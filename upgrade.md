# Upgrade

The Odoo Build project assists you in running upgrades for any Odoo project. This document helps understanding how to connect Odoo Build with an Odoo enviroment and how to run and upgrade.

## Setup

There are `task` script commands that take `env` as an argument. The `env` references a dotfile `./vault/.env.$NAME`. These files are managed with with the `*-env` commands.

Setting up a Odoo upgrade project requires the creation of a dotenv file. This guide assumes that we have the following setup:

- There is a server called ``

Get started by creating the `vault` folder.

```bash
task init-dotenv-dir
```

Then create a dotenv file for the upgrade project.

```bash
task create-env upgrade.odoo.example.com upgrade
```

This will create the file with the upgrade template. Edit the file.

```bash
task edit-env upgrade.odoo.example.com
```

Update the configs with the definition of your enviroment.

- **HOST**: Hostname of the Odoo instance. 
- **SERVER**:
- **PORT**:

- **ODOO_CONTAINER**:
- **ODOO_VERSION**:
- **POSTGRES_CONTAINER**:
- **DATABASE**:

- **TARGET_ODOO_CONTAINER**:
- **TARGET_ODOO_VERSION**:
- **TARGET_POSTGRES_CONTAINER**:
- **TARGET_DATABASE**:
