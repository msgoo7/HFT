#!/bin/sh

#  Inputs  ./startCronjob  Choice
#  start :   Start Cron job   
#  list  :   list all Cronjob 
#  stop  :   stop cronjob
#  logs  :   span Cronjob logs
#  spanlogs :   span Cronjob logs
#  man   :   about setup a cron job


#Dedicated Span Files Path   
spanFilePath=$PWD

#Timer For download Span File Again(minutes)
timer=1


#Read Command Line Input
userInput=$1
echo "Choice :  $userInput"


Python=$(which python)

if [ -f "SpanParser.py" ]; then 
  echo "File Found "
  $Python -m compileall .
fi


# Start cron jobs mentioned in cron.txt
if [ $userInput = "start" ]; then


        echo   "////////////////////////////////////////////////////////"  >> cronLogs.txt
        echo   "New Span File Download Started  : $(date) Started  "  >> cronLogs.txt
	echo   "Timer :: $timer "           >> cronLogs.txt
	echo   "directory :: $spanFilePath " >> cronLogs.txt
	echo   "*/$timer * * * *  $Python ${PWD}/SpanParser.pyc $spanFilePath  > ${PWD}/spanLogs.txt  2>&1"  >  cronJob.txt

	crontab cronJob.txt

# List all running cron jobs
elif [ $userInput = "list" ]; then    
	
 		crontab  -l   							

# Stop all cron jobs
elif [ $userInput  = "stop" ]; then

		crontab -r

# Show logs from  cron jobs
elif [ $userInput  = "logs" ]; then
		
 		vim cronLogs.txt

# Show logs from  cron jobs
elif [ $userInput  = "spanlogs" ]; then
		
 		vim  spanLogs.txt

# Description about cron job
elif [ $userInput  = "man" ]; then
	
		vim  cronDescription.txt
else
      echo   "////////////////////////////////////////////////////////"
      echo   "== Wrong Choice : Valid inputs are ======="
      echo   "start :   Start Cron job"
      echo   "list  :   list all Cronjob"
      echo   "stop  :   stop cronjob"
      echo   "logs  :   span Cronjob logs"
      echo   "spanlogs :   span Cronjob logs"
      echo   "man   :   about setup a cron job"
      echo   "////////////////////////////////////////////////////////"
fi	

