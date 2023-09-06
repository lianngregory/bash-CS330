
## Language overview and setup
**Bash is a Unix shell and command language**
### History


Bash was created by Brian Fox for the GNU Projecy in 1989, as a free software replacement for the Bourne shell. The shell's name is an acronym for Bourne Again Shell, a pun on the name of the Bourne shell that it replaces and the notion of being "born again". It has been used as the default login shell for most Linux distributions and is also available for Windows 10 and 11, using the Windows Subsystem for Linux.\
Bash is a command processor that typically runs in a text window where the user types commands that cause actions. Bash can also read and execute commands from a file, called a shell script.
### Getting started
#### Installation on Windows
First, install Linux on Windows with WSL [here](https://learn.microsoft.com/en-us/windows/wsl/install)\
You can write Bash scripts in any text editor you want. To utilize a text editor I am familiar with, I plan to use [Visual Studio Code](https://code.visualstudio.com/).

#### "Hello World" program
1. Create a new file using a text editor like vi/vim or nano
```
nano hello.sh
```
2. Type in the code below
```
#!/bin/bash
#print "Hello World!"
echo "Hello World!"
```
3. Set the script executable permission
```
chmod -v +x hello.sh
```
4. Run or execute the script any of these commands:
```
sh hello.sh
bash hello.sh
./hello.sh
```
5. Expected output:
```
Hello World!
```
