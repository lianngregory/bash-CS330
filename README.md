
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

### "Hello World" program
You can write Bash scripts in any text editor you want. To utilize a text editor I am familiar with, I plan to use [Visual Studio Code](https://code.visualstudio.com/). 
1. Create a new file using a text editor like vi/vim or nano
```
nano hello.sh
```
2. Type in the code below
```
#!/bin/bash
echo "Hello World!"
```
3. Run or execute the script
```
./hello.sh
```
4. Expected output:
```
Hello World!
```

### Writing comments in Bash scripts
To write comments in Bash scripts, use a "#" at the beginning of your comment. 
```
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
```
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

```
my_variable="test"         # declare variable
echo $my_variable          # display value
unset my_variable          # delete variable
```

**Environment Variables** are accessible to any program or script running in current shell session. They are created just like local variables, but using the keyword export instead.

Recommended naming conventions are all capital alphanumeric characters, numbers, and underscores, declared at the top of the file. 

```
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


## Arithmetic

In bash we are free to do any arithmetical operations. But the expression must enclosed by `$(( ))`

```
echo $(( 10 + 2 )) # 12
```

In arithmetic expansions, variables should generally be used without a $ prefix:

```
x=5
y=10
result=$(( x + y))
echo $result # 10
```

## Arrays

Arrays in bash are variables that allow you to refer to multiple values. In bash, arrays are also zero-based, where the first element in an array has index 0.

When dealing with arrays, we should be aware of the special environment variable IFS. IFS, or Input Field Separator, is the character that separates elements in an array. The default value is an empty space IFS=' '.

You can create an array by assigning a value to an index in the array variable

```
dogs[0]=pitbull
dogs[1]=poodle
dogs[2]=huskie
```

Array variables can also be created using compound assignments

```
dogs=(pitbull poodle huskie)
```

### Using Arrays in Bash

```
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

```
dogs=("${dogs[@]}" "goldendoodle")    # Push
dogs+=('goldendoodle')                # Also Push
unset dogs[2]                         # Remove one item
```

### Iterating Arrays

```
for d in "${dogs[@]}"; do   # loop over items in "dogs" array
  echo "$d"
done
```


## Dictionaries

Dictionaries, also known as hash tables and hash maps, defines an unordered collection of data as a set of key-value pair.

You can create an array by assigning a value to an index in the array variable

```
declare -A fruits

fruits[apple]="red"
fruits[orange]="orange"
fruits[pineapple]="yellow"
fruits[blueberry]="blue"
```

### Using Dictionaries in Bash

```
echo "${fruits[apple]}" # display value for key "apple"
echo "${fruits[@]}"     # All values
echo "${!fruits[@]}"    # All keys
echo "${#fruits[@]}"    # Number of elements
unset fruits[apple]     # Delete key "apple"
```

### Iterating Arrays

Loop over values
```
for value in "${fruits[@]}"; do  # loop over values in "fruits"
  echo "$value"
done
```

Loop over keys
```
for key in "${!fruits[@]}"; do  # loop over keys in "fruits"
  echo "$key"
done
```