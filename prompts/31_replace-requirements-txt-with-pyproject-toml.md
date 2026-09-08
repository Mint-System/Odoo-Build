---
title: "Replace requirements.txt with pyproject.toml"
state: cancelled
model: 
input_tokens: 
---

# Run 31

Note: @Clanker refers to the "ai agent" (you) who is working on this task.

@Clanker when working on this task, make sure to:

- Read context and task section first
- Prepare a list of todos
- Update the todo list while working on the task

## Context

@Clanker Read the `AGENTS.md` and `README.md` to get an understanding of the project.

## Task

Update the `pyproject.toml` with packages from `requirements.txt`.

Update the `install` command to use the `pypoject.toml` intead of `requirements.txt`.

Remove the `requirements.txt`.

Do not make this change for `odoo/requirements.txt`

## Worklog

- Reverted the change. The `.python-version` file is dynamic (changes per checked-out Odoo version), making `requires-python` in `pyproject.toml` impractical.
- Recreated the root `requirements.txt` with all project dependencies.
- Removed `pyproject.toml`.
- Reverted the `install` command in `task` back to `uv pip install -r requirements.txt`.
- Left `odoo/requirements.txt` and image-level `requirements.txt` references untouched.
