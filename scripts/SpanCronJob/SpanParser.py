"""Python script for downloading and parsing Span files"""

from __future__ import print_function
import csv
import argparse
import threading
try:
  import urllib2
  from HTMLParser import HTMLParser
  import ConfigParser

except ImportError:
  import urllib.request as urllib2
  from html.parser import HTMLParser
  import configparser as ConfigParser

import xml.etree.ElementTree as ET
from datetime import datetime, timedelta
from collections import OrderedDict, namedtuple
import sys, traceback
from subprocess import call
import zipfile
import os
import fnmatch
import time
import shutil
import platform

# setting User-Agent header for all requests to download Span files from exchange
opener = urllib2.build_opener()
opener.addheaders = [('User-agent', 'Mozilla/5.0')]
urllib2.install_opener(opener)

def ExchangeData( isEnabled, isComplete, spanUrl, spanFilePattern, maxFileCount, curFileCount, fileSuffix, cronSequence ):
  '''
    @brief Create exchange data dictionary
    @param isEnabled:       If Enabled download span file for exchange
    @param isComplete:      All span files for exchange is downloaded
    @param spanUrl:         URL for span file
    @param spanFilePattern: Span file name pattern
    @param maxFileCount:    Maximum number of span file sent by exchange
    @param curFileCount:    Index of span file to download
    @param fileSuffix:      List of span file suffix
    @param cronSequence:    Cron Sequence number
  '''
  return dict( isEnabled=isEnabled, isComplete=isComplete,
				 spanUrl=spanUrl, spanFilePattern=spanFilePattern,
				 maxFileCount=maxFileCount, curFileCount=curFileCount,
				 fileSuffix=fileSuffix, cronSequence=cronSequence )

'''
@brief Dictionary to store exchange data for all exchanges
       This will be used to get exchange span file download url and file to download
       Example: For NSEFO -
                URL - https://www.nseindia.com/archives/nsccl/span/
                SpanFileName - nsccl.20190531.i2.zip
'''
ExchangeDataDict = {}
ExchangeDataDict["NSEFO"] = ExchangeData( False, False,
                              'https://archives.nseindia.com/archives/nsccl/span/',
                              'nsccl.%s.%s.zip', 6, 0,
                              [ 'i1', 'i2', 'i3', 'i4', 'i5', 's' ], 0
                            )
ExchangeDataDict["NSECDS"] = ExchangeData( False, False,
                              'htpps://archives.nseindia.com/archives/cd/span/',
                              'nsccl_x.%s.%s.zip', 9, 0,
                              [ 'i1', 'i2', 'i3', 'i4', 'i5', 'i6', 'ps', 'i7', 's' ], 0
                            )
ExchangeDataDict["BSEFO"] = ExchangeData( False, False,
                              'https://www.bseindia.com/bsedata/Risk_Automate/SPN/',
                              'BSERISK%s-%s.ZIP', 6, 0,
                              [ '00', '01', '02', '03', '04', 'FINAL' ], 0
                            )
ExchangeDataDict["BSECDS"] = ExchangeData( False, False,
                              'https://www.bseindia.com/bsedata/Risk_Automate/CURRENCY/SPN/',
                              'BSECDXRISK%s-%s.ZIP', 9, 0,
                              [ '00', '01', '02', '03', '04', '05', '06P', '07', 'FINAL' ], 0
                            )
ExchangeDataDict["MSEFO"] = ExchangeData( False, False,
                              'https://www.msei.in/SX-Content/daily/Equity-Derivatives/{year}/{month}/{day}/',
                              'MCX-SXCCL-EDSRPF-%s-%s.zip', 5, 0,
                              [ '0630-01-I', '1100-02-I', '1230-03-I', '1400-04-I', '1527-05-I' ], 0
                            )
ExchangeDataDict["MSECD"] = ExchangeData( False, False,
                              'https://www.msei.in/SX-Content/daily/Currency-Derivatives/{year}/{month}/{day}/',
                              'MCX-SXCCLRPF-%s-%s.zip', 6, 0,
                              [ '0630-01-I', '1100-02-I', '1230-03-I', '1400-04-I', '1530-05-I', '1700-06-I' ], 0
                            )
ExchangeDataDict["MCX"] = ExchangeData( False, False,
                            'https://www.mcxindia.com/docs/default-source/market-operations/daily-span-risk-parameter-file/{year}/{month}/',
                            'mcxrpf-%s-%s.zip', 9, 0,
                            [ '0930-02-i', '1100-03-i', '1300-04-i', '1500-05-i', '1700-06-i', '1900-07-i', '2030-08-i', '2230-09-i', '2345-10-e' ], 0
                          )
#####################################################################################
# Constants

# Span file needs to be downloaded
IsDownload = True

# Path to store span files
Path = None

# Name of span file
SpanFile = None

IsLinux = ( platform.system() == "Linux" )

ExpiryMap = {}
SOMMap = {}
configFile = None
#####################################################################################

# Reading Config file
def readConfigFile():
  global configFile
  configFile = ConfigParser.ConfigParser()
  if configFile.read( Path + "/spanParser.conf" ) == []:
    sys.exit( "Error reading spanParser.conf file" )

def mkdir(dir_name):
  dirs = dir_name.split("/")
  for dir in dirs:
   #  print dir
    try:
      call("mkdir "+dir, shell=True)
      os.chdir(dir)
    except Exception as e:
      print( "Exception:", e, dir )
      os.chdir(dir)
      continue

def readCronSequenceFile():
  '''
  @brief Reading cronSequence.txt file containing text in format exchange:timestamp
         If last timestamp for exchange is of preveious day then we need start from
         first span for current day, so updating last_file_index to zero
  '''
  global ExchangeDataDict

  try:
    with open(Path+"/cronSequence.txt", "r") as cronSequencefile:
      for line in cronSequencefile:
        elements = line.split(':')
        exchange = elements[0]
        lastUpdateTimestamp = int( elements[1] )

        lastUpdateDate = datetime.fromtimestamp( lastUpdateTimestamp )
        curDate = datetime.now()
        if not lastUpdateDate.date() == curDate.date():
          configFile.set( exchange, "last_file_index", '0' )
          ExchangeDataDict[ exchange ]['isComplete'] = False

        ExchangeDataDict[ exchange ]['cronSequence'] = lastUpdateTimestamp
  except IOError as e:
    # create new sequence file if not exists
    with open(Path+"/cronSequence.txt", "w+") as cronSequencefile:
      pass


def updateCronSequenceFile():
  '''
  @brief Update cronSequence.txt file which will be used by HFT to check if new file has downloaded
         Format - EXCHANGE:Timestamp
         Example - NSEFO:1559377335
  '''
  global ExchangeDataDict

  lines = []
  for exchange, exchangeData in ExchangeDataDict.items():
    line = exchange + ":" + str(exchangeData['cronSequence']) + "\n"
    lines.append( line )

  with open(Path+"/cronSequence.txt", "w") as cronSequencefile:
    cronSequencefile.writelines( lines )


def readEnableConfig():
  '''
  @breif Reading enable configurations from file
  '''
  global ExchangeDataDict, configFile
  for exchange, exchangeData in ExchangeDataDict.items():
    exchangeData["isEnabled"] = bool( int( configFile.get( exchange, "is_enabled" ) ) )
    readUrlConfig( exchange, exchangeData )

def readUrlConfig( exchange, exchangeData ):
  '''
  @breif Reading span file download configurations from file
  '''
  if exchangeData is not None:
    spanUrl = configFile.get( exchange, "url" )
    if spanUrl.strip():
      if exchange in ["MSEFO", "MSECD"]:
        spanUrl += '{year}/{month}/{day}/'
      elif exchange == "MCX":
        spanUrl += '{year}/{month}/'
      exchangeData["spanUrl"] = spanUrl

def readLastIndexConfig():
  '''
  @brief Reading last file index configuration for all exchanges from file
         If all files has been downloaded then set isComplete to True
  '''
  global ExchangeDataDict, configFile
  for exchange, exchangeData in ExchangeDataDict.items():
    if exchangeData["isEnabled"]:
      try:
        exchangeData["curFileCount"] = int( configFile.get( exchange, "last_file_index" ) )
      except:
        configFile.set( exchange, "last_file_index", '0' )

      if exchangeData["curFileCount"] >= exchangeData["maxFileCount"]:
        exchangeData["isComplete"] = True

def updateLastIndexConfig():
  '''
  @brief Update last file index for all exchanges in file
  '''
  global configFile
  with open( Path+'/spanParser.conf', 'w' ) as f:
    configFile.write( f )

def init():
  '''
  @brief Reading configurations and initialize  exchange data
  '''
  global IsDownload, Path, SpanFile
  global ExchangeDataDict

  cliParser = argparse.ArgumentParser()
  cliParser.add_argument( 'path', help="Path where span files will be saved" )
  cliParser.add_argument( '--exchanges', action='append', help="Exchange for which span files will be downloaded" )
  cliParser.add_argument( '--isUpload', action='store_true', help ="Upload span file" )
  cliParser.add_argument( '--spanFile', type=str, help="Span file to upload" )

  cliArguments = cliParser.parse_args()

  Path = cliArguments.path
  readConfigFile()

  if cliArguments.exchanges is not None:
    if len(cliArguments.exchanges) > 0:
      for exchange in cliArguments.exchanges:
        ExchangeDataDict[ str(exchange) ]["isEnabled"] = True
        readUrlConfig( exchange, ExchangeDataDict[str(exchange)] )
  else:
    readEnableConfig()

  readLastIndexConfig()
  readCronSequenceFile()
  updateLastIndexConfig()

  IsDownload = not cliArguments.isUpload
  if cliArguments.spanFile is not None:
    SpanFile = cliArguments.spanFile

  if not IsDownload:
    if SpanFile is not None:

      # If we are providing span file location then only one exchange should be enabled
      # for which span file is provided
      if len(cliArguments.exchanges) == 1:
        return True
      else:
        print( "Error: Number of exchanges enabled and number of span file must match")
        return False

    else:
      print( "Error: Span file must be provided when using isUpload option")
      return False

  print( "Span CSV files will be stored at:", Path )
  return True

class MyHTMLParser(HTMLParser):
  """Parsing all the active elements in the html."""
  data = None
  def handle_starttag(self, tag, attrs):
    if tag == "a":
      for name, value in attrs:
        if name == "href":
          if not value.endswith(".zip"):
            self.data = value


eodFilesName = []

def find(pattern, path):
  for file in os.listdir(path):
    if fnmatch.fnmatch(file, pattern):
      eodFilesName.append( file )

  return eodFilesName


def downloadSpanFile( exchange ):
  '''
  @brief Download span file for given exchange
  '''
  global SpanFile, confiFile
  global Path

  exchangeData = ExchangeDataDict[ exchange ]

  url = exchangeData["spanUrl"]
  curDate = datetime.now()
  curDateStr = curDate.strftime("%Y%m%d")
  curYear = curDate.strftime("%Y")
  curMonth = curDate.strftime("%B")
  curDay = curDate.day
  if exchange == "MSECD" or exchange == "MSEFO":
    url = url.format( year = curYear, month = curMonth, day = curDay )
  elif exchange == "MCX":
    url = url.format( year = curYear, month = curMonth )

  fileNamePattern = exchangeData["spanFilePattern"]
  fileIndex = exchangeData["curFileCount"]
  maxFileIndex = exchangeData["maxFileCount"]
  isDownloaded = False

  # Download the latest span file uploaded
  # Skips old span files if unable to download
  while fileIndex < maxFileIndex:
    fileSuffix = exchangeData["fileSuffix"][fileIndex]
    fileName = fileNamePattern % ( curDateStr, fileSuffix )

    zipFilePathWithName = Path + fileName
    spnFilePathWithName = zipFilePathWithName[:-3] + "spn"
    tempFile = spnFilePathWithName

    if not os.path.exists( spnFilePathWithName ):
      try:
        response = urllib2.urlopen( url + fileName )
        f = open( zipFilePathWithName, "wb" )
        f.write(response.read())
        f.close()

        zipFile = zipfile.ZipFile( zipFilePathWithName, 'r' )
        zipFileContents = zipFile.namelist()
        if len(zipFileContents) == 1:
          tempFile = zipFile.extract( zipFileContents[0], Path )
        else:
          print( "Error span zip file contains more than one file" )
          return False
        zipFile.close()

        #remove downloaded zip file after extracting
        os.remove( zipFilePathWithName )
        isDownloaded = True
        print( "Downloaded span file for exchange:", exchange, fileName )

      except Exception as e:
        isDownloaded = False
        if "404" not in str(e):
          print( "Error downloading span file %s reason:" % fileName, e )

    else:
      isDownloaded = True
      print( "Skipping downloading span file as it already exist: ", spnFilePathWithName )

    fileIndex += 1

    if isDownloaded:
      #if span file downloaded update current file index in cache and spanParser.conf file
      exchangeData["curFileCount"] = fileIndex
      configFile.set( exchange, "last_file_index", str(exchangeData['curFileCount']) )

      SpanFile = tempFile
      return True

  return False

def getRowFormat(**kwargs):
  dict_ = OrderedDict()

  dict_['Exchange']=kwargs.get("Exchange", "")
  dict_['PfID']=kwargs.get("PfID", "")
  dict_['InstrumentName']=kwargs.get("InstrumentName","")
  dict_['InstrumentType']=kwargs.get("InstrumentType","")
  dict_['Symbol']=kwargs.get("Symbol","")
  dict_['Expiry']=kwargs.get("Expiry","")
  dict_['ISIN']=kwargs.get("ISIN","")
  dict_['StrikePrice']=kwargs.get("StrikePrice", "0")
  dict_['OptionType']=kwargs.get("OptionType", "")
  dict_['Price']=kwargs.get("Price", "0")
  dict_['Delta']=kwargs.get("Delta", "0")
  dict_['PriceScan']=kwargs.get("PriceScan", "0")
  dict_['SOM']=kwargs.get("SOM", "0")
  dict_['R0']=kwargs.get("R0","")
  dict_['R1']=kwargs.get("R1","")
  dict_['R2']=kwargs.get("R2","")
  dict_['R3']=kwargs.get("R3","")
  dict_['R4']=kwargs.get("R4","")
  dict_['R5']=kwargs.get("R5","")
  dict_['R6']=kwargs.get("R6","")
  dict_['R7']=kwargs.get("R7","")
  dict_['R8']=kwargs.get("R8","")
  dict_['R9']=kwargs.get("R9","")
  dict_['R10']=kwargs.get("R10","")
  dict_['R11']=kwargs.get("R11","")
  dict_['R12']=kwargs.get("R12","")
  dict_['R13']=kwargs.get("R13","")
  dict_['R14']=kwargs.get("R14","")
  dict_['R15']=kwargs.get("R15","")
  dict_['RiskDelta']=kwargs.get("RiskDelta", "0")
  dict_['Currency']=kwargs.get("Currency","")
  dict_['CC']=kwargs.get("CC","")

  return dict_


def getSpreadRowFormat(**kwargs):
  dict_ = OrderedDict()
  dict_['Exchange']=kwargs.get("Exchange", "")
  dict_['Symbol'] = kwargs.get("Symbol","")
  dict_['FirstMonth'] = kwargs.get("FirstMonth","")
  dict_['SecondMonth'] = kwargs.get("SecondMonth","")
  dict_['Spread'] = kwargs.get("Spread","")
  return dict_


IntermonthSpreadMap = {}


def updateInstrumentName( exchange, dict_):
  #    [ExchangeName] [Symbol] [Expiry(YYYYMMDD)] [StrikePrice] [C/P(For Call/Put)]
  global ExpiryMap
  global IntermonthSpreadMap
  symbol = dict_["Symbol"]
  if symbol not in ExpiryMap:
    ExpiryMap[symbol] = set()

  ExpiryMap[symbol].add(int(dict_['Expiry'][:8]))

  dict_['InstrumentName'] = "DEFAULT " + dict_["Exchange"] + \
                            " " + dict_["Symbol"] + \
                            " " + dict_["Expiry"]
  if dict_['InstrumentType'] == "O":
    dict_['InstrumentName'] += \
        " " + str(int(float(dict_["StrikePrice"])*getMultiplier( exchange ))) + \
        " " + dict_["OptionType"]

  som_key = exchange + "_" + symbol
  if som_key in SOMMap:
    dict_['SOM'] = SOMMap.get(som_key)
  else:
    dict_['SOM'] = '0'


def get_currency_defs(root):
  """Parse all currency defs from xml root."""
  currency_def = []
  for currencydef in root.iter(tag='currencyDef'):
    currency = {}
    for child in currencydef:
      currency[child.tag] = child.text
    currency_def.append(currency)
  return currency_def

def getCombinedCommoditiesRowFormat(**kwargs):
  dict_ = OrderedDict()

  dict_['Priority'] = kwargs.get("Priority","")
  dict_['CreditRate'] = kwargs.get("CreditRate","")
  dict_['CCLeg1'] = kwargs.get("CCLeg1","")
  dict_['DeltaLeg1'] = kwargs.get("DeltaLeg1","")
  dict_['SideLeg1'] = kwargs.get("SideLeg1","")
  dict_['CCLeg2'] = kwargs.get("CCLeg2","")
  dict_['DeltaLeg2'] = kwargs.get("DeltaLeg2","")
  dict_['SideLeg2'] = kwargs.get("SideLeg2","")

  return dict_


def getCombinedCommodity(root, pfId):
  return pfIdCCDict[pfId]

def get_combined_commodities_interspreads(data, root):
  interspread = root.iter(tag='interSpreads')

  for interspreads in interspread:
    for dSpread in interspreads.iter(tag='dSpread'):
      spread = dSpread.find('spread').text
      val = ((dSpread.find('rate')).find('val')).text

      # upto 4 digits precision
      val = format( float(val),'.4f' )

      name = []
      dpsr = []
      side = []

      for tLeg in dSpread.iter(tag='tLeg'):
        name.append(tLeg.find('cc').text)

        legDelta = tLeg.find('i').text
        legDelta = format( float(legDelta),'.4f' )
        dpsr.append( legDelta )

        side.append(tLeg.find('rs').text)

      combined_commodities = getCombinedCommoditiesRowFormat( Priority=spread,
          CreditRate=val,
          CCLeg1=name[0],
          DeltaLeg1=dpsr[0],
          SideLeg1=side[0],
          CCLeg2=name[1],
          DeltaLeg2=dpsr[1],
          SideLeg2=side[1]
          )

      data.append(combined_commodities)

def get_future_pf( exchange, data, root, isEodFile = False):
  """Parse all futures from xml root."""
  for futpf in root.iter(tag='futPf'):
    pfId = futpf.find('pfId').text
    symbol = futpf.find('undPf/pfCode').text
    currency = futpf.find('currency').text
    cc = 'NA'

    ii=0
    for fut in futpf.iter(tag='fut'):
      future = getRowFormat(
          Exchange=exchange,
          PfID=pfId,
          Symbol=symbol,
          InstrumentType="F"
      )
      ii+=1

      future['Expiry'] = fut.find("pe").text
      #print future['Expiry']
      # print future['Expiry']
      future['Price'] = fut.find('p').text
      future['Delta'] = fut.find('d').text
      scan_rate = fut.find('scanRate')
      if scan_rate is not None and scan_rate.find('priceScan') is not None:
        future['PriceScan'] = scan_rate.find('priceScan').text

      risk_array = fut.find('ra')
      if risk_array is not None:
        future['RiskDelta'] = risk_array.find('d').text
        rArray = [risk.text for risk in risk_array.findall('a')]
        for i in range(len(rArray)):
          future['R'+str(i)] = rArray[i]

      updateInstrumentName( exchange, future)
      future['Currency'] = currency
      future['CC']       = cc

      data.append(future)

def get_all_options( exchange, data, root, isEodFile = False):
  global SOMMap
  """Parse all options from xml root.
  Option tags used: oocPf, ooePf, oofPf, oopPf"""

  optionTags = [ 'oocPf', 'ooePf', 'oofPf', 'oopPf' ]
  for optionTag in optionTags:
    for oopf in root.iter(tag=optionTag):
      pfId = oopf.find('pfId').text
      symbol = oopf.find('undPf/pfCode').text
      currency = oopf.find('currency').text

      cc = 'NA'

      for series in oopf.iter(tag='series'):
        maturity = series.find('pe').text
        priceScan = "0"
        scan_rate = series.find('scanRate')
        if scan_rate is not None and scan_rate.find('priceScan') is not None:
          priceScan = scan_rate.find('priceScan').text
        for opt in series.iter(tag='opt'):
          option = getRowFormat(
              Exchange=exchange,
              PfID=pfId,
              Symbol=symbol,
              Expiry=maturity,
              InstrumentType="O",
              PriceScan=priceScan)
          for child in opt:
            if child.tag == 'k':
              option['StrikePrice'] = child.text
            elif child.tag == 'o':
              option['OptionType'] = child.text
            elif child.tag == 'alias':
              try:
                option['ISIN'] = ''
              except:
                pass
            elif child.tag == 'd':
              option['Delta'] = child.text
            elif child.tag == 'p':
              option['Price'] = child.text
            elif child.tag == 'ra':
              delta = child.find('d').text
              option['RiskDelta'] = delta
              rArray = [risk.text for risk in child.findall('a')]
              for i in range(len(rArray)):
                option['R'+str(i)] = rArray[i]

          updateInstrumentName( exchange, option)
          option['Currency'] = currency
          option['CC']       = cc

          data.append(option)

pfIdCCDict = {}

def read_spreads( exchange, intermonthData, root):
  global SOMMap

  for ccdef in root.iter(tag="ccDef"):
    symbols = set()
    options = []
    futures = []
    spread_tiers = {}
    # pfolios = []
    expiries = set()
    dictionary = dict()
    for pfolios in ccdef.iter(tag="pfLink"):
      pfId = pfolios.find("pfId").text
      # pfolioData = IntermonthSpreadMap.get(pfId, None)
      # if pfolioData is None:
      #     continue
      # pfolios.append(pfolioData)
      symbol = pfolios.find("pfCode").text
      symbols.add(symbol)
      type = pfolios.find("pfType").text

      global pfIdCCDict
      pfIdCCDict.update( { pfId : ccdef.find("cc").text } )

      if type == "FUT":
        futures.append(symbol)

    if exchange in ["MSEFO", "MSECD", "MCX"]:
      itrCcdef = ccdef.find('intraTiers')
      if itrCcdef is not None:
        for tier in itrCcdef.iter(tag="tier"):
          itrTier = tier.find('tn')
          itrFirstMonth = tier.find('sPe')
          itrSecondMonth = tier.find('ePe')
          if itrTier is not None and itrFirstMonth is not None and itrSecondMonth is not None:
            dictionary.setdefault(itrTier.text,[]).append(itrFirstMonth.text)
            dictionary.setdefault(itrTier.text,[]).append(itrSecondMonth.text)
    itrSomtier = ccdef.find('somTiers')
    if itrSomtier is not None:
      for somTier in itrSomtier.iter(tag="tier"):
        for symbol in symbols:
          SOMMap[exchange + "_" + symbol] = float(somTier.find('rate').find('val').text)
        break
    dSpreads = ccdef.iter(tag="dSpread")
    dcount = 0
    for dSpread in dSpreads:
      months = []
      if exchange in ["MSEFO", "MSECD", "MCX"]:
        for leg in dSpread.iter(tag="tLeg"):
          if(len(months) >= 2):
            break
          itrTn = leg.find('tn')
          if itrTn is not None:
            tn = itrTn.text
            if tn in dictionary:
              monthValues = dictionary[tn]
              for value in monthValues:
                months.append(value)
      else:
        for leg in dSpread.iter(tag="pLeg"):
          months.append(leg.find('pe').text)
      if len(months) <2:
        #print symbol, months
        continue
      first_month = months[0]
      second_month = months[1]
      val = dSpread.find("rate").find("val").text
      # print "====", symbols
      # print "==Months: ", first_month, second_month
      for symbol in symbols:
        intermonthData.append(getSpreadRowFormat(
          Exchange=exchange,
          Symbol=symbol,
          FirstMonth=first_month,
          SecondMonth=second_month,
          Spread=val)
        )
        # break


def parse_currency_conversion(root):

  pointInTime = root.find('pointInTime').find('clearingOrg')
  conversions = pointInTime.iter(tag='curConv')
  curr_data = list()
  for conversion in conversions:
    fromCur = conversion.find('fromCur').text
    toCur = conversion.find('toCur').text
    factor = conversion.find('factor').text
    curr_data.append(
        dict(
          fromCur=fromCur,
          toCur=toCur,
          factor=factor
          )
        )
  return curr_data

def initiate( exchange ):
  global SOMMap, tStop, SpanFile, ExchangeDataDict
  global Path
  SOMMap = {}

  if IsDownload:
    tStart = datetime.now()
    cur_date = datetime.now()
    cur_year = cur_date.strftime("%Y")
    cur_month = cur_date.strftime("%B")
    cur_day = cur_date.day

    if not downloadSpanFile( exchange ):
      return False

    tDownload = datetime.now() - tStart
    tStop = True
    print("Downloaded, Total download time:", str(tDownload))

  t1 = datetime.now()
  currFile=None

  currFile = SpanFile
  if currFile.endswith(".zip") or currFile.endswith(".ZIP"):
    currFile = currFile[:-4]
    currFile = currFile + ".spn"

  print( "Parsing spanfile: ", currFile )

  tree = ET.parse(currFile)

  root = tree.getroot()
  data = []
  data1 = []
  combined_commodities_interspreads = []

  curr_data = parse_currency_conversion(root)
  read_spreads( exchange, data1, root)

  get_future_pf( exchange, data, root )
  get_all_options( exchange, data, root )

  os.remove( currFile )

  # move old span files to archive and create new files

  spanCsvFile = Path + '/span_data_' + exchange + '.csv'
  spanCsvArchiveFile =  Path + '/archive/span_data_' + exchange + '.csv'
  if os.path.exists( spanCsvFile ):
    os.rename( spanCsvFile, spanCsvArchiveFile )
  with open(spanCsvFile, 'w') as data_file:
    writer = csv.DictWriter(data_file, getRowFormat().keys())
    writer.writeheader()
    writer.writerows(data)

  spanSpreadCsvFile = Path + '/span_spread_data_' + exchange + '.csv'
  spanSpreadCsvArchiveFile =  Path + '/archive/span_spread_data_' + exchange + '.csv'
  if os.path.exists( spanSpreadCsvFile ):
    os.rename( spanSpreadCsvFile, spanSpreadCsvArchiveFile )
  with open(spanSpreadCsvFile, 'w') as data_file:
    writer = csv.DictWriter(data_file, getSpreadRowFormat().keys())
    writer.writeheader()
    writer.writerows(data1)

  spanExchangeRateFile = Path+'/currency_conversion_'+exchange+'.csv'
  spanExchangeRateArchiveFile = Path+'/archive/currency_conversion_'+exchange+'.csv'
  if os.path.exists( spanExchangeRateFile ):
    os.rename( spanExchangeRateFile, spanExchangeRateArchiveFile )
  with open(spanExchangeRateFile, 'w') as data_file:
    writer = csv.DictWriter(data_file, curr_data[0].keys())
    writer.writeheader()
    writer.writerows(curr_data)

  ExchangeDataDict[ exchange ]['cronSequence'] = int( time.time() )

  t2 = datetime.now() - t1
  print( "Done Parsing, Total Time for parsing:", str(t2) )
  return True

'''
@brief getMultiplier()
@return multiplier
@func Earlier by default 100 was used due to which in currency segments strike price was
      generating with wrong precision.Now in currency segments 10000 will be used as multiplier.
      Add currency exchange here whenever span file support for other currencies are to be added
'''
def getMultiplier( exchange ):
  if exchange in ["MSECD", "NSECDS", "BSECDS"] :
    return 10000
  return 100

def main():
  # Initialize script and download span files.
  # If span file is successfully downloaded return exit status 0
  # If initialization or Span file download fails script returns exit status 1
  # Exit status is used when script is called from HFT

  if init():
    # Used to check if span file was successfully downloaded
    isSuccess = False

    # Download and process span file for all enabled exchanges
    for exchange, data in ExchangeDataDict.items():
      if data["isEnabled"] and not data["isComplete"]:
        isSuccess = initiate( exchange )

        #Update index of last span file and update cron sequence
        updateLastIndexConfig()
        updateCronSequenceFile()

    if not isSuccess:
      sys.exit(1)
    else:
      sys.exit(0)
  else:
    sys.exit(1)

main()