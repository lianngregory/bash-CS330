#!/bin/bash

# Define a dictionary (associative array) as a "person" object
declare -A person
person[name]="Liann"
person[age]=21
person[favoriteColor]="Pink"

# Function to display person's info
function display_person() {
    echo "Name: ${person[name]}"
    echo "Age: ${person[age]}"
    echo "Favorite Color: ${person[favoriteColor]}"
}

# Call the "display_person" function
display_person