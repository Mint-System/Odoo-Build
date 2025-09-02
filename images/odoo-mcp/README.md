# Mint System Odoo MCP

[![Docker pulls](https://img.shields.io/docker/pulls/mintsystem/odoo-mcp)](https://hub.docker.com/r/mintsystem/odoo-mcp/)

Image to run the Odoo MCP server.

Source: <https://github.com/Mint-System/Odoo-Build/tree/main/images/odoo-mcp>

## Usage

Add this config to your MCP client configuration:

```json
{
    "mcpServers": {
        "odoo": {
            "command": "docker",
            "args": [
                "run",
                "-i",
                "--rm",
                "-e",
                "ODOO_URL",
                "-e",
                "ODOO_DATABASE",
                "-e",
                "ODOO_USERNAME",
                "-e",
                "ODOO_PASSWORD",
                "mintsystem/odoo-mcp"
            ],
            "env": {
                "ODOO_URL": "http://odoo:8069",
                "ODOO_DATABASE": "18.0",
                "ODOO_USERNAME": "admin",
                "ODOO_PASSWORD": "admin"
            }
        }
    }
}
```

## Environment Variables

The following environment variables can be configured:

- `ODOO_URL`: The URL of your Odoo instance (default: `http://localhost:8069`)
- `ODOO_DATABASE`: The name of your Odoo database (default: `odoo`)
- `ODOO_USERNAME`: The username for Odoo authentication (default: `admin`)
- `ODOO_PASSWORD`: The password for Odoo authentication (default: `admin`)
