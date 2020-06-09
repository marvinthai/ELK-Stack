#!/bin/bash

###########################################################
#- Using your findings from the Player Analysis, create a **separate script to look at each day and each time** that you determined losses occurred. 
# Use `awk`, `pipes`, and `grep` tp isolates out the following four fields:¬
#- Time¬
#- AM/PM¬
#- First Name of Roulette Dealer¬ - Last Name of Roulette Dealer¬
#
#- For example, if there was a loss that occurred on `March 10th at 2 PM`, you would write one script that found the Roulette Dealer that was working at that specific day and time. ¬
#- *Hint: you will have many scripts, but only a small change is needed in each script.*¬
###########################################################


DEALER_SCHEDULE="0310_Dealer_schedule 0312_Dealer_schedule 0315_Dealer_schedule"
#DEALER_TIMES="05:00:00 AM\|08:00:00 AM|02:00:00 PM\|08:00:00 PM\|11:00:00 PM"
DEALER_TIMES="05:00:00 AM|08:00:00 AM|02:00:00 PM|08:00:00 PM|11:00:00 PM"
AWK_ACTION="'{print $1, $2, $5, $6}'"

#for i in `ls`; do  echo -e "$i";  cat $i | awk '{print $1, $2, $5, $6}' | grep -E "05:00:00 AM|08:00:00 AM|02:00:00 PM|08:00:00 PM|11:00:00 PM"; done;

for i in $DEALER_SCHEDULE; 
	do  echo -e "$i";  
	#cat $i | awk '{print $1, $2, $5, $6}' | grep -E "05:00:00 AM|08:00:00 AM|02:00:00 PM|08:00:00 PM|11:00:00 PM"; 
	cat $i | awk '{print $1, $2, $5, $6}' | grep -E "$DEALER_TIMES"; 
	echo ---;
	done;

# EOF ====================================================

