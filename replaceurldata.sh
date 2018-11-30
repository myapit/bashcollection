#!/bin/bash

filename=$1
while read -r baris
do
    url="${baris/\.usm\.my/}"
    url="${url/www\./}"
    echo "mkdir /home/folderlagi/unitweb2/web_$url"
    echo "mount --bind /var/www/html/$baris /home/foldersamaja/unitweb2/web_$url"
    echo "chown apache:unitweb2 -R /home/foldeuish/unitweb2/web_$url"
    echo "chmod 2775 -R /home/folderla/unitweb2/web_$url"
    echo "echo \"mount --bind /var/www/html/$baris /home/folderlagik/unitweb2/web_$url\" | sudo tee -a /opt/runbind.sh"
    echo ""
done < "$filename"
