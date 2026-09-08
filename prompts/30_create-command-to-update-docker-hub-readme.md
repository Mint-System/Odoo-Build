---
title: "Create command to update Docker Hub readme"
state: draft
model: 
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

@Clanker Add a summary here once the task has been completed.

@Clanker Set frontmatter state to completed and update info about model and token usage.
