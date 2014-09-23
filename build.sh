#!/bin/bash
cd $3

arr=( $(find  -maxdepth 1 -type f  -name "*.c" ! -name "$2.*"  ))

echo ${arr[@]}
build=()
echo "Other files to build with? enter the name without the './', then press enter:"
read -a build 

gcc -g -Wall $1 ${build[@]} -o $2

touch .buildconfig
printf "%s " "${build[@]}" > .buildconfig
input=()
echo "enter command line input leave blank if none, then press enter:"
read -a input
touch .buildargv
printf "%s " "${input[@]}" > .buildargv

./$2 ${input[@]}

echo "

------------------
(program exited with code: $?)"   


read  -p "Hit ENTER to close"
