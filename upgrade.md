# Upgrade

The Odoo Build project assists you in running upgrades for any Odoo project. This document helps understanding how to connect Odoo Build with an Odoo enviroment and how to run and upgrade.

## Setup

There are task file commands that take `env` as an argument. The `env` references a dotfile `./vault/.env.$NAME`. These files are managed with with the `*-env` commands.

Setting up a Odoo upgrade project requires the creation of a dotenv file. This guide assumes that we have the following setup:

- Our customer is `Acme Corporation`
- The production server is `host1.example.com` and the upgrade server is `host2.example.com`
- Odoo 16.0 production instance is running at `https://odoo.example.com`
- Odoo 18.0 upgrade environment is running at `https://upgrade.odoo.example.com`
- The Odoo setup is docker based. The Postgres containers have a different version
- Name of Odoo databases depends on the subdomain of the url

Get started by creating the `vault` folder.

```bash
task init-dotenv-dir
```

Then create a dotenv file for the upgrade project.

```bash
task create-env acme upgrade
```

This will create the file with the upgrade template. Edit the file.

```bash
task edit-env acme
```

Update the configs with the definition of your enviroment.

- **HOST**: Hostname of the Odoo pruction instance
- **SERVER**: SSH url to access the pruction server
- **PORT**: SSH port of server
- **ODOO_CONTAINER**: Name of production Odoo Docker container
- **ODOO_VERSION**: Version of Odoo production
- **POSTGRES_CONTAINER**: Name of production Postgres Docker container
- **DATABASE**: Name of production database
- **TARGET_HOST**: Hostname of the Odoo upgrade instance.
- **TARGET_SERVER**: SSH url to access the upgrade server
- **TARGET_PORT**: SSH port of server
- **TARGET_ODOO_CONTAINER**: Name of upgrade Odoo Docker container
- **TARGET_ODOO_VERSION**: Version of Odoo upgrade
- **TARGET_POSTGRES_CONTAINER**: Name of upgrade Postgres Docker container
- **TARGET_DATABASE**: Name of upgrade database

In our case the definition is:

```bash
HOST='odoo.example.com'
SERVER='host1.example.com'
PORT=22
ODOO_CONTAINER='odoo01'
ODOO_VERSION='16.0'
POSTGRES_CONTAINER='postgres01'
DATABASE='odoo'
TARGET_HOST='upgrade.odoo.example.com'
TARGET_SERVER='host2.example.com'
TARGET_PORT=22
TARGET_ODOO_CONTAINER='odoo02'
TARGET_ODOO_VERSION='18.0'
TARGET_POSTGRES_CONTAINER='postgres02'
TARGET_DATABASE='upgrade'
```

Note that the `HOST` and `TARGET_HOST` is a reference to a dotfile.

## Helper Scripts

In order to run upgrade there need to be two sets of command avaialble on the server.

<https://ansible.build/scripts.html#odoo-scripts>

<https://ansible.build/scripts.html#postgres>

Three layers of scripting:

taskfile.build -> odoo.build -> ansible.build

## Test Run

Before going live with an upgraded Odoo database, the new enviroments needs to be tested thouroughly. An upgrade run copies production database and runs upgrade scripts in test mode. This will return a neutralized and upgraded database ready for testing.

### Execute

All the steps required to provide an upgrades database can be run with: `task upgrade-odoo acme all-test`

The `all-test` parameter will execute these tasks:

**dump**

Dump and restore the production database on the Postgres container

```bash
task upgrade-odoo acme dump
```

**filestore**

Export and import the Odoo filestore

```bash
task upgrade-odoo acme filestore
```

**drop**

Drop the existing upgrade database

```bash
task upgrade-odoo acme drop
```

**test**

Run the Odoo upgrade scripts in test mode

```bash
task upgrade-odoo acme test
```

**uninstall**

Uninstall modules on the upgraded database

This step requires an env var:

```bash
ODOO_ADDONS_UNINSTALL=board_user_acl,l10n_din5008_expense
```

```bash
task upgrade-odoo acme uninstall
```

**init**

Init modules on the upgraded database

This step requires an env var:

```bash
ODOO_ADDONS_INIT=web_environment_ribbon
```

```bash
task upgrade-odoo acme init
```

**update**

Update all modules and clear assets

```bash
task upgrade-odoo acme upgrade
```

### Configure

With heavily customized Odoo databases and new features you have to make configurations that cannot be automated for an upgrade project and need to be done manually.

### Testing

### Troubleshooting



## Production Run

Once the testing phase of the upgrade project has finished and a date for the go-live has been chosen, run the upgrade in production mode.

In this scenario we ensure that the url `https://odoo.example.com` points to the new container after upgrade.

### Execute

In order to run the production upgrade execute `task upgrade-odoo acme all-production`.

Compare to `all-test` this command runs the upgrade in production mode:

- **production**: Run the Odoo upgrade scripts in test mode

```bash
task upgrade-odoo acme production
```

### Configure

### Testing

### Rename

### Cleanup