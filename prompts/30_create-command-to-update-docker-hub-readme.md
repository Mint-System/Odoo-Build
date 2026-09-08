---
title: "Create command to update Docker Hub readme"
state: completed
model: infomaniak/moonshotai/Kimi-K2.6
input_tokens: 
---

# Run 30

Note: @Clanker refers to the "ai agent" (you) who is working on this task.

@Clanker when working on this task, make sure to:

- Read context and task section first
- Prepare a list of todos
- Update the todo list while working on the task

## Context

@Clanker Read the `AGENTS.md` and `README.md` to get an understanding of the project.

## Task

Implemenet a `Docker` command `update-docker-hub-readme` that updates the REAMDE content for on hub.docker.com. For each image it updates the README content:

- `images/odoo/README.md` -> https://hub.docker.com/r/mintsystem/odoo/
- `images/odoo-cli/README.md` -> https://hub.docker.com/r/mintsystem/odoo-cli
- `images/odoo-mailgate/README.md` -> https://hub.docker.com/r/mintsystem/odoo-mailgate
- `images/odoo-upgrade/README.md` -> https://hub.docker.com/r/mintsystem/odoo-upgrade

It uses the credentials created with `login-docker` to make the post. 

## Worklog

- Created `bin/update-docker-hub-readme` Python script that reads Docker Hub credentials from `~/.docker/config.json` (or `$DOCKER_CONFIG/config.json`), authenticates with the Docker Hub API, and updates the `full_description` for each repository.
- Added `update-docker-hub-readme` function to the `task` file.
- Added the command to the `task` help table under the Docker section.
- Verified the script syntax and tested the command successfully against Docker Hub.
- Removed `python` prefix from the `update-docker-hub-readme` function call in the `task` file; the script now runs directly via its shebang.
- Renamed `bin/github-set-default-branch` to `bin/set-github-repo-default-branch`.
- Renamed `bin/run-jupyter-notebook` to `bin/exec-odoo-jupyter` and updated the function name and help table entry in the `task` file.

@Clanker Set frontmatter state to completed and update info about model and token usage.
