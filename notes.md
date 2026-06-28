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
