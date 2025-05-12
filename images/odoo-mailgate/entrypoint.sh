#!/bin/bash
set -e

entrypoint-log() {
    echo "$@"
}

syslogd -O /var/log/mail.log

# Set default env vars
: ${ODOO_URL:=${ODOO_URL:="http://odoo:8069"}}
: ${ODOO_DATABASE:=${ODOO_DB:="odoo"}}
: ${ODOO_USERNAME:=${ODOO_USERNAME:="admin"}}
: ${ODOO_PASSWORD:=${ODOO_PASSWORD:="admin"}}
: ${MAIL_MODEL:=${MAIL_MODEL:=""}}
: ${MAIL_THREAD_ID:=${MAIL_THREAD_ID:=""}}
: ${MAIL_DOMAIN:=${MAIL_DOMAIN:="yourcompany.com"}}
: ${MAIL_ALIASES:=${MAIL_ALIASES:="info"}}

# Generate SSL/TLS certificates
openssl req -x509 -newkey rsa:2048 -nodes \
  -out /etc/postfix/cert.pem \
  -keyout /etc/postfix/key.pem \
  -days 365 \
  -subj "/C=CH/ST=Uri/L=Uri/O=Mint System/CN=Odoo Mailgate" >/dev/null 2>&1

# Configure TLS
postconf -e "smtpd_tls_cert_file = /etc/postfix/cert.pem"
postconf -e "smtpd_tls_key_file = /etc/postfix/key.pem"
postconf -e "smtpd_tls_security_level = may"
postconf -e "smtp_tls_security_level = may"
postconf -e "smtpd_tls_loglevel = 1"
postconf -e "smtpd_tls_received_header = yes"
postconf -e "smtpd_tls_auth_only = no"

# General Postfix settings
postconf -e "inet_interfaces = all"
postconf -e "myhostname = mailgate.local"
postconf -e "myorigin = $MAIL_DOMAIN"
postconf -e "mydestination = $MAIL_DOMAIN, localhost.localdomain, localhost"
postconf -e "relay_domains = $MAIL_DOMAIN"
postconf -e "smtpd_relay_restrictions = permit_mynetworks, permit_sasl_authenticated, reject_unauth_destination"

# Configure master.cf to enable the submission service with TLS
if ! grep -q "^submission" /etc/postfix/master.cf; then
  echo "submission inet n       -       y       -       -       smtpd
  -o syslog_name=postfix/submission
  -o smtpd_tls_security_level=encrypt
  -o smtpd_tls_wrappermode=no" >> /etc/postfix/master.cf
fi


# Set optional parameters
if [ $MAIL_MODEL != "" ];then
  MAIL_MODEL_PARAM=" -m $MAIL_MODEL"
fi

if [ $MAIL_THREAD_ID != "" ];then
  MAIL_THREAD_ID_PARAM=" -i $MAIL_THREAD_ID"
fi

# Setup aliases
for MAIL_ALIAS in $MAIL_ALIASES; do
    echo "$MAIL_ALIAS: \"|/usr/local/bin/odoo-mailgate.py -l ${ODOO_URL} -d ${ODOO_DATABASE} -u ${ODOO_USERNAME} -p ${ODOO_PASSWORD}${MAIL_MODEL_PARAM}${MAIL_THREAD_ID_PARAM}\"" >> /etc/aliases
    newaliases
    entrypoint-log "Forward alias $MAIL_ALIAS to Odoo database $ODOO_DATABASE at ${ODOO_HOST}:${ODOO_PORT}."
done

entrypoint-log "Starting Postfix in foreground."
postfix start-fg