# [Odoo Build](https://odoo.build/)

A better Odoo image.

- Ships with python 3.11
- Odoo source is based on exact git revision
- Setup `odoo.conf` with environment vars
- Clone addons from git repos
- Install pip packages without building the image
- Detects addons in nested module folders
- Store session information in database
- Get environment name from server config
- Initialize database with selected modules
- Auto update modules that have changed

Source: <https://github.com/Mint-System/Odoo-Build/tree/16.0/build>

## Usage

```yml
version: "3"
services:
  odoo:
    container_name: odoo
    image: mintsystem/odoo:16.0.20241125
    depends_on:
      - db
    environment:
      HOST: db
      USER: odoo
      PASSWORD: odoo
      PORT: 5432
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
      ODOO_ADDONS_AUTO_UPDATE: True
      ENVIRONMENT: production
      PIP_INSTALL: postgres-client,manifestoo
      SERVER_WIDE_MODULES: web,session_db
      SESSION_DB_URI: postgres://odoo:odoo@db/16.0
      PROXY_MODE: True
      LOG_LEVEL: debug
      LIST_DB: False
      ADMIN_PASSWD: oqua9AiHeibac2pie9ei
      DBFILTER: ^%d$
      WORKERS: 4
      LIMIT_REQUEST: 16384
      LIMIT_TIME_CPU: 300
      LIMIT_TIME_REAL: 600
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

* `HOST` Name of the database container.
* `USER` Database username.
* `PASSWORD` Database user password.
* `PORT` Postgres server port. Default is `5432`.

### Module Repos

The entrypoint script can clone git repositories.

* `GIT_SSH_PUBLIC_KEY` Public key for SSH connection.
* `GIT_SSH_PRIVATE_KEY` Private key for SSH connection.
* `ADDONS_GIT_REPOS` Comma seperated list of git clone urls appended with `#` and branch name.

### Addons

The entrypoint script searches for module folders in the addons paths and creates a new addons path.

* `ODOO_ADDONS_PATH` Comma seperated list of container paths to the addons folders.
* `ODOO_DATABASE` Name of the Odoo database. Default is `odoo`.
* `ODOO_INIT` Enable to initalise the database. Default is `False`.
* `ODOO_INIT_LANG` Language used for database initialisation. Default is `en_US`.
* `ODOO_INIT_ADDONS` Provide comma separated list of modules for database initialisation. Default is `web`.
* `ODOO_ADDONS_AUTO_UPDATE` Detect file changes in module folders and update modules that changed. Default is `False`.

The default login is `admin:admin`.

### Server Environment

The Odoo server can be configured using the following env vars.

* `ENVIRONMENT` Provide an environment name. Can be accessed with `config.get("environment")`.
* `PIP_INSTALL` Comma seperated list of python packages.
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

Odoo is a multi-thread Python process.

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

## Develop

As with every Docker image this image can be updated.

### Install packages

Extend the image with additional Python packages.

```dockerfile
FROM mintsystem/odoo:16.0.20241125

RUN pip install prometheus-client astor fastapi python-multipart ujson a2wsgi parse-accept-language pyjwt
```

### Add custom Odoo conf

Copy a custom Odoo conf file to the image.

```dockerfile
FROM mintsystem/odoo:16.0.20241125

COPY ./odoo.conf.template /etc/odoo/
```

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