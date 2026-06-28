#!/bin/bash
num1=$1
num2=$2

echo "what is your name?"
read name

echo "what is your age?"
read age

random_number=$((RANDOM % 100))
sum=$((num1 + num2))
echo "--------------------------------"
echo "Hello $name! the sum of $num1 and $num2 is $sum."
echo "your age is $age."
echo "and you won a lottery of $random_number, at $(($random_number + $age))."

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

echo $((2 + 3)) # addition
echo $((2 - 3)) # subtraction
echo $((2 * 3)) # multiplication
echo $((2 / 3)) # division - bash doesn't do floating numbers by default
echo $((2 % 3)) # modulus
echo $((2 ** 3)) # exponentiation
echo "--------------------------------"
