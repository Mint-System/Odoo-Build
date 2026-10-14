---
title: "Odoo 20.0 https interface param"
author: "Janik von Rotz <login@janikvonrotz.ch>"
state: completed
date_completed: 2026-10-13
harness: pi
model: moonshotai/Kimi-K2.6
input_tokens: 24524
output_tokens: 4075
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

- Verified that `--http-interface` is a command-line only option in Odoo (not supported in `odoo.conf`).
- Added `HTTP_INTERFACE=${HTTP_INTERFACE:='0.0.0.0'}` to `images/odoo/entrypoint.sh` and passed it as `--http-interface="${HTTP_INTERFACE}"` to all `exec odoo` invocations (except scaffold).
- Documented `HTTP_INTERFACE` in `images/odoo/README.md` in both the compose example and the Server Environment section, placed before `PROXY_MODE`.
- Removed `--http-interface=0.0.0.0` from `compose.yml.template` and added `HTTP_INTERFACE: ${HTTP_INTERFACE}` to the environment section before `PROXY_MODE`.
