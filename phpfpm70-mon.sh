#!/bin/bash
multitail /var/opt/remi/php70/log/php-fpm/error.log /var/opt/remi/php70/log/php-fpm/www-error.log /var/opt/remi/php70/log/php-fpm/www-slow.log
