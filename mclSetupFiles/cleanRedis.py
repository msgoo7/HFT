#! /usr/bin/env python

# This script clears the market data from redis.
# It will read the configuration from the conf in the below format:
# [REDIS]
# redis_ip=127.0.0.1
# redis_port=6379
#
# Run command: ./cleanRedis.py conf_path/mcl.conf
# By default, it will connect to 127.0.0.1:6379


from __future__ import print_function
import sys
if sys.version_info[0] < 3:
  import ConfigParser
else:
  import configparser as ConfigParser

import redis
import time
import psycopg2

def deleteByPattern( redisConn, pattern ):
  keyList = redisConn.keys(pattern + "*");
  if( len(keyList) ):
    redisConn.delete(*keyList)

#default global value
configFile = "mcl.conf"

def clearRedisData():

  #redis constant values
  REDIS_BLOCK = "REDIS"
  IP = "redis_ip"
  PORT = "redis_port"
  KEY_PREFIX = "redis_key_prefix"

  #default values
  redisIp = "127.0.0.1"
  redisPort = 6379
  redisKeyPrefix = ""

  global configFile

  #enable options
  MCL_BLOCK = "MCL"
  OHLC_ENABLED = "ohlcDumpingEnabled"
  SNAPSHOT_ENABLED = "snapshotDumpingEnabled"

  ohlcEnabled = False
  snapshotEnabled = False

  #database constant values
  DB_BLOCK = "DB"
  DBHOST = "host"
  DBPORT = "port"
  DBUSER = "user"
  DBPASSWORD = "password"
  DBNAME = "dbname"

  dbHost = "127.0.0.1"
  dbPort = 5432
  dbUser = "mutrade"
  dbPassword = "mutrade"
  dbName = "mutradeDb"

  print( "Reading config file" , configFile )
  configParser = ConfigParser.ConfigParser();
  configParser.read( configFile )

  try:
    redisIp = configParser.get( REDIS_BLOCK, IP )
    redisPort = configParser.get( REDIS_BLOCK, PORT )
    redisKeyPrefix = configParser.get( REDIS_BLOCK, KEY_PREFIX )

    ohlcEnabled = configParser.get( MCL_BLOCK, OHLC_ENABLED )
    snapshotEnabled = configParser.get( MCL_BLOCK, SNAPSHOT_ENABLED )

    dbHost = configParser.get( DB_BLOCK, DBHOST )
    dbPort = configParser.get( DB_BLOCK, DBPORT )
    dbUser = configParser.get( DB_BLOCK, DBUSER )
    dbPassword = configParser.get( DB_BLOCK, DBPASSWORD )
    dbName = configParser.get( DB_BLOCK, DBNAME )

  except ConfigParser.NoSectionError:
    print( "Using default redis configuration", redisIp, redisPort )
    print( "Using default db configuration", dbHost, dbPort, dbUser, dbPassword, dbName )

  redisConn = redis.Redis( redisIp, int(redisPort) )
  redisConn.delete( "quote_hash" )
  redisConn.delete( "index_hash" )
  redisConn.delete( "oi_hash" )
  redisConn.delete( "dpr_hash" )

  deleteByPattern( redisConn, "session_" )
  deleteByPattern( redisConn, "symbol_info_" )

  if ohlcEnabled:
    ohlcQuoteKeysList = redisConn.keys( redisKeyPrefix + "ohlc_quote_*" )
  if snapshotEnabled:
    snapshotKeysLIst = redisConn.keys( redisKeyPrefix + "snapshot_*" )

  try:
    dbConn = psycopg2.connect( host=dbHost, database=dbName, user=dbUser, password=dbPassword, port=dbPort )
    dbCursor = dbConn.cursor()
    if ohlcEnabled:
      for key in ohlcQuoteKeysList:
        key = key.decode()
        dbQuery = "UPDATE appmaster.quote_index_processed SET index_processed = 0 where quote_key = %s;"
        try:
          print( "Updating quote_index_processed table, key:", key )
          dbCursor.execute( dbQuery, [key] )
        except Exception as e:
          print( "Error updating key: ", key )
          dbConn.rollback()
        else:
          redisConn.delete( key )
          dbConn.commit()

    if snapshotEnabled:
      for key in snapshotKeysLIst:
        key = key.decode()
        dbQuery = "UPDATE appmaster.snapshot_index_processed SET index_processed = 0 where snapshot_key = %s;"
        try:
          print( "Updating snapshot_index_processed table, key:", key )
          dbCursor.execute( dbQuery, [key] )
        except Exception as e:
          print( "Error updating key: ", key )
          dbConn.rollback()
        else:
          redisConn.delete( key )
          dbConn.commit()

    dbCursor.close()
    dbConn.close()

  except psycopg2.Error as err:
    print( "Error connecting to database", err )

  print( 'Redis data deleted successfully' )

  redisConn.connection_pool.disconnect()


if len(sys.argv) > 1:
  configFile = sys.argv[1]
clearRedisData()
