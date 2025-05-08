FROM debian:bookworm-slim

# Install Postfix and other required packages
RUN apt-get update && apt-get install -y \
    postfix procmail openssl busybox-syslogd netbase python3-minimal \
  && rm -rf /var/lib/apt/lists/*

# Copy the odoo-mailgate script into the container
COPY ./images/odoo-mailgate/odoo-mailgate.py /usr/local/bin/

# Copy the entrypoint script into the container
COPY ./images/odoo-mailgate/entrypoint.sh /

# Expose the SMTP ports
EXPOSE 25
EXPOSE 587

# Set the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
