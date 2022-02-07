#!/bin/bash
MY_DIRECTORIES="/home /var/log"
echo "Первые 10 каталогов по размеру"
for DIR in $MY_DIRECTORIES; do
	echo "The $DIR Directory:"
	du -S "$DIR" 2>/dev/null |
		sort -rn |
		sed '{11,$D; =}' | sed 'N; s/\n/ /' | awk '{printf $1 ":" "\t" $2 "\t" $3 "\n"}'
done
exit
