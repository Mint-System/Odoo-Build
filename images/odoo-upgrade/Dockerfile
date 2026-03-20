ARG POSTGRES_VERSION
FROM debian:stable-slim

WORKDIR /root

RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN install -d /usr/share/postgresql-common/pgdg

RUN curl -o /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc --fail https://www.postgresql.org/media/keys/ACCC4CF8.asc

RUN . /etc/os-release && \
    echo "deb [signed-by=/usr/share/postgresql-common/pgdg/apt.postgresql.org.asc] https://apt.postgresql.org/pub/repos/apt $VERSION_CODENAME-pgdg main" > /etc/apt/sources.list.d/pgdg.list

RUN apt-get update && apt-get install -y \
    postgresql-client-$POSTGRES_VERSION \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    openssh-client \
    rsync \
    python3 \
    python3-uvicorn \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s /usr/bin/python3 /usr/bin/python

COPY ./images/odoo-upgrade/bin/* /usr/local/bin/
RUN chmod +x /usr/local/bin/upgrade

ENTRYPOINT ["upgrade"]
