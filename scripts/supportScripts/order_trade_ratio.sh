#/bin/bash
SCRIPT_PATH=`pwd`
SEARCHPATH=/root/Utrade/muTrade-1.0.0-Linux_I2/
File=order_trade_`date +%F_%T`
cd  $SEARCHPATH
./genConfirmations

awk -F',' '{print $13}' confirmations.csv |sort |uniq -c|grep -v ClientId|awk '{print $2}'|while read line; 

do  
order=`grep $line confirmations.csv|cut -d ',' -f5,6 | grep '1,' | sort  -u -k1,1 |wc -l`
trade=`grep $line confirmations.csv | cut -d ',' -f5,6 | grep '2,' | sort -u -k1,1 |wc -l`
cncl=`grep $line confirmations.csv | cut -d ',' -f5,6 | grep '3,' | sort  -u -k1,1 |wc -l`

echo "##########"
echo "Dealer ID: $line"
echo "order: $order" 
echo "Trade: $trade"
echo "Cancel: $cncl"
done >> "$File"
