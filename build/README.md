# [Odoo Build](https://odoo.build/)

A better Odoo image.

- Ships with python 3.11
- Odoo source is based on exact git revision
- Setup `odoo.conf` with environment vars
- Clones addons from git repos
- Install pip packages without building the image
- Detects and aggregates nested module folders
- Store session information in database
- Set and get environment name from server config

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
      ENVIRONMENT: production
      GIT_SSH_PUBLIC_KEY: ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDR9Ibi0mATjCyx1EYg594oFkY0rghtgo+pnFHOvAcym Mint-System-Project-MCC@github.com
      GIT_SSH_PRIVATE_KEY: |
        -----BEGIN OPENSSH PRIVATE KEY-----
        b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW
        QyNTUxOQAAACA0fSG4tJgE4wssdRGIOfeKBZGNK4IbYKPqZxRzrwHMpgAAAKi5ZBaFuWQW
        hQAAAAtzc2gtZWQyNTUxOQAAACA0fSG4tJgE4wssdRGIOfeKBZGNK4IbYKPqZxRzrwHMpg
        AAAEBXswXHgmrlsqC9ftU9mA/D+kd3q+3D22PdK5KEEPINnTR9Ibi0mATjCyx1EYg594oF
        kY0rghtgo+pnFHOvAcymAAAAIk1pbnQtU3lzdGVtLVByb2plY3QtTUNDQGdpdGh1Yi5jb2
        0BAgM=
        -----END OPENSSH PRIVATE KEY-----
      ADDONS_GIT_REPOS: "git@github.com:Mint-System/Odoo-Apps-Server-Tools.git#16.0,git@github.com:OCA/server-tools.git#16.0"
      ODOO_ADDONS_PATH: /mnt/addons/,/mnt/oca/,/mnt/enterprise,/mnt/themes/
      SERVER_WIDE_MODULES: web,session_db
      PIP_INSTALL: astor
      SESSION_DB_URI: postgres://odoo:odoo@db/16.0
      LOG_LEVEL: debug
      ADMIN_PASSWD: oqua9AiHeibac2pie9ei
      DBFILTER: ^%d$
      LIST_DB: False
      PROXY_MODE: True
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

## Develop

### Install packages

Extend the image with additional python packages:

```dockerfile
FROM mintsystem/odoo:16.0.20241125

RUN pip install prometheus-client astor fastapi python-multipart ujson a2wsgi parse-accept-language pyjwt
```

### Add custom Odoo conf

Copy a custom Odoo conf file to the image:

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