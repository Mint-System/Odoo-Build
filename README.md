<img src="./odoo_development.jpg" width="200px">

Odoo Development
================

This is the [Mint System](https://www.mint-system.ch/) Odoo development environment.

This projects provides a highly opinionated way to develop Odoo and Odoo modules. It supports the following scenarios:

* **Docker Compose**: Spin up a Odoo, Postgres and pgAdmin Docker container and experiment locally.
* **Import and Export Database**: Use Odoo scripts to copy and restore a remote customer database in the local development environment. Investigate issues and deploy the database at wish.
* **Community Edition**: Checkout the Odoo Community Edition and start editing the source code.
* **Enterprise Modules**: Checkout the Odoo enterprise modules and deploy them into the Odoo Docker container or the Odoo source.
* **Develop Modules**: Scaffold a new module and develop new Odoo features locally.

## Requirements

The Odoo development environment has the following requirements:

* [Docker](https://docs.docker.com/engine/install/) and [Docker Compose](https://docs.docker.com/compose/)
* Install python 3.6+ with [pyenv](https://github.com/pyenv/pyenv)
* [wkhtmltopdf](https://wkhtmltopdf.org/): `sudo apt install wkhtmltopdf`
* bash/zsh alias: `task='./task'`

## Usage

The usage section is a set of workflows. Pick the one required by your scenario. See `task help` or [task](./task.md) for details about this projects commands.

Clone this repository.

```bash
git clone https://github.com/Mint-System/Odoo-Development.git odoo-development
cd odoo-development
```

Checkout branch.

```bash
task checkout 13.0
# or
task checkout 14.0
```

Install [Odoo scripts](https://github.com/Mint-System/Ansible-Playbooks/tree/master/roles/odoo-scripts)

```bash
task install-odoo-scripts
```

Disable auto install for Odoo apps.

```bash
task disable-auto-install
```

### Docker

Run Odoo with Docker container.

**Start and initialize Odoo with Docker**

Run docker compose.

```bash
task start
# or
npm run task-start
```

Initialize database.

```bash
docker-odoo-install
```

Open browser to [http://localhost:8069](http://localhost:8069) and login with `admin:admin`.

**Install custom module**

```bash
docker-odoo-install -m show_db_name
```

**Save config with Docker**

```bash
docker exec -it odoo bin/bash -c "odoo -s -d odoo --db_host \$HOST -r \$USER -w \$PASSWORD"
```

### Source

Run Odoo from source.

**Install Odoo source requirements**

Pull the `odoo` submodule and install the python dependencies.

```bash
git submodule update odoo
task install-src
```

**Initialize and start Odoo from source**

Run database container only

```bash
task start db
# or
npm run task-start-db
```

Initialize database

```bash
task init-db
```

Start Odoo from source

```bash
task start src
# or
npm run task-start-src
```

Open browser to [http://localhost:8069](http://localhost:8069) and login with `admin:admin`.

**Create a new module from source**

Scaffold a new module.

```bash
task create-module project_report
```

### Common

Instructions that are true for Docker and Source usage paths.

**Enable developer mode**

Open this url [http://localhost:8069/web?debug=1](http://localhost:8069/web?debug=1), which contains the debug flag.

**Manage database with Docker**

Open database manager [http://localhost:8000/](http://localhost:8000/) and login with `admin@example.com:admin`.

**Remove Docker conainers**

Kill docker containers and volumes.

```bash
task kill
```

**Stop all Docker containers**

```bash
task stop
```

**Remove database**

```bash
task drop-db odoo
```

**Install Odoo REST API dependencies**

```bash
pip install -r addons/rest_api/requirements.txt
```

Or with Docker:

```bash
docker exec odoo pip3 install -r /mnt/extra-addons/rest_api/requirements.txt
docker restart odoo
```

### Mail

**View emails**

Start mail service.

```bash
task start mail
```

Open the mail client [http://localhost](http://localhost).

**Send email**

Use curl to send an email to `support@localhost`:

```bash
task send-support-mail
```
