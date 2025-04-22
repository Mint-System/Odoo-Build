[Mint System odooctl](https://odoo.build/images/odoooctl/)
===

[![Docker pulls](https://img.shields.io/docker/pulls/mintsystem/odooctl)](https://hub.docker.com/r/mintsystem/odooctl/)

Image to run the odooctl cli.

Source: <https://github.com/Mint-System/Odoo-Build/tree/main/image/odooctl>

## Usage

Setup environment vaiables:

```bash
export NETWORK="odoo-build_default"
export ODOO_URL="http://localhost:8069"
export ODOO_DATABASE="odoo"
export ODOO_USERNAME="admin"
export ODOO_PASSWORD="admin"
```

Setup a function for the odooctl command:

```bash
odooctl() {
    docker run -it \
        -e ODOO_URL="$ODOO_URL" -e ODOO_DATABASE="$ODOO_DATABASE" -e ODOO_USERNAME="$ODOO_USERNAME" -e ODOO_PASSWORD="$ODOO_PASSWORD" \
        --network="$NETWORK" mintsystem/odooctl "$@"
}
```

Show help of odooctl:

```bash
odooctl --help
```