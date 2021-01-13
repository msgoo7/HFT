#!/bin/bash 
#set -x 

tdate=`date +%F`
fileName=CF_Execution_$tdate 
scrip_master_file=../../config/scrip_master_data.txt


function checkTodayReportFile()
{
  if [ -f $fileName"__CreatedForLogsDated__"$dateFilter.csv ] 
  then 
    echo File found,appending data  
  else 
    echo file not found, creating file 
    touch $fileName"__CreatedForLogsDated__"$dateFilter.csv
  fi
  echo "Dealer,Strategy ID,Symbol,Order Mode,Executed Quantity,Desired Spread,Executed Spread,Time" > $fileName"__CreatedForLogsDated__"$dateFilter.csv
}

function getSymbol()
{
  file=$1
  getSymbol=`grep "SymbolId " $file | grep "Leg :=" | awk '{print $NF}' | sort -r | head -n 1`
  symbolSecurityId=`echo ${getSymbol:3}`
  dataFromScripFile=`awk -v securityId="$symbolSecurityId" -F',' ' { if($3==securityId) print $0 }' $scrip_master_file | egrep  'NSEFO|BSEFO' `
  echo $dataFromScripFile | awk -F',' '{print $6}'
}

function getOrderMode()
{
  file=$1
  mode=`grep -m 1  "FirstLeg order Mode :=" $file | awk '{print $NF}'`
  if [[ $mode == "BUY" ]]
  then
    echo B:S
  else
    echo S:B
  fi
}

function getDesiredSpread()
{
  file=$1
  lineNumber=$2
  diff=`cat $file | wc -l `
  #grep -ni "getPriceDifference" $file | while read iteration
  while read iteration
  do
    lineFound=`echo $iteration | awk -F':' '{print $1}' `
    if [[ $lineFound -lt $lineNumber ]] 
    then
      diffBetweenLines=$(( lineNumber-lineFound ))
      if [[ $diff -ge  $diffBetweenLines ]]
      then
        diff=$diffBetweenLines
      fi
    fi
  done < <(grep -ni "Price Difference :=" $file)
  lineNum=$(( lineNumber-diff ))
  spread=`awk -v lineNum="$lineNum" -F':' '{if(NR==lineNum) print $NF}' $file`
  diff=`cat $file | wc -l `
  while read iteration
  do
    lineFound=`echo $iteration | awk -F':' '{print $1}' `
    if [[ $lineFound -lt $lineNumber ]] 
    then
      diffBetweenLines=$(( lineNumber-lineFound ))
      if [[ $diff -ge  $diffBetweenLines ]]
      then
        diff=$diffBetweenLines
      fi
    fi
  done < <(grep -ni "|Iteration = " $file)
  lineNum=$(( lineNumber-diff ))
  state=`awk -v lineNum="$lineNum"  '{if(NR==lineNum) print $NF}' $file`
  if [[ "$state" == "Square-off" ]]
  then
    echo 0
  else
    echo $spread | awk '{print $NF}'
  fi
}

function printData()
{
    echo iterationCount is $itrCount
    echo dealer is $dealer
    echo strategyId is $strategyId
    echo symbol is $symbol
    echo orderMode is $orderMode
    echo executedQuantity is $executedQuantity
    echo desiredSpread is $desiredSpread
    echo executedSpread is $executedSpread
    echo executedTime is $executedTime
    echo
}

function getDataFromFile()
{
  itrCount=1
  file=$1
  dealer=`echo $file | awk -F'_' '{print $NF--}' `
  strategyId=`echo $file | awk -F'_' '{print $(NF-2)}' `
  symbol=`getSymbol $file`
  orderMode=`getOrderMode $file`
  grep -ni "Executed Spread :"  $file | while read iteration
  do
    lineNumber=`echo $iteration | awk -F':' '{print $1}' ` 
    executedSpread=`awk -v lineNum="$lineNumber" -F':' '{if(NR==lineNum) print $NF}' $file`
    executedTime=`awk -v lineNum="$lineNumber" -F'.' '{if(NR==lineNum) print $1}' $file`
    lineNumber=$(( lineNumber+1 ))
    executedQuantity=`awk -v lineNum="$lineNumber" -F':' '{if(NR==lineNum) print $NF}' $file`
    desiredSpread=`getDesiredSpread $file $lineNumber`
    #printData $itrCount $dealer $strategyId $symbol $orderMode $executedQuantity $desiredSpread $executedSpread $executedTime
    echo "$dealer","$strategyId","$symbol","$orderMode","$executedQuantity","$desiredSpread","$executedSpread","$executedTime" >> $fileName"__CreatedForLogsDated__"$dateFilter.csv
    itrCount=$(( itrCount+1 )) 
  done
}

function parseLogFiles()
{
  if [[ "$dateFilter" == "all" ]]
  then
    for file in `ls | grep CashFuture | grep txt`
    do
      getDataFromFile $file $dateFilter
    done
  else
    for file in `ls | grep CashFuture | grep txt | grep $dateFilter`
    do
      getDataFromFile $file $dateFilter
    done
  fi

}

function verifyDate()
{
  if [[ "$customDate" == "" ]]
  then
    dataDate=`date +%d%b%y`
  fi
  if [[ "$customDate" == "all" ]]
  then
    dataDate=all
  fi
  if [[ "$customDate" != "" ]] && [[ "$customDate" != "all" ]]
  then
    dataDate=`date -d "$customDate" +%d%b%y`
  fi
  echo $dataDate

}

function printHelp()
{
  echo "This script will only work on bash 4.2 and above "
  echo "To run script either run it with bash or give execution permissions"
  echo "chmod +x genCashFutureReports.sh => ./genCashFutureReports.sh"
  echo "or"
  echo "bash genCashFutureReports.sh"
  echo "Usage :: "
  echo "By Default script will run for today's date"
  echo "./genCashFutureReports.sh"
  echo "To run for a custom date run with -t and date String in format YYYY-MM-DD"
  echo "genCashFutureReports.sh -t 2019-05-15"
  echo "To run for all the files run with -t and all "
  echo "genCashFutureReports.sh -t all"
  exit 
}

function main()
{
  dateFilter=`verifyDate $customDate`
  if [[ "$dateFilter" == "" ]]
  then
    printHelp
  fi
  checkTodayReportFile $dateFilter
  parseLogFiles $dateFilter
}

allFiles=0
while getopts t:h: option
do
  case "${option}"
    in
    t) customDate=${OPTARG};;
    h) printHelp
  esac
done


main $customDate
