#!/bin/bash
#Created on:09-02-2010
#Last modified:02-05-2010
#Purpose:To check the user account status in Linux
#Author:Surendra Kumar Anne
#The below command will grep all the users in shadow file
#whose expiry time is set and send them to expirelist.txt
cat /etc/shadow | cut -d: -f1,8 | sed /:$/d > /tmp/expirelist.txt
totalaccounts=`cat /tmp/expirelist.txt | wc -l`
for((i=1; i<=$totalaccounts; i++ ))
do
tuserval=`head -n $i /tmp/expirelist.txt | tail -n 1`
username=`echo $tuserval | cut -f1 -d:`
userexp=`echo $tuserval | cut -f2 -d:`
userexpireinseconds=$(( $userexp * 86400 ))
todaystime=`date +%s`
#check if the user expired or not?
if [ $userexpireinseconds -ge $todaystime ] ;
then
timeto7days=$(( $todaystime + 604800 ))
if [ $userexpireinseconds -le $timeto7days ];
then
#mail -s "The account $username will expire less than 7 days" haf
echo "sss"
fi
else
echo ""
#mail -s "The user account $username already expired" hafeez
fi
done
