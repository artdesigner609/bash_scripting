# Agent instructions — bash_scripting

Canonical instructions for AI coding agents working in this repository. `CLAUDE.md` is a symlink to this file.

## Project overview

Hands-on **bash scripting learning repo** for Linux/WSL. Not an application or library — small practice scripts, study notes, and an FAQ.

| Path | Role |
|------|------|
| `scripts/` | Practice shell scripts (one concept per file) |
| `notes.md` | Course notes and syntax examples |
| `faq.md` | Q&A from learning sessions (troubleshooting, `$1` vs `$*"`, bash vs zsh) |
| `README.md` | Human onboarding — quick start and script index |

Primary environment: **bash** at `/bin/bash`. All scripts use `#!/bin/bash` — never zsh or `#!/usr/bin/env` unless explicitly requested.

## When adding or changing content

1. **New lesson** → add script in `scripts/`, section in `notes.md`, link to the script
2. **Recurring question** → add Q&A to `faq.md` (do not duplicate long explanations in README)
3. **New script in index** → update README script table if the script is meant for learners
4. Keep diffs **minimal** — match existing tone, naming, and formatting
5. Do **not** commit unless the user asks

Naming: descriptive snake_case (`math_in_bash.sh`, `environment_variables.sh`). Version suffixes (`_v2`, `_v3`) when iterating the same exercise.

## Bash scripting best practices

### Script structure

- First line: `#!/bin/bash`
- Blank line after shebang is fine (matches existing scripts)
- End scripts without requiring a trailing newline change if file already has one
- One focused concept per script; short comments only when non-obvious (usage examples at bottom are OK)

### Quoting and variables

- **Always double-quote expansions**: `"$name"`, `"$1"`, `"$*"`, `"$(command)"`
- Assign without spaces: `name="John"` not `name = "John"`
- Use lowercase for script-local variables; uppercase for environment/constants when appropriate
- Prefer `"$*"` when all args form one value (e.g. full name); use `$1`, `$2`, … when each arg has its own meaning
- Use `"$@"` when iterating or passing args through unchanged (each word stays separate)

### User input

- Interactive: `read name` or `read -p "Prompt: " name`
- CLI args: document expected usage in a comment if not obvious

### Arithmetic and command substitution

- Integer math: `$((num1 + num2))`, `$((RANDOM % 100))`
- Embed command output: `"$(date)"`, `"$(whoami)"` — always inside double quotes
- Do not use legacy backticks `` `command` ``; use `$(command)`

### Environment variables

- Read with `"$VAR"`; set custom vars with `export MY_VAR="value"`
- Common examples in this repo: `$SHELL`, `$PWD`, `$USER`, `$HOME`, `$HOSTNAME`
- Note in docs that custom exports in the shell are session-only unless added to `~/.bashrc`

### Running scripts

Two valid ways (document in notes/faq, not every script):

```bash
bash script.sh [args]
chmod +x script.sh && ./script.sh [args]
```

`bash script.sh` ignores shebang; `./script.sh` requires a valid `#!/bin/bash` and `chmod +x`.

### Safety and portability (learning-level)

- Avoid `rm -rf` with unquoted or user-controlled paths
- Prefer `[[ ]]` over `[ ]` for tests when you introduce conditionals
- Use `set -euo pipefail` only when the script is ready for strict mode and handles failures — not required for beginner exercises unless requested
- No secrets in scripts; no `.env` or credentials in commits

### Style in this repo

- Match existing scripts: simple `echo`, `sleep`, `read`, no frameworks
- Do not add tests, CI, or heavy tooling unless asked
- Do not refactor unrelated files when fixing one script

## Common pitfalls (see also faq.md)

- **`name=$1`** with `./script.sh john smith` → only captures `john`; use **`name="$*"`** for a joined full name
- **`#!/usr/bin/zsh`** when bash is intended → breaks on systems without zsh when using `./script.sh`
- **Unquoted `$var`** → word splitting and globbing bugs
- **Duplicating docs** across README, notes, faq, and AGENTS.md — each file has one job

## Quick reference

```bash
# Check default shell
echo "$SHELL"

# Run from scripts/
bash himom.sh
bash bestdayever_v3.sh john smith
bash positional_arguments.sh "john smith" "good morning"
bash math_in_bash.sh 10 20
```

Course reference: [Network Chuck bash playlist](https://www.youtube.com/watch?v=SPwyp2NG-bE&list=PLIhvC56v63IKioClkSNDjW7iz-6TFvLwS).
