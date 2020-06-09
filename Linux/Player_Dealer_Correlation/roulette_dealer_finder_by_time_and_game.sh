#!/bin/bash

#######################################################
### Step 4: Scripting your Tasks¬
#
# In case there is future fraud on the other Lucky Duck Games, create a shell script called `roulette_dealer_finder_by_time_and_game.sh` that has the three following arguments:¬
#- One for the the specific time¬
#- One for the specific date¬
#- One for the casino game being played¬
# Note: The argument should be able to accept AM or PM.¬ 
#######################################################


SEARCH_DATE=$1
SEARCH_TIME=$2
SEARCH_DEALER=$3
DEALER_SCHED_FILE="$SEARCH_DATE"_Dealer_schedule

# Expect exactly 3 arguement
if  [ "$#" -ne 3 ]; then
    echo "Need to supply argument"
    echo "Usage: `basename $0` <date_4digits> <HR> <BlackJack|Roulette|Texas>"  
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
echo -e "Search Time in 1-12 hours -->" $SEARCH_TIME
echo -e "Search Dealer is -->" $3
echo -e "*_Dealer_schedule file to search -->"   $DEALER_SCHED_FILE
echo -e "-----------"

BlackJack_Dealer="blackjack"
Roulette_Dealer="roulette"
Texas_Hold_EM_dealer="texas"
DEALER_IS="/tmp/dealer.txt"

if [ "$3" == "$BlackJack_Dealer" ]; then
	cat $DEALER_SCHED_FILE | awk '{print $1, $2, $3, $4}' | grep -E "$SEARCH_TIME" 
elif [ "$3" == "$Roulette_Dealer" ]; then 
	cat $DEALER_SCHED_FILE | awk '{print $1, $2, $5, $6}' | grep -E "$SEARCH_TIME" 
else 
	cat $DEALER_SCHED_FILE | awk '{print $1, $2, $7, $8}' | grep -E "$SEARCH_TIME" 
fi

# EOF ====================================================


