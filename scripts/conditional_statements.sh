#!/bin/bash

random_number=$((RANDOM % 100))

if [ "$random_number" -ge 50 ]; then
    echo "You won a lottery of $random_number."
else
    echo "You lost the lottery. The number was $random_number."
fi

echo "--------------------------------"

echo "Do you Like BASH? (y/n)"
read like_bash

if [ "$like_bash" = "y" ]; then
    echo "You like BASH."
else
    echo "You don't like BASH. But Why???"
fi

echo "--------------------------------"
