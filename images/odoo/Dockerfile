FROM python:3.12-slim-bookworm

LABEL org.opencontainers.image.source="https://github.com/mint-system/odoo-build"
LABEL org.opencontainers.image.authors="Mint System GmbH <info@mint-system.ch>"

# Generate locale C.UTF-8 for postgres and general locale data
ENV LANG=C.UTF-8

# Retrieve the Odoo version
ARG ODOO_VERSION
ARG ODOO_DATE

# Install some deps, lessc and less-plugin-clean-css, and wkhtmltopdf
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        dirmngr \
        fonts-noto-cjk \
        gnupg \
        libssl-dev \
        # Custom packages:
        git \
        openssh-client \
        gettext \
        build-essential \
        python3-dev \
        libpq-dev \
        libldap2-dev \
        libsasl2-dev \
        libcairo2-dev \
        libjpeg-dev \
        libgif-dev \
        gcc \
        fontconfig \
        xfonts-75dpi \
        xfonts-base \
        wget && \
    rm -rf /var/lib/apt/lists/*

# Determine architecture for wkhtmltopdf download
RUN if [ -z "${TARGETARCH}" ]; then \
        TARGETARCH="$(dpkg --print-architecture)"; \
    fi; \
    WKHTMLTOPDF_ARCH=${TARGETARCH} && \
    case ${TARGETARCH} in \
        "amd64") WKHTMLTOPDF_ARCH=amd64 && WKHTMLTOPDF_SHA=e9f95436298c77cc9406bd4bbd242f4771d0a4b2  ;; \
        "arm64") WKHTMLTOPDF_SHA=77bc06be5e543510140e6728e11b7c22504080d4  ;; \
        "ppc64le" | "ppc64el") WKHTMLTOPDF_ARCH=ppc64el && WKHTMLTOPDF_SHA=7ed8f6dcedf5345a3dd4eeb58dc89704d862f9cd  ;; \
    esac && \
    curl -o wkhtmltox.deb -sSL https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-3/wkhtmltox_0.12.6.1-3.bookworm_${WKHTMLTOPDF_ARCH}.deb && \
    echo "${WKHTMLTOPDF_SHA} wkhtmltox.deb" | sha1sum -c - && \
    dpkg -i wkhtmltox.deb && \
    rm wkhtmltox.deb

# Install latest postgresql-client
RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ bookworm-pgdg main' > /etc/apt/sources.list.d/pgdg.list \
    && GNUPGHOME="$(mktemp -d)" \
    && export GNUPGHOME \
    && repokey='B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8' \
    && gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "${repokey}" \
    && gpg --batch --armor --export "${repokey}" > /etc/apt/trusted.gpg.d/pgdg.gpg.asc \
    && gpgconf --kill all \
    && rm -rf "$GNUPGHOME" \
    && apt-get update  \
    && apt-get install --no-install-recommends -y postgresql-client \
    && rm -f /etc/apt/sources.list.d/pgdg.list \
    && rm -rf /var/lib/apt/lists/*

# Install pnpm
RUN wget -qO- https://get.pnpm.io/install.sh | ENV="$HOME/.bashrc" SHELL="$(which bash)" bash -

# Install uv https://docs.astral.sh/uv/guides/integration/docker/
COPY --from=ghcr.io/astral-sh/uv:0.5.16 /uv /uvx /bin/

# Prepare virtual env
RUN uv venv /opt/odoo-venv
ENV PATH=/opt/odoo-venv/bin:$PATH

# Install Odoo tools
COPY ./images/odoo/requirements.txt /opt/odoo-venv/
RUN uv pip install --no-cache-dir -r /opt/odoo-venv/requirements.txt

# Install Odoo
COPY ./odoo /opt/odoo
RUN uv pip install pip
RUN pip install --no-cache-dir -e /opt/odoo -r /opt/odoo/requirements.txt
ENV ADDONS_PATH=/opt/odoo/addons

# Set release serial
RUN sed -i "s/FINAL, 0, '')/FINAL, 0, '.$ODOO_DATE')/" /opt/odoo/odoo/release.py 

# Set env vars
ENV ODOO_VERSION=$ODOO_VERSION

# Copy entrypoint scripts and Odoo configuration file
COPY ./images/odoo/bin/* /usr/local/bin/
COPY ./images/odoo/entrypoint.sh /
COPY ./images/odoo/odoo.conf.template /etc/odoo/

# Set the working directory
WORKDIR /opt/odoo

# Setup folder and permissions:
# Config: /etc/odoo
# Data: /var/lib/odoo
# Python: /opt/odoo-venv
# Addons: /mnt/extra-addons
RUN mkdir -p /var/lib/odoo \
    && mkdir -p /mnt/extra-addons

# Set OpenShift compatible permissions - Make directories writable by any user ID
RUN chmod -R 775 /etc/odoo \
    /var/lib/odoo \
    /opt/odoo-venv \
    /mnt/extra-addons

# Define volumes
VOLUME ["/var/lib/odoo", "/mnt/extra-addons"]

# Expose Odoo services
EXPOSE 8069 8071 8072

# Set the default config file
ENV ODOO_RC=/etc/odoo/odoo.conf

ENTRYPOINT ["/entrypoint.sh"]
CMD ["odoo"]