#!/bin/bash

# declare an array of cars
cars=("car" "train" "bike" "bus")

echo "${cars[0]}" # print the first item in the array
echo "${cars[1]}" # print the second item in the array
echo "${cars[2]}" # print the third item in the array
echo "${cars[3]}" # print the fourth item in the array

# or use @ to show all elements of the array

echo "-----------------------------------------"
echo "${cars[@]}" # print all elements of the array
echo "-----------------------------------------"
unset cars[1] # remove the second item from the array
echo "-----------------------------------------"
echo "${cars[@]}" # print all elements of the array
echo "-----------------------------------------"
cars[1]="trainride" # set the second item to "trainride"
echo "-----------------------------------------"
echo "${cars[@]}" # print all elements of the array
echo "-----------------------------------------"