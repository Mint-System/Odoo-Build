![](https://github.com/Mint-System/Odoo-Development/raw/14.0/logo.png)
<!-- ![](./logo.png) -->

Odoo Development
================

This is the [Mint System](https://www.mint-system.ch/) Odoo development environment.

This projects provides a highly opinionated way to develop Odoo and Odoo modules. It supports the following scenarios:

* **Docker Compose**: Spin up a Odoo, Postgres and pgAdmin Docker container and experiment locally
* **Import and Export Database**: Use Odoo scripts to copy and restore a remote customer database in the local development environment. Investigate issues and deploy the database at wish
* **Community Edition**: Checkout the Odoo Community Edition and start editing the source code
* **Enterprise Modules**: Checkout the Odoo enterprise modules and deploy them into the Odoo Docker container or the Odoo source.
* **Develop Modules**: Scaffold a new module, develop new Odoo features locally and [much more](./task.md)
* **Customizing Snippets**: Create [snippets](./snippets.md) and push them to an Odoo database
* **Odoo Scripts**: Develope scripts to patch Odoo modules 

## Requirements

The Odoo development environment has the following requirements:

* [Docker](https://docs.docker.com/engine/install/) and [Docker Compose](https://docs.docker.com/compose/)
* Install python 3.6+ with [pyenv](https://github.com/pyenv/pyenv)
* bash/zsh alias `task='./task'` with optional [completion](https://github.com/janikvonrotz/dotfiles/blob/master/oh-my-zsh-completions/_task)

## Usage

The usage section is a set of workflows. Pick the one required by your scenario. See `task help` or [task](./task.md) for details about the projects commands.

Clone this repository.

```console
git clone git@github.com:Mint-System/Odoo-Development.git
cd Odoo-Development
```

Checkout branch.

```console
task checkout 13.0
# or
task checkout 14.0
# or
task checkout 15.0
```

Install [Odoo scripts](https://ansible.build/roles/odoo-scripts/)

```console
task install-odoo-scripts
```

Disable auto install for Odoo apps.

```console
task disable-auto-install
```

### Docker

Run Odoo with Docker container.

**Start and initialize Odoo with Docker**

Run docker compose.

```console
task start
# or
npm run task-start
```

Initialize database.

```console
docker-odoo-install
```

Open browser to [http://localhost:8069](http://localhost:8069) and login with `admin:admin`.

**Install custom module**

```console
docker-odoo-install -m show_db_name
```

### Native

Run Odoo from source.

**Install Odoo native requirements**

Pull the `odoo` submodule and install the python dependencies.

```console
git submodule update odoo
task install-native
```

**Initialize and start Odoo from source**

Run database container only

```console
task start db
# or
npm run task-start-db
```

Initialize database

```console
task init-db
```

Start Odoo from source

```console
task start native
# or
npm run task-start-native
```

Open browser to [http://localhost:8069](http://localhost:8069) and login with `admin:admin`.

**Create a new module from source**

Scaffold a new module.

```console
task create-module addons/project_report
```

### Common

Instructions that are true for Docker and native usage paths.

**Enable developer mode**

Open this url [http://localhost:8069/web?debug=1](http://localhost:8069/web?debug=1), which contains the debug flag.

**Manage database with Docker**

Open database manager [http://localhost:8000/](http://localhost:8000/) and login with `admin@example.com:admin`.

**Remove Docker conainers**

Kill docker containers and volumes.

```console
task kill
```

**Stop all Docker containers**

```console
task stop
```

**Remove database**

```console
task drop-db
```

### Mail

**View emails**

Start mail service.

```console
task start mail
```

Open the mail client [http://localhost](http://localhost).

**Configure mail server**

Install the odoo mail server data package.

```console
task install-module mail_data
```

**Send email**

Use curl to send an email:

```console
task send-support-mail
```

## Trooubleshooting

### inotify instance limit reached 

**Problem**

While starting the native server this error is thrown:

```console
OSError: [Errno 24] inotify instance limit reached
```

**Solution**

Increase ifnotify watch limit.

```console
sudo sysctl fs.inotify.max_user_watches=52428800
```