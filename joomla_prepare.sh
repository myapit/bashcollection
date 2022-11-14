#!/bin/bash

if [[ -z "$1" && -z "$2" ]]
then
        echo "$0"
        echo "need paramater of JPA filename and WWWW"
        exit 1
else
        echo "Copi .JPA and Kickstat"
        sudo cp /home/sftponly/unitweb2/muatnaik/$1 /var/www/html/$2
        sudo cp /home/hafeez/kickstart.php /var/www/html/$2
        echo "Done kopi"

        echo "Grep data from config.php for $2"
        grep -E "user|password|db" /var/www/html/$2/configuration.php
        exit 1
fi
