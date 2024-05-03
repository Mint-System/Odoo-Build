# Odoo Build

An improved Odoo image.

- Substitutes environment vars in `odoo.conf.template`
- The Odoo source is the latest commit of tagged date
- Ships with python 3.11

## Usage

Pass the module paths with `ODOO_ADDONS_PATH`.

```yml
version: "3"
services:
  odoo:
    container_name: odoo
    image: mintsystem/odoo:16.0.2024.0405
    depends_on:
      - db
    environment:
      HOST: db
      USER: odoo
      PASSWORD: odoo
      PORT: 5432
      ODOO_ADDONS_PATH: /mnt/addons/,/mnt/enterprise,/mnt/oca/web/,/mnt/themes/
    ports:
      - "127.0.0.1:8069:8069"
    volumes:
      - odoo-data:/var/lib/odoo
      - ./addons:/mnt/addons
      - ./oca:/mnt/oca
      - ./enterprise:/mnt/enterprise
      - ./themes:/mnt/themes
```

## Develope

### Install packages

Extend the image with additional python packages or a custom `odoo.conf.template`:

```dockerfile
FROM mintsystem/odoo:16.0.2024.0405

USER root

RUN apt-get update && \
apt-get install -y --no-install-recommends \
gettext

RUN python -m pip install prometheus-client astor fastapi python-multipart ujson a2wsgi parse-accept-language pyjwt

COPY ./odoo.conf.template /etc/odoo/

USER odoo
```