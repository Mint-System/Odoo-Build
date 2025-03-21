Mint System Odoo Upgrade
===

Execute the Odoo Upgrade from a container.

## Usage

```bash
docker run -it -e PGHOST="$PGHOST" -e PGUSER="$PGUSER" -e PGPASSWORD="$PGPASSWORD" mintsystem/odoo-upgrade \
    upgrade --help
```

## Develop

Update upgrade script.

```bash
wget https://upgrade.odoo.com/upgrade -O image/odoo-upgrade/bin/upgrade
```