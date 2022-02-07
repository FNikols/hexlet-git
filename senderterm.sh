#!/bin/bash
logged_on=$(who | grep -i -m1 "$1" | awk '{print $1}')
echo "$logged_on"
if [ -z "$logged_on" ]; then
	echo "$1 is not logged on."
	echo "Exit"
	exit
fi
allowed=$(who -T | grep -i -m1 "$1" | awk '{print $2}')
echo "$allowed"
if [ "$allowed" != "+" ]; then
	echo "$1 does not allowing messaging."
	echo "Exit"
	exit
fi
if [ -z "$2" ]; then
	echo "No message parameter included."
	echo "Exit"
	exit
fi
terminal=$(who | grep -i -m1 "$1" | awk '{print $2}')
echo "$terminal"
shift
while [ -n "$1" ]; do
	whole_message=$whole_message' '$1
	shift
done
echo "$whole_message" | write "$logged_on" "$terminal"
