| Command                   | Option               | Description                                                                                |
|---------------------------|----------------------|--------------------------------------------------------------------------------------------|
| activate-venv             |                      | Activate virtualenv.                                                                       |
| build                     | [platform]           | Build Odoo Conainer image. Optionally define the target platform.                          |
| change-uuid               | [env]                | Change database uuid via xmlrpc.                                                           |
| checkout                  | [branch]             | Checkout Odoo version / branch.                                                            |
| checkout-all              |                      | Checkout every Odoo version / branch.                                                      |
| checkout-config-files     | [branch]             | Checkout config files from another branch.                                                 |
| checkout-revision         | [revision]           | Run Odoo revision script or checkout revision set by env var.                              |
| clear-assets              | [db]                 | Clear all assets of Odoo database.                                                         |
| clear-views               | [db]                 | Clear all views of Odoo database.                                                          |
| clear-filestore           | [db]                 | Clear local filestore folder. No param will clear all filestores. Default is branch name.  |
| convert-database          | [db]                 | Convert database backup file from PostgreSQL 9.5 to latest. Default is branch name.        |
| create-module             | [path]               | Create new Odoo module from template.                                                      |
| create-module-repo        | [path]               | Initialize Odoo module repo from template.                                                 |
| create-revision           | [revision]           | Create new Odoo revision.                                                                  |
| create-nextcloud-env      | [env]                | Create env file for Nextcloud instance.                                                    |
| create-odoo-env           | [env]                | Create env file for Odoo Instance.                                                         |
| create-snippet            | [id]                 | Create snippet from template.                                                              |
| disable-mailserver        | [env]                | Disable mail server settings via xmlrpc.                                                   |
| disable-snippet           | [env][path]          | Disable snippet definition.                                                                |
| container-login           |                      | Setup container hub login credentials.                                                     |
| drop-db                   | [db]                 | Drop target Odoo database. Default is branch name.                                         |
| edit-env                  | [env]                | Open env file in default editor.                                                           |
| generate-admin-passwd     | [pass]               | Generate hash for Odoo master password.                                                    |
| translate-module          | [env][path][lang]    | Generate translation for Odoo module.                                                      |
| generate-help-doc         |                      | Write help table to task.md file.                                                          |
| generate-module-overview  |                      | Update module overview doc file.                                                           |
| generate-module-security  | [path][model]        | Generate model access file for a selected model of a module.                               |
| generate-module-model     | [path][model]        | Generate model files from templates.                                                       |
| generate-module-snippet   | [path][ref]          | Generate view snippet from template.                                                       |
| generate-snippets-doc     |                      | Update snippets doc file.                                                                  |
| generate-revisions-doc    |                      | Update revisions doc file.                                                                 |
| get-addons-path           |                      | Output addons path.                                                                        |
| get-module-version        | [path]               | Get module version from manifest.                                                          |
| get-modules               | [path][option]       | Get list of modules in path. Option is 'basename' or 'dirname'.                            |
| git-feature-branch        | [path]               | Create feature branch for Odoo module.                                                     |
| git-fetch                 |                      | Fetch all Odoo version branches.                                                           |
| git-mig-branch            | [path]               | Create migration branch for Odoo module.                                                   |
| git-submodule-add         | [url] [path]         | Add git submodule.                                                                         |
| git-submodule-checkout    |                      | Checkout submodule commits.                                                                |
| git-submodule-commit-all  | [message][path]      | Commit all changes in path.                                                                |
| git-submodule-ls          | [grep]               | List submodule path space separated.                                                       |
| git-submodule-list        |                      | List path and url of submodules.                                                           |
| git-submodule-init        |                      | Init submodules listed in the .gitmodules file.                                            |
| git-submodule-pull        |                      | Pull all submodules listed in the .gitmodules file.                                        |
| git-submodule-push        |                      | Push all submodules in path.                                                               |
| git-submodule-remove      | [path]               | Remove a git submodule.                                                                    |
| git-submodule-delete      |                      | Delete all submodule folders.                                                              |
| git-submodule-status      | [path]               | Show status for submodules in path.                                                        |
| git-submodule-switch      | [branch]             | Switch branch for all submodules listed in the .gitmodules file.                           |
| git-submodule-sync        |                      | Switch, stash and pull all submodules.                                                     |
| import-csv                | [db][path]           | Import data from csv. Filename must match PostgreSQL table name.                           |
| info                      |                      | Show values of project env vars.                                                           |
| init-db                   | [db]                 | Initialize the Odoo database. Default is branch name.                                      |
| init-venv                 |                      | Initialize python virtual env.                                                             |
| init-module               | [db][path,module]    | Initialize Odoo module. Default database is branch name.                                   |
| load-language             | [db][lang]           | Install language package in Odoo db.                                                       |
| install-native            |                      | Install Odoo requirements in source folder.                                                |
| install-odoo-scripts      |                      | Install Odoo scripts.                                                                      |
| install-requirements      | [db][path]           | Install python packages from requirements.txt.                                             |
| install-snippet           | [env][path]          | Install snippet definition.                                                                |
| k8s-apply                 |                      | Apply the Odoo K8s manifests.                                                              |
| lint-module               | [path]               | Run pylint odoo for module.                                                                |
| lint-module-repo          | [path]               | Run pylint odoo for modules in repo folder.                                                |
| lint-snippets             |                      | Run checks for all snippets.                                                               |
| list-modules              | [path]               | Get modules in path as list.                                                               |
| list-env                  |                      | List env files.                                                                            |
| list-revision             |                      | List available Odoo revisions.                                                             |
| llm-update                | [path][prompt]       | Feed module files with prompt to LLM and apply file changes.                               |
| logs                      |                      | Tail Odoo container logs.                                                                  |
| node-install              |                      | Install build dependencies.                                                                |
| node-dev                  |                      | Start vuepress development server.                                                         |
| node-build                |                      | Create vuepress build.                                                                     |
| node-serve-build          |                      | Serve vuepress build.                                                                      |
| odooctl                   | [param]              | Execute odooctl cli.                                                                       |
| odoo-cloc                 | [db]                 | Count custom line of codes. Default is branch name.                                        |
| pass-store-dotenv         |                      | Store content of .env in pass entry.                                                       |
| pass-restore-dotenv       |                      | Restore content of .env from pass entry.                                                   |
| patch-database            | [db][path]           | Apply sql file to database. Default database is branch name.                               |
| publish                   |                      | Publish Odoo container image.                                                              |
| ps                        |                      | List container processes.                                                                  |
| pytest-module             | [db][name,path]      | Run module tests with pytest.                                                              |
| release-module            | [path]               | Create GitHub release for a module.                                                        |
| remove                    | [name]               | Remove containers and volumes. Options: none, db, admin, odoo, mail.                       |
| remove-env                | [env]                | Remove environment config.                                                                 |
| remove-module             | [db][name]           | Remove target Odoo module.                                                                 |
| remove-snippet            | [env][path]          | Remove snippet definition.                                                                 |
| reset-views               | [db][key]            | Execute hard reset on views matching keys.                                                 |
| restart                   | [name]               | Restart container.                                                                         |
| run                       | [name][cmd]          | Run container with command.                                                                |
| save-config               | [name]               | Save Odoo database config.                                                                 |
| setup-mail                | [db]                 | Setup mail config in Odoo db.                                                              |
| setup-mail-sql            | [db]                 | Setup mail config in Odoo db with SQL.                                                     |
| set-admin                 | [db]                 | Sets the password for the first user in database. Default is branch name.                  |
| set-addons-path           |                      | Set Odoo addons path env variable.                                                         |
| source                    |                      | Source the Python virtual env.                                                             |
| show-env                  | [env]                | Output content of the env file.                                                            |
| show-revision             | [revision]           | Show references of Odoo revision.                                                          |
| start                     | [name][db]           | Start container. Options: none, db, admin, odoo, native, mail.                             |
| start-kind                |                      | Start kind Kubernetes cluster.                                                             |
| start-minikube            |                      | Start minikube Kubernetes cluster.                                                         |
| start-psql                | [db]                 | Start PSQL shell in container container. Default is branch name.                           |
| start-shell               | [db]                 | Start Odoo shell from source folder. Default is branch name.                               |
| stop                      | [name]               | Stop containers.                                                                           |
| template-odoo-rc          |                      | Template the Odoo config file.                                                             |
| template-docker-compose   |                      | Template the Docker compose file.                                                          |
| test-container            | [clean]              | Test Odoo image.                                                                           |
| test-xmlrpc               | [env]                | Test json rpc connection.                                                                  |
| test-k8s                  |                      | Test Kubernetes environment.                                                               |
| test-module               | [db][name,path]      | Test target Odoo module.                                                                   |
| test-module-repo          | [db][path]           | Test target Odoo modules in repo folder.                                                   |
| update-app-list           | [db]                 | Update app list.                                                                           |
| update-docs               |                      | Update project docs.                                                                       |
| upgrade-module            | [path][version]      | Upgrade code of module from target Odoo version.                                           |
| upgrade-odoo              | [db][version][mode]  | Run the Odoo upgrade scripts. Default mode ist 'test'.                                     |
| update-module             | [db][name,path]      | Update target Odoo module.                                                                 |
| update-readme             | [path]               | Update Readme file of Odoo module collection.                                              |
| update-snippet            | [env][path]          | Update snippet definition.                                                                 |
| upload-module             | [env][path]          | Zip and upload Odoo module.                                                                |
| visualize-dependencies    | [path]               | Generate visualizations of module dependencies.                                            |
| version                   |                      | Show version of required tools.                                                            |
| zip-module                | [path]               | Create zip file for module.                                                                |
