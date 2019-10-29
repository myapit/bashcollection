#!/bin/bash
find /var/www/html/ -name "*.jpa" | grep backup | xargs rm
find /var/www/html/ -name "*.j01" | grep backup | xargs rm
find /var/www/html/ -name "*.zip" | grep "wp-content" | grep backups | xargs rm

