| command              | option       | description                                                       |
| -------------------- | ------------ | ----------------------------------------------------------------- |
| clear-assets         | [db]         | Clear Odoo assets.                                                |
| clear-filestore      | [db]         | Clear local filestore folder. No param will clear all filestores. |
| convert-database     | [db]         | Convert database backup file from postgres 9.5 to latest.         |
| create-module        | [path]       | Create new Odoo module from template.                             |
| disable-auto-install |              | Disable auto install for enterprise modules.                      |
| disable-mailserver   | [env]        | Disable mail server settings via xmlrpc.                          |
| drop-db              | [db]         | Drop target Odoo database. Default is odoo                        |
| init-db              | [db]         | Initialize the Odoo database. Default is odoo                     |
| init-next-env        | [env]        | Create env file for Nextcloud instance.                           |
| init-odoo-env        | [env]        | Create env file for Odoo Instance.                                |
| init-venv            |              | Initialize python virtual env.                                    |
| install-module       | [db] [name]  | Install target Odoo module.                                       |
| install-odoo-scripts |              | Install Odoo scripts.                                             |
| install-native       |              | Install Odoo requirements in source folder.                       |
| kill                 |              | Remove docker containers and volumes.                             |
| lint-module          | [path]       | Run pylint odoo for module.                                       |
| logs                 |              | Tail Odoo Docker container logs.                                  |
| odoo-cloc            | [db]         | Count custom line of codes.                                       |
| release-module       | [path]       | Create GitHub release for a module.                               |
| remove-module        | [db] [name]  | Remove target Odoo module.                                        |
| remove-submodule     | [path]       | Remove git submodule.                                             |
| restart              | [name]       | Restart docker container. Options: none, db, mail                 |
| start                | [name]       | Start docker container. Options: none, db, mail, native           |
| save-config          | [name]       | Save Odoo database config                                         |
| start-psql           | [db]         | Start PSQL shell in Docker container.                             |
| start-shell          | [db]         | Start Odoo shell from source folder.                              |
| stop                 |              | Stop docker containers.                                           |
| update-config        |              | Update odoo config.                                               |
| update-app-list      | [db]         | Update app list.                                                  |
| update-module        | [db] [name]  | Update target Odoo module.                                        |
| update-odoo-view     | [env] [path] | Update view xml definition.                                       |
| upload-module        | [env] [path] | Zip and upload Odoo module.                                       |
| zip-module           | [path]       | Create zip file for module.                                       |