pswd="PASS_WORD"
userName="USER_NAME"
dbName="DB_NAME"
hostIp="127.0.0.1"
port="5432"
echo "Enter level... "
read ans
PGPASSWORD=$pswd psql -U $userName -d $dbName -h $hostIp -p $port -a -f 'rmsLevels_'$ans'.sql'
