#!/bin/bash

name=$1 # $1 is the first argument passed to the script
greeting=$2 # $2 is the second argument passed to the script

echo "$greeting, $name. You are looking good today!"

# if we run the script with ./positional_arguments.sh "john smith" "good morning", we will get the following output:

# good morning, john smith. You are looking good today!