#!/usr/bin/python

import sys
import ConfigParser
import os

config = ConfigParser.ConfigParser()
if config.read("fileUpload.conf") == []:
  sys.exit("error in reading fileUpload.conf file")

DB_NAME = config.get("DB","dbname")
DB_USER = config.get("DB","user")
DB_PASSWORD = config.get("DB","password")
DB_HOST = config.get("DB","host")
CLIENT_CSV_PATH = ""

'''
Need to run clients_migrations.sql first because there are checks
in fileuploader for BSE i.e. If it will not find an entry in client_exchange_settings
it will delete all the entries of that client from the DB (e.g. like orderlimits, childparentcodemapping etc).
'''

os.system("PGPASSWORD=" +DB_PASSWORD + " psql -U "+ DB_USER + " -h " + DB_HOST + " "+ DB_NAME + " < clients_migrations.sql")
os.system("./fileUploader " + CLIENT_CSV_PATH)
