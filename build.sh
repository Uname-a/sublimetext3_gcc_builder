#!/bin/bash
cd $3
echo $3
arr=( $(find  -maxdepth 1 -type f  -name "*.c" ! -name "$2.*"  ))

echo ${arr[@]}
build=()
echo "Other files to build with? enter the name without the './', then press enter:"
read -a build 
echo
gcc -g -Wall $1 ${build[@]} -o $2

touch .buildconfig
printf "%s " "${build[@]}" > .buildconfig
input=()
echo "enter argvsto be run with, leave blank if none, then press enter:"
read -a input
echo
touch .buildargv
printf "%s " "${input[@]}" > .buildargv
echo "Running Program:"
echo
./$2 ${input[@]}

echo "

------------------
(program exited with code: $?)"   
echo

read  -p "Hit ENTER to close"
