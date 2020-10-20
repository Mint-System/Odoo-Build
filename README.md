Odoo Development
================

The Mint System Odoo development environment.

This projects provides a highly opiniated way to develope Odoo and Odoo modules. It supports the following scenarios:

* **Docker Compose**: Spin up a Odoo, Postgres and pgAdmin Docker container and experiment locally.
* **Import and Export Database**: Use Odoo scripts to copy and restore a remote customer database in the local development environment. Investigate issues and deploy the database at whish.
* **Community Edition**: Checkout the Odoo Community Edition and start editing the source code.
* **Enterprise Modules**: Checkout the Odoo enterprise modules and deploy them into the Odoo Docker container or the Odoo source.
*  **Develope Modules**: Scaffold a new module and develope new Odoo features locally.

## Requirements

The Odoo development environment has the following requirements:

* [Odoo Scripts](https://github.com/Mint-System/Ansible-Playbooks/tree/master/roles/odoo-scripts)
* [Docker Compose](https://docs.docker.com/compose/)
* Python 3.7.X
* [wkhtmltopdf](https://wkhtmltopdf.org/)
* bash/zsh alias: `task='task'`

## Usage

The usage section is set of recipes. Pick the one required according to your scenario.

Clone this repository.

```bash
git clone https://github.com/Mint-System/Odoo-Development.git odoo-development
cd odoo-development
```

### Docker

Run Odoo with Docker container.

#### Start and initialize Odoo with Docker

Run docker compose.

```bash
task start
```

Initialize database and install modules.

```bash
docker-odoo-install
```

Open browser to [http://localhost:8069](http://localhost:8069) and login with `admin:admin`.

#### Install custom module with Odoo scripts

```bash
docker-odoo-install -m show_db_name
```

#### Save config with Docker

```bash
docker exec -it odoo bin/bash -c "odoo -s -d odoo --db_host \$HOST -r \$USER -w \$PASSWORD"
```

### Source

Run Odoo from source.

#### Create and activate virtual env

Create and activate the virutal env.
```bash
task venv-init
```

#### Install Odoo source requirements

Pull the `odoo` submodule and install the python dependencies.

```bash
git submodule update odoo
task install-src
```

**Py3o Report Engine**

If you are using the Py3o report engine additional packages are required:

```bash
cd odoo
pip install py3o.template py3o.formats
cd ..
# MacOS
brew cask install libreoffice
# Ubuntu
apt-get --no-install-recommends install libreoffice
```

#### Initialize and start Odoo from source

Run database container only

```bash
task start-db
```

Initialize database

```bash
task init-db
```

Start Odoo from source

```bash
task start-src
```

Open browser to [http://localhost:8069](http://localhost:8069) and login with `admin:admin`.

#### Create a new module from source

Scaffold a new module.

```bash
task scaffold-src project_report
```

### Common

Instructions that are true for Docker and Source usage paths.

#### Enable developer mode

Open this url [http://localhost:8069/web?debug=1](http://localhost:8069/web?debug=1), which contains the debug flag.

#### Manage database with Docker

Open database manager [http://localhost:8000/](http://localhost:8000/) and login with `admin@example.com:admin`.

#### Remove Docker conainers

Kill docker containers and volumes.

```bash
docker-compose down -v
```

#### Stop all Docker containers

```bash
task stop
```

#### Remove database

```bash
task drop-db odoo
```

#### Install Odoo REST API dependencies

```bash
pip install -r addons/rest_api/requirements.txt
```

Or with Docker:

```bash
docker exec odoo pip3 install -r /mnt/extra-addons/rest_api/requirements.txt
docker restart odoo
```

### Managed Modules

Manage Odoo modules.

#### Setup managed modules

Update the entries in the list `managed_modules.txt`.

Checkout a specific git revision in the Odoo enterprise repository.

Run `task compile-managed-modules` to create zip files for the managed modules.

#### Load and unload managed modules

Run `task copy-managed-modules` to load the managed modules into the addons folder.

Execute the script `task remove-managed-mdoules` to delete the managed modules from the addons folder.

#### Export pgAdmin connections

```bash
docker exec pgadmin python setup.py --dump-servers /var/tmp/servers.json --user admin@example.com; cat /var/tmp/servers.json
```
