# Changelog

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## 20205-04-28

### Added

* Added license files to Docker images.
* New Docker image `odooctl`.
* Refactored the `visualize-dependencies` command.
* Odoo image script `download-odoo-enterprise`

### Updated

* Distinct between git submodules and git folders.
* Docker ignore file selects only necessary files.
* Mark odoo and entprise git modules as shallow.
* Set empty default for Odoo image db filter
* Update `odoo/Dockerfile` with multi stage build

## 2025-03-20

### Added

* New commands to analyse odoo: `debug`, `record-with-py-spy` and `record-with-memray`.
* Integrated memray into the Odoo image.
* Added a separate readme file in images folder.

### Updated

* Renamed `test-container` to `test-project`.
* Rename `docker-compose` to `compose`.
* Renamed `init-git-submodule` to `clone-git-submdule`.
* Updated `*-git-subodule` commands to clone repos without git submodule.
* Renamed `image` to `images`.
* Renamed `-git-submodule` to `-git-folder`.

### Removed

- Removed all git submodules

## 2025-03-20

### Added

* Update module docs with `update-module-docs`.
* Added develop section with guied on how to update the repo templates.
* Config for pre-commit added.
* Added `versions` and `revisions` folder.
* The new command `save-version` stores the Odoo version files.

### Updated

* Changed base image to `python:3.12-slim-bookworm`.
* Renamed all task functions to match the naming pattern.
* Updated the repo templates for 16.0, 17.0 and 18.0.
* Renamed all files in `bin` folder.
* Renamed the `generate-*-docs` commands.
* The `checkout` command loads the Odoo version from the `versions` folder.
* Moved all revision definitions to the `revisions` folder.

### Removed

* Removed everything related to Kubernetes.
* Removed repo templates for 14.0 and 15.0.
* Removed any user/group definitions from image.
* These commands have been removed: `checkout-config-files`, `save-config`.
* These files have been removed: `.gitmodules`, `.python-version`.

### Fixed

* Missing dependency `rlPyCairo` in Docker image.

## 2025-02-20

### Fixed

* Escape double quotes for database name in create statement.

### Added

* Commands to update git submodules in batch `-status`, `-commit-all`, `-push`.
* Support `GITHUB_USERNAME` and `GITHUB_PERSONAL_ACCESS_TOKEN` in image.
* Install `pnpm` instead of `npm`.

### Updated

* Ensure that `image/scripts/setup-mail` and `scripts/setup-mail` have the same structure.
* Command `setup-mail` is tested with `test-container`.
* Renamed `scripts` to `bin`.
* Refactored the initialisation of the Odoo image.
* Removed xml header from snippet files.
* Switched from Python 3.11 to 3.12.

### Removed

* Remove Odoo patch scripts.
* Removed `node-less` and `npm` packages from image.

## 2025-01-27

### Added

* Build Docker image for `linux/amd64` and `linux/arm64`.
* Store and restore `.env` to pass store with `pass-store-dotenv` and `pass-restore-dotenv`.
* Init database with selected modules defined in `ODOO_INIT_ADDONS`.
* Enable mail server configuration from env vars.
* Support podman as container engine.
* Docker compose file is now a template `template-docker-compose`.
* Command to update module code with LLMs `llm-update`.
* Add LLM integration as feature to the README.

### Updated

* Ensure `templates/task` is using `uv`.
* Split functions in `entrypoint.sh` into multiple scripts.
* Ensure task file matches <https://taskfile.build> specification.
* Fallback to empty string for docker compose env vars.
* Renamed `DOCKER` to `CONTAINER` and `docker` to `container`.

### Fixed

* Set default `base,web` for server environment module.

## 2025-01-10

### Added

* Run the Odoo upgrade script with `upgrade-odoo`.
* Upgrade module code with `upgrade-module`.
* After switching version branch with `checkout` the new branch is pulled.
* Image shows revision date in settings page.
* Image supports env vars to initialize database.
* `test-docker` uses new env vars to initialize database.
* Test image features with `test-docker`.
* Extended usage section of the Image README file.
* Use prefixed `PG` env vars for database connection.
* Image supports auto update modules with click-odoo.
* New commands to manage snippets `disable-snippet` and `remove-snippet`.
* Support `MODULE_AUTO_INSTALL_DISABLED` for native path.
* Shallow checkout for submodules with option `shallow = true`.
* Replace `pip` with `uv`.

### Updated

* Command `test-xmlrpc` renamed to `test-xmlrpc`.
* Refactored `odooctl` cli.
* Added emojies to the README feature list.
* Rename `build` folder to `image`.
* Moved selected Python packages to `requirements.txt`.

### Fixed

* Append nested module paths to the addons path env var.

### Removed

* Removed `logo.png`.
* Removed `scripts/jsonrpc`.
* Removed commands `get-jsonrpc-session`, `odoo-checkin` and `odoo-checkout`.
* Removed `odoorpc` from requirements.txt.
* Removed packages for `psql`.
* Removed command `disable-auto-install`.

## 2024-12-16

### Added

* New commands `lint-module-repo` and `test-module-repo` to test all modules in repo.
* New test commands `task test-k8s` and `task test-docker` for CI.
* Run test commands on every push  and PR.
* Show GitHub action badge in README file.
* Odoo Build image load ssh private and public key to Odoo config. They can be used with `git_base`.
* Added command `show-revision`
* Added command `git-fetch`

### Updated

* All functions in `task` have been sorted and grouped.
* `checkout-revision` updates var in `.env` file.
* Replaced Mailhog with Mailpit
* Refactored Odoo revision scripts.

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
