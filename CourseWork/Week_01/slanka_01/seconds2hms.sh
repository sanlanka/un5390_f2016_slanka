#!/bin/bash

#BASH Script to Convert seconds into Human readable hms format
#slanka for UN5390 Assignment_01/question 6
#Sun 6 Sept, 2016, 11:08PM
#save user input in $secs
#Usage: sh seconds2hms.sh <seconds>

#START

#check to see if there is no input and prompt the Usage 
#and also check to see if the nummber of arguments is equal to one
if [ $# -ne 1 ]
then
	
    echo "Usage: sh seconds2hms.sh <seconds> "
else
    secs=$1
fi

#Check to see if the Input is Positive Integer and then proceed to calculate the  Hours: Minutes:Seconds
if [[ $secs =~ ^[\-0-9]+$ ]] && (($secs > 0))
then
	((hh=secs/3600))
	((mm=secs%3600/60))
	((ss=secs%60))
	printf "%d:%02d:%02d\n" ${hh} ${mm} ${ss}
else
	echo "Please Enter a valid Positive Integer as the Input"
fi

#END