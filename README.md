Odoo Development
================

The Mint System Odoo development environment.

This projects provides a highly opiniated way to develope Odoo and Odoo modules. It supports the following scenarios:

**Docker Compose**

Spin up a Odoo, Postgres and PGadmin Docker container and experiment locally.

**Import and Export Database**

Use Odoo scripts to copy and restore a remote customer database in the local development environment. Investigate issues and deploy the database at whish.

**Community Edition**

Checkout the Odoo Community Edition and start editing source code.

**Enterprise Modules**

Checkout the Odoo enterprise modules and deploy them into the Odoo Docker container or the Odoo source.

**Develope Modules**

Scaffold a new module and develope new Odoo features locally.

## Requirements

The Odoo development environment has the following requirements:

* [Odoo Scripts](https://github.com/Mint-System/Ansible-Playbooks/tree/master/roles/odoo-scripts/files)
* [Docker Compose](https://docs.docker.com/compose/)
* Python 3.7.X
* [Task](https://taskfile.dev/)
* wkhtmltopdf

## Usage

The usage section is set of recipes. Pick the one required according the scenarios.

Clone this repository.

```bash
git clone https://github.com/Mint-System/Odoo-Development.git odoo-development
cd odoo-development
```

### Docker

Run Odoo as Docker container.

#### Install Odoo with Docker

Run docker compose.

```bash
task up
```

Initialize database and install modules.

```bash
docker-odoo-install
```

Open browser to [http://localhost:8069](http://localhost:8069) and login with `admin:admin`.

#### Create new module with Docker

Scaffold a new module.

```bash
docker exec -it odoo odoo scaffold sales-customization /mnt/extra-addons
```

Restart Odoo.

```bash
docker restart odoo
```

#### Install custom module with Odoo scripts

```bash
docker-odoo-install -m show_db_name
```

#### Create new database with Docker

```bash
docker exec -it odoo bin/bash
createdb -h $HOST -U $USER odoo2 --locale=de_CH.utf8 --template=template0
# Enter password
psql -h $HOST -U $USER -l
# Enter password
odoo -i base,web -c /etc/odoo/odoo.conf -d odoo2 --db_host $HOST -r $USER -w $PASSWORD --without-demo=all --stop-after-init
# Exit
docker restart odoo
```

Open [http://localhost:8069/?db=Test](http://localhost:8069/?db=Test) in your browser.

#### Delete database with Docker

```bash
docker exec -it odoo bin/bash
psql -h $HOST -U $USER -l
# Enter password
dropdb -h $HOST -U $USER mint-system
# Enter password
```

#### Save config with Docker

```bash
docker exec -it odoo bin/bash -c "odoo -s -d odoo --db_host \$HOST -r \$USER -w \$PASSWORD"

```

### Source

Run Odoo from source.

#### Create and activate virtual env

Create and acivate the virutal env.
```bash
cd odoo
python3 -m venv venv
source venv/bin/activate
```

#### Install Odoo source requirements

Pull the `odoo` submodule and install the python dependencies.

```bash
git submodule update odoo
cd odoo
pip install setuptools wheel watchdog phonenumbers
pip install -r requirements.txt
```

**Py3o Report Engine**

If you are using the py3o report engine additional packages are required:

```bash
pip install py3o.template py3o.formats
# Macos
brew cask install libreoffice
# Ubuntu
apt-get --no-install-recommends install libreoffice
```

#### Run database container only

```bash
task up-db
```

#### Install Odoo from source

```bash
task src-install
```

#### Start Odoo from source

```bash
task up-src
```

#### Create a new module from source


```bash
cd odoo
./odoo-bin scaffold project_report ../addons
```

### Common

#### Enable developer mode

Open this url [http://localhost:8069/web?debug=1](http://localhost:8069/web?debug=1), which contains the debug flag.

#### Manage database with Docker

Open database manager [http://localhost:8000/](http://localhost:8000/) and login with `admin@example.com:admin`.

#### Remove Docker conainers

Kill docker containers.

```bash
docker-compose down -v
```

#### Stop all Docker containers

```bash
task stop
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

#### Setup managed modules

Update the entries in the list `managed_modules.txt`.

Checkout a specific git revision in the Odoo enterprise repository.

Run the script `compile-managed-modules` to create zip files for the managed modules.

#### Load and unload managed modules

Run the script `copy-managed-modules` to load the managed modules into the addons folder.

Execute the script `remove-managed-mdoules` to delete the managed modules from the addons folder.

#### Export pgAdmin connections

```bash
docker exec pgadmin python setup.py --dump-servers /var/tmp/servers.json --user admin@example.com; cat /var/tmp/servers.json
```
