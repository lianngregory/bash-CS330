#!/bin/bash

swap () {
    temp="$x"
    x="$y"
    y="$temp"
}

# Define vars
x=5
y=7

echo "The value of x before swapping: $x"
echo "The value of y before swapping: $y"

swap
echo "The value of x after swapping: $x"
echo "The value of y after swapping: $y"