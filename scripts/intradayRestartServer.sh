name=`whoami`
S1=`ps -u $name|grep hft`
S2=""
if [ "$S1" == "$S2" ];
then
./runHftIntraday.sh > /dev/null 2>&1 & disown
echo "Server STARTED..  "
else
echo "Server already running please enter y to restart or n to keep it running...    "
read ans
if [ "$ans" == "y" ]
then
pkill hft
./runHftIntraday.sh > /dev/null 2>&1 & disown
echo "Server RESTARTED..  "
else
echo "Old instance is running..."
fi
fi

