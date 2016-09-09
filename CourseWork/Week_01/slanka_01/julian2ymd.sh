#!/bin/bash

#BASH script to convert Julian date into Year Month and day format

#slanka for Assignment_01/Question_07
#Mon,Sept 7,2016, 00:43AM

#START
#Check to see if the Inputs are valid positive Integers and not aplhabets
if [[ $1 =~ ^[\-0-9]+$ ]] && (($1 > 0))
then
	continue
else
	echo "Please Enter valid Positive Integers as the Input"
    echo "Usage: sh julian2ymd.sh <Year> <days> "
	exit
fi
#Check to see if the Second Argument is Positive Integer
if [[ $2 =~ ^[\-0-9]+$ ]] && (($2 > 0))
then
	continue
else
	echo "Please Enter valid Positive Integers as the Input"
    echo "Usage: sh julian2ymd.sh <Year> <days> "
	exit
fi
#check to see if there is no input and prompt the Usage
if [ $# -ne 2 ]
then
    echo "Usage: sh julian2ymd.sh <Year> <days> "
	exit
else
	#If everything is fine save the arguments in variables
    jy=$1
	jd=$2
	#check to see if the year is a leap year.
	ly=`echo "$jy%4" | bc`
	case $ly in
		#if the year is a leap year
		0)
		#Pipe the echoed output to the calculator
		m=`echo "($jd/31)" | bc`
		#Check for m cases
		#Subtract the number of days according to the m
		#The remainging days correspond to days in the month after
		case $m in
			0) d=`echo "$jd" | bc` ;;
			1) d=`echo "$jd-31" | bc` ;;
			2) d=`echo "$jd-60" | bc` ;;
			3) d=`echo "$jd-90" | bc` ;;
			4) d=`echo "$jd-121" | bc` ;;
			5) d=`echo "$jd-151" | bc` ;;
			6) d=`echo "$jd-182" | bc` ;;
			7) d=`echo "$jd-212" | bc` ;;
			8) d=`echo "$jd-243" | bc` ;;
			9) d=`echo "$jd-274" | bc` ;;
	   	   10) d=`echo "$jd-304" | bc` ;;
	   	   11) d=`echo "$jd-335" | bc` ;;
	   esac
	   ;;
	   *)
	   #If the year is not a leap year
	   #continue the same process but this time Feb has 28 days.
	    m=`echo "($jd/30)" | bc`
		case $m in
			0) d=`echo "$jd" | bc` ;;
			1) d=`echo "$jd-31" | bc` ;;
			2) d=`echo "$jd-60" | bc` ;;
			3) d=`echo "$jd-90" | bc` ;;
			4) d=`echo "$jd-121" | bc` ;;
			5) d=`echo "$jd-151" | bc` ;;
			6) d=`echo "$jd-182" | bc` ;;
			7) d=`echo "$jd-212" | bc` ;;
			8) d=`echo "$jd-243" | bc` ;;
			9) d=`echo "$jd-274" | bc` ;;
   	   	   10) d=`echo "$jd-304" | bc` ;;
   	   	   11) d=`echo "$jd-335" | bc` ;;
   		esac
		;;
	esac 
	m=$(($m+1))
	#if the days are exactly equal to the number of days. Its the next day of the net month so increment the day by one
	if [ $d == 0 ]
	then
		d=$(($d+1))
	fi
	#print the output on the screen
printf "%d-%02d-%02d\n" ${jy} ${m} ${d}
fi

#END
