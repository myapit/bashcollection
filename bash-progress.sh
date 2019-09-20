#!/bin/bash
 CLEAR(){ echo -en "\033c";}                            # Predefined functions
 CIVIS(){ echo -en "\033[?25l";}                        # (see description above)
 CNORM(){ echo -en "\033[?12l\033[?25h";}               #
  TPUT(){ echo -en "\033[${1};${2}H";}                  #
  DRAW(){ echo -en "\033%@";echo -en "\033(0";}         #
 WRITE(){ echo -en "\033(B";}                           #
  BLUE(){ echo -en "\033c\033[0;1m\033[37;44m\033[J";}  #

   touch /tmp/.waiting                                  # create an empty control file
   trap "rm -rf /tmp/.waiting;exit 2" 1 2 3 15          # catch interrupt keys (like ctrl+c)

   P0(){ echo -n '#';}
   P1(){ echo -n  '|';}                                 # function P1 (for progress)
   P2(){ echo -n  '/';}                                 #          P2
   P3(){ echo -n '-';}                                  #          P3
   P4(){ echo  -n '\';}                                 #          P4

   CLEAR                                                # clear screen
   BLUE                                                 # make background blue and font white
   CIVIS                                                # hide cursor

   echo -e ""                                           # empty line
   echo -e ""                                           # empty line again

   DRAW                                                 # switch to drawing mode
   echo -e "  lqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqk"         # draw box lines
   echo -e "  x                              x"         #
   echo -e "  x EXECUTING IN PROGRES:        x"         # use large case, since small ones
   echo -e "  x                              x"         # are now used used for drawings
   echo -e "  mqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqj"         #
   WRITE                                                # switch back to normal text input mode

   i=0                                                  # set variable 'i'
   while [ -f /tmp/.waiting ]                           # while file exist
   do                                                   # 
    i=$((++$i))                                         # increase variable i by one each time
     TPUT 5 30 ;P$i                                     # put one of P1, P2, P3 or P4 to exact position

     if [ "$i" = "4" ]; then                            # make sure that variable 'i' will never
        unset i                                         # increase over 4
     fi                                                 #

    usleep 100000                                       # 0.1 second sleep (microsleep)
   done &                                               # fork a subprocess and execute it in background

   # some operation here                                # customize for your needs (put some custom commands)

   sleep 5                                              # sleep for another 5 seconds
   rm -rf /tmp/.waiting                                 # remove control file and stop execution

   TPUT 10 10                                           # put cursor out of the box to another place
   echo ""                                              # make an empty line
   CNORM                                                # Normalize cursor view
