#!/bin/bash

for ((x=1;x<=100;x++)); do
    if ((x % 5 == 0)) && ((x % 3 == 0)); then
        echo FizzBuzz
    elif ((x % 3 == 0)); then
        echo Fizz
    elif ((x % 5 == 0)); then
        echo Buzz
    else
        echo $x
    fi;
done