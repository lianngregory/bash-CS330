#!/bin/bash

split_string () {
    input_string="$1"       # Input string passed as first argument
    delimiter=" "           # Set space as the delimiter

    # Use IFS (Internal Field Separator) to split the string
    IFS="$delimiter" read -r string1 string2 <<< "$input_string"

    # Return both split strings
    echo "$string1"
    echo "$string2"
}

# Example usage:
input="Hello World"
split_string "$input"       # expected output: 120