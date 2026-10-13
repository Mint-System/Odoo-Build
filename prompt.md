---
title: "Odoo 20.0 https interface param"
author: "Janik von Rotz <login@janikvonrotz.ch>"
state: draft
date_completed: YYYY-MM-DD
harness:
model:
input_tokens:
output_tokens:
---

# Odoo 20.0 https interface param

Note: @Clanker refers to the "ai agent" (you) who is working on this prompt file.

@Clanker when working on this prompt file, make sure to:

- Read context and task section first
- Prepare a list of todos
- Update the todo list while working on task

## Context

@Clanker Read the `AGENTS.md` and `README.md` to get an understanding of the project.

## Task

Currently I have `--http-interface=0.0.0.0` in my `compose.yml.template` to start Odoo 20.0.

Instead I would like to have this param as default in the image `images/odoo/entrypoint.sh`.

If I understand correctly this param cannot be configured in `odoo.conf` or as an enviroment var. Double-check.

I want you to add a env var `HTTP_INTERACE` with `0.0.0.0` as default. Document this env var in `images/odoo/README.md`. Add before `PROXY_MODE`.

Then remove the param from the compose template.

I will build and test the image.

## Worklog

@Clanker Add a summary here once the task has been completed.

@Clanker Set frontmatter state to completed and update date, harness and model. If you have access to session info also add token count.
