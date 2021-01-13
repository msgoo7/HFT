#!/usr/bin/python
import sys
import ConfigParser
import csv

try:
    import psycopg2
except ImportError:
    print "error in importing psycopg2"

config = ConfigParser.ConfigParser()
if config.read("filterScrips.conf") == []:
    sys.exit("error in reading filterScrips.conf file")

DB_NAME = config.get("DB","muTradeDbName")
DB_USER = config.get("DB","muTradeDbUser")
DB_PASSWORD = config.get("DB","muTradeDbPassword")
DB_HOST = config.get("DB","muTradeDbHost")
DB_PORT = config.get("DB","muTradeDbPort")

CM_TBT_FILE = config.get( "TBT", "CM_FILE" )
FO_TBT_FILE = config.get( "TBT", "FO_FILE" )
CUR_TBT_FILE = config.get( "TBT", "CUR_FILE" )

##################################################################################################################

#Remove unwanted entries from db.
def filter_db( securities_str ):

  print "Updating Database..."

  try:
    conn = psycopg2.connect(database=DB_NAME, user=DB_USER, password=DB_PASSWORD, host=DB_HOST, port=DB_PORT)
    cur = conn.cursor()

    cur.execute( "DELETE from appmaster.scrip_master where security_id NOT IN (VALUES{0})".format(securities_str) )

    conn.commit()
    conn.close()

  except BaseException as e:
    print("Database Exception :", e)
    sys.exit(1)

################################################################################################################

#Read the tbt file and return security data set.
def read_file( file_name ):

  print "Parsing file : " + file_name
  securities = set()

  try:
    file_handler = open(file_name, "r")
  except IOError:
    print( "Error in reading file : ", file_name)
    return securities

  csv_record_reader = csv.reader(file_handler, delimiter = ',')

  #Skipping header.
  next( csv_record_reader )

  file_data_list = [list(ele) for ele in csv_record_reader]

  for items in file_data_list:
    try :
      securities.add( items[0] ) #Security Id
    except :
      continue

  print "No. of securities : " + str(len(securities))

  return securities

##################################################################################################################

#Handles which files are to be read and returns the combined securities set.
def read_tbt_files():

  cm_securities_set = read_file( CM_TBT_FILE )
  fo_securities_set = read_file( FO_TBT_FILE )
  cur_securities_set = read_file( CUR_TBT_FILE )

  combined_securities_set = cm_securities_set.union( fo_securities_set )
  combined_securities_set = cur_securities_set.union( combined_securities_set )

  return combined_securities_set

###############################################################################################################

#Get data set from tbt files
combined_securities_set = read_tbt_files()
print "Total No. of securities : " + str(len(combined_securities_set))

if len(combined_securities_set) == 0:
  print "Exiting , no security found."
  sys.exit(1)

#Prepare string for where in clause.
securities_str = ''
for s in combined_securities_set:
  securities_str += "("
  securities_str += s
  securities_str += ")"
  securities_str += ","

#Chop off last extra comma
securities_str = securities_str[:-1]

#Remove unwanted entries from db.
filter_db( securities_str )

print "Finished."
