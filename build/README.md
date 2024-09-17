# [Odoo Build](https://odoo.build/)

A better Odoo image.

- Substitutes environment vars in `odoo.conf.template`
- Detects and aggregates nested module folders 
- The Odoo source is set to the latest commit of date in tag
- Ships with python 3.11
- Define Odoo configs with env vars
- Set and get environment name from server config

## Usage

Use `ODOO_ADDONS_PATH` to pass paths with nested module folders.

```yml
version: "3"
services:
  odoo:
    container_name: odoo
    image: mintsystem/odoo:17.0.20240730
    depends_on:
      - db
    environment:
      HOST: db
      USER: odoo
      PASSWORD: odoo
      PORT: 5432
      ODOO_ADDONS_PATH: /mnt/addons/,/mnt/oca/,/mnt/enterprise,/mnt/themes/
      LOG_LEVEL: debug
      ADMIN_PASSWD: oqua9AiHeibac2pie9ei
      DBFILTER: ^%d$
      ENVIRONMENT: production
      LIST_DB: False
      PROXY_MODE: True
    ports:
      - "127.0.0.1:8069:8069"
    volumes:
      - odoo-data:/var/lib/odoo
      - ./addons:/mnt/addons
      - ./oca:/mnt/oca
      - ./enterprise:/mnt/enterprise
      - ./themes:/mnt/themes
```

## Develop

### Install packages

Extend the image with additional python packages:

```dockerfile
FROM mintsystem/odoo:16.0.2024.0405

USER root

RUN python -m pip install prometheus-client astor fastapi python-multipart ujson a2wsgi parse-accept-language pyjwt

USER odoo
```

### Add custom Odoo conf

Copy a custom Odoo conf file to the image:

```dockerfile
FROM mintsystem/odoo:16.0.2024.0405

USER root

COPY ./odoo.conf.template /etc/odoo/

USER odoo
```
