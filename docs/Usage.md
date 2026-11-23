Usage
===

How to use the Odoo Build project.

## Create a new module from source

Create a new module.

```bash
task create-module addons/project/project_sprint
```

Add a new model.

```bash
task generate-module-model addons/project/project_sprint project.sprint
```

Add model security.

```bash
task generate-module-security addons/project/project_sprint project.sprint
```

Generate module docs.

```bash
task generate-module-docs addons/project/project_sprint project.sprint
```

## Load modules from external folder

To load modules from a external folder, set this env var in your `.env` file:

```bash
ODOO_ADDONS_PATH=/path/to/your/module-repo,../odoo-project/odoo-apps
```

The paths will be appended to the Odoo config.

## Initialize without demo data

In your `.env` file set this env var:

```bash
WITHOUT_DEMO=True
```

## Pint Odoo database name

The default database name is the checked out Odoo version.

To define another name, set this env var in your `.env` file:

```bash
DB_NAME=odoo
```

## Disable browser open

To disable the browser open when starting the Odoo server edit the `.env` file:

```bash
BROWSER_OPEN=false
```

## Set podman as container engine

If you are using podman, set this `.env` var:

```bash
CONTAINER_ENGINE=podman
```

## Change log level

To change the log level of Odoo set this env var in your `.env` file:

```bash
LOG_LEVEL=debug
```

## Stop all containers

Without service name the stop commands stops all containers.

```bash
task stop
```

## Remove containers

Removes containers and volumes.

```bash
task remove
```

## Drop database

To drop the default database run:

```bash
task drop-db
```

## Pin Postgres image version

Define the Postgres image in your `.env` file:

```bash
POSTGRES_IMAGE=postgres:16-alpine
```

## Setup mail catcher

Start mailpit server.

```bash
task start mailpit
```

When you send mails in Odoo they will be catched and shown on <http://localhost:8025/>.

## Forward mails with Odoo Mailgate

Start all containers.

```bash
task start
```

Initialize the Odoo database.

```bash
task exec odoo init-db
```

Log into Odoo and setup an alias for `info@yourcompany.com`.

Send a test mail with swaks:

```bash
swaks --to info@yourcompany.com --from sender@example.com \
  --server localhost:25 \
  --body "This is a test email for the Odoo mailgate system." \
  --header "Subject: Test Email for Odoo"
```

The mail will be forwarded to Odoo.

Trace the mailgate log with:

```bash
docker exec mailgate tail -f /var/log/mail.log
```

You can also send a mail with tls encryption:

```bash
swaks --to info@yourcompany.com --from sender@example.com \
  --server localhost:587 \
  --tls \
  --body "This is a test email for the Odoo mailgate system." \
  --header "Subject: Test Email for Odoo"
```

## Debug Odoo with VSCode

In VSCode define a break point for a selected method.

Run Odoo source with a debugger.

```bash
task debug source
```

In VSCode run `Python - attach debugger` to attach the debugger.

Open [http://localhost:8069](http://localhost:8069) and run the method that you want to debug.

VSCode should jump to the breakpoint and you can step through the method.

## Profile Odoo memory usage

Run Odoo with memray.

```bash
task record-with-memray native
```

Open [http://localhost:8069](http://localhost:8069) and finish the recording with <kbd>ctrl</kbd>+<kbd>c</kbd>.

The flamegraph report will be generated and opened.

## Profile Odoo execution time

Run Odoo and get the process id.

```bash
PID=$(ps -eo pid,comm | grep -m 1 'odoo' | awk '{print $1}')
```

Record the Odoo process with py-spy.

```bash
task record-with-py-spy "$PID"
```

Finish the recording with <kbd>ctrl</kbd>+<kbd>c</kbd>.

The browser will open [https://www.speedscope.app/](https://www.speedscope.app/). Upload the `tmp/speedscope-profiling.json` file.

## Show module depdency tree

Use the `manifestoo` command to reason about module dependencies. The `--addons-path` will be provided.

Here is an example output:

```bash
[main][~/Odoo-Build]$ task manifestoo --select partner_firstname tree
partner_firstname (19.0.1.0.0)
└── base_setup (19.0+c)
    └── web (19.0+c)

```
