#!/bin/bash

multiply () {
  ans=$(($1 * $2))             # multiply the two inputted values
  echo $ans                    # "return" ans
}

result=$(multiply 2 5)         # call function nd store result in variable
echo "The sum is: $result"     # print result