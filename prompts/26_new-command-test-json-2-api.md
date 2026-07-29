---
title: "New command test json 2 api"
state: completed
model: infomaniak/moonshotai/Kimi-K2.6
input_tokens: 46.2K
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

Here is the documentation: https://www.odoo.com/documentation/19.0/developer/reference/external_api.html

The `test-json-2` also simply counts the res.partner records.

## Worklog

Added the `test-json-2` command to the `task` script. The command:
- Loads the target environment using `load-dotenv` (same as `test-xmlrpc`).
- Authenticates against the Odoo JSON-RPC endpoint (`/jsonrpc`) via `curl` to obtain a user ID.
- Calls `res.partner` `search_count` through the JSON-RPC API.
- Prints the record count in the same format as `test-xmlrpc`.

Also updated the help table to include the new command.

@Clanker Set frontmatter state to completed and update info about model and token usage.
