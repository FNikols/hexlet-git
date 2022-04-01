#!/bin/bash
#
# Sample shell script to demo exit code usage #
#
#set -xvu

parametr1=$1                                                             #присваиваем переменной parametr1 значение первого параметра скрипта
script_name=$0                                                           #присваиваем переменной script_name значение имени скрипта
echo "Вы запустили скрипт с именем $script_name и параметром $parametr1" # команда echo выводит определенную строку, обращение к переменным осуществляется через $имя_переменной.
echo 'Вы запустили скрипт с именем $script_name и параметром $parametr1' # здесь мы видим другие кавычки, разница в том, что в одинарных кавычках не происходит подстановки переменных.

## find ip in the file ##
grep -q 127.0.0.53 /etc/resolv.conf
## Did we found IP address? Use exit status of the grep command ##
if [ $? -eq 0 ]; then
  echo "Success: I found IP address in file."
  # echo "function_name(): value of \\$var is ${var}"
  exit 0
else
  echo "--- Failure: I did not found IP address in file. Script failed --- "
  ## >&2
  # echo "function_name(): value of \\$var is ${var}"
  exit 1
fi
