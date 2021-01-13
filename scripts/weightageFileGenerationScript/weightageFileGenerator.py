#!/usr/bin/python
import sys
import ConfigParser
import csv

try:
    import psycopg2
except ImportError:
    print "error in importing psycopg2"

config = ConfigParser.ConfigParser()
if config.read("weightageFile.conf") == []:
    sys.exit("error in reading weightageFile.conf file")


DB_NAME = config.get("DB","muTradeDbName")
DB_USER = config.get("DB","muTradeDbUser")
DB_PASSWORD = config.get("DB","muTradeDbPassword")
DB_HOST = config.get("DB","muTradeDbHost")
DB_PORT = config.get("DB","muTradeDbPort")

GENERATE_BSE_WEIGHTAGE_REPORT = config.get("BSE","generateBseWeightageReport")

##################################################################################################################

def read_db( marketName ):

  security_symbol_dict = {}

  try:
    conn = psycopg2.connect(database=DB_NAME, user=DB_USER, password=DB_PASSWORD, host=DB_HOST, port=DB_PORT)
    cur = conn.cursor()
    cur.execute("SELECT security_id, symbol from appmaster.scrip_master where market_id IN (%s)", (marketName,)  )

    for item in cur.fetchall():
      security_symbol_dict[item[0]] = item[1]

    conn.commit()
    conn.close()

    return security_symbol_dict

  except BaseException as e:
    print("Database Exception :", e)
    sys.exit(1)

################################################################################################################

def read_file( file_name, delm = ',' ):
  try:
    file_handler = open(file_name, "r")
  except IOError:
    print( "Error in reading file : ", file_name)
    sys.exit(1)

  csv_record_reader = csv.reader(file_handler, delimiter = ',')

  return csv_record_reader

def write_to_file( final_record, outputFileName ):
  try:
    file_handler = open( outputFileName,"w+")
    csv_file_writer = csv.writer(file_handler)
    csv_file_writer.writerows(final_record)
  except IOError:
    print("Error file not open : ",outputFileName)

##################################################################################################################

def generateBseWeightageReport():

  bseInputWeightageFileName = config.get("BSE", "inputFilePath")
  outputFile = config.get("BSE", "outputFile")

  bseRawFileCsv = read_file( bseInputWeightageFileName  )
  scripMaster = read_db('BSECM')
  bodRawFileList = [list(ele) for ele in bseRawFileCsv]

  final_weightage_list=[]

  for items in bodRawFileList:

    try :
      if int(items[1]) in scripMaster:
        row_entry=[]
        row_entry.append( scripMaster[int(items[1])]  ) #Symbol
        row_entry.append( items[8] ) #IssueCap
        row_entry.append( items[9] ) #IWF
        row_entry.append( items[11] ) #ClosePrice
        row_entry.append( float(items[8]) * float(items[9]) * float(items[11]) ) #IndexMarCapital
        row_entry.append( items[7] ) #Weightage
        row_entry.append( 1 ) #CapFactor
        final_weightage_list.append( row_entry )
    except :
      continue

  write_to_file( final_weightage_list, outputFile  )

###############################################################################################################

if GENERATE_BSE_WEIGHTAGE_REPORT == "1" :
  generateBseWeightageReport()
