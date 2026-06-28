# Bash Scripting FAQ

Questions and answers from learning sessions. See also [notes.md](notes.md) for course notes and [scripts/](scripts/) for practice files.

---

## About this project

### Q: What is in this codebase?

This is a small **bash scripting learning workspace**, not a large application. It contains:

| File | Purpose |
|------|---------|
| `notes.md` | Study notes: shell basics, shebang, running scripts, variables, `read` |
| `scripts/himom.sh` | First script — `echo` and `sleep` timing demo |
| `scripts/bestdayever.sh` | Variables — hardcoded `name="John"`, motivational messages |
| `scripts/bestdayever_v2.sh` | User input — prompts with `read name` |
| `scripts/bestdayever_v3.sh` | Command-line arguments — name passed when you run the script |
| `scripts/conditional_statements.sh` | `if` / `else` and numeric tests |
| `scripts/loops.sh` | `for` loops |
| `README.md` | Intro and course links (e.g. Network Chuck) |

All scripts use `#!/bin/bash` and are meant to run on a typical Linux system where bash is installed at `/bin/bash`.

### Q: What concepts are covered so far?

- Shebang line and choosing an interpreter
- Running scripts: `bash script.sh` vs `chmod +x` + `./script.sh`
- `echo`, `sleep`, variables, and `read` for user input
- Command-line arguments: `$1`, `$*`, and multi-word values
- Conditionals (`if` / `else`) and `for` loops

---

## Bash vs Zsh

### Q: What is the bash vs zsh mismatch?

**Bash** and **zsh** are both shells — programs that read and run your commands. They look almost the same for simple scripts (`echo`, `read`, `sleep`, variables).

The "mismatch" happens when different parts of a project disagree:

| What | Might say |
|------|-----------|
| Project folder / notes | "Bash scripting" |
| Script shebang | `#!/usr/bin/zsh` |
| How you run the script | `bash script.sh` (forces bash, ignores shebang) |

That is inconsistent labeling, not necessarily a bug — but it can cause confusion or failures later.

### Q: Does bash vs zsh matter for my current scripts?

**Mostly no** for what we have now. `echo`, `sleep`, `read`, and `name="John"` behave the same in both shells.

It **starts to matter** when you use more advanced features: arrays, globbing rules, string manipulation, and shell-specific syntax diverge between bash and zsh.

### Q: What should I use in this project?

**Pick bash and stick with it:**

- Use `#!/bin/bash` in every script
- Run with `./script.sh` (after `chmod +x`) or `bash script.sh`
- Do not mix in `#!/usr/bin/zsh` unless you intentionally want zsh and have it installed

---

## Default shell: `echo $SHELL`

### Q: What does `echo $SHELL` show?

It prints the path to your **login/default shell** — the shell you normally get when you open a terminal.

```bash
echo $SHELL
# Example output on WSL: /bin/bash
```

This tells you your default interactive shell. It does **not** control how scripts run unless you invoke them in a specific way.

### Q: How do I see what shell is running right now?

```bash
ps -p $$ -o comm=
# Often prints: bash
```

`$SHELL` is your configured default; `ps` shows what is actually running this session.

---

## Two ways to run a script

### Q: What happens when I run `bash himom.sh`?

```bash
cd scripts
bash himom.sh
```

1. You explicitly tell **bash** to run the file.
2. Bash reads and executes the commands.
3. The shebang line (`#!/bin/bash`) is **ignored** — treated like a comment when bash is invoked by name.
4. Bash runs all `echo` / `sleep` lines.

This works even if the shebang pointed somewhere else, as long as the syntax is valid bash.

### Q: What happens when I run `./himom.sh`?

```bash
chmod +x himom.sh   # once, to make it executable
./himom.sh
```

1. Linux reads the first line: `#!/bin/bash`
2. Linux starts **`/bin/bash`** and passes the script to it
3. Bash runs the commands

The shebang **must** point to an interpreter that **exists** on your system. If it says `#!/usr/bin/zsh` but zsh is not installed, you get an error like:

```text
./himom.sh: cannot execute: required file not found
```

The script file exists — the **interpreter** in the shebang is missing. That is a common Linux gotcha.

### Q: Comparison table

| Command | Who runs the script? | Uses shebang? |
|---------|----------------------|---------------|
| `bash himom.sh` | Bash (you chose it) | No — ignored |
| `./himom.sh` | Whatever shebang says | Yes — required |

### Q: Why do both methods exist?

- **`bash script.sh`** — handy for learning and testing; you pick the shell; shebang does not matter.
- **`./script.sh`** — how installed tools usually run; shebang must be correct; file must be executable (`chmod +x`).

Many tutorials use `./script.sh` after `chmod +x`. That only works if the shebang interpreter is installed.

---

## What we found on this WSL setup

When we checked this environment:

- `echo $SHELL` → `/bin/bash`
- `/usr/bin/zsh` was **not installed**
- Scripts that had `#!/usr/bin/zsh` failed with `./himom.sh` but worked with `bash himom.sh`

After updating all scripts to `#!/bin/bash`, both methods work on a system where `/bin/bash` exists (standard on Linux/WSL).

---

## User input and command-line arguments

Scripts in this project get a name three different ways:

| Script | Method | Example |
|--------|--------|---------|
| `bestdayever.sh` | Hardcoded variable | `name="John"` in the file |
| `bestdayever_v2.sh` | Interactive `read` | Script asks; you type the name |
| `bestdayever_v3.sh` | Command-line arguments | `./bestdayever_v3.sh john smith` |

### Q: How does `read` differ from command-line arguments?

- **`read name`** — the script waits and you type input after it starts (see `bestdayever_v2.sh`).
- **Command-line arguments** (`$1`, `"$*"`, etc.) — you pass input when you launch the script; no prompt (see `bestdayever_v3.sh`).

### Q: Why does `./bestdayever_v3.sh john smith` only print "john" when I use `name=$1`?

The shell **splits the command line on spaces** into separate arguments before your script runs:

```text
./bestdayever_v3.sh john smith
  → $0 = ./bestdayever_v3.sh
  → $1 = john
  → $2 = smith
```

`name=$1` only stores the **first** argument — `john`. Everything after the first space is in `$2`, `$3`, etc., and is ignored unless you use them.

### Q: How do I capture a full name with spaces (e.g. "john smith")?

Use **`"$*"`** to join all arguments into one string:

```bash
name="$*"
```

| Command | `name=$1` | `name="$*"` |
|---------|-----------|-------------|
| `./bestdayever_v3.sh john smith` | john | john smith |
| `./bestdayever_v3.sh john` | john | john |
| `./bestdayever_v3.sh "john smith"` | john smith | john smith |

The quoted form `"john smith"` is one argument, so `$1` works there — but `"$*"` also handles multiple separate words without requiring quotes.

### Q: What is the difference between `$1`, `$2`, `$*`, and `$@`?

| Variable | Meaning |
|----------|---------|
| `$1`, `$2`, … | One word each — first, second, … argument |
| `$#` | Count of arguments (not including the script name) |
| `"$*"` | All arguments joined into **one string** (spaces between words) — good for a full name |
| `"$@"` | All arguments as **separate words** — good when each argument is its own value |

For a single display name like "john smith", `"$*"` is the right choice in `bestdayever_v3.sh`.

### Q: Does the script name count as an argument?

No. `$0` is the script path (`./bestdayever_v3.sh`). Numbered arguments (`$1`, `$2`, …) start with the **first word you typed after the script name**.

---

## Conditional statements

See [`conditional_statements.sh`](scripts/conditional_statements.sh) and the matching section in [notes.md](notes.md).

### Q: How do I write a basic if / else in bash?

```bash
if [ "$random_number" -gt 50 ]; then
    echo "You won a lottery of $random_number."
else
    echo "You lost the lottery."
fi
```

- `if` and `then` are on one line here, or you can break across lines (common style).
- Every `if` needs a closing **`fi`**.
- Spaces inside `[ ... ]` are required — `[` is a command, not syntax sugar.

### Q: Why do I get `[: -gt: unary operator expected`?

Typical cause: the variable in the test is **empty or unset**.

```bash
# Broken — random_number was never assigned
if [ $random_number -gt 50 ]; then
```

Bash expands that to:

```text
[ -gt 50 ]
```

`-gt` expects a number on the left, but nothing is there → **unary operator expected**. The `else` branch may still run, so the script looks half-broken.

**Fix:**

1. **Assign the variable before the test:**

```bash
random_number=$((RANDOM % 100))
```

2. **Quote the variable in the test:**

```bash
if [ "$random_number" -gt 50 ]; then
```

Quoting avoids word-splitting and makes empty values safer to debug.

### Q: What are common numeric test operators in `[ ]`?

| Operator | Meaning | Example |
|----------|---------|---------|
| `-eq` | equal | `[ "$a" -eq "$b" ]` |
| `-ne` | not equal | `[ "$a" -ne "$b" ]` |
| `-gt` | greater than | `[ "$a" -gt 50 ]` |
| `-lt` | less than | `[ "$a" -lt 10 ]` |
| `-ge` | greater or equal | `[ "$a" -ge 0 ]` |
| `-le` | less or equal | `[ "$a" -le 100 ]` |

Use these for **integers**. For string equality, use `=` or `==` inside `[ ]` or `[[ ]]`.

### Q: Should I use `[ ]` or `[[ ]]` for conditionals?

Both work in bash. This repo starts with **`[ ]`** (POSIX-style tests) for learning.

`[[ ... ]]` is bash-only and handles some cases more cleanly (e.g. `[[ $a -gt 50 ]]` without quoting is often OK). Prefer **`[ "$var" ... ]`** with quotes when using `[ ]`.

### Q: How does this relate to `$(( ... ))`?

- **`$((RANDOM % 100))`** — arithmetic expansion; computes a number.
- **`[ "$n" -gt 50 ]`** — test command; compares values and returns true/false for `if`.

You often assign with `$(( ... ))` first, then compare in `[ ... ]`.

---

## Loops

See [`loops.sh`](scripts/loops.sh) and the matching section in [notes.md](notes.md).

### Q: How do I write a simple `for` loop in bash?

```bash
for i in 1 2 3 4 5; do
    echo "Hello, $i!"
done
```

- **`for`** — loop over a list of words (`1`, `2`, … or files, or `"$@"`).
- **`do`** — start of the loop body.
- **`done`** — end of the loop (not `end` or `fi`).

### Q: Can I use a variable in a loop condition later?

Yes — loops and conditionals combine naturally:

```bash
random_number=$((RANDOM % 100))

for i in 1 2 3; do
    if [ "$random_number" -gt 50 ]; then
        echo "Run $i: won with $random_number"
    else
        echo "Run $i: lost with $random_number"
    fi
done
```

Set variables **before** the `if` that uses them, same rule as standalone conditionals.

---

## Quick reference commands

```bash
# Default shell
echo $SHELL

# Shebang line in a script
head -1 scripts/himom.sh

# Check interpreters exist
which bash
which zsh

# Run script two ways
bash scripts/himom.sh
cd scripts && chmod +x himom.sh && ./himom.sh

# Command-line arguments (multi-word name)
cd scripts && ./bestdayever_v3.sh john smith
cd scripts && ./bestdayever_v3.sh "john smith"

# Conditionals and loops
cd scripts && ./conditional_statements.sh
cd scripts && ./loops.sh
```
