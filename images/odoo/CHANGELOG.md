# Changelog

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

### Added

- Support for installing Python packages from `/var/lib/odoo/requirements.txt` via `install-python-packages` script.
- Documentation for `requirements.txt` and updated paths in `README.md` to reflect new virtual environment locations.
- New virtual environment path `/var/lib/odoo/venv` for additional Python packages.
- Support for loading database credentials from files via `db_user_FILE` and `db_password_FILE` environment variables.
- Added `secrets` section in `compose.yml.template` to support loading database credentials from files.

### Changed

- Renamed virtual environment path from `/opt/odoo-venv` to `/opt/odoo/venv` and `/var/lib/odoo/venv` for better separation of Odoo tools and user-installed packages.
- Updated `Dockerfile` to use `/var/lib/odoo/venv` for additional Python packages and adjusted `PATH` accordingly.
- Modified `install-python-packages` to check PyPI availability before installing packages and to install from `requirements.txt` if present.
- Updated `install-python-packages` to use `--no-deps` flag for both `PYTHON_INSTALL` and `requirements.txt` installations.
- Adjusted directory permissions in `Dockerfile` to exclude `/opt/odoo-venv` since it no longer exists.
- Updated `README.md` to reflect new paths and behavior for Python package installation.
- Updated `entrypoint.sh` to support loading database credentials from files via `_FILE` environment variables.
- Renamed `bin/conf` to `bin/config` for consistency.
- Updated `task` script to reflect correct test description for `test-xmlrpc` (now "Test xml rpc connection").

### Fixed

- Fixed test in `task` script to verify `click` is installed in `/var/lib/odoo/venv/` when using `requirements.txt`.

## 2026-01-29

### Added

- Support `git-aggregator`.
- Split SSH key management into `add-ssh-key` and `remove-ssh-key`.
- Add new env vars: `DB_MAXCONN`, `LOG_DB`, `LOG_HANDLER`, `LOGFILE`, `LIMIT_MEMORY_HARD`, `LIMIT_MEMORY_SOFT`, `LIMIT_MEMORY_HARD_GEVENT`, `LIMIT_MEMORY_SOFT_GEVENT`.
- Env var `ADDITIONAL_ODOO_RC` to append custom config to main section.
- Env var `IR_CONFIG_PARAMETER` to append to ir config section.
- Env var `ODOO_ENTERPRISE_PATH` to set path to Odoo Enterprise modules.
- Add support to start a nginx proxy next to Odoo.
- Add `zip` package.

### Fixed

- Inconsistent naming of `DBFILTER` is now `DB_FILTER`.
- Remove `-e` from Odoo pip install.

### Removed

- Removed the `AUTO_UPDATE_MODULES` env var.
- Removed the `ODOO_DATABASE` env var.

### Changed

- Prefix Odoo image entrypoint echos.
- **BREAKING**: Renamed `ENVIRONMENT` to `RUNNING_ENV`.
- Moved `aggregate-git-repos` to `entrypoint.sh`.
- Support `test-requirements.txt` for `setup-tests`.
- **BREAKING**: Replaced `ODOO_INIT_DEMO_DATA` to `WITHOUT_DEMO`.
- Changed default for `PROXY_MODE` to `True` and `LIST_DB` to `FALSE`.
- Updated bash scripts to follow coding conventions as outlined in `AGENTS.md`.
- Converted variables from uppercase to lowercase for local variables in multiple scripts.
- Updated function declarations to remove the `function` keyword and use `name() { }` syntax.
- Standardized conditional syntax to use `[[...]]` instead of `[...]` in all scripts.
- Ensured proper quoting with single quotes where variable expansion is not needed.
- Moved the `setup-mail` script from Odoo Build to this project.
