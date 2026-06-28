# Bash Scripting

A hands-on learning repo for **bash shell scripting** on Linux. Scripts, notes, and an FAQ — built while following courses and practicing small exercises from basics to user input, arguments, command substitution, and arithmetic.

No install step beyond a working bash environment (Linux, macOS, or WSL on Windows).

## Prerequisites

- A terminal (bash is the default shell on most Linux systems and WSL)
- `bash` available at `/bin/bash` (check with `which bash`)
- Optional: [Cursor](https://cursor.com) or VS Code — open `bash_scripting.code-workspace` for spell-check and project settings

## Quick start

```bash
# Clone or download this repo, then:
cd bash_scripting/scripts

# Run a script with bash (no chmod needed):
bash himom.sh

# Or make scripts executable and run directly (uses the shebang line):
chmod +x himom.sh
./himom.sh
```

Try the interactive script:

```bash
bash bestdayever_v2.sh
```

Try passing arguments:

```bash
bash bestdayever_v3.sh john smith
bash positional_arguments.sh "john smith" "good morning"
bash math_in_bash.sh 10 20
```

## What's in this repo

| Path | Description |
|------|-------------|
| [`notes.md`](notes.md) | Course notes — concepts, syntax, and examples as you learn |
| [`faq.md`](faq.md) | Q&A from learning sessions (bash vs zsh, `$1` vs `$*`, running scripts, troubleshooting) |
| [`scripts/`](scripts/) | Practice scripts, ordered roughly by difficulty |
| `bash_scripting.code-workspace` | Editor workspace file (optional) |

## Scripts

All scripts use `#!/bin/bash`. Run from the `scripts/` directory or pass the full path.

| Script | Topics | Example |
|--------|--------|---------|
| [`himom.sh`](scripts/himom.sh) | First script, `echo`, `sleep` | `bash himom.sh` |
| [`bestdayever.sh`](scripts/bestdayever.sh) | Variables | `bash bestdayever.sh` |
| [`bestdayever_v2.sh`](scripts/bestdayever_v2.sh) | User input with `read` | `bash bestdayever_v2.sh` |
| [`bestdayever_v3.sh`](scripts/bestdayever_v3.sh) | All args as one string (`"$*"`) | `bash bestdayever_v3.sh john smith` |
| [`positional_arguments.sh`](scripts/positional_arguments.sh) | `$1`, `$2` positional args | `bash positional_arguments.sh "john smith" "good morning"` |
| [`execute_commands_as_output.sh`](scripts/execute_commands_as_output.sh) | Command substitution `$(...)` | `bash execute_commands_as_output.sh` |
| [`math_in_bash.sh`](scripts/math_in_bash.sh) | Arithmetic `$((...))`, `read`, args | `bash math_in_bash.sh 10 20` |

### Suggested learning order

1. `himom.sh` — running a script
2. `bestdayever.sh` → `bestdayever_v2.sh` → `bestdayever_v3.sh` — variables, `read`, command-line args
3. `positional_arguments.sh` — separate positional parameters
4. `execute_commands_as_output.sh` — embed command output in `echo`
5. `math_in_bash.sh` — math and mixing input methods

Read the matching sections in [`notes.md`](notes.md) as you go. If something is confusing (e.g. why `./script.sh` fails but `bash script.sh` works), check [`faq.md`](faq.md).

## Running scripts — two ways

**1. Invoke bash explicitly** (shebang is ignored):

```bash
bash script.sh
bash script.sh arg1 arg2
```

**2. Run as executable** (shebang tells the OS which interpreter to use):

```bash
chmod +x script.sh   # once per script
./script.sh
./script.sh arg1 arg2
```

For multi-word arguments without quotes, use `"$*"` in the script to join them (see `bestdayever_v3.sh`). For separate parameters, use `$1`, `$2`, etc. (see `positional_arguments.sh`).

## Course resources

- [Network Chuck — Bash scripting playlist](https://www.youtube.com/watch?v=SPwyp2NG-bE&list=PLIhvC56v63IKioClkSNDjW7iz-6TFvLwS)

## Contributing / extending

This is a personal learning repo. To add your own practice scripts:

1. Create a new file in `scripts/` with `#!/bin/bash` as the first line
2. Add notes in `notes.md` if you want to document what you learned
3. Keep scripts small and focused on one idea
