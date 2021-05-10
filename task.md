| command              | option       | description                                                               |
| -------------------- | ------------ | ------------------------------------------------------------------------- |
| activate-venv        |              | Activate python virtual env.                                              |
| clear-assets         | [db]         | Clear Odoo assets.                                                        |
| clear-filestore      | [db]         | Clear local filestore folder. Pass not param to clear all filestores.     |
| convert-database     | [db]         | Convert database backup file from postgres 9.5 to latest.                 |
| create-module        | [path]       | Create new Odoo module from template.                                     |
| disable-auto-install |              | Disable auto install for enterprise modules.                              |
| disable-mailserver   | [env]        | Disable mail server settings via xmlrpc.                                  |
| drop-db              | [db]         | Drop target Odoo database.                                                |
| init-db              | [db]         | Initialize the Odoo database. Optionally pass db name.                    |
| init-next-env        | [env]        | Create env file for Nextcloud instance.                                   |
| init-odoo-env        | [env]        | Create env file for Odoo Instance.                                        |
| init-venv            |              | Initialize python virtual env.                                            |
| install-module       | [db] [name]  | Install target Odoo module.                                               |
| install-odoo-scripts |              | Install Odoo scripts.                                                     |
| install-src          |              | Install Odoo requirements in source folder.                               |
| kill                 |              | Remove docker containers and volumes.                                     |
| logs                 |              | Tail Odoo Docker container logs.                                          |
| release-module       | [path]       | Create GitHub release for module.                                         |
| remove-module        | [db] [name]  | Remove target Odoo module.                                                |
| restart              | [name]       | Restart docker container. Options: none, db, mail                         |
| start                | [name]       | Start docker container. Options: none, db, mail, src                      |
| start-shell          | [db]         | Start Odoo shell from source folder.                                      |
| stop                 |              | Stop docker containers.                                                   |
| update-app-list      | [db]         | Update app list.                                                          |
| update-module        | [db] [name]  | Update target Odoo module.                                                |
| update-odoo-view     | [env] [path] | Update view xml definition.                                               |
|                      |              | `task update-odoo-view myenv snippets/mrp.report_mrporder.show_stock.xml` |
| upload-module        | [env] [path] | Zip and upload Odoo module.                                               |
| zip-module           | [path]       | Create zip file for module.                                               |