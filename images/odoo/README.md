[Mint System Odoo](https://odoo.build/images/odoo/)
===

[![Docker pulls](https://img.shields.io/docker/pulls/mintsystem/odoo)](https://hub.docker.com/r/mintsystem/odoo/)

A better Odoo image.

This container image is an improvement of the official Odoo image:

- 📦 Package management is handled with [uv](https://docs.astral.sh/uv/) for Python and [pnpm](https://pnpm.io/) for Node.
- 🔄 The Odoo source is based on a specific [revision](https://odoo.build/revisions.html).
- 💎 The image build process ensures reproducibility.
- ⚙️ Configuration of `odoo.conf` is managed through environment variables.
- 🌱 Addons are cloned from git repositories.
- 🛠️ Python packages are installed at runtime.
- 📂 The system detects addons in nested module folders.
- 💾 Session information can be stored in the database.
- 🖥️ Environment name is retrieved from server configuration.
- 📋 Database initialization with selected modules.
- 📜 The image includes built-in [manifestoo](https://github.com/acsone/manifestoo) and [click-odoo-contrib](https://github.com/acsone/click-odoo-contrib).
- 🪴 The container runs without requiring root privileges.
- ✂️ Reduced image size through multi-stage build and file cleanup.
- 👀 Use the image to run module tests and create code coverage reports.
- 🏥 Image has a built-in health check.
- 🌐 Built-in nginx reverse proxy. 

Source: <https://github.com/Mint-System/Odoo-Build/tree/main/images/odoo/>

Changelog: <https://odoo.build/images/odoo/CHANGELOG.html>

## Usage

The Mint System Odoo image runs with a very basic configuration, but can also be highly customized with environment variables.

Supported tags:

- [`19.0.20260119`](https://hub.docker.com/layers/mintsystem/odoo/19.0.20260119), [`19.0`](https://hub.docker.com/layers/mintsystem/odoo/19.0)
- [`18.0.20260119`](https://hub.docker.com/layers/mintsystem/odoo/18.0.20260119), [`18.0`](https://hub.docker.com/layers/mintsystem/odoo/18.0)
- [`17.0.20260119`](https://hub.docker.com/layers/mintsystem/odoo/17.0.20260119), [`17.0`](https://hub.docker.com/layers/mintsystem/odoo/17.0)
- [`16.0.20260119`](https://hub.docker.com/layers/mintsystem/odoo/16.0.20260119), [`16.0`](https://hub.docker.com/layers/mintsystem/odoo/16.0)
- [`15.0.20260119`](https://hub.docker.com/layers/mintsystem/odoo/15.0.20260119), [`15.0`](https://hub.docker.com/layers/mintsystem/odoo/15.0)

### Minimal

The following `compose.yml` is a minimal setup:

```yml
services:
  odoo:
    container_name: odoo
    image: mintsystem/odoo:18.0
    depends_on:
      - db
    environment:
      PGHOST: db
      PGUSER: odoo
      PGPASSWORD: odoo
    ports:
      - "127.0.0.1:8069:8069"
    volumes:
      - odoo-data:/var/lib/odoo
  db:
    container_name: db
    image: postgres:16-alpine
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
    image: mintsystem/odoo:18.0
    depends_on:
        db:
            condition: service_healthy
    environment:
      PGHOST: db
      PGUSER: odoo
      PGPASSWORD: odoo
      PGPORT: 5432
      DB_NAME: odoo
      DB_MAXCONN: 128
      PGSSLMODE: verify-ca
      PGSSLROOTCERT: /mnt/postgres-secret/ca.crt
      SMTP_SERVER: mail.infomaniak.com
      SMTP_PORT: 587
      SMTP_SSL: True
      SMTP_USER: odoo@yourcompany.com
      SMTP_PASSWORD: *****
      EMAIL_FROM: odoo@yourcompany.com
      MAIL_BOUNCE_ALIAS: bounce
      MAIL_CATCHALL_ALIAS: reply
      MAIL_CATCHALL_DOMAIN: yourcompany.com
      MAIL_DEFAULT_FROM: odoo
      MAIL_ALIAS_DOMAIN: yourcompany.com
      ODOO_MAIL_SMTP_HOST: mail.infomaniak.com
      ODOO_MAIL_SMTP_PORT: 587
      ODOO_MAIL_SMTP_ENCRYPTION: starttls
      ODOO_MAIL_SMTP_FROM_FILTER: odoo@yourcompany.com
      ODOO_MAIL_IMAP_HOST: mail.infomaniak.com
      ODOO_MAIL_IMAP_PORT: 993
      ODOO_MAIL_IMAP_SSL: True
      ODOO_MAIL_USERNAME: odoo@yourcompany.com
      ODOO_MAIL_PASSWORD: *****
      GIT_AUTHOR_NAME: "Your Name"
      GIT_AUTHOR_EMAIL: you@example.com
      GIT_SSH_PUBLIC_KEY: "ssh-ed25519 BBBBC3NzaC1lZDI1NTE5BBBBIDR9Ibi0mATjCyx1EYg594oFkY0rghtgo+pnFHOvAcym Mint-System-Project-MCC@github.com"
      GIT_SSH_PRIVATE_KEY: "LS0tLS1CRUdJTiBPUEVOU1NIIFBSSVZBVEUgS0VZLS0tLQpiM0JsYm5OemFDMXJaWGt0ZGpFQUFBQUFCRzV2Ym1VQUFBQUVibTl1WlFBQUFBQUFBQUFCQUFBQU13QUFBQXR6YzJndFpXClF5TlRVeE9RQUFBQ0EwZlNHNHRKZ0U0d3NzZFJHSU9mZUtCWkdOSzRJYllLUHFaeFJ6cndITXBnQUFBS2k1WkJhRnVXUVcKaFFBQUFBdHpjMmd0WldReU5UVXhPUUFBQUNBMGZTRzR0SmdFNHdzc2RSR0lPZmVLQlpTks0SWJZS1BxWnhSenJ3SE1wZwowQkFnTT0KLS0tLS1FTkQgT1BFTlNTSCBQUklWQVRFIEtFWS0tLS0tCg=="
      SSH_ID_ALGORITHM: id_ed25519
      GITHUB_USERNAME: bot-mintsys
      GITHUB_PAT: *****
      GITLAB_URL: https://gitlab.com
      GITLAB_USERNAME: bot-mintsys
      GITLAB_PAT: *****
      FORGEJO_URL: https://codeberg.org
      FORGEJO_USERNAME: bot-mintsys
      FORGEJO_PAT: *****
      ADDONS_GIT_REPOS: |
        git@github.com:Mint-System/Odoo-Apps-Server-Tools#18.0
        git@github.com:OCA/server-tools#18.0
      ODOO_ADDONS_PATH: /mnt/addons/,/mnt/enterprise/,/mnt/oca/,/mnt/themes/
      ODOO_ENTERPRISE_PATH: /mnt/enterprise
      ODOO_INIT_LOGIN: odoo
      ODOO_INIT_PASSWORD: *****
      ODOO_INIT_LANG: de_CH
      ODOO_INIT_ADDONS: server_environment_ir_config_parameter
      RUNNING_ENV: production
      WITHOUT_DEMO: False
      PYTHON_INSTALL: |
        prometheus-client
        pyjwt
      SERVER_WIDE_MODULES: session_db,module_change_auto_install
      SESSION_DB_URI: postgres://odoo:odoo@db/18.0
      PROXY_MODE: False
      LOG_LEVEL: debug
      MAX_CRON_THREADS: 4
      LIST_DB: True
      LOG_DB: True
      LOG_HANDLER: ':INFO'
      LOGFILE: None
      ADMIN_PASSWD: *****
      DB_FILTER: ^%d$
      WORKERS: 4
      LIMIT_REQUEST: 16384
      LIMIT_TIME_CPU: 300
      LIMIT_TIME_REAL: 600
      LIMIT_MEMORY_HARD: 2684354560
      LIMIT_MEMORY_SOFT: 2147483648
      LIMIT_MEMORY_HARD_GEVENT: 1048579
      LIMIT_MEMORY_SOFT_GEVENT: 1048576
      MODULE_AUTO_INSTALL_DISABLED: odoo_test_xmlrunner
      TEST_ADDONS_DIR: /mnt/oca/partner-contact
      TEST_INCLUDE: partner_firstname
      TEST_EXCLUDE: partner_fax
      AUTO_UPDATE_TRANSLATIONS: True
      AUTO_UPDATE_MODULES_LIST: True
      ADDITIONAL_ODOO_RC: "syslog = True"
      IR_CONFIG_PARAMETER: "web.base.url = https://odoo.example.com"
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
    image: postgres:16-alpine
    environment:
      POSTGRES_USER: odoo
      POSTGRES_PASSWORD: odoo
      PGDATA: /var/lib/postgresql/data/pgdata
    volumes:
      - db-data:/var/lib/postgresql/data/pgdata
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U odoo -d $DB_NAME"]
      interval: 5s
      timeout: 5s
      retries: 5
volumes:
  odoo-data:
  db-data:
```

The environment variables are explained in detail further down.

## Lifecycle

The Mint System Odoo image has this container lifecycle in mind:

- **Initialize**: Clone addons and initialize the database.
- **Start**: The container starts and updates the execution environment.
- **Execute**: Actions performed while the container is running.
- **Analyze**: Analyse the current state of the container.
- **Test**: Test modules in the container.

### Initialize

Before starting the container you can initalize the database with selected scripts.

Run the `download-git-archive` script to download the Odoo Enterprise modules:

```bash
docker compose exec odoo download-git-archive
```

Run the `clone-git-addons` or `aggregate-git-repos` script to clone module repos:

```bash
docker compose exec odoo clone-git-addons
docker compose exec odoo aggregate-git-repos
```

Run the `init-db` script to initalize the Odoo database:

```bash
docker compose exec odoo init-db
```

The scripts are configured with environment variables.

### Start

Once you start the container the `entrypoint.sh` script will:

- Run the `template-odoo-rc` script to template the `odoo.conf` file.
- While doing so assemble the addons path with `set-addons-path`.
- Run the `install-python-packages` script to install the Python packages.
- Wait for the database to be ready.
- Run the `update-modules-list` script if enabled.
- Run the `update-translations` script if enabled.
- Start the Odoo server.

### Execute

Once the container is running, install modules with:

```bash
docker compose exec odoo init-module partner_firstname
```

Or update specific modules with this command:

```bash
docker compose exec odoo update-module partner_firstname
```

There is also the option to update all modules:

```bash
docker compose exec odoo update-modules
```

The container use [click-odoo-contrib](https://github.com/acsone/click-odoo-contrib) to update Odoo modules. For each installed module a checksum is computed and stored in the database. Whenever an update of module is triggered, the checksum is computed and compared. Only modules with a different checksum are updated.

### Analyze

With the [manifestoo](https://github.com/acsone/manifestoo) cli you can query the module manifest files.

List all modules:

```bash
docker exec odoo bash -c "manifestoo --select-found list --separator=,"
```

### Test

The `run-tests` script runs module tests and produces a `coverage.xml` file.

But first the server environment must be prepared to run tests.

```bash
docker exec odoo setup-tests
```

Once this command is finished, run the module tests.

```bash
docker exec odoo run-tests
```

## Environment Variables

The container can be configured with environment variables. This section shows all the variables in detail:

### Database Connection

Odoo supports the PostgreSQL database only.

- `PGHOST` Name of the database container.
- `PGUSER` Database username.
- `PGPASSWORD` Database user password.
- `PGPORT` Postgres server port. Default is `5432`.
- `DB_NAME` Fixed database name. Default is `""`.
- `DB_MAXCONN`: Maximum database connection. default is `64`.
- `PGSSLMODE`: SSL mode for postgres connection. Default is `prefer`.
- `PGSSLROOTCERT`: Path too ssl root cert. Required when using `verify-ca` mode.

### SMTP Server

This is the mail configuration of the Odoo server.

- `SMTP_SERVER` Adress of the SMTP server.
- `SMTP_PORT` Port of the SMTP server.
- `SMTP_SSL` Use ssl encryption. Default is `False`.
- `SMTP_USER` SMTP username.
- `SMTP_PASSWORD` SMTP user password.
- `EMAIL_FROM` Mail adress of the sender.

### System Parameters

Set mail parameters for the company.

- `MAIL_BOUNCE_ALIAS`: Name of the bounce mail adress.
- `MAIL_CATCHALL_ALIAS`: Name of the reply-to mail adress.
- `MAIL_CATCHALL_DOMAIN`: Domain name of the reply-to mail address.
- `MAIL_DEFAULT_FROM`: From address for outgoing mails.
- `MAIL_ALIAS_DOMAIN`: Mail domain of the company.

### Incoming and Outgoing Mail-Server

Setup mail configuration for the default database.

- `ODOO_MAIL_SMTP_HOST`: If set Odoo sends mails to this host.
- `ODOO_MAIL_SMTP_PORT`: SMTP port. Default is `587`.
- `ODOO_MAIL_SMTP_ENCRYPTION`: SMTP encryption type. Default is `starttls`.
- `ODOO_MAIL_SMTP_FROM_FILTER`: Send mails from this address only. Default is `""`.
- `ODOO_MAIL_IMAP_HOST`: If set Odoo fetches mails from this host.
- `ODOO_MAIL_IMAP_PORT`: IMAP port. Default is `993`.
- `ODOO_MAIL_IMAP_SSL`: Enable IMAP SSL. Default is `True`.
- `ODOO_MAIL_USERNAME`: Username of the Odoo mailbox.
- `ODOO_MAIL_PASSWORD`: Password of the Odoo mailbox.

The configuration will be applied to the `DB_NAME` database.

### Module Repos

The image can clone git repositories.

- `GIT_AUTHOR_NAME`: Set user name global git config.
- `GIT_AUTHOR_EMAIL`: Set user email global git config.
- `GIT_SSH_PUBLIC_KEY`: Public key for SSH connection.
- `GIT_SSH_PRIVATE_KEY`: Base64 encoded private key for SSH connection: `cat ~/.ssh/id_ed2551 | base64 -w0`
- `SSH_ID_ALGORITHM`: Filename and algorithm of the SSH key file. Default is `id_ed25519`
- `GITHUB_USERNAME` GitHub username for https git clone and archive download.
- `GITHUB_PAT`: GitHub access token for https git clone and archive download.
- `GITLAB_URL`: Url of GitLab instance. Default is `https://gitlab.com`.
- `GITLAB_USERNAME`: GitLab Username for https git clone.
- `GITLAB_PAT`: GitLab access token for https git clone and archive download.
- `FORGEJO_URL`: Url of Forgejo instance. Default is `https://codeberg.org`.
- `FORGEJO_USERNAME`: Forgejo Username for https git clone.
- `FORGEJO_PAT`: Forgejo access token for https git clone and archive download.
- `ADDONS_GIT_REPOS` Comma or line-break seperated list of git clone urls appended with `#` and branch name.

You can use https and git urls for `ADDONS_GIT_REPOS`:

```bash
ADDONS_GIT_REPOS=git@github.com:OCA/server-tools#18.0,git@github.com:Mint-System/Odoo-Apps-Server-Tools
ADDONS_GIT_REPOS=https://github.com/OCA/server-tools#18.0,https://github.com/Mint-System/Odoo-Apps-Server-Tools
```

If you use a git url, make sure a valid SSH private/public key is defined. Branch name fallback is the Odoo version.

### Addons Path

The entrypoint script searches for module folders in the addons path and creates a new addons path.

- `ODOO_ADDONS_PATH` Comma seperated list of container paths pointing to addon folders. Default is:
  - `/mnt/extra-addons` Default location for custom modules.
  - `/var/lib/odoo/enterprise` Reserved location for Odoo enterprise modules.
  - `/var/lib/odoo/git` Reserved location for git repos.
  - `TEST_ADDONS_DIR` Variable location for module testing.
  - `/opt/odoo/addons` Reserved location for Odoo community modules.
- `ODOO_ENTERPRISE_PATH` Odoo Enterprise is cloned to this folder. Default is `/var/lib/odoo/enterprise`.

### Initialize

Set these environment variables for the database init:

- `ODOO_INIT_LOGIN` Username of the admin user. Default is `admin`.
- `ODOO_INIT_PASSWORD` Password of the admin user. Default is `admin`.
- `ODOO_INIT_LANG` Language used for database init. Default is `en_US`.
- `ODOO_INIT_ADDONS` Provide comma separated list of modules for database init. Default is `web`.
- `WITHOUT_DEMO` If enabled Odoo inits the database with demo data. Default is `True`.

### Server Environment

The Odoo server can be configured using these env vars:

- `RUNNING_ENV` Provide an environment name. Can be accessed with `config.get("environment")`.
- `PYTHON_INSTALL` Comma or line-break seperated list of python packages.
- `SERVER_WIDE_MODULES` Comma separated list of modules to load with server. The variable will be prefixed with `base,web`.
- `SESSION_DB_URI` Connection string for storing session data in database.
- `PROXY_MODE` Enable server proxy mode. Default is `True`.
- `LOG_LEVEL` Set the logging level. Default is `info`.
- `LOG_DB` When enabled the database log is shown in the Odoo log. Default is `False`.
- `LOG_HANDLER` Define the log handler. Default is `[':INFO']`.
- `LOGFILE` Set the logging level. Default is `None`.

### Database Manager

The Odoo database manager is disabled by default.

- `LIST_DB` Enable the database manager. Default is `False`.
- `ADMIN_PASSWD` Master password for database manager. Default is `odoo`.
- `DB_FILTER` Set filter for database name. Default is `.*`.

### Process Limits

Odoo is executed as a multi-threaded Python process.

- `MAX_CRON_THREADS` Maximum count of cron threads. Default is `2`.
- `WORKERS` Define how many workers should be spawned. Default is `0`.
- `LIMIT_REQUEST` Maximum number of requests per worker. Default is `65536`.
- `LIMIT_TIME_CPU` Maximum cpu time per request. Default is `60`.
- `LIMIT_TIME_REAL` Maximum real time per request. Default is `120`.
- `LIMIT_MEMORY_HARD` Hard memory limit for the Odoo process. Default is `2560 * 1024 * 1024`.
- `LIMIT_MEMORY_SOFT` Soft memory limit for the Odoo process. Default is `2048 * 1024 * 1024`.
- `LIMIT_MEMORY_HARD_GEVENT` Set hard memory limit for the gevent process. Default is `False`.
- `LIMIT_MEMORY_SOFT_GEVENT` Set soft memory limit for the gevent process. Default is `False`.

To calculate the amount of workers multply the amount of cpu cores by 2. To get the cpu core count run `nproc`.

### Module Auto Install

With the `module_change_auto_install` module you can disable the auto installation of specific modules.

- `MODULE_AUTO_INSTALL_DISABLED` Comma separated list of modules that should be auto installed. Requires `module_change_auto_install` in `SERVER_WIDE_MODULES`.

### Module Auto Update

Updating translations and the module list can be automated.

- `AUTO_UPDATE_TRANSLATIONS` If enabled, translatiosn will be updated when the container starts. Default is `False`.
- `AUTO_UPDATE_MODULES_LIST` If enabled, the modules list will be updated when the container starts. Default is `False`.

### Testing

With this image you can also run module tests.

- `TEST_ADDONS_DIR`: Provide the directory with the modules that should be tests.
- `TEST_INCLUDE` Comma separated list of modules that should be test exlusively.
- `TEST_EXCLUDE`: Comma separated list of modules that should not be tested.

### Additional Config

If you have additional config for Odoo use the vars:

- `ADDITIONAL_ODOO_RC`: Added to the options section of the odoo.conf.
- `IR_CONFIG_PARAMETER`: Added to the `ir.config_parameter` section of the odoo.conf.

### Naming

This image tries to stay compatible with other images such as <https://github.com/acsone/odoo-bedrock> or <https://github.com/Tecnativa/doodba>.

Compatibility with other images is mainly achieved by using the same environments variables and offering the same functionality.

## Files

### pyproject.toml

When mounting your `pyproject.toml` to `/var/lib/odoo/pyproject.toml` the `sync-python-project` script will run `uv sync --active` in the directory.

### repos.yml

The image includes [git-aggregator](https://github.com/acsone/git-aggregator). It allows to clone and merge addon repos from different origins and branches.

When mounting the `repos.yml` to `/var/lib/odoo/git/repos.yml` the `aggregate-git-repos` script will run the `gitaggregate` command in the directory.

### nginx.conf

The image includes the [nginx web server](https://nginx.org/). If the container is started with `odoo-nginx` in addition to the Odoo process a nginx reverese proxy is started. The nginx config file is loaded from `/etc/nginx/nginx.conf` and the process is listening on port `8080`.

Make sure to set `WORKERS` to `1` or more, otherwise the real-time connection of Odoo will not work. Having one or more workers will start the gevent listener on port `8072`.

## Build

This image can be customized by any extend.

### Install packages

Update the image with Python packages:

```dockerfile
FROM mintsystem/odoo:18.0

RUN uv pip install prometheus-client astor fastapi python-multipart ujson a2wsgi parse-accept-language pyjwt
```

Or with apt packages:

```dockerfile
FROM mintsystem/odoo:18.0

RUN apt-get update && apt-get install -y libgl1-mesa-glx poppler-utils tesseract-ocr
```

## Develop

See [Odoo Build > Build and publish container image](https://odoo.build/#build-and-publish-container-image) for details.

### Internal paths

The most important image paths are:

- `/etc/odoo` Contains the `odoo.conf` and `odoo.conf.template` files.
- `/mnt/extra-addons` Nested module are loaded from this path by default.
- `/mnt/test-addons` Recommended mount path for modules to test.
- `/opt/odoo/addons` Contains the Odoo community edition modules.
- `/opt/odoo-venv` This is where Python packages are installed.
- `/var/lib/odoo` Odoo data folder.
- `/var/lib/odoo/enterprise` Odoo enterprise modules are downloaded to this folder.
- `/var/lib/odoo/filestore` For every database name Odoo creates a filestore.
- `/var/lib/odoo/git` The cloned module repos are stored here.
- `/var/lib/odoo/sessions` Location where werkzeug stores session information.

### Capture memory profile

With [memray](https://bloomberg.github.io/memray/) you can visualize the memory usage of Odoo.

Run Odoo with memray.

```bash
docker compose exec -p 127.0.0.1:8069:8069 odoo memray
```

Finish the recording with <kbd>ctrl</kbd>+<kbd>c</kbd>.

Generate the flamegraph and copy the flamegraph to the host.

```bash
docker compose exec odoo python3 -m memray flamegraph /var/lib/odoo/memray-capture.bin
docker cp odoo:/var/lib/odoo/memray-flamegraph-capture.html ./tmp/
```

### Scripts

Under the hood the image uses several scripts to manage Odoo. Make yourself familiar with these scripts:

- [`add-ssh-key`](https://github.com/Mint-System/Odoo-Build/blob/main/images/odoo/bin/add-ssh-key)
- [`aggregate-git-repos`](https://github.com/Mint-System/Odoo-Build/blob/main/images/odoo/bin/aggregate-git-repos)
- [`check-database-initialized`](https://github.com/Mint-System/Odoo-Build/blob/main/images/odoo/bin/check-database-initialized)
- [`clone-git-addons`](https://github.com/Mint-System/Odoo-Build/blob/main/images/odoo/bin/clone-git-addons)
- [`download-git-archive`](https://github.com/Mint-System/Odoo-Build/blob/main/images/odoo/bin/download-git-archive)
- [`init-db`](https://github.com/Mint-System/Odoo-Build/blob/main/images/odoo/bin/init-db)
- [`init-module`](https://github.com/Mint-System/Odoo-Build/blob/main/images/odoo/bin/init-module)
- [`install-python-packages`](https://github.com/Mint-System/Odoo-Build/blob/main/images/odoo/bin/install-python-packages)
- [`list-database`](https://github.com/Mint-System/Odoo-Build/blob/main/images/odoo/bin/list-database)
- [`log-entrypoint`](https://github.com/Mint-System/Odoo-Build/blob/main/images/odoo/bin/log-entrypoint)
- [`parse-url`](https://github.com/Mint-System/Odoo-Build/blob/main/images/odoo/bin/parse-url)
- [`remove-ssh-key`](https://github.com/Mint-System/Odoo-Build/blob/main/images/odoo/bin/remove-ssh-key)
- [`run-tests`](https://github.com/Mint-System/Odoo-Build/blob/main/images/odoo/bin/run-tests)
- [`set-addons-path`](https://github.com/Mint-System/Odoo-Build/blob/main/images/odoo/bin/set-addons-path)
- [`setup-mail`](https://github.com/Mint-System/Odoo-Build/blob/main/images/odoo/bin/setup-mail)
- [`setup-tests`](https://github.com/Mint-System/Odoo-Build/blob/main/images/odoo/bin/setup-tests)
- [`sync-python-project`](https://github.com/Mint-System/Odoo-Build/blob/main/images/odoo/bin/sync-python-project)
- [`template-odoo-rc`](https://github.com/Mint-System/Odoo-Build/blob/main/images/odoo/bin/template-odoo-rc)
- [`update-module`](https://github.com/Mint-System/Odoo-Build/blob/main/images/odoo/bin/update-module)
- [`update-modules`](https://github.com/Mint-System/Odoo-Build/blob/main/images/odoo/bin/update-modules)
- [`update-modules-list`](https://github.com/Mint-System/Odoo-Build/blob/main/images/odoo/bin/update-modules-list)
- [`update-translations`](https://github.com/Mint-System/Odoo-Build/blob/main/images/odoo/bin/update-translations)
- [`wait-for-pg`](https://github.com/Mint-System/Odoo-Build/blob/main/images/odoo/bin/wait-for-pg)
