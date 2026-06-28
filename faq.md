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
| `scripts/bestdayever_v2.sh` | User input — same script but prompts with `read name` |
| `README.md` | Intro and course links (e.g. Network Chuck) |

All scripts use `#!/bin/bash` and are meant to run on a typical Linux system where bash is installed at `/bin/bash`.

### Q: What concepts are covered so far?

- Shebang line and choosing an interpreter
- Running scripts: `bash script.sh` vs `chmod +x` + `./script.sh`
- `echo`, `sleep`, variables, and `read` for user input

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
```
