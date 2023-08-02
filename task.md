# Help

| command                     | option            | description                                                                               |
| --------------------------- | ----------------- | ----------------------------------------------------------------------------------------- |
| change-uuid                 | [env]             | Change database uuid via xmlrpc.                                                          |
| checkout                    | [branch][branch]  | Switch and merge from one branch to another.                                              |
| checkout-revision           | [revision]        | Switch to a different Odoo revision by tag name.                                          |
| clear-assets                | [db]              | Clear all assets of Odoo database.                                                        |
| clear-filestore             | [db]              | Clear local filestore folder. No param will clear all filestores. Default is branch name. |
| convert-database            | [db]              | Convert database backup file from postgres 9.5 to latest. Default is branch name.         |
| create-module               | [path]            | Create new Odoo module from template.                                                     |
| disable-auto-install        |                   | Disable auto install for enterprise modules.                                              |
| disable-mailserver          | [env]             | Disable mail server settings via xmlrpc.                                                  |
| drop-db                     | [db]              | Drop target Odoo database. Default is branch name.                                        |
| edit-env                    | [env]             | Open env file in default editor.                                                          |
| generate-admin-passwd       | [pass]            | Generate hash for Odoo master password.                                                   |
| generate-module-translation | [env][path][lang] | Generate translation for Odoo module.                                                     |
| git-feature-branch          | [path]            | Create feature branch for Odoo module.                                                    |
| get-module-version          | [path]            | Get module version from manifest.                                                         |
| git-list-submodules         |                   | List path and url of submodules.                                                          |
| git-mig-branch              | [path]            | Create migration branch for Odoo module.                                                  |
| git-pull-submodules         |                   | Pull alls submodules.                                                                     |
| git-update-submodules       |                   | Update submodules from .gitmodules file.                                                  |
| init-db                     | [db]              | Initialize the Odoo database. Default is branch name.                                     |
| init-next-env               | [env]             | Create env file for Nextcloud instance.                                                   |
| init-odoo-env               | [env]             | Create env file for Odoo Instance.                                                        |
| init-venv                   |                   | Initialize python virtual env.                                                            |
| install-module              | [db][name,path]   | Install target Odoo module.  Default database is branch name.                             |
| install-native              |                   | Install Odoo requirements in source folder.                                               |
| install-odoo-scripts        |                   | Install Odoo scripts.                                                                     |
| install-snippet             | [env][path]       | Install snippet xml definition.                                                           |
| kill                        | [name]            | Remove docker containers and volumes.                                                     |
| lint-module                 | [path]            | Run pylint odoo for module.                                                               |
| lint-snippets               |                   | Run checks for all snippets.                                                              |
| list                        |                   | List docker services.                                                                     |
| list-odoo-env               |                   | List odoo env files.                                                                      |
| logs                        |                   | Tail Odoo Docker container logs.                                                          |
| odoo-cloc                   | [db]              | Count custom line of codes. Default is branch name.                                       |
| patch-database              | [db][path]        | Apply sql file to database. Default database is branch name.                              |
| ps                          |                   | List docker processes.                                                                    |
| release-module              | [path]            | Create GitHub release for a module.                                                       |
| remove-module               | [db][name]        | Remove target Odoo module.                                                                |
| remove-submodule            | [path]            | Remove git submodule.                                                                     |
| reset-views                 | [db][key]         | Execute hard reset on views matching keys.                                                |
| restart                     | [name]            | Restart docker container.                                                                 |
| save-config                 | [name]            | Save Odoo database config                                                                 |
| send-support-mail           |                   | Sends an mail for support@local to smtp://localhost                                       |
| set-admin                   | [db]              | Sets the password for the first user in database. Default is branch name.                 |
| source                      |                   | Source the Python virtual env.                                                            |
| start                       | [name] [db]       | Start docker container. Options: none, db, admin, odoo, native, mail.                     |
| start-psql                  | [db]              | Start PSQL shell in Docker container. Default is branch name.                             |
| start-shell                 | [db]              | Start Odoo shell from source folder. Default is branch name.                              |
| stop                        | [name]            | Stop docker containers.                                                                   |
| switch-branch               | [branch]          | Switch submodules to target branch.                                                       |
| test-jsonrpc                | [env]             | Test json rpc connection.                                                                 |
| test-module                 | [db][name,path]   | Test target Odoo module.                                                                  |
| update-app-list             | [db]              | Update app list.                                                                          |
| update-config               |                   | Update Odoo native and docker config files.                                               |
| update-docs                 |                   | Update project docs.                                                                      |
| update-module               | [db][name,path]   | Update target Odoo module.                                                                |
| update-readme               | [path]            | Update Readme file of Odoo module collection.                                             |
| update-snippet              | [env][path]       | Update snippet xml definition.                                                            |
| upload-module               | [env][path]       | Zip and upload Odoo module.                                                               |
| zip-module                  | [path]            | Create zip file for module.                                                               |