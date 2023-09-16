
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

#### "Hello World" program
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

#### Writing comments in Bash scripts
To write comments in Bash scripts, use a "#" at the beginning of your comment. 
```
#!/bin/bash

# this is a comment!
# print Hello World! as output
echo "Hello World!"
```
