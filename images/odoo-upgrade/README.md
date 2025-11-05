[Mint System Odoo Upgrade](https://odoo.build/images/odoo-upgrade/)
===

[![Docker pulls](https://img.shields.io/docker/pulls/mintsystem/odoo-upgrade)](https://hub.docker.com/r/mintsystem/odoo-upgrade/)

Image to run the Odoo Enterprise upgrade script.

Source: <https://github.com/Mint-System/Odoo-Build/tree/main/images/odoo-upgrade>

## Usage

Setup environment vaiables:

```bash
export NETWORK="odoo-build_default"
export PGHOST="db"
export PGUSER="odoo"
export PGPASSWORD="odoo"
export DATABASE="odoo"
export TARGET_DATABASE="upgrade"
export TARGET_VERSION="18.0"
```

Run the upgrade script:

```bash
docker run -it \
    -e PGHOST="$PGHOST" -e PGUSER="$PGUSER" -e PGPASSWORD="$PGPASSWORD" \
    --network="$NETWORK" mintsystem/odoo-upgrade \
    test -d "$DATABASE" -t "$TARGET_VERSION" -r "$TARGET_DATABASE"
```

Show help of upgrade command and arguments:

```bash
docker run -it mintsystem/odoo-upgrade --help
docker run -it mintsystem/odoo-upgrade test --help
```

## Development

### Update the Odoo upgrade script

Update the upgrade script:

```bash
wget https://upgrade.odoo.com/upgrade -O images/odoo-upgrade/bin/upgrade
```