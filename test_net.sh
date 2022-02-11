#!/bin/bash
#
# Sample shell script to demo exit code usage #
#
#set -xvu

## find ip in the file ##
grep -q 127.0.0 /etc/resolv.conf
## Did we found IP address? Use exit status of the grep command ##
if [ $? -eq 0 ]
then
  echo "Success: I found IP address in file."
  echo "function_name(): value of \\$var is ${var}"
  exit 0
else
  echo "--- Failure: I did not found IP address in file. Script failed --- " 
## >&2
  echo "function_name(): value of \\$var is ${var}"
  exit 1
fi

