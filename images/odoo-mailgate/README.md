[Mint System Odoo Mailgate](https://odoo.build/images/odoo-mailgate/)
===

[![Docker pulls](https://img.shields.io/docker/pulls/mintsystem/odoo-mailgate)](https://hub.docker.com/r/mintsystem/odoo-mailgate/)

The Odoo Mailgate Docker image integrates a Postfix mail server and the odoo-mailgate script, allowing you to receive and forward emails to Odoo.

Source: <https://github.com/Mint-System/Odoo-Build/tree/main/image/odoo-mailgate>

## Usage

Setup environment vaiables:

```bash
export ODOO_DATABASE="odoo"
export ODOO_USERNAME=2
export ODOO_PASSWORD="admin"
export ODOO_HOST="odoo"
export ODOO_PORT=8069
export EMAIL_ADDRESS="info@yourcompany.com"
```

Run the upgrade script:

```bash
docker run -d --name odoo-mailgate -p 25:25 -p 587:587 \
  -e ODOO_DATABASE=$ODOO_DATABASE \
  -e ODOO_USERNAME=$ODOO_USERNAME \
  -e ODOO_PASSWORD=$ODOO_PASSWORD \
  -e ODOO_HOST=$ODOO_HOST \
  -e ODOO_PORT=$ODOO_PORT \
  -e EMAIL_ADDRESS=$EMAIL_ADDRESS \
  mintsystem/odoo-mailgate
```

## Develop

Start all containers.

```bash
task start
```

Open Odoo and setup the domain `yourcompany.com` for the default company.

Send a test e-mail with swaks:

```bash
swaks --to info@yourcompany.com --from sender@example.com \
  --server localhost:25 \
  --body "This is a test email for the Odoo mailgate system." \
  --header "Subject: Test Email for Odoo"
```

The mail will be forwarded to Odoo and shown as a discuss channel.

Trace the mailgate log:

```bash
docker  exec mailgate tail -f /var/log/mail.log
```
