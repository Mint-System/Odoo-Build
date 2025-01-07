Odoo Build
==========

[![Docker pulls](https://img.shields.io/docker/pulls/mintsystem/odoo)](https://hub.docker.com/r/mintsystem/odoo/) [![.github/workflows/test.yml](https://github.com/Mint-System/Odoo-Build/actions/workflows/test.yml/badge.svg)](https://github.com/Mint-System/Odoo-Build/actions/workflows/test.yml)

This is the [Mint System](https://www.mint-system.ch/) Odoo development environment.

This projects provides a highly opinionated way to manage and develop Odoo. It features:

* 🔍 **Odoo Source**: Checkout the Odoo Community and Enterprise Edition and start editing the source code.  
* 🐳 **Docker Compose**: Spin up an Odoo, Postgres, and pgAdmin Docker container and experiment locally.  
* 💻 **Native**: Start an Odoo server directly from the source.  
* 🔄 **Multiple Versions**: With Odoo Build, you can switch between Odoo versions starting from 13.0 up to 18.0.  
* 🛠️ **Develop Modules**: Scaffold new modules, develop new Odoo features locally.  
* 📥 **Import and Export Database**: Use Odoo scripts to copy and restore a customer database to the local environment. Investigate issues and deploy the database with ease.  
* 🤝 **Community Repos**: The most common community repos are checked out when setting up the project.  
* ✂️ **Customizing Snippets**: Create [snippets](./snippets.md) and push them to an Odoo database.  
* 🕰️ **Odoo Revisions**: Snapshot the Odoo source at a specific date. See [revisions](./revisions.md) for details.  
* 📦 **Odoo Image**: Build and publish a custom Odoo Docker image. See [README](./image/README.md) for details.  
* ☸️ **Kubernetes**: Deploy Odoo and Postgres to a local Kubernetes cluster.  
* 🔑 **Credentials**: Manage login credentials for Odoo and Nextcloud.  
* ⬆️ **Odoo Upgrade**: Helper commands to ease the Odoo upgrade process.  
* 🚀 **And More**: See [task help](./task.md).

## Requirements

The Odoo development environment has the following requirements:

* [Docker](https://docs.docker.com/engine/install/)
* Install Python 3.11+ with [pyenv](https://github.com/pyenv/pyenv)
* bash/zsh alias `alias task='./task'` with optional [bash](https://github.com/janikvonrotz/dotfiles/blob/master/bash/completions/task_completions)/[zsh](https://github.com/janikvonrotz/dotfiles/blob/master/oh-my-zsh/completions/_task) completion.

You can also use [Nix](https://nixos.org/) to setup the development requirements.

Install [kind](https://kind.sigs.k8s.io/) or [minikube](https://minikube.sigs.k8s.io/docs/) and [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl) to deploy Odoo to Kubernetes.

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

Run Odoo from source. Currently supported OS: Ubuntu, Debian, Pop!_OS, Darwin, Windows with Ubuntu on WSL2.

#### Setup Odoo environment

Sync the submodule branch.

```bash
task git-submodule-sync
```

#### Setup Python environment

Install Python and pip.

```bash
pyenv install
```

Install the python dependencies.

```bash
task install-native
```

#### Initialize and start Odoo from source

Start database container only.

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

Create a new module.

```bash
task create-module addons/project/project_sprint
```

Add a new model.

```bash
task generate-module-model addons/project/project_sprint project.sprint
```

Add model security.

```bash
task generate-module-security addons/project/project_sprint project.sprint
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

#### Set Odoo database name

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

#### Drop database

```bash
task drop-db
```

#### Define Postgres image version

Define the Postgres image in your `.env` file:

```bash
POSTGRES_IMAGE=postgres:12-alpine
```

#### Build and publish Odoo image

To build the Docker image setup these `.env` vars:

```bash
ODOO_REVISION=16.0.20241220
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

#### Setup mail catcher

Start mail server.

```bash
task start mail
```

Setup mail server config for Odoo.

```bash
task setup-mail
```

### Kubernetes

Run a local Kubernets cluster with kind or minikube.

#### Start Kubernetes Cluster

Start Kubernetes with `kind`.

```bash
task start-kind
```

Or start Kubernetes with `minikube`.

```bash
task start-minikube
```

#### Deploy Odoo to Kubernetes

Ensure you have `kubectl` installed and can access the cluster.

The following command applies the Odoo and Postgres manifests and initializes the Odoo database.

```bash
task k8s-apply
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

Or this error:

```bash
inotify.calls.InotifyError: Call failed (should not be -1): (-1) ERRNO=(0)
```

**Solution**

Increase inotify watch limit.

```bash
sudo vi /etc/sysctl.conf
```

```
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

### Import Error lxml

**Problem**

After install the Pyhton dependencies and running Odoo the following error is thrown:

```
ImportError: lxml.html.clean module is now a separate project lxml_html_clean.
Install lxml[html_clean] or lxml_html_clean directly.
```

**Solution**

Pin the version lxml.

```bash
pip install lxml==4.9.3
```

#### Attribute Error werkzeug

**Problem**

After install the Pyhton dependencies and running Odoo the following error is thrown:

```
Traceback (most recent call last):
  File "/home/janikvonrotz/Odoo-Build/venv17.0/bin/odoo", line 7, in <module>
    exec(compile(f.read(), __file__, 'exec'))
  File "/home/janikvonrotz/Odoo-Build/odoo/setup/odoo", line 5, in <module>
    import odoo
  File "/home/janikvonrotz/Odoo-Build/odoo/odoo/__init__.py", line 119, in <module>
    from . import service
  File "/home/janikvonrotz/Odoo-Build/odoo/odoo/service/__init__.py", line 5, in <module>
    from . import model
  File "/home/janikvonrotz/Odoo-Build/odoo/odoo/service/model.py", line 13, in <module>
    from odoo.http import request
  File "/home/janikvonrotz/Odoo-Build/odoo/odoo/http.py", line 279, in <module>
    if parse_version(werkzeug.__version__) >= parse_version('2.0.2'):
                     ^^^^^^^^^^^^^^^^^^^^
AttributeError: module 'werkzeug' has no attribute '__version__'
```

**Solution**

```bash
pip install Werkzeug==2.2.2
```