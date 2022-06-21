#author: myapit
#Purpose: to clear semaphores when apache fail to start

#!/bin/bash

   echo "checking"
   #sleep 120
    if [ `ps auxwwww|grep httpdX|grep -v grep|wc -l` -gt 0 ]
    then
     echo "Apache is running."
     exit
    else
     echo "Apache is not running."
      /home/hafeez/apache-clear-semaphores.sh
      sleep 5
      /usr/bin/systemctl start httpd
    fi
