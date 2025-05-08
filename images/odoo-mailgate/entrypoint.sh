#!/bin/bash
set -e

entrypoint-log() {
    echo "$@"
}

syslogd -O /var/log/mail.log

# Set default env vars
: ${ODOO_DATABASE:=${ODOO_DB:="odoo"}}
: ${ODOO_USERNAME:=${ODOO_USERNAME:=2}}
: ${ODOO_PASSWORD:=${ODOO_PASSWORD:="admin"}}
: ${ODOO_HOST:=${ODOO_HOST:="odoo"}}
: ${ODOO_PORT:=${ODOO_PORT:=8069}}
: ${EMAIL_ADDRESS:=${EMAIL_ADDRESS:="info@yourcompany.com"}}

# Generate SSL/TLS certificates
openssl req -x509 -newkey rsa:2048 -nodes \
  -out /etc/postfix/cert.pem \
  -keyout /etc/postfix/key.pem \
  -days 365 \
  -subj "/C=CH/ST=Uri/L=Uri/O=Mint System/CN=Odoo Mailgate" >/dev/null 2>&1

# Configure Postfix
postconf -e "smtpd_tls_cert_file = /etc/postfix/cert.pem"
postconf -e "smtpd_tls_key_file = /etc/postfix/key.pem"
postconf -e "smtpd_tls_security_level = may"
postconf -e "smtp_tls_security_level = may"
postconf -e "smtpd_tls_auth_only = no"
postconf -e "inet_interfaces = all"

DOMAIN=${EMAIL_ADDRESS#*@}
postconf -e "myhostname = mailgate.local"
postconf -e "myorigin = $DOMAIN"
postconf -e "mydestination = $DOMAIN, localhost.localdomain, localhost"

# Setup alias map instead of virtual
echo "info: \"|/usr/local/bin/odoo-mailgate.py -d ${ODOO_DATABASE} -u ${ODOO_USERNAME} -p ${ODOO_PASSWORD} --host ${ODOO_HOST} --port ${ODOO_PORT}\"" > /etc/aliases
newaliases

entrypoint-log "Configured alias for $EMAIL_ADDRESS → Odoo @ ${ODOO_HOST}:${ODOO_PORT}"

entrypoint-log "Starting Postfix in foreground."
postfix start-fg