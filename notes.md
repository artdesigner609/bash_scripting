# BASH Scripting

It was made in 1989. It's a LINUX SHELL just a command line in Linux, which helps us to interact with LINUX operating system. It is a command language interpreter that executes commands read from the standard input device (keyboard) or from a file. It is a command processor that typically runs in a text window where the user types commands that cause actions.

it helps us to do different things like:

1. make new files, deleting, editing them, etc.
2. add new users, deleting them, adding them to user_groups, etc.

## SHELL Commands

### find users' default SHELL

```bash
which $SHELL
echo $SHELL
```

### echo Hello World

we use this command to say computer to print something on the screen. it is used to display a line of text/string that is passed as an argument.

```bash
echo "Hello World"
```

### writing first BASH script - See different methods to run script - make it executable

sometimes we need to automate things, so we write scripts to do that. A script is a file that contains a list of commands that can be executed by the shell.

the first line that we write in a script is called the shebang line (`#!/bin/bash`). It tells the system which interpreter to use when the script is run directly (e.g. `./script.sh`). There are multiple reasons for this: when we write scripts in Linux, they might be PYTHON scripts, PERL scripts, BASH scripts, etc., so we need to tell the system which interpreter to use.

All scripts in this project use bash. See [FAQ](faq.md) for bash vs zsh and the difference between `bash script.sh` and `./script.sh`.

[Hi Mom Bash Script](/scripts/himom.sh)
[Practice - Best Day Ever](/scripts/bestdayever.sh)

we will execute this script by using the command:

```bash
bash himom.sh
```

there is another way to execute the script. First, we have to make the script executable, and adding executable permissions by using this command:

```bash
chmod +x himom.sh
```

then we can execute the script by using the command:

```bash
./himom.sh
```

### BASH Debugging

Debugging is a very important part of programming so we should get used to problem solving and fixing errors as early as possible. And bash has a few built in features that make our life simple.

When running at the command line you can do:

```bash
set -x # turn on debugging

bash -x ./script.sh # output of the script will be printed with debugging information

set +x # turn off debugging
```

This tells you which lines are working and which lines are not. If you want to debug at a certain point you can insert **set -x** into your script and **set +x** to end the section.

You can see its outputting a **+** for the command and then the output of what that command executed. If there was an **error** it would output a **-** on that line this makes it easy to spot where you have gone wrong so you can fix them.

### BASH Variables

we can write variables in BASH scripts. A variable is a name that represents a value. we can use variables to store data that we want to use later in our script.

```bash
#!/bin/bash
name="John"
echo "Hello, $name"
```

### BASH User Input

we can get user input in BASH scripts by using the read command. The read command reads a line of input from the user and stores it in a variable.

[Best Day Ever V2](/scripts/bestdayever_v2.sh)

```bash
#!/bin/bash
echo "What is your name?"
read name
echo "Hello, $name"
```

another way to get user input is to pass arguments on the command line when you run the script.

[Best Day Ever V3](/scripts/bestdayever_v3.sh)

```bash
#!/bin/bash
name="$*"   # all arguments joined (e.g. ./script.sh john smith → "john smith")
echo "Hello, $name. Good Morning!"
```

now let's see how can we use the positional arguments in our script.

[Positional arguments](/scripts/positional_arguments.sh)

```bash
#!/bin/bash
name=$1
greeting=$2

echo "$greeting, $name. You are looking good today!"
```

### Execute Commands as Output of a Script

we can execute commands as output of a script.

[Execute Commands as Output of a Script](/scripts/execute_commands_as_output.sh)

### Math in BASH Scripts

we can perform math operations in BASH scripts.

[Math in BASH Scripts](/scripts/math_in_bash.sh)

* $RANDOM is a built-in variable that generates a random number between 0 and 32767.

Some examples of using $RANDOM:

* $RANDOM % 10 generates a random number between 0 and 9.
* $RANDOM % 100 generates a random number between 0 and 99.
* $RANDOM % 10 + 10 generates a random number between 10 and 19.

### Environment Variables

we can use environment variables in BASH scripts. Environment variables are variables that are set by the system and are available to all processes running in the system.

Some examples of environment variables:

* $SHELL
* $PWD
* $USER
* $HOSTNAME
* $HOSTTYPE
* $OSTYPE
* $TERM

If we want to use a custom environment variable, we can do that by using the export command.

```bash
export MY_VARIABLE="my value"
echo $MY_VARIABLE
```

but if we **close our terminal**, our **custom environment variable** will be lost. to make it permanent, we can **add it** to our **.bashrc** file through terminal.

```bash
echo "export MY_VARIABLE=\"my value\"" >> ~/.bashrc # add the custom environment variable to the .bashrc file
source ~/.bashrc # source the .bashrc file to apply the changes
echo $MY_VARIABLE # print the custom environment variable
```

If we want to remove it, we can do that by using the unset command through terminal.

```bash
unset MY_VARIABLE # remove the custom environment variable from the terminal
echo $MY_VARIABLE
```

but if we want to remove it permanently, we can do that by removing it from our **.bashrc** file, by opening it with a code editor and removing the line that contains the custom environment variable. Then we can source the .bashrc file to apply the changes.

```bash
code ~/.bashrc # open the .bashrc file with a code editor

# remove the line that contains the custom environment variable
# e.g. export MY_VARIABLE="my value"

source ~/.bashrc # source the .bashrc file to apply the changes

echo $MY_VARIABLE # print the custom environment variable
```

### Conditional Statements

we can use conditional statements in BASH scripts.

[Conditional Statements](/scripts/conditional_statements.sh)

### Loops

we can use loops in BASH scripts.

[Loops](/scripts/loops.sh)
