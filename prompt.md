---
title: "Check new Odoo 20.0 server options"
author: "Janik von Rotz <login@janikvonrotz.ch>"
state: completed
date_completed: 2026-10-06
model: moonshotai/Kimi-K2.6
input_tokens: 408885
output_tokens: 5875
---

# Check new Odoo 20.0 server options

Note: @Clanker refers to the "ai agent" (you) who is working on this prompt file.

@Clanker when working on this prompt file, make sure to:

- Read context and task section first
- Prepare a list of todos
- Update the todo list while working on task

## Context

@Clanker Read the `AGENTS.md` and `README.md` to get an understanding of the project.

## Task

There is Odoo Docker image in `images/odoo` that support configuring Odoo with env vars.

There is now Odoo version 20.0 and I want to know if there are new server params.

Report them in the worklog and I will decide if they should be supported with env vars.

## Worklog

Compared `odoo/odoo/tools/config.py` between Odoo 19.0 and 20.0.

**New configuration options / env vars in Odoo 20.0:**

| Param | Env Var / CLI | Type / Default | Notes |
|---|---|---|---|
| `db_system` | `PGDATABASE_SYSTEM` | string, `postgres` | Database for shared system operations (bus, maintenance). |
| `gevent_workers` | `ODOO_GEVENT_WORKERS` | int, `1` | Number of gevent workers in prefork mode. Requires `SO_REUSEPORT`. |
| `unsafe_policy` | `ODOO_UNSAFE_POLICY` | choice, `log` | Policy when unsafe objects are detected during arbitrary code execution: `disable`, `log`, `raise`, `terminate`. |
| `max_http_threads` | `ODOO_MAX_HTTP_THREADS` | int, `2 * cpu_count + 1` | Read directly from env, not exposed in config file. |
| Colors | `ODOO_PY_COLORS`, `NO_COLOR`, `FORCE_COLOR` | bool | New `[colors]` config section (`pid`, `loglevel`, `session_id`, `http_request_line`, `http_response_body`, `perf`, `cursor_mode`, `sql`). |

**Notable behavioral change:**
- `http_interface` default changed from `0.0.0.0` to `127.0.0.1`. In a Docker container this means Odoo would only listen on localhost and be unreachable from the host/nginx unless explicitly overridden.

**Default change:**
- `DEFAULT_SERVER_WIDE_MODULES` now includes `rpc` (`['base', 'rpc', 'web']`).

None of the new params above are currently supported by `images/odoo/odoo.conf.template` or `images/odoo/bin/template-odoo-rc`.

**Implementation:**

Added support for the following env vars to the Odoo Docker image:

- `DB_SYSTEM` → `db_system` in `odoo.conf` (default: `postgres`)
- `GEVENT_WORKERS` → `gevent_workers` in `odoo.conf` (default: `1`)
- `ODOO_MAX_HTTP_THREADS` → exported directly to the environment when set (no config file entry; Odoo reads it via `os.getenv`)

Updated files:
- `images/odoo/odoo.conf.template`
- `images/odoo/bin/template-odoo-rc`
- `images/odoo/README.md`
