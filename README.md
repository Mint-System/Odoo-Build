![](https://github.com/Mint-System/Odoo-Build/raw/14.0/logo.png)
<!-- ![](./logo.png) -->

Odoo Build
==========

This is the [Mint System](https://www.mint-system.ch/) Odoo development environment.

This projects provides a highly opinionated way to develop Odoo and Odoo modules. It supports the following scenarios:

* **Docker Compose**: Spin up a Odoo, Postgres and pgAdmin Docker container and experiment locally
* **Import and Export Database**: Use Odoo scripts to copy and restore a remote customer database to the local development environment. Investigate issues and deploy the database at wish
* **Community Edition**: Checkout the Odoo Community Edition and start editing the source code
* **Enterprise Modules**: Checkout the Odoo enterprise modules and deploy them into the Odoo Docker container or the Odoo source.
* **Develop Modules**: Scaffold a new module, develop new Odoo features locally and [much more](./task.md)
* **Customizing Snippets**: Create [snippets](./snippets.md) and push them to an Odoo database
* **Odoo Scripts**: Develope scripts to patch Odoo code
* **Odoo Image**: Build and publish an Odoo Docker image

## Requirements

The Odoo development environment has the following requirements:

* [Docker](https://docs.docker.com/engine/install/) and [Docker Compose](https://docs.docker.com/compose/)
* Install python 3.6+ with [pyenv](https://github.com/pyenv/pyenv)
* bash/zsh alias `task='./task'` with optional [completion](https://github.com/janikvonrotz/dotfiles/blob/master/oh-my-zsh-completions/_task)

## Usage

The usage section is a set of workflows. Pick the one required by your scenario. See `task help` or [task](./task.md) for details about the project commands.

Clone this repository.

```bash
git clone git@github.com:Mint-System/Odoo-Build.git
cd Odoo-Build
```

Checkout branch.

```bash
task checkout 13.0
# or
task checkout 14.0
# or
task checkout 15.0
# or
task checkout 16.0
# or
task checkout 17.0
```

Install [Odoo scripts](https://ansible.build/roles/odoo-scripts/)

```bash
task install-odoo-scripts
```

### Native

Run Odoo from source. Currently supported OS: Ubuntu, Debian

**Install Odoo native requirements**

Pull the `odoo` submodule and install the python dependencies.

```bash
git submodule update odoo
task install-native
```

**Initialize and start Odoo from source**

Run database container only

```bash
task start db
```

Initialize database

```bash
task init-db
```

Start Odoo from source

```bash
task start native
```

Open browser to [http://localhost:8069](http://localhost:8069) and login with `admin:admin`.

**Create a new module from source**

Scaffold a new module.

```bash
task create-module addons/project_report
```

**Load modules from thirdpary folder**

To load modules from a thirdparty folder, set this env var in your `.env` file

```
ODOO_ADDONS_PATH=,thirdparty/modules/,../other/modules
```

The paths will be appended to the Odoo config.

### Docker

Run Odoo with Docker container.

**Start and initialize Odoo with Docker**

Run docker compose.

```bash
task start
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

### Common

Instructions that are true for Docker and native usage paths.

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
task drop-db
```

### Image

To build the Docker image setup these `.env` vars:

```
ODOO_REVISION=16.5
DOCKER_REGISTRY=mint-system/
```

Build the Odoo image.

```bash
task build
```

Publish the Odoo image.

```
task publish
```

## Mail

### Setup mail server and client

Start mail server.

```
task start mail
```

Create a new account `odoo@example.com` and set `odoo` as password.\
Create a new account `test@example.com` and set `test` as password.

Install a simple mail client such as [Claws Mail](https://www.claws-mail.org/) and connect with credentials:

host: `localhost`\
port: `25`\
username: `odoo@example.com`\
password: `test`

For incoming mails use these informations:

server type: `IMAP`
host: `localhost`\
port: `143`\
username: `odoo@example.com`\
password: `test`

Repeat the same for `test@example.com`.

### Setup incoming and outgoing mail for Odoo

Activate mail sever option with `example.com` domain.

For outgoing mails use these informations:

host: `localhost`\
port: `25`\
username: `odoo@example.com`\
password: `odoo`

For incoming mails use these informations:

server type: `IMAP`
host: `localhost`\
port: `143`\
username: `odoo@example.com`\
password: `odoo`

### Test mail exchange

Follow these steps to test a mail exchange:

* Send mail in Odoo to `test@example.com`
* In mail client create reply to the mail and save as draft
* Copy the mail to the inbox of `odoo@example.com`
* Trigger fetchmail in Odoo
* Check if reply has been processed

## Troubleshooting

### inotify instance limit reached 

**Problem**

While starting the native server this error is thrown:

```bash
OSError: [Errno 24] inotify instance limit reached
```

**Solution**

Increase ifnotify watch limit.

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
