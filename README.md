Odoo Build
===

![Vercel](https://vercelbadge.vercel.app/api/mint-system/odoo-build) [![Docker pulls](https://img.shields.io/docker/pulls/mintsystem/odoo)](https://hub.docker.com/r/mintsystem/odoo/) [![.github/workflows/test.yml](https://github.com/Sozialinfo/Odoo-Build/actions/workflows/test.yml/badge.svg)](https://github.com/Sozialinfo/Odoo-Build/actions/workflows/test.yml) [![matrix-badge](https://matrix.to/img/matrix-badge.svg)](https://matrix.to/#/!gmucNdFKeaGvdzcGTP:mint-system.ch?via=mint-system.ch)

This is the [Sozialinfo](https://www.sozialinfo.ch/) Odoo development environment.

This projects provides a highly opinionated way to manage and develop Odoo. It features:

* 🔍 **Odoo Source**: Checkout the Odoo Community and Enterprise Edition and start editing the source code.
* 🐳 **Container Compose**: Spin up an Odoo, Postgres, and pgAdmin container and experiment locally.
* 💻 **Native**: Start an Odoo server directly from the source.
* 🔄 **Multiple Versions**: With Odoo Build, you can switch between Odoo versions starting from 13.0 up to 18.0.
* 🛠️ **Develop Modules**: Scaffold new modules, develop new Odoo features locally.
* 📥 **Import and Export Database**: Use Odoo scripts to copy and restore a customer database to the local environment. Investigate issues and deploy the database with ease.
* 🤝 **Community Repos**: The most common community repos are checked out when setting up the project.
* ✂️ **Customizing Snippets**: Create [snippets](./snippets.md) and push them to an Odoo database.
* 🕰️ **Odoo Revisions**: Snapshot the Odoo source at a specific date. See [revisions](./revisions.md) for details.
* 📦 **Container Image**: Build and publish a custom Odoo images. See [README](./images/README.md) for details.
* 🔑 **Credentials**: Manage login credentials for Odoo and Nextcloud.
* ⬆️ **Odoo Upgrade**: Helper commands to ease the Odoo upgrade process.
* 🧠 **LLM**: Prompt LLMs with module code and apply changes.
* 🚀 **And More**: See [task help](./task.md).

## Requirements

The Odoo development environment has the following requirements:

* [Docker](https://docs.docker.com/engine/install/) or [podman](https://podman.io/docs/installation)
* Install Python 3.12+ with [uv](https://docs.astral.sh/uv/): `uv python install`

#### MacOS

MacOS has the following additional requirements:

```bash
brew install grep gettext
```

**Command Completion (Optional)**

bash/zsh alias `task='./task'` with [completion](https://taskfile.build/#completion).

**Nix (Optional)**

You can use [Nix](https://nixos.org/) to setup the requirements.

**LLM (Optional)**

Install the [llm](https://datasette.io/tools/llm) cli to make use of the LLM features.

## Usage

The usage section is a set of workflows. See `task help` or [task](./task.md) for details about the project commands.

Clone this repository.

```bash
git clone git@github.com:Sozialinfo/Odoo-Build.git
cd Odoo-Build
```

When working with Nix, run the nix-shell.

```bash
nix-shell
```

Checkout the Odoo version. Show supported versions with `task list-versions`.

```bash
task checkout "$VERSION"
```

Install build and Python dependencies. Currently supported: Arch Linux, Darwin, Debian, Fedora, Ubuntu, Pop!\_OS, Windows with Ubuntu on WSL2.

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
task start native
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
task run odoo init-db
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

### Load modules from thirdparty folder

Clone thirdparty repos into the `thirdparty` folder.

To load modules from a thirdparty folder, set this env var in your `.env` file:

```bash
ODOO_ADDONS_PATH=thirdparty/odoo-apps-partner-contact,../odoo-cd/untracked-odoo-apps
```

The paths will be appended to the Odoo config.

### Initialize without demo data

In your `.env` file define this Odoo parameter env var:

```bash
ODOO_PARAM=--without-demo=all
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

### Remove containers

Removes containers and volumes.

```bash
task remove
```

### Stop all containers

Without service name the stop commands stops all containers.

```bash
task stop
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

Ensure your container setup can build [multi-platform images](https://docs.docker.com/desktop/features/containerd/#build-multi-platform-images).

Checkout latest revision of the Odoo version.

```bash
task checkout-latest-revision
```

Build the Odoo image.

```bash
task build
```

Test the image.

```bash
task test-project
```

Publish the Odoo image.

```bash
task publish
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

### Update the Odoo Upgrade script

Update the upgrade script:

```bash
wget https://upgrade.odoo.com/upgrade -O image/odoo-upgrade/bin/upgrade
```

### Forward mails with Odoo Mailgate

Start all containers.

```bash
task start
```

Initialize the Odoo database.

```bash
task run odoo init-db
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
task create-revision 18.0.20250520
```

Replace all image references in the docs.

### Update repo template from oca-addons-repo-template

Install copier.

```bash
source task source
uv pip install copier
```

Run copier and select ruff as linter.

```bash
copier copy --UNSAFE https://github.com/OCA/oca-addons-repo-template.git "templates/$VERSION"
```

Remove unnecessary linter files.

```bash
cd "templates/$VERSION"
rm -rf .github
rm .copier-answers.yml
rm .flake8
rm .isort.cfg
rm .pylintrc-mandatory
rm README.md
```

In `.pre-commit-config.yaml` remove mandatory pylint odoo:

```yaml
  - id: pylint_odoo
    args:
      - --rcfile=.pylintrc-mandatory
```

In `.pylintrc` remove these rules:

* missing-return
* duplicate-xml-record-id
* redefined-builtin

In the `.ruff.toml` set this option:

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

Run Odoo native with a debugger.

```bash
task debug native
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

The flamegraph report will be generated an opened.

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
