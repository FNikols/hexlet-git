#!/bin/bash

echo "Применение ловушки DEBUG"
trap 'echo "line ${LINENO}: score is $score"' DEBUG

score=0
if [ "${USER}" = "mike" ]; then
    let "score += 1"
fi

let "score += 1"

if [ "$1" = "7" ]; then
    score=7
fi
# exit 0

echo "Применение ловушки EXIT"
trap 'echo score is $score, status is $status' EXIT

if [ -z $1 ]; then
    status="default"
else
    status=$1
fi

score=0
if [ ${USER} = 'superman' ]; then
    score=99
elif [ $# -gt 1 ]; then
    score=$2
fi
exit

# --------------------------
echo "with -f turned off"
ls *

echo "with -f turned on"
set -f
ls *
set +f
exit

# --------------------------
touch /root/test 2>/dev/null
if [ $? -eq 0 ]; then
    echo "Successfully created file"
    exit 0
else
    echo "Could not create file" >&2
    exit 1
fi
