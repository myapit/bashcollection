#!/bin/bash
e='echo -en'                                     # shortened echo command variable
   ESC=$( $e "\033")                             # variable containing escaped value 
 CLEAR(){ $e "\033c";}                           # clear screen
 CIVIS(){ $e "\033[?25l";}                       # hide cursor
 CNORM(){ $e "\033[?12l\033[?25h";}              # show cursor
  TPUT(){ $e "\033[${1};${2}H";}                 # terminal put (x and y position)
COLPUT(){ $e "\033[${1}G";}                      # put text in the same line as the specified column
  MARK(){ $e "\033[7m";}                         # select current line text
UNMARK(){ $e "\033[27m";}                        # normalize current line text
  DRAW(){ $e "\033%@";echo -en "\033(0";}        # switch to 'garbage' mode to be able to draw
 WRITE(){ $e "\033(B";}                          # return to normal (reset)
  BLUE(){ $e "\033c\033[0;1m\033[37;44m\033[J";} # clear screen, set backgrou
