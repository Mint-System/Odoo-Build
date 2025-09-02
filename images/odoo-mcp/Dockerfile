FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir fastmcp

COPY ./images/odoo-mcp/bin/server /app/server

RUN chmod +x /app/server

ENV ODOO_URL=http://odoo:8069
ENV ODOO_DATABASE=odoo
ENV ODOO_USERNAME=admin
ENV ODOO_PASSWORD=admin

CMD ["python3", "/app/server"]
