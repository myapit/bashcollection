#!/bin/bash
START=`date +%s`
PYTHON=`which python`
while [ $(( $(date +%s) - 3600 )) -lt $START ]; do
    echo $(date)
    $PYTHON ps_mem.py >> /home/hafeez/log-mem.txt
    sleep 1m
done
