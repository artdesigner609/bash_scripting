#!/bin/bash
num1=$1
num2=$2

echo "what is your name?"
read name

echo "what is your age?"
read age

random_number=$((RANDOM % 100))
sum=$((num1 + num2))
echo "$name, the sum of $num1 and $num2 is $sum and your age is $age and you won a lottery of $random_number."

echo "--------------------------------"
echo "some other random variables in BASH are:"
echo $SHELL
echo $PWD
echo $USER
echo $HOSTNAME
echo $HOSTTYPE
echo $OSTYPE
echo $TERM
echo "--------------------------------"
