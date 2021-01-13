#!/bin/bash 

#name='$1'
SCRIPT_PATH=`pwd`

SEARCHPATH=/root/muTrade-1.0.0-Linux_I2/logs/strategyLogs/

cd  $SEARCHPATH

rm -f $SCRIPT_PATH/commulative_avg_data_*
rm -f single_records.txt 
rm -rf *_records.txt
################################# Function To get average data for single strategy
single_strategy() { 

 echo "############################# Total Time ########################"
   
      grep "Total Time:" single_records.txt | awk -F "Total Time:" '{ print $NF}'|sort -n|awk ' { a[i++]=$1; } END { print "Median = ",a[int(i/2)]; print "Min = ",a[0] ; print "Max = ",a[i-1] }'
echo "############################# TurnAroundTime ########################"

      grep "TurnAroundTime:" single_records.txt | awk -F "TurnAroundTime:" '{ print $NF}'|sort -n|awk ' { a[i++]=$1; } END { print "Median = ",a[int(i/2)]; print "Min = ",a[0] ; print "Max = ",a[i-1] }'

echo "############################# Time to Send ########################"
     grep "Time to Send:" single_records.txt | awk -F "Time to Send:" '{ print $NF}'|sort -n|awk ' { a[i++]=$1; } END { print "Median = ",a[int(i/2)]; print "Min = ",a[0] ; print "Max = ",a[i-1] }'

echo "############################# Time to React ########################"
    grep "Time to React:" single_records.txt | awk -F "Time to React:" '{ print $NF}'|sort -n|awk ' { a[i++]=$1; } END { print "Median = ",a[int(i/2)]; print "Min = ",a[0] ; print "Max = ",a[i-1] }'
 
}

####################### Function to get average data for all strategy
avg_data() {
    echo "############################# Total Time ########################"

      grep "Total Time:" all_records.txt | awk -F "Total Time:" '{ print $NF}'|sort -n|awk ' { a[i++]=$1; } END { print "Median = ",a[int(i/2)]; print "Min = ",a[0] ; print "Max = ",a[i-1] }'
echo "############################# TurnAroundTime ########################"

      grep "TurnAroundTime:" all_records.txt | awk -F "TurnAroundTime:" '{ print $NF}'|sort -n|awk ' { a[i++]=$1; } END { print "Median = ",a[int(i/2)]; print "Min = ",a[0] ; print "Max = ",a[i-1] }'
     
echo "############################# Time to Send ########################"
     grep "Time to Send:" all_records.txt | awk -F "Time to Send:" '{ print $NF}'|sort -n|awk ' { a[i++]=$1; } END { print "Median = ",a[int(i/2)]; print "Min = ",a[0] ; print "Max = ",a[i-1] }'

echo "############################# Time to React ########################"
    grep "Time to React:" all_records.txt | awk -F "Time to React:" '{ print $NF}'|sort -n|awk ' { a[i++]=$1; } END { print "Median = ",a[int(i/2)]; print "Min = ",a[0] ; print "Max = ",a[i-1] }'
}


find_lattency()
{
    egrep 'Time to React|Time to Send|TurnAroundTime|Total Time' $1
}



if [[ "$1" == "all" ]] 
then 
    #Run for all since no argument passed 
    for uniq_strategy in `ls | awk -F'_' '{print $1}' | uniq `
    do 
	echo running for strategy $uniq_strategy
	for file in `ls | grep $uniq_strategy`
	do 
 	    find_lattency $file| awk -F'|' '{print $2}' >> "$uniq_strategy"_records.txt
            
          #  echo file is $file
            #single_stratey > $SCRIPT_PATH/$uniq_strategy
            #dos2unix $SCRIPT_PATH/$uniq_strategy
	    find_lattency $file |awk -F'|' '{print $2}' >> all_records.txt
           
         done 

    done
else 

#    echo Verifying if strategy name is correct    
    
#   for arg in `ls |awk -F'_' '{print $1}'|uniq` 

#    do 

#     if [[ "$arg" == "$1" ]]

#    then 
     echo -n "Enter Strategy ID :"
     read SID
     
    echo Running for strategy $SID
                  
      for file in `ls | grep $SID`
        do
       # echo  FILE is $file
             
           find_lattency $file | awk -F'|' '{print $2}' >> single_records.txt
           # find_lattency $file |awk -F'|' '{print $2}' >> all_records.txt
            single_strategy >>  $SCRIPT_PATH/"$SID"_`date +%F_%H%M` 
        done

 #   else 
 #       echo Strategy Name Is Not Correct 
       fi
#done
#fi
avg_file() {
dos2unix all_records.txt 
avg_data >> $SCRIPT_PATH/commulative_avg_data_`date +%F` 
dos2unix $SCRIPT_PATH/commulative_avg_data_`date +%F`
}

avg_file &> /dev/null
rm -rf *_records.txt
