# Stage 1: Build environment
ARG PYTHON_VERSION
FROM python:${PYTHON_VERSION}-slim-bookworm AS builder

# Retrieve the Odoo version
ARG ODOO_VERSION
ARG ODOO_DATE
ARG ODOO_ENTERPRISE_REF

# Install build dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        libxml2-dev \
        libxslt-dev \
        python3-dev \
        libpq-dev \
        libldap2-dev \
        libsasl2-dev \
        libcairo2-dev \
        libjpeg-dev \
        libgif-dev \
        gcc \
        git \
        wget \
        curl \
        gnupg && \
    rm -rf /var/lib/apt/lists/*

# Install uv for Python package management
COPY --from=ghcr.io/astral-sh/uv:0.7.21 /uv /uvx /bin/

# Prepare virtual env
RUN uv venv /opt/odoo/venv
ENV PATH=/opt/odoo/venv/bin:$PATH

# Install Odoo tools
COPY ./images/odoo/requirements.txt /opt/odoo/venv/
RUN uv pip install --no-cache-dir -r /opt/odoo/venv/requirements.txt

# Install Odoo
COPY ./odoo /opt/odoo
ENV UV_COMPILE_BYTECODE=1
ENV UV_CONCURRENT_INSTALLS=1
RUN uv pip install --no-cache-dir /opt/odoo -r /opt/odoo/requirements.txt

# Clean up unnecessary files to reduce image size
# - build/ + egg-info: leftovers of the wheel build
# - .pot/.md/.rst: not needed at runtime
# - tests/: unit test code, not needed at runtime
# - site-packages/{odoo,addons}: duplicate of /opt/odoo, shadowed by PYTHONPATH
# - venv permissions: applied here so the final stage does not copy up the venv
RUN set -eux; \
    rm -rf /opt/odoo/build /opt/odoo/odoo.egg-info; \
    find /opt/odoo -type d \( -name build -o -name egg-info \) -prune -exec rm -rf {} +; \
    find /opt/odoo -type f \( -name "*.pot" -o -name "*.md" -o -name "*.rst" \) -delete; \
    # Only prune tests inside addons/ - the core odoo/tests package is imported
    # by odoo.service.server at startup (from ..tests import loader, runner)
    find /opt/odoo/addons -type d -name tests -prune -exec rm -rf {} +; \
    site_packages="$(/opt/odoo/venv/bin/python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"; \
    rm -rf "$site_packages/odoo" "$site_packages/addons"; \
    chgrp -R 0 /opt/odoo/venv; \
    chmod -R g=u /opt/odoo/venv

# Set release serial
RUN sed -i "s/FINAL, 0, '')/FINAL, 0, '.$ODOO_DATE')/" /opt/odoo/odoo/release.py

# Stage 2: Runtime environment
FROM python:${PYTHON_VERSION}-slim-bookworm

LABEL org.opencontainers.image.source="https://github.com/mint-system/odoo-build"
LABEL org.opencontainers.image.authors="Mint System GmbH <info@mint-system.ch>"

# Generate locale C.UTF-8 for postgres and general locale data
ENV LANG=C.UTF-8

# Retrieve the Odoo version again for the runtime environment
ARG ODOO_VERSION
ARG ODOO_DATE
ARG ODOO_ENTERPRISE_REF
ENV ODOO_VERSION=$ODOO_VERSION
ENV ODOO_ENTERPRISE_REF=$ODOO_ENTERPRISE_REF

# Install runtime dependencies including wkhtmltopdf dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        gettext-base \
        fonts-noto-cjk \
        git \
        openssh-client \
        fontconfig \
        xfonts-75dpi \
        xfonts-base \
        libcairo2 \
        libxml2 \
        libxslt1.1 \
        nginx \
        # wkhtmltopdf dependencies:
        libjpeg62-turbo \
        libx11-6 \
        libxcb1 \
        libxext6 \
        libxrender1 && \
    rm -rf /var/lib/apt/lists/*

# Install wkhtmltopdf
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
# The pgdg key is fetched directly (armored) so gnupg is not needed at runtime
RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ bookworm-pgdg main' > /etc/apt/sources.list.d/pgdg.list \
    && curl -fsSL 'https://www.postgresql.org/media/keys/ACCC4CF8.asc' -o /etc/apt/trusted.gpg.d/pgdg.gpg.asc \
    && apt-get update \
    && apt-get install --no-install-recommends -y postgresql-client \
    && rm -f /etc/apt/sources.list.d/pgdg.list \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js and rtlcss
# npm is only needed to install rtlcss; purge it afterwards (also removes the
# python3.11 stack that npm pulls in). The nodejs runtime stays for rtlcss.
RUN apt-get update && \
    apt-get install -y --no-install-recommends nodejs npm && \
    npm install -g rtlcss && \
    apt-get purge -y npm && \
    apt-get autoremove -y --purge && \
    rm -rf /var/lib/apt/lists/*

# Install uv for Python package management
COPY --from=ghcr.io/astral-sh/uv:0.7.21 /uv /uvx /bin/

# Copy the virtual environment and Odoo from the builder stage
COPY --from=builder /opt/odoo/venv /opt/odoo/venv
COPY --from=builder /opt/odoo /opt/odoo

# Setup environment path
ENV PATH=/opt/odoo/venv/bin:$PATH
ENV ADDONS_PATH=/opt/odoo/addons

# Resolve odoo to /opt/odoo/odoo
ENV PYTHONPATH=/opt/odoo

# Copy entrypoint scripts and Odoo configuration file
COPY ./images/odoo/bin/* /usr/local/bin/
COPY ./images/odoo/entrypoint.sh /
COPY ./images/odoo/odoo.conf.template /etc/odoo/

# Setup folder and permissions:
# Home: /home/odoo
# Config: /etc/odoo
# Data: /var/lib/odoo
# Python: /opt/odoo/venv
# Addons: /mnt/extra-addons

# Create folders
RUN mkdir -p /home/odoo /var/lib/odoo /mnt/extra-addons

# Set OpenShift compatible permissions - arbitrary UID runs as gid 0
# The venv is already fixed in the builder stage to avoid copying it up
RUN chgrp -R 0 /home/odoo /etc/odoo /var/lib/odoo /mnt/extra-addons \
    && chmod -R g=u /home/odoo /etc/odoo /var/lib/odoo /mnt/extra-addons

# Set the working directory
WORKDIR /opt/odoo

# Set home directory
ENV HOME=/home/odoo

# Nginx configuration
RUN mkdir -p /var/cache/nginx/odoo
RUN mkdir -p /var/run/nginx/
COPY ./images/odoo/nginx.conf /etc/nginx/nginx.conf

# Define volumes
VOLUME ["/var/lib/odoo", "/mnt/extra-addons"]

# Expose Odoo services
# Port 8068 and 8071 is used for testing
# Port 8080 is the nginx proxy
EXPOSE 8068 8069 8071 8072 8080

# Set the default config file
ENV ODOO_RC=/etc/odoo/odoo.conf

ENTRYPOINT ["/entrypoint.sh"]
CMD ["odoo"]

# Healthcheck
HEALTHCHECK --interval=10s --timeout=5s --retries=3 \
  CMD curl --silent --fail "http://localhost:8069/web/health" || exit 1