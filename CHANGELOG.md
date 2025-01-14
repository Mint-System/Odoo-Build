# Changelog

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## Undefined

### Added

* Build Docker image for `linux/amd64` and `linux/arm64`.
* Store and restore `.env` to pass store with `pass-store-dotenv` and `pass-restore-dotenv`.

### Updated

* Ensure `templates/task` is using `uv.

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
* Moved selected Python packages to requirements.txt.

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
- Removed `docker-compose` in favor of `docker compose` plugin
- Updated troubleshooting section