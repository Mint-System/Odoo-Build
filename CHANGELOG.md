# Changelog

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## Undefined

### Added

* Run the Odoo upgrade script with `upgrade-odoo`.
* Upgrade module code with `upgrade-module`.
* After switching version branch with `checkout` the new branch is pulled.
* Show revision date in settings page.
* Image has env vars to initialize database.
* `test-docker` uses new env vars to initialize database.
* Extended usage section of Odoo Build README file.
* Use the prefixed `PG` env vars for database connection.

### Fixed

* Append nested module paths to the addons path env var.

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