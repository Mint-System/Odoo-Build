# Changelog

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## Undefined

### Removed

- Removed command `setup-mail`.

### Added

- Added OCA maintainer toools repo.
- Repo task and workflow templates to build and publish modules as python packages.
- Added `hatch-odoo` and new command option `start hatch`.
- Repo templates for Odoo 19.0.

### Changed

- Grouped the help table entries.
- Use `odoo-module-migrator` instead of `upgrade_code` command.
- Renamed `upgrade-module` to `migrate-module`.
- **BREAKING**: Replaced `ODOO_INIT_DEMO_DATA` to `WITHOUT_DEMO`.
- Env var `IR_CONFIG_PARAMETER` to append to ir config section.
- **BREAKING**: Renamed `ENVIRONMENT` to `RUNNING_ENV`.
- **BREAKING**: Renamed `native` to `source`.
- Simplified the install command.
- Replace `generate-module-docs` with `generate-oca-module-docs`.

## 2025-09-12

### Updated

- Refactored the use upgrade util libraries.
- Set `PYTHONPATH` env var.
- Removed any instance `--upgrade-path`.
- The `build`, `push` and `test-image` require folder param.
- Replace `--xmlrpc-port` with `--htt-port`.

### Added

- Support SteamOS.
- Odoo 19.0 version folder.
- Set `pgvector/pgvector:pg16-trixie` as default postgres image.
- Added Python version condition to upgrade-util lib.

### Fixed

- Removed `ls-modules` and updated `list-modules`.
- Make task script grep `-P` free.

## 2025-08-22

### Added

- Support Arch Linux.
- Odoo Docker image healthcheck.
- On install the Odoo upgrade utils are cloned.
- Odoo Docker image ships with upgrade utils.
- Test the upgrade utils.
- Split `checkout-revision` into `load-revision`.
- Added `download-git-folder` command.
- Docker image supports linux arm64.

### Updated

- The `build.yml` workflow builds the Docker image.

### Fixed

- Change sysctl conf file.
- Add submodule will checout branch.

## 2025-07-15

### Added

- Export import website data with `export-website-data` and `import-website-data`.
- Odoo image scripts `setup-tests` and `run-tests`.
- Extended `test-project` with module tests.
- New command `exec` to run commands in containers.
- New env var to include and exclude modules for tests.
- Command `reset-venv`.
- Another Odoo image script `update-translations`.

### Fixed

- Check grep vs ggrep for Mac OS.
- Wrap system param env vars in odoo conf template.

### Updated

- Export import website data with translations.
- Updated install function to support *Fedora Linux*.

## 2025-05-16

### Added

- Odoo image env vars to set initial admin login and password.
- Added script `init-module` to Odoo image.
- Odoo image supports verify-ca as postgres ssl mode.

### Updated

- Rename `start-psql` to `psql` and `start-shell` to `shell`.
- Added code parameter to `shell` command.
- Renamed `install-native` to `install`.
- Removed `start queue`.
- Do not check version in module manifest files.
- Updated the `setup-mail` script.
- Make pg ssl mode the default.

### Fixed

- Wrappend ssh key env vars in `.env.template`.
- Set default value for smtp_port to 0.
- Improved regex pattern to match module manifest version.

### Removed

- Command `setup-mail-sql` is gone.
- Removed Odoo scripts as requirement.

## 2025-05-16

### Added

- Smtp connection vars for server mail.
- Add `coding-guidelines.py` to pre-commit for templates 18.0.
- New Docker image `odoo-mailgate`.
- Clone task file repo on install.

### Updated

- The env var `CLICK_ODOO_UPDATE` has been renamed to `AUTO_UPDATE_MODULES`.
- Support any container name with `logs <name>`.
- Added the compose vars.
- Import selected commands from taskfile repo.
- The help command supports a grep param.
- Moved develop instructions of images to main readme.

## 20205-04-28

### Added

- Added license files to Docker images.
- New Docker image `odoocli`.
- Refactored the `visualize-dependencies` command.
- Odoo image script `download-odoo-enterprise`

### Updated

- Distinct between git submodules and git folders.
- Docker ignore file selects only necessary files.
- Mark odoo and entprise git modules as shallow.
- Set empty default for Odoo image db filter
- Update `odoo/Dockerfile` with multi stage build

## 2025-03-20

### Added

- New commands to analyse odoo: `debug`, `record-with-py-spy` and `record-with-memray`.
- Integrated memray into the Odoo image.
- Added a separate readme file in images folder.

### Updated

- Renamed `test-container` to `test-project`.
- Rename `docker-compose` to `compose`.
- Renamed `init-git-submodule` to `clone-git-submdule`.
- Updated `*-git-subodule` commands to clone repos without git submodule.
- Renamed `image` to `images`.
- Renamed `-git-submodule` to `-git-folder`.

### Removed

- Removed all git submodules

## 2025-03-20

### Added

- Update module docs with `update-module-docs`.
- Added develop section with guied on how to update the repo templates.
- Config for pre-commit added.
- Added `versions` and `revisions` folder.
- The new command `save-version` stores the Odoo version files.

### Updated

- Changed base image to `python:3.12-slim-bookworm`.
- Renamed all task functions to match the naming pattern.
- Updated the repo templates for 16.0, 17.0 and 18.0.
- Renamed all files in `bin` folder.
- Renamed the `generate-*-docs` commands.
- The `checkout` command loads the Odoo version from the `versions` folder.
- Moved all revision definitions to the `revisions` folder.

### Removed

- Removed everything related to Kubernetes.
- Removed repo templates for 14.0 and 15.0.
- Removed any user/group definitions from image.
- These commands have been removed: `checkout-config-files`, `save-config`.
- These files have been removed: `.gitmodules`, `.python-version`.

### Fixed

- Missing dependency `rlPyCairo` in Docker image.

## 2025-02-20

### Fixed

- Escape double quotes for database name in create statement.

### Added

- Commands to update git submodules in batch `-status`, `-commit-all`, `-push`.
- Support `GITHUB_USERNAME` and `GITHUB_PERSONAL_ACCESS_TOKEN` in image.
- Install `pnpm` instead of `npm`.

### Updated

- Ensure that `image/scripts/setup-mail` and `scripts/setup-mail` have the same structure.
- Command `setup-mail` is tested with `test-container`.
- Renamed `scripts` to `bin`.
- Refactored the initialisation of the Odoo image.
- Removed xml header from snippet files.
- Switched from Python 3.11 to 3.12.

### Removed

- Remove Odoo patch scripts.
- Removed `node-less` and `npm` packages from image.

## 2025-01-27

### Added

- Build Docker image for `linux/amd64` and `linux/arm64`.
- Store and restore `.env` to pass store with `pass-store-dotenv` and `pass-restore-dotenv`.
- Init database with selected modules defined in `ODOO_INIT_ADDONS`.
- Enable mail server configuration from env vars.
- Support podman as container engine.
- Docker compose file is now a template `template-docker-compose`.
- Command to update module code with LLMs `llm-update`.
- Add LLM integration as feature to the README.

### Updated

- Ensure `templates/task` is using `uv`.
- Split functions in `entrypoint.sh` into multiple scripts.
- Ensure task file matches <https://taskfile.build> specification.
- Fallback to empty string for docker compose env vars.
- Renamed `DOCKER` to `CONTAINER` and `docker` to `container`.

### Fixed

- Set default `base,web` for server environment module.

## 2025-01-10

### Added

- Run the Odoo upgrade script with `upgrade-odoo`.
- Upgrade module code with `upgrade-module`.
- After switching version branch with `checkout` the new branch is pulled.
- Image shows revision date in settings page.
- Image supports env vars to initialize database.
- `test-docker` uses new env vars to initialize database.
- Test image features with `test-docker`.
- Extended usage section of the Image README file.
- Use prefixed `PG` env vars for database connection.
- Image supports auto update modules with click-odoo.
- New commands to manage snippets `disable-snippet` and `remove-snippet`.
- Support `MODULE_AUTO_INSTALL_DISABLED` for native path.
- Shallow checkout for submodules with option `shallow = true`.
- Replace `pip` with `uv`.

### Updated

- Command `test-xmlrpc` renamed to `test-xmlrpc`.
- Refactored `odoocli` cli.
- Added emojies to the README feature list.
- Rename `build` folder to `image`.
- Moved selected Python packages to `requirements.txt`.

### Fixed

- Append nested module paths to the addons path env var.

### Removed

- Removed `logo.png`.
- Removed `scripts/jsonrpc`.
- Removed commands `get-jsonrpc-session`, `odoo-checkin` and `odoo-checkout`.
- Removed `odoorpc` from requirements.txt.
- Removed packages for `psql`.
- Removed command `disable-auto-install`.

## 2024-12-16

### Added

- New commands `lint-module-repo` and `test-module-repo` to test all modules in repo.
- New test commands `task test-k8s` and `task test-docker` for CI.
- Run test commands on every push  and PR.
- Show GitHub action badge in README file.
- Odoo Build image load ssh private and public key to Odoo config. They can be used with `git_base`.
- Added command `show-revision`
- Added command `git-fetch`

### Updated

- All functions in `task` have been sorted and grouped.
- `checkout-revision` updates var in `.env` file.
- Replaced Mailhog with Mailpit
- Refactored Odoo revision scripts.

## 2024-11-27

### Added

There are new commands in the Odoo Build project:

- `task create-revision` ⁠David Denicolò I use this command to define a new Odoo Revision. Here is the latest: [https://github.com/Mint-System/Odoo-Build/blob/16.0/scripts/odoo_revision_16.0.20241125](https://github.com/Mint-System/Odoo-Build/blob/16.0/scripts/odoo_revision_16.0.20241125 "https://github.com/mint-system/odoo-build/blob/16.0/scripts/odoo_revision_16.0.20241125")
- `task start-kind` / `task start-minikube` to deploy a local Kubernetes cluster
- `task k8s-apply` to deploy Odoo to the Kubernetes cluster
- `task create-module` / `task generate-module-model` / `generate-module-security` for bootstraping new modules
- `task list-revisions` to list the available revisions.
- The config folder has been removed. When starting Odoo with `task start native` the `odoo.conf.template` will be templated with env vars.
- `task test-json-rpc` has now a model parameter.

## 2024-11-13

### Added

- Boostrap modules with `task create-module|generate-module-model|generate-module-security`
- Updated module templates in `templates`
- Start and deploy to Minikube (Kubernetes) `task start-minikube|init-minikube` see `k8s` folder for details
- Removed `compose` in favor of `docker compose` plugin
- Updated troubleshooting section
