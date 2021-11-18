| command              | option           | description                                                       |
| -------------------- | ---------------- | ----------------------------------------------------------------- |
| checkout             | [branch]         | Checkout Odoo Development branch.                                 |
| clear-filestore      | [db]             | Clear local filestore folder. No param will clear all filestores. |
| convert-database     | [db]             | Convert database backup file from postgres 9.5 to latest.         |
| create-module        | [path]           | Create new Odoo module from template.                             |
| disable-auto-install |                  | Disable auto install for enterprise modules.                      |
| disable-mailserver   | [env]            | Disable mail server settings via xmlrpc.                          |
| change-uuid          | [env]            | Change database uuid via xmlrpc.                                  |
| drop-db              | [db]             | Drop target Odoo database. Default is odoo.                       |
| git-list-submodules  |                  | List path and url of submodules.                                  |
| git-pull-submodules  |                  | Pull alls submodules.                                             |
| init-db              | [db]             | Initialize the Odoo database. Default is odoo                     |
| init-next-env        | [env]            | Create env file for Nextcloud instance.                           |
| init-odoo-env        | [env]            | Create env file for Odoo Instance.                                |
| init-venv            |                  | Initialize python virtual env.                                    |
| install-module       | [db] [name,path] | Install target Odoo module.                                       |
| install-odoo-scripts |                  | Install Odoo scripts.                                             |
| install-native       |                  | Install Odoo requirements in source folder.                       |
| kill                 |                  | Remove docker containers and volumes.                             |
| lint-module          | [path]           | Run pylint odoo for module.                                       |
| logs                 |                  | Tail Odoo Docker container logs.                                  |
| list                 |                  | List docker services.                                             |
| ps                   |                  | List docker processes.                                            |
| odoo-cloc            | [db]             | Count custom line of codes.                                       |
| patch-database       | [db] [path]      | Apply sql file to database                                        |
| release-module       | [path]           | Create GitHub release for a module.                               |
| remove-module        | [db] [name]      | Remove target Odoo module.                                        |
| remove-submodule     | [path]           | Remove git submodule.                                             |
| restart              | [name]           | Restart docker container.                                         |
| start                | [name]           | Start docker container.                                           |
| save-config          | [name]           | Save Odoo database config                                         |
| start-psql           | [db]             | Start PSQL shell in Docker container.                             |
| start-shell          | [db]             | Start Odoo shell from source folder.                              |
| stop                 | [name]           | Stop docker containers.                                           |
| test-module          | [db] [name,path] | Test target Odoo module.                                          |
| update-config        |                  | Update odoo config.                                               |
| update-app-list      | [db]             | Update app list.                                                  |
| update-module        | [db] [name,path] | Update target Odoo module.                                        |
| update-snippet       | [env] [path]     | Update snippet xml definition.                                    |
| install-snippet      | [env] [path]     | Install snippet xml definition.                                   |
| upload-module        | [env] [path]     | Zip and upload Odoo module.                                       |
| zip-module           | [path]           | Create zip file for module.                                       |
| update-docs          |                  | Update project docs.                                              |
| source               |                  | Source the Python virtual env.                                    |
