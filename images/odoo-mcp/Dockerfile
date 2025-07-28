FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir fastmcp

# Copy the server script
COPY ./images/odoo-mcp/bin/server /app/server

# Make the server script executable
RUN chmod +x /app/server

# Set environment variables with defaults
ENV ODOO_URL=http://localhost:8069
ENV ODOO_DATABASE=odoo
ENV ODOO_USERNAME=admin
ENV ODOO_PASSWORD=admin

# Expose any necessary ports (MCP typically uses stdio, so this may not be needed)

# Run the server
CMD ["python3", "/app/server"]
