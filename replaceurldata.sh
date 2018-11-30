#!/bin/bash

filename=$1
while read -r baris
do
    url="${baris/\.usm\.my/}"
    url="${url/www\./}"
    echo "mkdir /home/folderlagi/unitweb2/web_$url"
done < "$filename"
