#!/bin/bash
# example of passing argument to bash script

#basic arg get using dolarsign $ and number of arg
echo "#argument splite using space up to 3 word/argument. => " $1 $2 $3

#get all argument and store in array
args=("$@")
echo "#argument in array =>" ${args[0]} ${args[1]} ${args[2]}

#get number of arg passed
echo "Number of argument => " $#
