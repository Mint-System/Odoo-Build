---
title: "New command test json 2 api"
state: completed
model: infomaniak/moonshotai/Kimi-K2.6
input_tokens:
---

# Run 26

Note: @Clanker refers to the "ai agent" (you) who is working on this task.

@Clanker when working on this task, make sure to:

- Read context and task section first
- Prepare a list of todos
- Update the todo list while working on the task

## Context

@Clanker Read the `AGENTS.md` and `README.md` to get an understanding of the project.

## Task

Similar to `test-xmlrpc` create a new command `test-json-2` api. Instead of using the `odoocli` script the new command should make curl post to the JSON-2 API.

Here is the documentation: https://www.odoo.com/documentation/19.0/developer/reference/external_api.html#external-json-2-api

Check the details: https://demo3.odoo.com/doc

The `test-json-2` also simply counts the res.partner records.

## Worklog

Implemented the `test-json-2` command in the `task` script. The command loads environment variables and posts to the Odoo JSON-2 API (`/json/2/res.partner/search_count`) via `curl`. Authentication uses the Bearer token scheme with `ODOO_PASSWORD` (which for JSON-2 API setups contains the API key). A live test against `odoo.smart-me.com` returned `37798` res.partner records. Replaced the broken placeholder implementation with the correct curl call and basic error handling.

- Updated `test-json-2()` function in `task` (line ~3001)
- No new env vars required; reuses `ODOO_URL` and `ODOO_PASSWORD` (API key)
- Help row for `test-json-2` was already present in the help table
- Verified bash syntax with `bash -n task` and tested against `odoo.smart-me.com`

@Clanker Set frontmatter state to completed and update info about model and token usage.
