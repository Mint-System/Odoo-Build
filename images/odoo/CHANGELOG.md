# Changelog

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## Undefined

### Added

* Support `git-aggregator`.
* Split SSH key management into `add-ssh-key` and `remove-ssh-key`.
* Env var `PYTHON_INSTALL_ADDONS_REQUIREMENTS` to enable packages from `requirements.txt`.
* Add new env vars: `DB_MAXCONN`, `LOG_DB`, `LOG_HANDLER`, `LOGFILE`, `LIMIT_MEMORY_HARD`, `LIMIT_MEMORY_SOFT`, `LIMIT_MEMORY_HARD_GEVENT`, `LIMIT_MEMORY_SOFT_GEVENT`.

### Updated

* Prefix Odoo image entrypoint echos.
* BREAKING: Renamed `ENVIRONMENT` to `RUNNING_ENV`.
* Moved `aggregate-git-repos` to `entrypoint.sh`
