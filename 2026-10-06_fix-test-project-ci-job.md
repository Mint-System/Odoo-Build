---
commit_ref: 3771d9f2e2e1f0a7cac125bd1b5d9ed0e7b1254d
title: "Fix test-project ci job"
author: "Janik von Rotz <login@janikvonrotz.ch>"
state: completed
date_completed: 2026-10-06
model: moonshotai/Kimi-K2.6
input_tokens: 287382
output_tokens: 4737
---

# Fix test-project ci job

Note: @Clanker refers to the "ai agent" (you) who is working on this prompt file.

@Clanker when working on this prompt file, make sure to:

- Read context and task section first
- Prepare a list of todos
- Update the todo list while working on task

## Context

@Clanker Read the `AGENTS.md` and `README.md` to get an understanding of the project.

## Task

When GitHub runs `.github/workflows/test-project.yml` I get this error:

```bash
Run ./task install
Could not find .venv18.0/bin/active. Use init-venv to initalize.
cat: .python-version: No such file or directory
Ensure Python version  is installed.
Downloading cpython-3.14.8-linux-x86_64-gnu (download) (34.6MiB)
...
 + wcwidth==0.9.2
 + webcolors==25.10.0
 + webencodings==0.6.1
 + websocket-client==1.9.2
 + wheel==0.48.0
 + whool==1.3
 + widgetsnbextension==4.0.16
 + wsproto==1.3.2
./task: line 1149: cd: odoo: No such file or directory
Python: Install Odoo and dependencies.
Error: Process completed with exit code 1.
```

The install should work without `./odoo` folder.

Note that `test-project` runs for a while, so do not run it.

## Worklog

Fixed the `test-project` CI job by making the Odoo requirements installation in `task install` conditional.

**Problem:** The `install()` function in `./task` unconditionally ran `cd odoo` to install Odoo and its dependencies. In the CI workflow (`.github/workflows/test-project.yml`), the `odoo/` directory does not exist because `task checkout` is not executed before `task install`, causing the script to fail with `cd: odoo: No such file or directory`.

**Fix:** Wrapped the Odoo requirements block in `task` with a `[[ -d "odoo" ]]` check so it only runs when the Odoo source directory is present. The CI workflow runs `test-project` using Docker containers and does not need the native Odoo source installation.

**Verification:** Ran `bash -n task` to confirm the modified script has valid syntax.

@Clanker Set frontmatter state to completed and update date and model. If you have access to session info also add token count.
