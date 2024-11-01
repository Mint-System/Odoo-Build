![](https://github.com/Mint-System/Odoo-Build/raw/16.0/logo.png)

Odoo Build
==========

[![Docker pulls](https://img.shields.io/docker/pulls/mintsystem/odoo)](https://hub.docker.com/r/mintsystem/odoo/)

This is the [Mint System](https://www.mint-system.ch/) Odoo development environment.

This projects provides a highly opinionated way to develop Odoo modules. It features:

* **Odoo Source**: Checkout the Odoo Community and Enterprise Edition and start editing the source code.
* **Docker Compose**: Spin up a Odoo, Postgres and pgAdmin Docker container and experiment locally.
* **Native**: Start an Odoo server directly from the source.
* **Import and Export Database**: Use Odoo scripts to copy and restore a customer database to the local environment. Investigate issues and deploy the database at ease.
* **Community Modules**: The most common community modules are checked out when setting up the project.
* **Customizing Snippets**: Create [snippets](./snippets.md) and push them to an Odoo database.
* **Odoo Scripts**: Develope scripts to patch Odoo code.
* **Odoo Revisions**: Snapshot the Odoo source at a specific date. See [revisions](./revisions.md) for details.
* **Odoo Image**: Build and publish a custom Odoo Docker image. See [README](./build/README.md) for details.
* **Kubernetes**: Deploy Odoo and Postgres to a minikube cluster.
* **Develop Modules**: Scaffold a new module, develop new Odoo features locally and [much more](./task.md).
* **Credentials**: Setup credentials to log into Odoo.
* **Import Data**: Import Odoo records from CSV.

## Requirements

The Odoo development environment has the following requirements:

* [Docker](https://docs.docker.com/engine/install/) and [Docker Compose](https://docs.docker.com/compose/)
* Install Python 3.11+ with [pyenv](https://github.com/pyenv/pyenv)
* Install [PostgreSQL](https://www.postgresql.org/download/)
* bash/zsh alias `task='./task'` with optional [bash](https://github.com/janikvonrotz/dotfiles/blob/master/bash/completions/task_completions)/[zsh](https://github.com/janikvonrotz/dotfiles/blob/master/oh-my-zsh/completions/_task) completion.

You can also use [Nix](https://nixos.org/) to setup the development requirements.

To test Kubernetes deployments for Odoo install [minikube](https://minikube.sigs.k8s.io/docs/) and [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl).

## Usage

The usage section is a set of workflows. See `task help` or [task](./task.md) for details about the project commands.

Clone this repository.

```bash
git clone git@github.com:Mint-System/Odoo-Build.git
cd Odoo-Build
```

When working with Nix, run the nix-shell.

```bash
nix-shell
```

Checkout the Odoo version. Supported versions are: 13.0, 14.0, 15.0, 16.0, 17.0, 18.0

```bash
task checkout $VERSION
```

Install [Odoo scripts](https://ansible.build/roles/odoo_scripts/).

```bash
task install-odoo-scripts
```

Decide wether you want to run Odoo in native mode (from source) or with Docker as a container.

### Native

Run Odoo from source. Currently supported OS: Ubuntu, Debian, Pop!_OS, Darwin 

#### Install Odoo native requirements

Pull the `odoo` submodule and install the python dependencies.

```bash
git submodule update odoo
task install-native
```

#### Initialize and start Odoo from source

Run database container only.

```bash
task start db
```

Initialize database.

```bash
task init-db
```

Start Odoo from source.

```bash
task start native
```

The browser will be opened automatically.

#### Create a new module from source

Scaffold a new module.

```bash
task create-module addons/project_report
```

#### Load modules from thirdparty folder

Clone thirdparty repos into the `thirdparty` folder.

To load modules from a thirdparty folder, set this env var in your `.env` file:

```bash
ODOO_ADDONS_PATH=thirdparty/odoo-apps-partner-contact,../odoo-cd/untracked-odoo-apps
```

The paths will be appended to the Odoo config.

#### Initialize without demo data

In your `.env` file define this Odoo parameter env var:

```bash
ODOO_PARAM="--without-demo=all"
```

#### Define Odoo database name

By default the database name is the current branch name.

To define the name, set this env var in your `.env` file:

```bash
ODOO_DATABASE=odoo
```

#### Disable browser open

To disable the browser open when starting the Odoo server edit the `.env` file:

```bash
BROWSER_OPEN=false
```

### Docker

Run Odoo with Docker container.

#### Start and initialize Odoo with Docker

Set the Odoo addons path in your `.env` file:

```bash
ODOO_ADDONS_PATH=/mnt/addons/,/mnt/oca/,/mnt/enterprise,/mnt/themes/
```

Run Docker Compose.

```bash
task start
```

Initialize database with the Odoo script.

Use `docker-odoo-init help` to show all options.

```bash
docker-odoo-init -d odoo -i web
```

Open browser to [http://localhost:8069](http://localhost:8069) and login with `admin:admin`.

#### Install custom module

```bash
docker-odoo-install -m show_db_name
```

### Common

Instructions that are true for Docker and native usage.

#### Change log level

To change the log level of Odoo set this env var in your `.env` file:

```bash
LOG_LEVEL=debug
```

#### Manage database with Docker

Open database manager [http://localhost:8000/](http://localhost:8000/) and login with `admin@example.com:admin`.

#### Remove Docker containers

This removes containers and volumes.

```bash
task remove
```

#### Stop all Docker containers

```bash
task stop
```

#### Remove database

```bash
task drop-db
```

#### Define Postgres image version

Define the Postgres image in your `.env` file:

```bash
POSTGRES_IMAGE=postgres:12-alpine
```

#### Build Odoo image

To build the Docker image setup these `.env` vars:

```bash
ODOO_REVISION=16.0.2024.0405
DOCKER_REGISTRY=mint-system/
```

Checkout the Odoo revision.

```bash
task checkout-revision
```

Build the Odoo image.

```bash
task build
```

Publish the Odoo image.

```bash
task publish
```

#### Mail catcher

Start mail server.

```bash
task start mail
```

Setup mail server config for Odoo.

```bash
task setup-mail
```

### Kubernetes

Run a local Kubernets cluster with minikube.

#### Start minikube

Ensure you have `minikube` installed.

```bash
task start-minikube
```

#### Deploy Odoo to minikube

Ensure you have `kubectl` installed and can access the cluster.

The following command applies the Odoo and Postgres manifests and initializes the Odoo database.

```bash
task init-minikube
```

## Troubleshooting

### Remove tracked submodule folders

**Problem**

The checkout command fails tue to unregistered submdoules.

**Solution**

Remove the submodule with `git rm`, f.e. `git rm oca/dms`.

### inotify instance limit reached 

**Problem**

While starting the native server this error is thrown:

```bash
OSError: [Errno 24] inotify instance limit reached
```

**Solution**

Increase inotify watch limit.

```bash
sudo vi /etc/sysctl.conf
```

```conf
fs.inotify.max_user_watches=524288
fs.inotify.max_user_instances=256
```

```bash
sudo sysctl -p
```

### ImportError libldap

**Problem**

Instance with `auth_ldap` does not start.

```
ImportError: libldap_r-2.4.so.2: cannot open shared object file: No such file or directory
```

**Solution**

Reinstall with pip flags.

```
pip install python-ldap --force-reinstall --no-binary python-ldap
```

### psycopg2 symbol not found

**Problem**

`init-db` fails with psycopg2 errors on macOS / Darwin.

**Solution**

```bash
source task source
pip install psycopg2-binary --force
```

### Distribution not found

**Problem**

After switching the Odoo version with `task checkout` the `task` command fail with this error:

```
pkg_resources.DistributionNotFound: The 'odoo==XX.0' distribution was not found and is required by the application
```

**Solution**

The local Odoo package needs to be updated:

```bash
source task source
pip install -e odoo 
```