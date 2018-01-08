#!/bin/bash
find /var/www/html/ -name "*.jpa" | grep backup | xargs rm
