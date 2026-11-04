Odoo Build
===

[![.github/workflows/deploy-docs.yml](https://github.com/Mint-System/Odoo-Build/actions/workflows/deploy-docs.yml/badge.svg)](https://github.com/Mint-System/Odoo-Build/actions/workflows/deploy-docs.yml) [![.github/workflows/test-project.yml](https://github.com/Mint-System/Odoo-Build/actions/workflows/test-project.yml/badge.svg)](https://github.com/Mint-System/Odoo-Build/actions/workflows/test-project.yml) [![matrix-badge](https://matrix.to/img/matrix-badge.svg)](https://matrix.to/#/#odoo-build:mint-system.ch)

This is the [Mint System](https://www.mint-system.ch/) Odoo development environment.

This projects provides a highly opinionated way to manage and develop Odoo. It features:

- 🔍 **Odoo Source**: Checkout the Odoo Community and Enterprise Edition and start editing the source code.
- 🐳 **Container Compose**: Spin up an Odoo, Postgres, and Mailgate container and experiment locally.
- 💻 **Native**: Start an Odoo server directly from the source.
- 🔄 **Multiple Versions**: With Odoo Build, you can switch between Odoo versions starting from 13.0 up to 19.0.
- 🛠️ **Develop Modules**: Generate new modules, develop new Odoo features locally.
- 📥 **Import and Export Database**: Use Odoo scripts to copy and restore a customer database to the local environment.
- 🤝 **Community Repos**: The most common community repos are checked out when setting up the project.
- ✂️ **Customizing Snippets**: Create [snippets](./snippets/) and push them to an Odoo database.
- 🕰️ **Odoo Revisions**: Snapshot the Odoo source at a specific date. See [revisions](./revisions/) for details.
- 📦 **Container Image**: Build and publish custom Odoo images. See [README](./images/) for details.
- 📓 **Jupyter Notebooks**: Initialize and run Jupyter Lab integrated with Odoo, and execute notebooks with Papermill.

## Requirements

The Odoo development environment has the following requirements:

- [Docker](https://docs.docker.com/engine/install/) or [podman](https://podman.io/docs/installation)
- [uv](https://docs.astral.sh/uv/)
- [curl](https://curl.se/docs/)

**Command Completion (Optional)**

bash/zsh `alias task='./task'` with [completion](https://taskfile.build/usage/#completion).

## Usage

The usage section is a set of workflows. See `task help` for details about the project commands.

Clone this repository.

```bash
git clone git@github.com:Mint-System/Odoo-Build.git
cd Odoo-Build
```

Checkout the Odoo version. Show supported versions with `task list-versions`.

```bash
task checkout "$VERSION"
```

NOTE: checkout downloads >1 GB when a version is downloaded for the first time. This may take some time depending on bandwidth.

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

Run container compose.

```bash
task start
```

Initialize database with the image script.

```bash
task exec odoo init-db
```

Open browser to [http://localhost:8069](http://localhost:8069) and login with `admin:admin`.
