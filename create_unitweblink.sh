#!/bin/bash

if [[ -z "$1" && -z "$2" ]]
then
        echo "No Parameter,  need param: $0 shortkut fullurl"
else
        echo  $1
        sudo mkdir /home/sftponly/unitweb2/web_$1
        read -p "press"
        sudo mount --bind /var/www/html/$2 /home/sftponly/unitweb2/web_$1
        read -p "press"
        echo "mount --bind /var/www/html/$2 /home/sftponly/unitweb2/web_$1" | sudo tee -a /opt/runbind.sh
        read -p "Press to end"
        sudo chown apache:unitweb2 -R /var/www/html/$2
        read -p "Press key : patut last dh nie"
        exit 1
fi
