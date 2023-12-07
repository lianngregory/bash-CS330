
## Language overview and setup
**Bash is a Unix shell and command language**

### History

Bash was created by Brian Fox for the GNU Projecy in 1989, as a free software replacement for the Bourne shell. The shell's name is an acronym for Bourne Again Shell, a pun on the name of the Bourne shell that it replaces and the notion of being "born again". It has been used as the default login shell for most Linux distributions and is also available for Windows 10 and 11, using the Windows Subsystem for Linux. \
Bash is a command processor that typically runs in a text window where the user types commands that cause actions. Bash can also read and execute commands from a file, called a shell script.

### Helpful Resources for Learning Bash Scripting
- [Bash Handbook](https://github.com/denysdovhan/bash-handbook) by deny
- [Bash Guide](https://mywiki.wooledge.org/BashGuide)
- [Serious Shell Programming](https://freebsdfrau.gitbook.io/serious-shell-programming/acknowledgements)
- [Bash Scripting Tutorial](https://linuxconfig.org/bash-scripting-tutorial) by Luke Reynolds
- [Advanced Bash-Scripting Guide](https://tldp.org/LDP/abs/html/) by Mendel Cooper

### Getting started

#### UNIX
If you're using a UNIX based machine, Bash will most likely be preinstalled and ready to go when opening up your terminal. 

#### Windows
Install Linux on Windows with WSL [here](https://learn.microsoft.com/en-us/windows/wsl/install) 

### Bash Use Cases
It is important to note that Bash is a *Shell Scripting Language*, which means that 

### "Hello World" program
You can write Bash scripts in any text editor you want. To utilize a text editor I am familiar with, I plan to use [Visual Studio Code](https://code.visualstudio.com/). 
1. Create a new file using a text editor like vi/vim or nano
```shell
nano hello.sh
```
2. Type in the code below
```shell
#!/bin/bash
echo "Hello World!"
```
3. Run or execute the script
```shell
./hello.sh
```
4. Expected output:
```shell
Hello World!
```
hello world example [source code](https://github.com/lianngregory/bash-CS330/blob/main/code%20examples/hello.sh)

### Writing comments in Bash scripts
To write comments in Bash scripts, use a "#" at the beginning of your comment. 
```shell
#!/bin/bash

# this is a comment!
# print Hello World! as output
echo "Hello World!"
```


## Names and Data Types

### Naming

**Some Rules for Bash Variable Naming**

- Community standard for all variable naming is [snake_case](https://en.wikipedia.org/wiki/Snake_case).

- The first character of a variable name cannot be a number

- Variable name cannot have whitespace in between

- Variable names cannot be reserved words

Reserved Words
```shell
if
elif
else
then
while
do
done
for
until
case
esac
continue 
break
function
```

**Local Variable** exist only within a single script. They are inaccessible to other programs and scripts. A local variable can be declared using `=` sign and can be retrieved using the $ sign.

Recommended naming conventions are lower-case alphanumeric characters, numbers, and underscores

```shell
my_variable="test"         # declare variable
echo $my_variable          # display value
unset my_variable          # delete variable
```

**Environment Variables** are accessible to any program or script running in current shell session. They are created just like local variables, but using the keyword export instead.

Recommended naming conventions are all capital alphanumeric characters, numbers, and underscores, declared at the top of the file. 

```shell
export MY_ENVIORMENT_VARIABLE="This is an enviorment variable!"
```

Here's a few common enviorment variables that you may come across in bash!

| Variable       | Description                       |
| -------------- | --------------------------------- |
| `$HOME`        | User's home directory             |
| `$PWD`         | User's current working directory  |
| `$HOSTNAME`    | Device’s hostname on the network  |

### Types

Bash has no data types, which would make it an "untyped" language. This means that there isn't any type conversions, implicit or explicit. Variables can contain only numbers or a string of one or more characters. Bash variables are character strings, but depending on context, Bash permits arithmetic operations and comparisons on variables. The determining factor is whether the value of a variable contains only digits.

## Operators
Arithmetic Operators:
- \+ (Addition)
- \- (Subtraction)
- \* (Multiplication)
- / (Division)
- % (Modulo)

Comparison Operators:
- -eq (Equal)
- -ne (Not Equal)
- -lt (Less Than)
- -le (Less Than or Equal To)
- -gt (Greater Than)
- -ge (Greater Than or Equal To)

Logical Operators:
- ! (Negation)
- a (Logical AND)
- o (Logical OR)

String Operators:
- = (Equal)
- != (Not Equal)

File Test Operators:
- -e (File exists)
- -f (Is a regular file)
- -d (Is a directory)
- -r (Is readable)
- -w (Is writable)
- -x (Is executable)

Assignment Operator:
- = (Assignment)

Compound Assignment Operators:
- += (Append to a variable)
- -= (Remove from a variable)

## Arithmetic

In bash we are free to do any arithmetical operations. But the expression must enclosed by `$(( ))`

```shell
echo $(( 10 + 2 )) # 12
```

In arithmetic expansions, variables should generally be used without a $ prefix:

```shell
x=5
y=10
result=$(( x + y))
echo $result # 10
```
arithmetic example [source code](https://github.com/lianngregory/bash-CS330/blob/main/code%20examples/arithmetic.sh)

## Arrays

Arrays in bash are variables that allow you to refer to multiple values. In bash, arrays are also zero-based, where the first element in an array has index 0.

When dealing with arrays, we should be aware of the special environment variable IFS. IFS, or Input Field Separator, is the character that separates elements in an array. The default value is an empty space IFS=' '.

You can create an array by assigning a value to an index in the array variable

```shell
dogs[0]=pitbull
dogs[1]=poodle
dogs[2]=huskie
```

Array variables can also be created using compound assignments

```shell
dogs=(pitbull poodle huskie)
```

### Using Arrays in Bash

```shell
echo "${dogs[0]}"           # Element #0
echo "${dogs[-1]}"          # Last element
echo "${dogs[@]}"           # All elements, space-separated
echo "${#dogs[@]}"          # Number of elements
echo "${#dogs}"             # String length of the 1st element
echo "${#dogs[3]}"          # String length of the Nth element
echo "${dogs[@]:3:2}"       # Range (from position 3, length 2)
echo "${!dogs[@]}"          # Keys of all elements, space-separated
```

### Array Operations

```shell
dogs=("${dogs[@]}" "goldendoodle")    # Push
dogs+=('goldendoodle')                # Also Push
unset dogs[2]                         # Remove one item
```

### Iterating Arrays

```shell
for d in "${dogs[@]}"; do   # loop over items in "dogs" array
  echo "$d"
done
```


## Dictionaries

Dictionaries, also known as hash tables and hash maps, defines an unordered collection of data as a set of key-value pair.

```shell
declare -A fruits

fruits[apple]="red"
fruits[orange]="orange"
fruits[pineapple]="yellow"
fruits[blueberry]="blue"
```

### Using Dictionaries in Bash

```shell
echo "${fruits[apple]}" # display value for key "apple"
echo "${fruits[@]}"     # All values
echo "${!fruits[@]}"    # All keys
echo "${#fruits[@]}"    # Number of elements
unset fruits[apple]     # Delete key "apple"
```

### Iterating Dictionaries

Loop over values
```shell
for value in "${fruits[@]}"; do  # loop over values in "fruits"
  echo "$value"
done
```

Loop over keys
```shell
for key in "${!fruits[@]}"; do  # loop over keys in "fruits"
  echo "$key"
done
```


## Functions

In Bash, functions are a chunk of code that can be called numerous times. The purpose of a function is to help you make your bash scriptsaid making your code more readable and to avoid repeated code.

You can define functions in two ways.

The first way starts with the function name, followed by parentheses. This is the more commonly found format.
```shell
function_name () {
  code
}

function_name     # call the function
```

The second way starts with the reserved word function, followed by the function name.
```shell
function function_name {
  code
}

function_name     # call the function
```

**Arguments and Parameters:** When a function is called, the parameters are pushed onto the stack. These values are then accessible within the function as local variables. They are stored directly on the stack, not as references to heap memory.

**Local Variables:** Local variables declared within a Bash function are also stored on the stack. Bash allocates stack space for these variables when the function is called and deallocates it when the function returns. The values of local variables are stored directly on the stack, and their memory is automatically released when the function exits.

### Function Example: Pass-by Reference
```shell
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
```
pass-by reference example [source code](https://github.com/lianngregory/bash-CS330/blob/main/code%20examples/functions-passby.sh)

### Function Example: Multiplying Two Numbers
```shell
#!/bin/bash

multiply () {
  ans=$(($1 * $2))             # multiply the two inputted values
  echo $ans                    # "return" ans
}

result=$(multiply 2 5)         # call function nd store result in variable
echo "The sum is: $result"     # print result
```
multiply 2 numbers example [source code](https://github.com/lianngregory/bash-CS330/blob/main/code%20examples/functions-multiply.sh)

### Function Example: Recursion
```shell
#!/bin/bash

factorial () {
    if (( $1 <= 1 )); then
        echo 1
    else
        last=$(factorial $(( $1 - 1 )))
        echo $(( $1 * last ))
    fi
}

factorial 5    # expected output: 120
```
recursion example [source code](https://github.com/lianngregory/bash-CS330/blob/main/code%20examples/functions-recursion.sh)

### Function Example: Split a String
```shell
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

input="Hello World"
split_string "$input"       # expected output: Hello\nWorld
```
classes and inheritance example [source code](https://github.com/lianngregory/bash-CS330/blob/main/code%20examples/functions-splitstring.sh)

## Booleans

Bash does not support boolean values, although any bash variable can be 0 or "true" and 1 or "false".

## Conditional Statements

Bash has 4 types of conditional statements:
1. if statement
2. if-else statement
3. if..elif..else..fi statement (Else If ladder)
4. case statement

In Bash, code blocks in selection control statements are delimited using specific keywords and symbols. 

- The "if" statement is followed by a condition and the "then" keyword.
- The "elif" statement is also followed by a condition and the "then" keyword.
- The "else" keyword is used to indicate an alternative code block that is executed if the condition is false.
- The "fi" keyword marks the end of the entire statement.

### Conditional Statements Example
```shell
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
```
conditional statements example [source code](https://github.com/lianngregory/bash-CS330/blob/main/code%20examples/fizzBuzz.sh)

### if statement
The statement will be executed if the specified condition is true
```shell
if [ expression ]
then
  statement
fi
```

### if-else statement
If the specified condition is not true in if part then the else statement will be executed.
```shell
if [ expression ]
then
  statement1
else
  statement2
fi
```

### if..elif..else..fi statement (Else If ladder)
To use multiple conditions in one if-else block, then elif keyword is used in bash. If expression1 is true then it executes statement 1.1, and this process continues. If none of the conditions are true then it processes the else statement (statment3).
```shell
if [ expression1 ]
then
  statement1.1
elif [ expression2 ]
then
  statement2.1
else
   statement3
fi
```

### case statement
Case statements allow you to perform conditional branching based on the value of a variable or expression, similar to a switch statement. When a match is found all of the associated statements until the double semicolon (;;) is executed. The "esac" keyword marks the end of the case statement.
```shell
case  in
   Pattern 1) Statement 1;;
   Pattern n) Statement n;;
esac
```

## Short Circuit Evaluation

Logical AND (&&)
```shell
if [ expression1 ] && [ expression2 ]
then
  statement
fi
```

Logical OR (||)
```shell
if [ expression1 ] || [ expression2 ]
then
  statement
fi
```

## Classes and Inheritance

Bash is primarily a scripting language and by-result is not designed with object-oriented programming features like classes, objects, and inheritance. 

However, you can simulate some of the features of objects, structs, or records in Bash using associative arrays, also known as dictionaries.

```shell
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
```

classes and inheritance example [source code](https://github.com/lianngregory/bash-CS330/blob/main/code%20examples/classes-inheritance.sh)