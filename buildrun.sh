#!/bin/bash
cd $3
build=()
readarray build < ./.buildconfig
echo "Being built with:"
echo ${build[@]}


gcc -g -Wall $1 ${build[@]} -o $2

input=()
readarray input < ./.buildargv
echo "Being run with:"
echo ${input[@]}

./$2 ${input[@]}

echo "

------------------
(program exited with code: $?)"   


read  -p "Hit ENTER to close"
