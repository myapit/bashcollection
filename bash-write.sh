#!/bin/bash

DOMAIN=""
echo "*******"
echo "Apache conf generator"
echo ""
read -p "Enter FULL DOMAIN Name (ex: www.koolblog.usm.my ) : " DOMAIN
##touch ${DOMAIN}.txt
DOMAIN=${DOMAIN/\.usm\.my/}
if [ ! -f ${DOMAIN}.conf ]; then
tee "${DOMAIN}".conf <<EOF
<Directory "/var/www/html/${DOMAIN}.usm.my">
    php_admin_value open_basedir /var/www/html/${DOMAIN}.usm.my
    php_admin_value upload_tmp_dir /var/www/html/${DOMAIN}.usm.my/tmp
    RewriteEngine On
    RewriteOptions Inherit
    <LimitExcept GET POST>
        Deny from all
    </LimitExcept>
    Options FollowSymLinks IncludesNoExec
    AllowOverride All
    Order allow,deny
    Allow from all
</Directory>
EOF
else
 echo "FILE ${DOMAIN} ALREADY EXISTS !"
fi
