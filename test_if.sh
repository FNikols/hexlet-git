#!/bin/bash
#
# Sample shell script to demo exit code usage #
#
#set -xvu
set -o errexit
set -o nounset
# set -o pipefail

## find ip in the file ##
grep -q 127.0.0.53 /etc/resolv.conf
## Did we found IP address? Use exit status of the grep command ##

# KR=$?
# echo "KR = $KR"
# [ $KR -eq 0 ] || exit $KR
# echo "Возможно дальнейшее выполнение"

# [ $? -eq 0 ] || exit $?
# echo "Возможно"

# run this script with one argument
# the goal is to find out if the argument is a file or a directory
if [ -f "$1" ]; then
	echo "$1 is a file"
elif [ -d "$1" ]; then
	echo "$1 is a directory"
else
	echo "I do not know what \$1 is"
fi
exit 0
