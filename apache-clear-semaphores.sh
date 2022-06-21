#!/bin/bash
ipcs -s | awk -v user=apache '$3==user {system("ipcrm -s "$2)}'
