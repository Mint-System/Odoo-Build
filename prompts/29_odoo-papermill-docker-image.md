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

Create the files `README.md`, `LICENSE,` `Dockerfile`, `entproint.sh` `pyproject.toml` and `fastapi.py` similar to `images/odoo-mailgate`.

The images supports these env vars:

- `VENV_PATH="/app/.venv"`
- `PYTHON_INSTALL`
- `START_JUPYTER=True`
- `JUPYTER_HOST="0.0.0.0`
- `JUPYTER_PORT="80"`
- `JUPYTER_TOKEN`
- `API_TOKEN`
- `EXECUTION_TIMEOUT=120`

The `entrypoint.sh` creates the virutal env at `VENV_PATH` and install python packages defined in `PYTHON_INSTALL`. It also installs packages from `/apps/main/requirements.txt` if path exists.

If `START_JUPYTER` is true, the image will also start `jupyter lab` and expose it via FastAPI proxy. If `JUPYTER_TOKEN` is not set, a value will be generated.

The Dockerfile is based on `debian:stable-slim` and installs `uv` and `git`.

The `fastapi.py` is a FastAPI server with shebang `#!/usr/bin/env python3`. The FastAPI packages are installed with `pyproject.toml`.

It provides and post endpoint `/exec/{path/to/notebook.ipynb}?param=value`. It then uses <https://papermill.readthedocs.io/> to run the notebook. Papermill command runs with `--execution-timeout=$EXECUTION_TIMEOUT`. The https response waits for papermill to finish an then returns either an 200 ok, 504 timeout or 500 exception with details. In any case the response contains the command line output of papermill.

Another endpoint is `/list`. This method simply traverses the `/app/main` dir and search `Jupyter notebooks`. It then returns the a simple list with the paths to the notebook.

All requests must be authenticated with the `API_TOKEN` in a bearer auth header.

Update the `compose.yml.template` with a new service `odoo-paperill`. The FastAPI server must be accessable on `localhost:8080`.

Add a new task command `build-odoo-papermill` similar to `build-odoo-mailgate`. This commands build and publishes the image.

Then add another task command `start-odoo-papermill <path>`. This command starts the `odoo-paperill` service and mounts `<paths>` to `/app/main`. After starting the service it will run a curl command that returns the `/list` content with instructions. The `JUPYTER_TOKEN` is predefined and the url including the token is opened.

Add a help entry for both commands.

For testing I will use `task init-odoo-jupyter tmp` and then `task start-odoo-papermill tmp`.

Just for context: In another step I will create an Odoo module `papermill_job`. This module is based on OCA `queue_job` and provides a job template to make requests to the odoo-papermill service. It allows setting parameters `param=value` that are forwarded to the papermill notebook call. The module will store the response and supports re-running of failed notebook jobs. The url and api token of the odoo-papermail service can be set on the settings page of Odoo. When defining a papermill job it allows selecting a notebook path generated from the `/list` endpoint.

In the `README.md` make reference to the Odoo Module <https://odoo-wiki.org/papermill-job.html> (does not exist yet). Other parts of the readme follow the same structure as `odoo-mailgate/README.md`. However, the usage section also gives an example of an Dockerfile that copies a notebook file to the `/app/mail` folder.

Include the `images/odoo-papermill/README.md` in the `bin/update-docker-hub-readme` script.

## Worklog

@Clanker Add a summary here once the task has been completed.

@Clanker Set frontmatter state to completed and update info about model and token usage.
