#!/bin/bash
#######################################################
### Step 4: Scripting your Tasks¬
# Develop a shell script called `roulette_dealer_finder_by_time.sh` that can analyze the employee schedule to easily find the Roulette Dealer at a specific time.
#
#  Design the shell script to accept the following two arguments:¬ 
# - One for the date (Four Digits)¬
# - One for the time¬
# Note: The argument should be able to accept AM or PM.¬ 
#######################################################


SEARCH_DATE=$1
SEARCH_TIME=$2
DEALER_SCHED_FILE="$SEARCH_DATE"_Dealer_schedule

# Expect exactly 3 arguement
if  [ "$#" -ne 3 ]; then
    echo "Need to supply argument"
    echo "Usage: `basename $0` <date_4digits> <HR> <AM/PM>" 
    exit 1
fi

# Check for existing log file
FILE=$DEALER_SCHED_FILE     
if [ ! -f $FILE ]; then
	echo "Log file $FILE does not exist."
	exit 1
fi

# Take times in 1-12 hours only
if [[ ! "$SEARCH_TIME" =~ ^[0-9]+$ ]]; then 
	echo "Enter time format as:  hours in 1-12 hours"
	exit 1
	elif [ "$SEARCH_TIME" -gt 12 ]; then
		echo "Enter time as hours from 1-12"
		exit 1	
fi

echo -e "\nStart searching...."
echo -e "Search date -->" $SEARCH_DATE
echo -e "Search Time in 1-12 hours -->" $SEARCH_TIME $3
echo -e "*_Dealer_schedule file to search -->"   $DEALER_SCHED_FILE
echo -e "-----------"

if [ "$3" == "AM" ]; then
		DAY="PM"
	else
		DAY="AM"
fi
cat $DEALER_SCHED_FILE | awk '{print $1, $2, $5, $6}' | grep -E "$SEARCH_TIME"  | grep -Ev "$DAY"
# EOF ====================================================


