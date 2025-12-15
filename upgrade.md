# Upgrade

The Odoo Build project assists you in running upgrades for any Odoo project. This document provides a highly opinionated way to connect Odoo Build with an existing Odoo enviroment and execute the upgrade.

## Setup

Odoo Build provies task file commands that take `env` as an argument. The `env` is reference to the name of a dotfile (`vault/.env.$NAME`). These files are managed with with the `*-env` commands.

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

- `HOST`: Hostname of the Odoo pruction instance
- `SERVER`: SSH url to access the pruction server
- `PORT`: SSH port of server
- `ODOO_CONTAINER`: Name of production Odoo Docker container
- `ODOO_VERSION`: Version of Odoo production
- `POSTGRES_CONTAINER`: Name of production Postgres Docker container
- `DATABASE`: Name of production database
- `TARGET_HOST`: Hostname of the Odoo upgrade instance.
- `TARGET_SERVER`: SSH url to access the upgrade server
- `TARGET_PORT`: SSH port of server
- `TARGET_ODOO_CONTAINER`: Name of upgrade Odoo Docker container
- `TARGET_ODOO_VERSION`: Version of Odoo upgrade
- `TARGET_POSTGRES_CONTAINER`: Name of upgrade Postgres Docker container
- `TARGET_DATABASE`: Name of upgrade database

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

Note that the `HOST` and `TARGET_HOST` is a reference to another dotfile.

## Helper Scripts

Running the upgrade requires scripts on the servers. Ensure that the following scripts are installed on the server:

- <https://ansible.build/scripts.html#docker> provides generic Docker container commands
- <https://ansible.build/scripts.html#odoo> helps managing the Odoo container
- <https://ansible.build/scripts.html#postgres> supports managing the Postgres container

You probably have become aware thats project and the upgrade process uses scripts and containers from different projects. Here is a list of projects involved to run the upgrade:

- <https://taskfile.build> provides the basic commands to manage the dotfiles
- <https://odoo.build> which is this project, provides the commands to run the upgrade steps
- <https://ansible.build> as mentioned this repo has the scripts to manage containers on the server

## Test Run

Before going live with an upgraded Odoo database, the new enviroments needs to be tested thoroughly . An upgrade run copies the production database and runs the Odoo Enterprise upgrade script in test mode. On sucess a neutralized and upgraded database will be ready for testing.

### Execute

All the steps required to provide an upgraded database can be run with: `task upgrade-odoo acme all-test`

The `all-test` parameter will execute these tasks:

**dump**

Dump and restore the production database on the Postgres container.

```bash
task upgrade-odoo acme dump
```

**filestore**

Export and import the Odoo filestore.

```bash
task upgrade-odoo acme filestore
```

**drop**

Drop the existing upgrade database.

```bash
task upgrade-odoo acme drop
```

**test**

Run the Odoo upgrade scripts in test mode.

```bash
task upgrade-odoo acme test
```

**uninstall**

Uninstall modules on the upgraded database.

This step requires an env var: `ODOO_ADDONS_UNINSTALL=board_user_acl,l10n_din5008_expense`

```bash
task upgrade-odoo acme uninstall
```

**init**

Init modules on the upgraded database.

This step requires an env var: `ODOO_ADDONS_INIT=web_environment_ribbon`

```bash
task upgrade-odoo acme init
```

**update**

Update all modules and clear assets.

```bash
task upgrade-odoo acme update
```

**restart**

Restart target Odoo and Postgres container.

```bash
task upgrade-odoo acme restart
```

### Troubleshooting

There are additional commands for troubleshooting:

**logs**

Show log of target Odoo container.

```bash
task upgrade-odoo acme logs
```

**shell**

Start shell in target Odoo container.

```bash
task upgrade-odoo acme shell
```

### Configure

With heavily customized Odoo databases and new features you have to make configurations that cannot be automated for an upgrade project and need to be done manually.

### Testing

The testing of an upgraded Odoo database is done in collaboration between the Odoo partner and customer. Define test cases that verify the customer's workflows. Collect feedback and establish a loop of testing, feedback, fixing, upgrading and testing.

## Production Run

Once the testing phase of the upgrade project has finished and a date for the go-live has been chosen, run the upgrade in production mode.

In this scenario we ensure that the url `https://odoo.example.com` points to the new container after the upgrade.

### Execute

In order to run the production upgrade execute `task upgrade-odoo acme all-production`.

Similar to `all-test` this command runs all comands, but instead of **test** in runs this command:

**production**

Run the Odoo upgrade scripts in test mode

```bash
task upgrade-odoo acme production
```

### Configure

The configuration work as done for the test upgrade applies to the production mode.

### Testing

Run smoke-tests on the upgraded database.

### Rename

Until here you can still abort the go-live. To go live we flip the switch, which means we rename the target database to the original name and ensure that `https://odoo.example.com` points to the right database.

**rename-production**

Rename target database to source database.

```bash
task upgrade-odoo acme rename-production
```

As the final step you have to ensure that `https://odoo.example.com` points to `host2.example.com`. This requires updating the DNS and proxy configuration on the target server.

### Recovery

If something goes wrong, you can fallback to the original database at any time. Simply revert DNS update.

### Cleanup

After a week of sucessful working with the upgraded database, it is safe to sunset the original server and/or database.

Shut down the `odoo01` container the `host1.example.com` server.

Ensure that `https://upgrade.odoo.example.com` no longer resolves.

