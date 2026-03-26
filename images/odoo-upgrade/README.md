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
    --name odoo-upgrade \
    -v /var/tmp/odoo-upgrade:/root
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

## Troubleshooting

### Server version mismatch

**Problem**

The generating dump step failed with this message:

```bash
2025-11-12 09:54:54 ERROR: Generating the dump of your database has failed. The 'pg_dump' command has failed with the following output:
 pg_dump: error: aborting because of server version mismatch
pg_dump: detail: server version: 16.9; pg_dump version: 15.12 (Debian 15.12-0+deb12u2)
```

**Solution**

Ensure that the local postgres server does not have a never version than the remote server.

If necessary downgrade the local postgres server.

### Unrecognized parameter transaction_timeout

**Problem**

The restore step fails with:

```
pg_restore: error: could not execute query: ERROR:  unrecognized configuration parameter "transaction_timeout"
```

**Solution**

The database has been restored despite the error.
But it is recommended to use postgres version 17.
