"""Python script for downloading and parsing Global Category Ban files"""

import argparse
import csv

try:
    import psycopg2
except ImportError:
    print ("psycopg2 not found")
    exit(0)
try:
    from urllib2 import Request, urlopen
except ImportError:
    from urllib.request import Request, urlopen


# Downloading Client Category Ban file from exchange and storing it on given path
def downloadFile(path, file_name):
    web_url = Request('https://www.nseindia.com/content/fo/fo_secban.csv', headers={'User-Agent': 'Mozilla/5.0'})
    web_url_data = urlopen(web_url).read()
    with open(path + "/" + file_name, 'w') as file:
        file.write(web_url_data)

    symbol_list = readData(web_url_data)
    return symbol_list


# reading and appending data from records
def readData(records):
    symbol_list = []
    csv_record_reader = csv.reader(records.splitlines()[1:], delimiter=',')
    for record in csv_record_reader:
        symbol_list.append(record[1])

    return symbol_list


# Reading file from given path and appending symbol names in list
def readFile(path, file_name):
    with open(path + "/" + file_name, 'r') as file_records:
        symbol_list = readData(file_records.read())

    return symbol_list


# Uploading symbols in db with required fields
def uploadFile(db_name, db_user, db_password, db_host, db_port, symbol_list):
    conn = psycopg2.connect(database=db_name,
                            user=db_user,
                            password=db_password,
                            host=db_host,
                            port=db_port)

    cur = conn.cursor()
    try:
        cur.execute("INSERT INTO appmaster.client_category_ban_history( SELECT * from appmaster.client_category_ban )")
        cur.execute("TRUNCATE TABLE appmaster.client_category_ban ")

        exchanges = ['NSEFO', 'BSEFO', 'MSEFO']

        cc_ban = {'client_type': 5, 'square_off_status': 0, 'order_mode_allowed': 3, 'source': 'DEFAULT',
                  'instrument': 'All', 'group_name': 'All', 'maturity_yearmon': 0, 'maturity_day': 0,
                  'option_type': 'All', 'strike_price': 0, 'updated_by': 'SUPERADMIN', 'product_id': -1}

        for symbol in symbol_list:
            cc_ban['symbol'] = symbol
            for exchange in exchanges:
                cc_ban['market_id'] = exchange

                cur.execute(
                    "INSERT INTO appmaster.client_category_ban "
                    "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, now(), %s)",
                    [
                        cc_ban['client_type'], cc_ban['square_off_status'], cc_ban['order_mode_allowed'],
                        cc_ban['source'],
                        cc_ban['market_id'], cc_ban['instrument'], cc_ban['symbol'], cc_ban['group_name'],
                        cc_ban['maturity_yearmon'], cc_ban['maturity_day'], cc_ban['option_type'],
                        cc_ban['strike_price'], cc_ban['updated_by'], cc_ban['product_id']
                    ])
        conn.commit()

    except BaseException as e:
        print ('Error', e)
        cur.execute("rollback")

    conn.close()


# Reading command line arguments and taking certain actions on them
def main():
    '''
      @brief Reading configurations and initialize  exchange data
      '''

    cli_parser = argparse.ArgumentParser(description='process command line options for manual file upload')
    cli_parser.add_argument('--path', default='./', help="Path where global ban category files will be saved")
    cli_parser.add_argument('--is_manual_upload', action='store_true', default=False,
                            help="Upload global ban category file manually file")
    cli_parser.add_argument('--file_name', default='globalCategoryBan.csv', type=str, help="file name to upload")
    cli_parser.add_argument('--db_name', default='mutradeDb', help="Db name")
    cli_parser.add_argument('--db_user', default='mutrade', help="Db user")
    cli_parser.add_argument('--db_password', default='mutrade', help="Db password")
    cli_parser.add_argument('--db_host', default='10.0.0.40', help="Db host")
    cli_parser.add_argument('--db_port', default='5442', help="Db port")

    cli_arguments = cli_parser.parse_args()

    path = cli_arguments.path
    file_name = cli_arguments.file_name
    symbol_list = []
    if not cli_arguments.is_manual_upload:
        symbol_list = downloadFile(path, file_name)
    else:
        symbol_list = readFile(path, file_name)

    uploadFile(cli_arguments.db_name,
               cli_arguments.db_user,
               cli_arguments.db_password,
               cli_arguments.db_host,
               cli_arguments.db_port,
               symbol_list)


# Starting of Global Client Category Ban File
main()
