#!/bin/bash
cd $3
if [ -f  ./.buildconfig ]; then
	build=()
	read -a build < ./.buildconfig
	echo "Being built with:"
	echo ${build[@]}
	echo
	gcc -g -Wall $1 ${build[@]} -o $2

else 
	echo "Need to run 'build' at least once"
	echo
	read -p "Hit ENTER to close"
	exit
fi

if [ -f  ./.buildargv ]; then
	input=()
	read -a input < ./.buildargv
	echo "Being run with argvs:"
	echo ${input[@]}
	echo
	echo "Runnig program:"
	echo
	./$2 ${input[@]}

	echo "

------------------
(program exited with code: $?)"   

	echo
	read  -p "Hit ENTER to close"
else 
	echo "Need to run 'build' at least once"
	echo
	read -p "Hit ENTER to close"
	exit
fi