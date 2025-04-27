[Mint System Odoo](https://odoo.build/images/odoo/)
===

[![Docker pulls](https://img.shields.io/docker/pulls/mintsystem/odoo)](https://hub.docker.com/r/mintsystem/odoo/)

A better Odoo image.

This container image is an improvement of the official Odoo image:

- 🐍 The image uses Python version 3.12.
- 📦 Package management is handled with [uv](https://docs.astral.sh/uv/) for Python and [pnpm](https://pnpm.io/) for Node.
- 🔄 The Odoo source is based on a specific [revision](https://odoo.build/revisions.html).
- 💎 The image build process ensures reproducibility.
- ⚙️ Configuration of `odoo.conf` is managed through environment variables.
- 🌱 Addons are cloned from git repositories.
- 🛠️ Python packages can be installed without rebuilding the image.
- 📂 The system detects addons in nested module folders.
- 💾 Session information can be stored in the database.
- 🖥️ Environment name is retrieved from server configuration.
- 📋 Database initialization with selected modules.
- 📜 The image includes built-in [Manifestoo](https://github.com/acsone/manifestoo) and [click-odoo-contrib](https://github.com/acsone/click-odoo-contrib).
- 🪴 The container runs without requiring root privileges.
- ✂️ Reduced image size through multi-stage build and file cleanup.

Source: <https://github.com/Mint-System/Odoo-Build/tree/main/images/odoo/>

## Usage

The Mint System Odoo image runs with a very basic configuration, but can also be highly customized with environment variables.

### Base

The following `compose.yml` file is a basic setup:

```yml
services:
  odoo:
    container_name: odoo
    image: mintsystem/odoo:16.0.20250311
    depends_on:
      - db
    environment:
      PGHOST: db
      PGUSER: odoo
      PGPASSWORD: odoo
      PGPORT: 5432
    ports:
      - "127.0.0.1:8069:8069"
    volumes:
      - odoo-data:/var/lib/odoo
      - ./addons:/mnt/addons
      - ./oca:/mnt/oca
      - ./enterprise:/mnt/enterprise
      - ./themes:/mnt/themes
  db:
    container_name: db
    image: postgres:14-alpine
    environment:
      POSTGRES_USER: odoo
      POSTGRES_PASSWORD: odoo
      PGDATA: /var/lib/postgresql/data/pgdata
    volumes:
      - db-data:/var/lib/postgresql/data/pgdata
volumes:
  odoo-data:
  db-data:
```

### Customized

This `compose.yml` shows all possible configurations:

```yml
services:
  odoo:
    container_name: odoo
    image: mintsystem/odoo:16.0.20250311
    depends_on:
      - db
    environment:
      PGHOST: db
      PGUSER: odoo
      PGPASSWORD: odoo
      PGPORT: 5432
      MAIL_DEFAULT_FROM: test
      MAIL_CATCHALL_DOMAIN: mint-system.ch
      MAIL_CATCHALL_ALIAS: test@mint-system.ch
      ODOO_MAIL_SMTP_HOST: mail.infomaniak.com
      ODOO_MAIL_SMTP_PORT: 587
      ODOO_MAIL_SMTP_ENCRYPTION: starttls
      ODOO_MAIL_SMTP_FROM_FILTER: test@mint-system.ch
      ODOO_MAIL_IMAP_HOST: mail.infomaniak.com
      ODOO_MAIL_IMAP_PORT: 993
      ODOO_MAIL_IMAP_SSL: "True"
      ODOO_MAIL_USERNAME: test@mint-system.ch
      ODOO_MAIL_PASSWORD: *****
      GIT_SSH_PUBLIC_KEY: ssh-ed25519 BBBBC3NzaC1lZDI1NTE5BBBBIDR9Ibi0mATjCyx1EYg594oFkY0rghtgo+pnFHOvAcym Mint-System-Project-MCC@github.com
      GIT_SSH_PRIVATE_KEY: LS0tLS1CRUdJTiBPUEVOU1NIIFBSSVZBVEUgS0VZLS0tLQpiM0JsYm5OemFDMXJaWGt0ZGpFQUFBQUFCRzV2Ym1VQUFBQUVibTl1WlFBQUFBQUFBQUFCQUFBQU13QUFBQXR6YzJndFpXClF5TlRVeE9RQUFBQ0EwZlNHNHRKZ0U0d3NzZFJHSU9mZUtCWkdOSzRJYllLUHFaeFJ6cndITXBnQUFBS2k1WkJhRnVXUVcKaFFBQUFBdHpjMmd0WldReU5UVXhPUUFBQUNBMGZTRzR0SmdFNHdzc2RSR0lPZmVLQlpTks0SWJZS1BxWnhSenJ3SE1wZwowQkFnTT0KLS0tLS1FTkQgT1BFTlNTSCBQUklWQVRFIEtFWS0tLS0tCg==
      GITHUB_USERNAME: bot-mintsys
      GITHUB_PERSONAL_ACCESS_TOKEN: *****
      ADDONS_GIT_REPOS: "git@github.com:Mint-System/Odoo-Apps-Server-Tools.git#16.0,git@github.com:OCA/server-tools.git#16.0"
      ODOO_ADDONS_PATH: /mnt/addons/
      ODOO_DATABASE: "16.0"
      ODOO_INIT_LANG: de_CH
      ODOO_INIT_ADDONS: server_environment_ir_config_parameter
      ENVIRONMENT: production
      PYTHON_INSTALL: prometheus-client
      SERVER_WIDE_MODULES: session_db,module_change_auto_install
      SESSION_DB_URI: postgres://odoo:odoo@db/16.0
      PROXY_MODE: "True"
      LOG_LEVEL: debug
      LIST_DB: False
      ADMIN_PASSWD: *****
      DBFILTER: ^%d$
      WORKERS: 4
      LIMIT_REQUEST: 16384
      LIMIT_TIME_CPU: 300
      LIMIT_TIME_REAL: 600
      MODULE_AUTO_INSTALL_DISABLED: odoo_test_xmlrunner
      CLICK_ODOO_UPDATE: True
    ports:
      - "127.0.0.1:8069:8069"
    volumes:
      - odoo-data:/var/lib/odoo
      - ./addons:/mnt/addons
      - ./oca:/mnt/oca
      - ./enterprise:/mnt/enterprise
      - ./themes:/mnt/themes
  db:
    container_name: db
    image: postgres:14-alpine
    environment:
      POSTGRES_USER: odoo
      POSTGRES_PASSWORD: odoo
      PGDATA: /var/lib/postgresql/data/pgdata
    volumes:
      - db-data:/var/lib/postgresql/data/pgdata
volumes:
  odoo-data:
  db-data:
```

The environment variables are explained in detail further down.

## Lifecycle

The Mint System Odoo image has this container lifecycle in mind:

* **Initialize**: Clone addons and initialize the database.
* **Start**: The container starts and updates the execution environment.
* **Execution**: Actions performed while the container is running.
* **Analyze**: Analyse the current state of the container.

### Initialize

Before starting the container you can initalize the database with selected scripts.

Run the `download-odoo-enterprise` script to download the Odoo Enterprise modules:

```bash
docker compose run --rm odoo download-odoo-enterprise
```

Run the `git-clone-addons` script to clone module repos:

```bash
docker compose run --rm odoo git-clone-addons
```

Run the `init-db` script to initalize the Odoo database:

```bash
docker compose run --rm odoo init-db
```

The scripts are configured with environment variables.

### Start

Once you start the container the `entrypoint.sh` script will:

* Run the `set-addons-path` script to assemble the addons path.
* Run the `auto-envsubst` script to template the `odoo.conf` file.
* Run the `python-install` script to install the Python packages.
* Wait for the database to be ready.
* Run the `setup-mail` script to update the mail configuration in the database.
* Run the `odoo-update` script to update modules.
* Start the Odoo server.

### Execution

Once the container is running, you can update modules with this command: 

```bash
docker exec odoo bash -c "click-odoo-update \$(grep addons_path /etc/odoo/odoo.conf | sed 's/addons_path = /--addons-path=/') -d odoo
```

This will start a detached Odoo process and updates only the modules that have a different checksum.

### Analyze

With the [Manifestoo](https://github.com/acsone/manifestoo) cli you can query the module manifest files.

List all modules:

```bash
docker exec odoo manifestoo --select-found list
```

## Environment Variables

The container can be configured with environment variables. This section shows all the variables in detail:

### Database Connection

Odoo supports the PostgreSQL database only.

* `PGHOST` Name of the database container.
* `PGUSER` Database username.
* `PGPASSWORD` Database user password.
* `PGPORT` Postgres server port. Default is `5432`.

### System Parameters

Define Odoo system parameters. Requires `server_environment_ir_config_parameter` in `ODOO_INIT_ADDONS`.

* `MAIL_CATCHALL_ALIAS`: Name of the catchall mail adress. Default is `catchall`.
* `MAIL_CATCHALL_DOMAIN`: Domain name of of the catchall mail addres
* `MAIL_DEFAULT_FROM`: From name for outgoing mails. Default is `notification`.

### Incoming and Outgoing Mail-Server

Define the mail configuration with these env vars:

* `ODOO_MAIL_SMTP_HOST`: If set Odoo sends mails to this host.
* `ODOO_MAIL_SMTP_PORT`: SMTP port. Default is `587`.
* `ODOO_MAIL_SMTP_ENCRYPTION`: SMTP encryption type. Default is `starttls`.
* `ODOO_MAIL_SMTP_FROM_FILTER`: Send mails from this address only. Default is `""`.
* `ODOO_MAIL_IMAP_HOST`: If set Odoo fetches mails from this host.
* `ODOO_MAIL_IMAP_PORT`: IMAP port. Default is `993`.
* `ODOO_MAIL_IMAP_SSL`: Enable IMAP SSL. Default is `True`.
* `ODOO_MAIL_USERNAME`: Username of the Odoo mailbox.
* `ODOO_MAIL_PASSWORD`: Password of the Odoo mailbox.

### Module Repos

The image can clone git repositories.

* `GIT_SSH_PUBLIC_KEY` Public key for SSH connection.
* `GIT_SSH_PRIVATE_KEY` Base64 encoded private key for SSH connection: `cat ~/.ssh/id_ed2551 | base64 -w0`
* `GITHUB_USERNAME` Username for https git clone and GitHub download.
* `GITHUB_PERSONAL_ACCESS_TOKEN` Access token for https git clone and GitHub download.
* `ADDONS_GIT_REPOS` Comma seperated list of git clone urls appended with `#` and branch name.

You can use https and git urls for `ADDONS_GIT_REPOS`:

```bash
ADDON_GIT_REPO=git@github.com:OCA/server-tools.git#16.0,git@github.com:Mint-System/Odoo-Apps-Server-Tools.gi#16.0
ADDON_GIT_REPO=https://github.com/OCA/server-tools.git#16.0,https://github.com/Mint-System/Odoo-Apps-Server-Tools.gi#16.0
```

If you use a git url make sure a valid SSH private/public key is defined.

### Addons Path

The entrypoint script searches for module folders in the addons path and creates a new addons path.

* `ODOO_ADDONS_PATH` Comma seperated list of container paths pointing to addon folders.

### Initialize

Set these environment variables for the database init:

* `ODOO_DATABASE` Name of the Odoo database. No default is set.
* `ODOO_INIT_LANG` Language used for database init. Default is `en_US`.
* `ODOO_INIT_ADDONS` Provide comma separated list of modules for database init. Default is `web`.

### Server Environment

The Odoo server can be configured using these env vars:

* `ENVIRONMENT` Provide an environment name. Can be accessed with `config.get("environment")`.
* `PYTHON_INSTALL` Comma seperated list of python packages.
* `SERVER_WIDE_MODULES` Comma separated list of modules to load with server. The variable will be prefixed with `base,web`.
* `SESSION_DB_URI` Connection string for storing session data in database.
* `PROXY_MODE` Enable server proxy mode. Default is `False`.
* `LOG_LEVEL` Set the logging level. Default is `info`.

### Database Manager

The Odoo database manager is disabled by default.

* `LIST_DB` Enable the database manager. Default is `False`.
* `ADMIN_PASSWD` Master password for database manager. Default is `odoo`.
* `DB_FILTER` Set filter for database name. Default is `.*`.

### Process Limits

Odoo is executed as a multi-threaded Python process.

* `WORKERS` Define how many workers should be spawned. Default is `0`.
* `LIMIT_REQUEST` Maximum number of requests per worker. Default is `65536`.
* `LIMIT_TIME_CPU` Maximum cpu time per request. Default is `60`.
* `LIMIT_TIME_REAL` Maximum real time per request. Default is `120`.

### Module Auto Install

With `module_change_auto_install` module you can disable the auto installation of specific modules.

* `MODULE_AUTO_INSTALL_DISABLED` Comma separated list of modules that should be auto installed. Requires `module_change_auto_install` in `SERVER_WIDE_MODULES`.

### Module Auto Update

The container uses [click-odoo-contrib](https://github.com/acsone/click-odoo-contrib) to update Odoo modules. The feature is disabled by default.

* `CLICK_ODOO_UPDATE` If enabled click-odoo is used to update modules that have changed. Requires `ODOO_DATABASE` and `ODOO_ADDONS_PATH`. Default is `False`.

## Build

This image can be customized by any extend.

### Install packages

Update the image with Python packages.

```dockerfile
FROM mintsystem/odoo:16.0.20250311

RUN uv pip install prometheus-client astor fastapi python-multipart ujson a2wsgi parse-accept-language pyjwt
```

Or with apt packages.

```dockerfile
FROM mintsystem/odoo:16.0.20250311

RUN apt-get update && apt-get install -y libgl1-mesa-glx poppler-utils tesseract-ocr
```

### Add custom Odoo conf

Copy custom Odoo conf file to the image.

```dockerfile
FROM mintsystem/odoo:16.0.20250311

COPY ./odoo.conf.template /etc/odoo/
```

## Develop

See [Odoo Build > Build and publish container image](https://odoo.build/#build-and-publish-container-image) for details.

### Internal paths

The most important image paths are:

* `/etc/odoo` Contains the `odoo.conf` and `odoo.conf.template` files.
* `/var/lib/odoo/filestore` For every database name Odoo create a filestore.
* `/var/lib/odoo/sessions` Location where werkzeug stores session information.
* `/var/lib/odoo/git` The cloned module repos are stored here.
* `/var/lib/odoo/enterprise` Odoo Enterprise modules are downloaded to this folder.
* `/opt/odoo-venv` This is where Python packages are installed.
* `/mnt/extra-addons` Module folders are loaded from this path by default.

### Capture memory profile

With [memray](https://bloomberg.github.io/memray/) you can visualize the memory usage of Odoo.

Run Odoo with memray.

```bash
docker compose run --rm -p 127.0.0.1:8069:8069 odoo memray
```

Finish the recording with <kbd>ctrl</kbd>+<kbd>c</kbd>.

Generate the flamegraph and copy the flamegraph to the host.

```bash
docker compose run --rm odoo python3 -m memray flamegraph /var/lib/odoo/memray-capture.bin
docker cp odoo:/var/lib/odoo/memray-flamegraph-capture.html ./tmp/
```
