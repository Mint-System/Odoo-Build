FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
    openssh-client \
    rsync \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

COPY ./image/odoo-upgrade/bin/* /usr/local/bin/

CMD ["/bin/bash"]