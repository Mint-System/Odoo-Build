# Changelog

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## Undefined

### Added

* Support `git-aggregator`.
* Split SSH key management into `add-ssh-key` and `remove-ssh-key`.
* Add new env vars: `DB_MAXCONN`, `LOG_DB`, `LOG_HANDLER`, `LOGFILE`, `LIMIT_MEMORY_HARD`, `LIMIT_MEMORY_SOFT`, `LIMIT_MEMORY_HARD_GEVENT`, `LIMIT_MEMORY_SOFT_GEVENT`.

### Updated

* Prefix Odoo image entrypoint echos.
* **BREAKING**: Renamed `ENVIRONMENT` to `RUNNING_ENV`.
* Moved `aggregate-git-repos` to `entrypoint.sh`.
* Support `test-requirements.txt` for `setup-tests`.
* **BREAKING**: Replaced `ODOO_INIT_DEMO_DATA` to `WITHOUT_DEMO`.
* Changed default for `PROXY_MODE` to `True` and `LIST_DB` to `FALSE`.

### Fixed

* Inconsistent naming of `DBFILTER` is now `DB_FILTER`.