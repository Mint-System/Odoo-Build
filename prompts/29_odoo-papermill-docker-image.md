---
title: "Odoo Papermill Docker image"
state: draft
model: 
input_tokens: 
---

# Run 29

Note: @Clanker refers to the "ai agent" (you) who is working on this task.

@Clanker when working on this task, make sure to:

- Read context and task section first
- Prepare a list of todos
- Update the todo list while working on the task

## Context

@Clanker Read the `AGENTS.md` and `README.md` to get an understanding of the project.

## Task

I want you to create a new Docker image `images/odoo-papermill` "Mint System Odoo Papermill".

This is a base image that can be used to run Jupyter Notebooks. It provides a FastAPI endpoint that Odoo can call.

Create the files `README.md`, `LICENSE,` `Dockerfile`, `entproint.sh` and `odoo-papermill.py` similar to `images/odoo-mailgate`.

The images supports these env vars:

- `VENV_PATH="/app/.venv"`
- `JUPYTER_HOST="0.0.0.0`
- `JUPYTER_PORT="80"`
- `JUPYTER_TOKEN`
- `API_TOKEN`
- `EXECUTION_TIMEOUT=120`

If JUPYTER_TOKEN is set, the image will also start `jupyter lab` and expose it via FastAPI proxy.

The Dockerfile is based on `debian:stable-slim` and installs uv and git.

The `odoo-papermaill.py` is a FastAPI server with shebang `#!/usr/bin/env python3`.

It provides and post endpoint `/exec/{path/to/notebook.ipynb}?param=value`. It then uses https://papermill.readthedocs.io/ to run the notebook. The https response waits for papermill to finish an then returns either an 200 ok, 504 timeout or 500 exception with details. In any case the response contains the command line output of papermill.

Another enpoint is `/list`. This method simply traverses the `/app/main` dir and search `Jupyter notebooks`. It then returns the a simple list with the paths to the notebook.

All requests must be authenticated with the `API_TOKEN` in a bearer auth header.

Update the `compose.yml.template` with a new service `odoo-paperill`. The FastAPI server must be accessable on `localhost:8080`.

Then add a new command `start-odoo-papermill <path>` command. Similar to `start-jupyter-lab` it will start the `odoo-paperill` service and mount the `path` to `/app/main`.

Just for context: In another step I will create an Odoo module `papermill_job`. This module is based on OCA `queue_job` and provides a job template to make requests to the odoo-papermill service. It allows seeting parameters `param=value` that are forwarded to the papermill notebook call. The module will store the response and supports re-running of failed notebook jobs. The url and api token to the odoo-papermail service can be set on the settings page of Odoo. When defining the job it allows selecting a notebook path generated from the `/list` endpoint.

## Worklog

@Clanker Add a summary here once the task has been completed.

@Clanker Set frontmatter state to completed and update info about model and token usage.
