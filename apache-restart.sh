#!/bin/bash
/usr/bin/systemctl restart httpd
#/usr/bin/systemctl start httpd

for (( ; ; ))
do
   echo "checking"
   sleep 120
    if [ `ps auxwwww|grep httpd|grep -v grep|wc -l` -gt 0 ]
    then
     echo Apache is running.
     break
    else
     echo Apache is not running.
     /usr/bin/systemctl start httpd
    fi

done

# put this file in /etc/cron.daily (centos 7)
