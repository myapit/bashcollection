#!/bin/bash
# loop sample code

# numeric type
for index in 1 2 3 4 5
do
        echo $index
done

for index in {1..10}
do
        echo $index
done

# for bash version 4.0 and above {start..end..increment}
for index in (1..10..2}
do
        echo $index
done


# three expression type
# C-style code
for (( index = 1; index <=10; index++ ))
do
        echo $index
done

# infinate loop : for (( ; ; ))

# lopp with conditional break
for index in {1..10}
do
        if [ $index -eq 10 ]
        then
                echo "stop now"
                break
        fi
done


for file in /var/log
do
        if [ "${file}" == "/var/log/secure" ]
        then
                echo "file found"
                break
        fi
done

# loop with continue command
for I in 1 2 3 4 5
do
  statements1      #Executed for all values of ''I'', up to a disaster-condition if any.
  statements2
  if (condition)
  then
        continue   #Go to next iteration of I in the loop and skip statements3
  fi
  statements3
done

FILES="$@"
for myfile in $FILES
do
        if [ -f ${f}.bak ]
        then
                echo "Skiping $f file..."
                continue  # read next file and skip the cp command
        fi

        # execute this command if above condition DO NOT MEET
        /bin/cp $f $f.bak
done

# reference to : https://www.cyberciti.biz/faq/bash-for-loop/
# credits go to them too
