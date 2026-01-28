Odoo Build
===

![Vercel](https://vercelbadge.vercel.app/api/mint-system/odoo-build) [![.github/workflows/test.yml](https://github.com/Mint-System/Odoo-Build/actions/workflows/test.yml/badge.svg)](https://github.com/Mint-System/Odoo-Build/actions/workflows/test.yml) [![matrix-badge](https://matrix.to/img/matrix-badge.svg)](https://matrix.to/#/!gmucNdFKeaGvdzcGTP:mint-system.ch?via=mint-system.ch)

This is the [Mint System](https://www.mint-system.ch/) Odoo development environment.

This projects provides a highly opinionated way to manage and develop Odoo. It features:

- 🔍 **Odoo Source**: Checkout the Odoo Community and Enterprise Edition and start editing the source code.
- 🐳 **Container Compose**: Spin up an Odoo, Postgres, and pgAdmin container and experiment locally.
- 💻 **Native**: Start an Odoo server directly from the source.
- 🔄 **Multiple Versions**: With Odoo Build, you can switch between Odoo versions starting from 13.0 up to 19.0.
- 🛠️ **Develop Modules**: Generate new modules, develop new Odoo features locally.
- 📥 **Import and Export Database**: Use Odoo scripts to copy and restore a customer database to the local environment.
- 🤝 **Community Repos**: The most common community repos are checked out when setting up the project.
- ✂️ **Customizing Snippets**: Create [snippets](./snippets.md) and push them to an Odoo database.
- 🕰️ **Odoo Revisions**: Snapshot the Odoo source at a specific date. See [revisions](./revisions.md) for details.
- 📦 **Container Image**: Build and publish custom Odoo images. See [README](./images/README.md) for details.
- 🔑 **Credentials**: Manage login credentials for Odoo and other applications.
- ⬆️ **Odoo Upgrade**: Helper commands to ease the Odoo [upgrade](./upgrade.md) process.
- 🚀 **And More**: See [task help](./task.md).

## Requirements

The Odoo development environment has the following requirements:

- [Docker](https://docs.docker.com/engine/install/) or [podman](https://podman.io/docs/installation)
- [uv](https://docs.astral.sh/uv/)
- [curl](https://curl.se/docs/)

**Command Completion (Optional)**

bash/zsh `alias task='./task'` with [completion](https://taskfile.build/#completion).

## Usage

The usage section is a set of workflows. See `task help` or [task](./task.md) for details about the project commands.

Clone this repository.

```bash
git clone git@github.com:Mint-System/Odoo-Build.git
cd Odoo-Build
```

Checkout the Odoo version. Show supported versions with `task list-versions`.

NOTE: checkout downloads >1 GB when a version is downloaded for the first time. This may take some time depending on bandwidth.

```bash
task checkout "$VERSION"
```

Install build and Python dependencies. Currently supported: Arch Linux, Darwin, Debian, Fedora, Ubuntu, Pop!\_OS, SteamOS, Windows with Ubuntu on WSL2.

```bash
task install
```

Decide wether you want to run Odoo in native mode (recommended) or as a container.

### Run Odoo from source

Start database container only.

```bash
task start db
```

Initialize database.

```bash
task init-db
```

Start Odoo from source.

```bash
task start source
```

The browser will be opened automatically.

### Run Odoo as container

Set the Odoo addons path in your `.env` file:

```bash
ODOO_ADDONS_PATH=/mnt/addons/,/mnt/oca/,/mnt/enterprise,/mnt/themes/
```

Run container compose.

```bash
task start
```

Initialize database with the image script.

```bash
task exec odoo init-db
```

Open browser to [http://localhost:8069](http://localhost:8069) and login with `admin:admin`.

## Development

### Create a new module from source

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

### Load modules from external folder

To load modules from a external folder, set this env var in your `.env` file:

```bash
ODOO_ADDONS_PATH=/path/to/your/module-repo,../odoo-project/odoo-apps
```

The paths will be appended to the Odoo config.

### Initialize without demo data

In your `.env` file set this env var:

```bash
WITHOUT_DEMO=True
```

### Set Odoo database name

The default database name is the checked out Odoo version.

To define another name, set this env var in your `.env` file:

```bash
ODOO_DATABASE=odoo
```

### Disable browser open

To disable the browser open when starting the Odoo server edit the `.env` file:

```bash
BROWSER_OPEN=false
```

### Set podman as container engine

If you are using podman, set this `.env` var:

```bash
CONTAINER_ENGINE=podman
```

### Change log level

To change the log level of Odoo set this env var in your `.env` file:

```bash
LOG_LEVEL=debug
```

### Manage database with container

Start pgadmin.

```bash
task pgadmin
```

Open pgadmin [http://localhost:8000/](http://localhost:8000/) and login with `admin@example.com:admin`.

### Stop all containers

Without service name the stop commands stops all containers.

```bash
task stop
```

### Remove containers

Removes containers and volumes.

```bash
task remove
```

### Drop database

To drop the default database run:

```bash
task drop-db
```

### Define Postgres image version

Define the Postgres image in your `.env` file:

```bash
POSTGRES_IMAGE=postgres:16-alpine
```

### Build and publish container image

Ensure the host machine can build [multi-platform images](https://docs.docker.com/desktop/features/containerd/#build-multi-platform-images).

Checkout latest revision of the Odoo version.

```bash
task checkout-latest-revision
```

Build and publish the Odoo image.

```bash
task build images/odoo --push
```

### Setup mail catcher

Start mailpit server.

```bash
task start mailpit
```

When you send mails in Odoo they will be catched and shown on <http://localhost:8025/>.

### Source env file

Assuming the name of the environment is `test`, you source env vars like this:

```bash
eval "$(task show-env test)"
```

### Forward mails with Odoo Mailgate

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

### Create Odoo revision

Check the latest official Odoo image tag on <https://hub.docker.com/_/odoo/tags>.

Replace the `-` with a `.` in the tag name and create a revision:

```bash
task create-revision "$VERSION.YYYYDDMM"
```

Replace all image references in the docs.

Commit and push revision with tag:

```bash
task commit-and-push-revision
```

### Update repo template from oca-addons-repo-template

Run copier to copy the OCA template fiels

```bash
source task source
copier copy --UNSAFE https://github.com/OCA/oca-addons-repo-template.git "templates/$VERSION"
```

Answer with:

- `$VERSION`
- `Mint-System`
- `Mint System GmbH`
- `server-tools`
- `Enter` for all remaining questions.

Remove unnecessary linter files.

```bash
cd "templates/$VERSION"
rm .copier-answers.yml
rm .pylintrc-mandatory
rm README.md
```

Restore the folder `templates/$VERSION/.github` and update `templates/$VERSION/.gitignore` with:

```txt
# Odoo Build
tmp
```

In `.pre-commit-config.yaml` remove mandatory pylint odoo:

```yaml
  - id: pylint_odoo
    args:
      - --rcfile=.pylintrc-mandatory
```

And set `https://www.mint-system.ch/` as args for the mainainter-tools.

In the `.ruff.toml` set this option at the top:

```toml
line-length = 120
```

Template the server tools repo and run the linter:

```bash
task template-repo addons/server_tools
cd addons/server_tools
task all
```

Refine the templates based on the linter results.

### Debug Odoo with VSCode.

In VSCode define a break point for a selected method.

Run Odoo source with a debugger.

```bash
task debug source
```

In VSCode run `Python - attach debugger` to attach the debugger.

Open [http://localhost:8069](http://localhost:8069) and run the method that you want to debug.

VSCode should jump to the breakpoint and you can step through the method.

### Profile Odoo memory usage

Run Odoo with memray.

```bash
task record-with-memray native
```

Open [http://localhost:8069](http://localhost:8069) and finish the recording with <kbd>ctrl</kbd>+<kbd>c</kbd>.

The flamegraph report will be generated and opened.

### Profile Odoo execution time

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


### Show module depdency tree

Use the `manifestoo` command to reason about module dependencies. The `--addons-path` will be provided.

Here is an example output:

```bash
[main][~/Odoo-Build]$ task manifestoo --select partner_firstname tree
partner_firstname (19.0.1.0.0)
└── base_setup (19.0+c)
    └── web (19.0+c)

```
