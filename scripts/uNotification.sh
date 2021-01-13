#!/bin/bash
. /etc/profile
#set -x 
#We have defined the states to check the last state process
ProcessMailSent=0          #Process is not running and mail has been sent
ProcessDisconnectState=1   #Process is not running and mail is not sent yet
ProcessInitialisation=2    #Process is in running State

#Enter space separated emaild's on which email needs to be sent 
#for exmaple mailAddress=(abc@email.com def@email.com)
mailAddress=()


ServicesToMonitor=( hft-2 dms multicastTbt tradeReceiver1 tradeReceiver2 )
ServicesToRestart=( dms tradeReceiver1 tradeReceiver2 )

declare -A lastState

for processname in ${ServicesToMonitor[*]}
do
   lastState[$processname]=$ProcessInitialisation
done

RUNAT="08:30"



restartService()
{
  processname=$1
  #Restart module based upon case 

   ######################## Checking if service is DMS
   if [ "$processname" == "dms" ]
   then
           ./restartDms.sh
           sleep 1
   fi

####################### CHECKING tradeReceiver1

   if [ "$processname" == "tradeReceiver1" ]
   then
        ./runTradeReceiver1.sh
       sleep 1
   fi
####################### CHECKING tradeReceiver2

   if [ "$processname" == "tradeReceiver2" ]
   then
      ./runTradeReceiver2.sh
   sleep 1
   fi
 
  #Check if process has started or not 
  checkProcess=$(pidof $processname )
  if [ "$checkProcess" == "" ]
  then
     #Uncomment if required to mail on each restart failure
     #send_Mail "$DATE"  "$processname" false
     echo ERROR :: Unable to restart $processname :  ${lastState[$processname]}
  else
     send_Mail "$DATE" "$processname"  true
     lastState[$processname]=$ProcessInitialisation
     echo INFO :: $processname restarted successfully `date`
  fi

}


send_Mail(){
#echo " inside sendMail $1 - $2 - $3"

#Dummy send mail commands
#echo -e "############## Disk Status ###############\n $(df -Th )echo "  "\n \n############# Memory Status #############\n $(free -g)" | mailx -v -s "uTrade Module Notification: : $2 is Up" -S smtp="<ip>:<port>" -S smtp-use-starttls -S from=<from-emailid> -S smtp-auth=login -S smtp-auth-user="instialert" -S smtp-auth-password="<from-emailid-passwd>" -S ssl-verify=ignore  -S nss-config-dir="/etc/pki/nssdb/" ${mailAddress[*]}


if [ $3 = true ] 
then
     echo -e "############## Disk Status ###############\n $(df -Th )echo "  "\n \n############# Memory Status #############\n $(free -g)" | mailx -v -s "uTrade Module Notification: : $2 is Up"  -S smtp-use-starttls -S from=<from-emailid> -S smtp-auth=login -S smtp-auth-user="instialert" -S smtp-auth-password="<from-emailid-passwd>" -S ssl-verify=ignore  -S nss-config-dir="/etc/pki/nssdb/" ${mailAddress[*]}
else
     echo -e "############## Disk Status ###############\n $(df -Th )echo "  "\n \n############# Memory Status #############\n $(free -g)" | mailx -v -s "uTrade Module Notification: : $2 is Up"  -S smtp-use-starttls -S from=<from-emailid> -S smtp-auth=login -S smtp-auth-user="instialert" -S smtp-auth-password="<from-emailid-passwd>" -S ssl-verify=ignore  -S nss-config-dir="/etc/pki/nssdb/" ${mailAddress[*]}
fi
}

#We have defined the function to check the time it will run

check_services (){
while [ 1 ]
do
  DATE=`/bin/date +%H:%M`
  if [ "$DATE" == "$RUNAT" ] 
  then
       for processname in ${ServicesToMonitor[*]}
       do
         null=""
         checkProcess=$(pidof $processname )
         if [ "$checkProcess" != "$null"  ] 
         then
            send_Mail "$DATE"  "$processname" true

         else
            send_Mail "$DATE" "$processname"  false
         fi
        lastState[$processname]=$ProcessMailSent

       done
       sleep 61
  else
       for processname in ${ServicesToMonitor[*]}
       do
      	  echo "######################################################################################"
          echo INFO :: `date`
      	  echo INFO :: process :  $processname
      	  echo INFO :: process State :  ${lastState[$processname]}
               checkProcess=$(pidof $processname )
               if [ "$checkProcess" == "" ]
               then
       	           echo ERROR :: $processname not running `date`
       	           if [ ${lastState[$processname]} != $ProcessMailSent  ]
       	           then
               		     lastState[$processname]=$ProcessDisconnectState 
       	           fi
                   echo ERROR :: process State not working :  ${lastState[$processname]}
                   if [ ${lastState[$processname]} == $ProcessDisconnectState ] 
               	   then
               		     send_Mail "$DATE" "$processname"  false > /dev/null
                		   lastState[$processname]=$ProcessMailSent
       		             echo ERROR :: process State after mail sent :  ${lastState[$processname]}
                	 fi
                   if [[ "${ServicesToRestart[@]}" =~ "$processname" ]] 
                   then
                       sleep 5
                       echo INFO :: Restarting process $processname `date`
                       restartService $processname
                   fi
              else 
       	          echo INFO :: $processname running `date`
       	          lastState[$processname]=$ProcessInitialisation
              fi
       done
       sleep 10
   fi
done
}

check_services
