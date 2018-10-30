#!/bin/bash


filename=$1

#cleanup
#HELLO=":hello:"
#HELLO=$(strip "$HELLO" ":")
#echo $HELLO # hello

echo "Cleaning all file and directory ..."
echo "" > php-gen.ini
echo "" > logrepot.txt
rm tmp/*
echo "Beginnning migration process ... "

while read -r line
do
    name="$line"
    DATE=`date '+%Y-%m-%d %H:%M:%S'`
   # echo "Name read from file - $name"
    sshpass -f 'mypass' scp -r /var/www/html/$name username@servername.usm.my:~/joomla-migrate-2018
    echo "#"
    echo "[PATH=/var/www/html/$name]" >> php-gen.ini
    echo "open_basedir = /var/www/html/$name" >> php-gen.ini
    echo "upload_tmp_dir = /var/www/html/$name/tmp" >> php-gen.ini

    apacheconfname=${name//".usm.my"/}
#$(strip "$name" "usm.my")
    echo "<Directory \"/var/www/html/$name\">
         RewriteEngine On
         RewriteOptions Inherit
         <LimitExcept GET POST>
                Deny from all
        </LimitExcept>
         Options FollowSymLinks IncludesNoExec
         AllowOverride All
         Order allow,deny
         Allow from all
        </Directory>" > "tmp/$apacheconfname.conf"

    echo "">> php-gen.ini
    echo "DONE ($DATE) - $name" >> logrepot.txt
done < "$filename"
