[Mint System Odoo CLI](https://odoo.build/images/odoooctl/)
===

[![Docker pulls](https://img.shields.io/docker/pulls/mintsystem/odoocli)](https://hub.docker.com/r/mintsystem/odoocli/)

Image to run the odoocli.

Source: <https://github.com/Mint-System/Odoo-Build/tree/main/image/odoocli>

## Usage

Setup environment vaiables:

```bash
export NETWORK="odoo-build_default"
export ODOO_URL="http://localhost:8069"
export ODOO_DATABASE="odoo"
export ODOO_USERNAME="admin"
export ODOO_PASSWORD="admin"
```

Setup a function for the odoocli command:

```bash
odoocli() {
    docker run -it \
        -e ODOO_URL="$ODOO_URL" -e ODOO_DATABASE="$ODOO_DATABASE" -e ODOO_USERNAME="$ODOO_USERNAME" -e ODOO_PASSWORD="$ODOO_PASSWORD" \
        --network="$NETWORK" mintsystem/odoocli "$@"
}
```

Show help of odoocli:

```bash
odoocli --help
```
