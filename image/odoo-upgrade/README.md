Mint System Odoo Upgrade
===

Image to run the Odoo upgrade script.

Source: <https://github.com/Mint-System/Odoo-Build/tree/main/image/odoo-upgrade>

## Usage

Setup environment vaiables:

```bash
export PGHOST="db"
export PGUSER="odoo"
export PGPASSWORD="odoo"
export NETWORK="odoo-build_default"
export DATABASE="odoo"
export TARGET_DATABSE="upgrade"
```

Run the upgrade script:

```bash
docker run -it \
    -e PGHOST="$PGHOST" -e PGUSER="$PGUSER" -e PGPASSWORD="$PGPASSWORD" \
    --network="$NETWORK" mintsystem/odoo-upgrade \
    upgrade test -d "$DATABASE" -t "$TARGET_DATABSE"
```

## Develop

Update upgrade script:

```bash
wget https://upgrade.odoo.com/upgrade -O image/odoo-upgrade/bin/upgrade
```