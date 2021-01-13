uname="utrade"
pswd="utrade"
dbName="testuser_mutrade_hft"
echo "Enter FileName"
read fName

out=`PGPASSWORD=$pswd psql -U $uname -d $dbName -f $fName`
echo out

