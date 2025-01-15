# [Mint System Odoo Image](https://odoo.build/image/)

A better Odoo image.

- 🐍 Ships with python 3.11.
- 📦 Uses [uv](https://docs.astral.sh/uv/) to manage python.
- 🔄 Odoo source is based on exact [revision](https://odoo.build/revisions.html).
- 💎 Image build is reproducible.
- ⚙️ Setup `odoo.conf` with environment vars.
- 🌱 Clone addons from git repos.
- 🛠️ Install python packages without building the image.
- 📂 Detect addons in nested module folders.
- 💾 Store session information in database.
- 🖥️ Get environment name from server config.
- 🗄️ Initialize database with selected modules.
- 📜 Built-in [Manifestoo](https://github.com/acsone/manifestoo) and [click-odoo-contrib](https://github.com/acsone/click-odoo-contrib).
- 🌈 Multiplatform image supports `amd64` and `arm64`.

Source: <https://github.com/Mint-System/Odoo-Build/tree/16.0/image/>

## Usage

```yml
services:
  odoo:
    container_name: odoo
    image: mintsystem/odoo:16.0.20250106
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
      ODOO_MAIL_IMAP_SSL: True
      ODOO_MAIL_USERNAME: test@mint-system.ch
      ODOO_MAIL_PASSWORD: *****
      GIT_SSH_PUBLIC_KEY: ssh-ed25519 BBBBC3NzaC1lZDI1NTE5BBBBIDR9Ibi0mATjCyx1EYg594oFkY0rghtgo+pnFHOvAcym Mint-System-Project-MCC@github.com
      GIT_SSH_PRIVATE_KEY: |
        -----BEGIN OPENSSH PRIVATE KEY-----
        b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW
        QyNTUxOQAAACA0fSG4tJgE4wssdRGIOfeKBZGNK4IbYKPqZxRzrwHMpgAAAKi5ZBaFuWQW
        hQAAAAtzc2gtZWQyNTUxOQAAACA0fSG4tJgE4wssdRGIOfeKBZGNK4IbYKPqZxRzrwHMpg
        0BAgM=
        -----END OPENSSH PRIVATE KEY-----
      ADDONS_GIT_REPOS: "git@github.com:Mint-System/Odoo-Apps-Server-Tools.git#16.0,git@github.com:OCA/server-tools.git#16.0"
      ODOO_ADDONS_PATH: /mnt/addons/,/mnt/oca/,/mnt/enterprise,/mnt/themes/
      ODOO_DATABASE: 16.0
      ODOO_INIT: True
      ODOO_INIT_LANG: de_CH
      ODOO_INIT_ADDONS: server_environment_ir_config_parameter
      ENVIRONMENT: production
      PYTHON_INSTALL: prometheus-client
      SERVER_WIDE_MODULES: session_db,module_change_auto_install
      SESSION_DB_URI: postgres://odoo:odoo@db/16.0
      PROXY_MODE: True
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

### Database Connection

Odoo supports PostgreSQL database only.

* `PGHOST` Name of the database container.
* `PGUSER` Database username.
* `PGPASSWORD` Database user password.
* `PGPORT` Postgres server port. Default is `5432`.

### System Parameters

Define Odoo system parameters. Requires `server_environment_ir_config_parameter` to be in `ODOO_INIT_ADDONS`.

* `MAIL_CATCHALL_ALIAS`: Name of the catchall mail adress. Default is `catchall`.
* `MAIL_CATCHALL_DOMAIN`: Domain name of of the catchall mail addres
* `MAIL_DEFAULT_FROM`: From name for outgoing mails. Default is `notification`.

### Incoming and Outgoing Mail-Server

Load mail server configuration from environment vars.

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

The entrypoint script can clone git repositories.

* `GIT_SSH_PUBLIC_KEY` Public key for SSH connection.
* `GIT_SSH_PRIVATE_KEY` Private key for SSH connection.
* `ADDONS_GIT_REPOS` Comma seperated list of git clone urls appended with `#` and branch name.

### Addons Path

The entrypoint script searches for module folders in the addons path and creates a new addons path.

* `ODOO_ADDONS_PATH` Comma seperated list of container paths pointing to addon folders.

### Initialize

If enabled the entrypoint script initializes the Odoo database.

* `ODOO_DATABASE` Name of the Odoo database. No default is set.
* `ODOO_INIT` Enable to initalise the database. Default is `False`.
* `ODOO_INIT_LANG` Language used for database initialisation. Default is `en_US`.
* `ODOO_INIT_ADDONS` Provide comma separated list of modules for database initialisation. Default is `web`.

### Server Environment

The Odoo server can be configured using the following env vars.

* `ENVIRONMENT` Provide an environment name. Can be accessed with `config.get("environment")`.
* `PYTHON_INSTALL` Comma seperated list of python packages.
* `SERVER_WIDE_MODULES` Comma separated list of modules to load with server.
* `SESSION_DB_URI` Connection string for storing session data in database.
* `PROXY_MODE` Enable server proxy mode. Default is `False`.
* `LOG_LEVEL` Set the logging level. Default is `info`.

### Database Manager

The Odoo database manager is disabled by default.

* `LIST_DB` Enable the database manager. Default is `False`.
* `ADMIN_PASSWD` Master password for database manager. Default is `odoo`.
* `DB_FILTER` Set filter for database name. Default is `.*`.

### Process Limits

Odoo is a multi-threaded Python process.

* `WORKERS` Define how many workers should be spawned. Default is `0`.
* `LIMIT_REQUEST` Maximum number of requests per worker. Default is `65536`.
* `LIMIT_TIME_CPU` Maximum cpu time per request. Default is `60`.
* `LIMIT_TIME_REAL` Maximum real time per request. Default is `120`.

### Container Paths

Here are the most important container paths.

* `/etc/odoo` Contains the `odoo.conf` and `odoo.conf.template` files.
* `/var/lib/odoo/filestore` For every database name Odoo create a filestore.
* `/var/lib/odoo/git` The cloned module repos are stored here.
* `/opt/odoo-venv` This is where Python packages are installed.
* `/mnt/extra-addons` Module folders are loaded from this path by default.

### Disable Auto Install

With `module_change_auto_install` module you can disable the auto installation of specific modules.

* `MODULE_AUTO_INSTALL_DISABLED` Comma separated list of modules that should be auto installed. Requires `module_change_auto_install` in `SERVER_WIDE_MODULES`.

### Mainfestoo

With the [Manifestoo](https://github.com/acsone/manifestoo) cli you can query the module manifest files.

List all modules:

```bash
docker exec odoo manifestoo --select-found list
```

### click-odoo

With [click-odoo](https://github.com/acsone/click-odoo) you can manage the Odoo database.

* `CLICK_ODOO_UPDATE` If enabled click-odoo is used to update modules that have changed. Requires `ODOO_DATABASE` and `ODOO_ADDONS_PATH`. Default is `False`.

Update all modules manually:

```bash
docker exec odoo bash -c "click-odoo-update \$(grep addons_path /etc/odoo/odoo.conf | sed 's/addons_path = /--addons-path=/') -d odoo
```

## Build

This image can be customized and extended as needed.

### Install packages

Extend the image with Python packages.

```dockerfile
FROM mintsystem/odoo:16.0.20250106

RUN uv pip install prometheus-client astor fastapi python-multipart ujson a2wsgi parse-accept-language pyjwt
```

Or with apt packages.

```dockerfile
FROM mintsystem/odoo:16.0.20250106

USER root
RUN apt-get update && apt-get install -y libgl1-mesa-glx poppler-utils tesseract-ocr
USER odoo
```

### Add custom Odoo conf

Copy a custom Odoo conf file to the image.

```dockerfile
FROM mintsystem/odoo:16.0.20250106

COPY ./odoo.conf.template /etc/odoo/
```

## Develop

See [Odoo Build > Build and publish Odoo image](https://odoo.build/#build-and-publish-odoo-image) for details.

## Troubleshooting

### Session folder not writable

**Problem**

When starting the container the following error shows up:

```
/var/lib/odoo/sessions: directory is not writable
```

**Cause**

The Odoo user/group have a different uid/gid.

**Solution**

```bash
docker exec -u root -it $CONTAINER bash
chown -R odoo:odoo /var/lib/odoo
```