[Mint System Odoo Mailgate](https://odoo.build/images/odoo-mailgate/)
===

[![Docker pulls](https://img.shields.io/docker/pulls/mintsystem/odoo-mailgate)](https://hub.docker.com/r/mintsystem/odoo-mailgate/)

The Odoo Mailgate Docker image integrates a Postfix mail server and the odoo-mailgate script, allowing you to receive and forward emails to Odoo.

Source: <https://github.com/Mint-System/Odoo-Build/tree/main/images/odoo-mailgate>

## Usage

Setup environment variables:

```bash
export ODOO_URL="https://odoo.example.com"  # default: "http://odoo:8069""
export ODOO_DATABASE="example" # default: "odoo"
export ODOO_USERNAME="demo" # default: "admin"
export ODOO_PASSWORD="demo" # default: "admin"
export MAIL_MODEL="res.partner" # default: False
export MAIL_THREAD_ID=10 # default: False
export MAIL_DOMAIN="yourcompany.com" # default: "yourcompany.com"
export MAIL_ALIASES="info invoice contact support" # default: "info"
```

Run the upgrade script:

```bash
docker run -d --name odoo-mailgate -p 25:25 -p 587:587 \
  -e ODOO_URL=$ODOO_URL \
  -e ODOO_DATABASE=$ODOO_DATABASE \
  -e ODOO_USERNAME=$ODOO_USERNAME \
  -e ODOO_PASSWORD=$ODOO_PASSWORD \
  -e MAIL_MODEL=$MAIL_MODEL \
  -e MAIL_THREAD_ID=$MAIL_THREAD_ID \
  -e MAIL_DOMAIN=$MAIL_DOMAN \
  -e MAIL_ALIASES=$MAIL_ALIASES \
  mintsystem/odoo-mailgate
```

## Develop

Start all containers.

```bash
task start
```

Open Odoo and setup the domain `yourcompany.com` for the default company.

Send a test mail with swaks:

```bash
swaks --to info@yourcompany.com --from sender@example.com \
  --server localhost:25 \
  --body "This is a test email for the Odoo mailgate system." \
  --header "Subject: Test Email for Odoo"
```

The mail will be forwarded to Odoo and shown as a discuss channel.

Trace the mailgate log:

```bash
docker exec mailgate tail -f /var/log/mail.log
```

You can also send a mail with tls encryption:


```bash
swaks --to info@yourcompany.com --from sender@example.com \
  --server localhost:587 \
  --tls \
  --body "This is a test email for the Odoo mailgate system." \
  --header "Subject: Test Email for Odoo"
```
