---
title: "Remove psql connection uris"
state: completed
model: Kimi K2.6
input_tokens: 24.9K
---

# Run 28

Note: @Clanker refers to the "ai agent" (you) who is working on this task.

@Clanker when working on this task, make sure to:

- Read context and task section first
- Prepare a list of todos
- Update the todo list while working on the task

## Context

@Clanker Read the `AGENTS.md` and `README.md` to get an understanding of the project.

## Task

Read https://github.com/Mint-System/Odoo-Build/issues/75

Remove the connection uri in `images/odoo/bin/` scripts.

## Worklog

Replaced all PostgreSQL connection URI strings in `images/odoo/bin/` scripts with environment variable-based connections. `psql` automatically reads `PGUSER`, `PGPASSWORD`, `PGHOST`, and `PGPORT` from the environment, avoiding URI parsing issues with special characters (e.g., `%`, `@`, `:`) in passwords.

Files modified:
- `images/odoo/bin/init-db`: Replaced three URI usages and removed `2>/dev/null` so connection errors surface in logs.
- `images/odoo/bin/check-database-initialized`: Replaced the URI with `-d "$database"`.
- `images/odoo/bin/list-databases`: Removed the `conn_str` variable and used `-d postgres`.

Set frontmatter state to completed and updated model info.
