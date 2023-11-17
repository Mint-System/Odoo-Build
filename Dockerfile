ARG ODOO_IMAGE

FROM $ODOO_IMAGE

USER root

RUN apt-get update && \
apt-get install -y --no-install-recommends \
gettext

USER odoo

COPY ./build/odoo.conf.template /etc/odoo/

COPY ./build/entrypoint.sh /

RUN pip3 install prometheus-client
