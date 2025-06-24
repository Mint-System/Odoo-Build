| Command                   | Option               | Description                                                                                |
|---------------------------|----------------------|--------------------------------------------------------------------------------------------|
| activate-venv             |                      | Activate virtualenv.                                                                       |
| add-git-submodule         | [url] [path]         | Add git submodule.                                                                         |
| build                     | [Dockerfile][platform] | Build Odoo Container image. Optionally define the target platform.                         |
| backup-env-files          | [path]               | Archive and copy env files to target location.                                             |
| build-vuepress            |                      | Create Vuepress build.                                                                     |
| change-uuid               | [env]                | Change database uuid via xmlrpc.                                                           |
| checkout                  | [version]            | Checkout Odoo version.                                                                     |
| checkout-git-folder       |                      | Checkout git commit.                                                                       |
| checkout-latest-revision  | [version]            | Checkout the latest revision of the Odoo version.                                          |
| checkout-revision         | [revision]           | Run Odoo revision script or checkout revision set by env var.                              |
| commit-with-llm           |                      | Commit with llm generated commit message.                                                  |
| clean-git-folder          |                      | Clean git folder.                                                                          |
| clear-assets              | [db]                 | Clear all assets of Odoo database.                                                         |
| clear-filestore           | [db]                 | Clear local filestore folder. No param will clear all filestores.                          |
| clear-views               | [db]                 | Clear all views of Odoo database.                                                          |
| clock-odoo                | [db]                 | Count custom line of codes.                                                                |
| clone-git-folder          |                      | Clone git folder listed in the .gitmodules file.                                           |
| commit-git-folder         | [message][path]      | Commit all changes in path.                                                                |
| container-login           | [user][pass]         | Setup container hub login credentials.                                                     |
| container-ps              |                      | List container processes.                                                                  |
| copy-env                  | [env][env]           | Copy env file.                                                                             |
| create-git-feature-branch | [path]               | Create feature branch for Odoo module.                                                     |
| create-git-mig-branch     | [path]               | Create migration branch for Odoo module.                                                   |
| create-module             | [path]               | Create new Odoo module from template.                                                      |
| create-module-repo        | [path]               | Initialize Odoo module repo from template.                                                 |
| create-nextcloud-env      | [env]                | Create env file for Nextcloud instance.                                                    |
| create-odoo-env           | [env]                | Create env file for Odoo instance.                                                         |
| create-revision           | [revision]           | Create new Odoo revision.                                                                  |
| create-snippet            | [id]                 | Create snippet from template.                                                              |
| debug                     | [name]               | Debugg application. Options: native.                                                       |
| delete-git-folder         |                      | Delete all git folders.                                                                    |
| dev-vuepress              |                      | Start Vuepress development server.                                                         |
| disable-mailserver        | [env]                | Disable mail server settings via xmlrpc.                                                   |
| disable-snippet           | [env][path]          | Disable snippet definition.                                                                |
| drop-db                   | [db]                 | Drop target Odoo database.                                                                 |
| edit-env                  | [env]                | Open env file in default editor.                                                           |
| export-website-data       | [env]                | Export website data from Odoo database.                                                    |
| generate-admin-passwd     | [pass]               | Generate hash for Odoo master password.                                                    |
| generate-module-docs      | [path]               | Generate readme file for module.                                                           |
| generate-module-model     | [path][model]        | Generate model in module folder.                                                           |
| generate-module-inherit   | [path][model]        | Generate inherited model in module folder.                                                 |
| generate-module-views     | [path][model]        | Generate model views in module folder.                                                     |
| generate-module-security  | [path][model]        | Generate model access file.                                                                |
| generate-module-snippet   | [path][ref]          | Generate snippet for referefenced view.                                                    |
| generate-module-wizard    | [path][model]        | Generate wizard for a model in module folder.                                              |
| generate-ssh-keys         |                      | Generate ssh key pair.                                                                     |
| generate-pg-ssl-keys      |                      | Generate PostgreSQL SSL key material.                                                      |
| get-addons-path           |                      | Output addons path.                                                                        |
| status-git-folder         | [path]               | Show status for git folder in path.                                                        |
| get-modules               | [path][option]       | Get list of modules in path. Option is 'basename' or 'dirname'.                            |
| get-module-version        | [path]               | Get module version from manifest.                                                          |
| help                      | [grep]               | Show help for commands.                                                                    |
| import-csv                | [db][path]           | Import data from csv. Filename must match PostgreSQL table name.                           |
| import-website-data       | [env]                | Import website data to Odoo database.                                                      |
| info                      |                      | Show values of project env vars.                                                           |
| init-db                   | [db]                 | Initialize the Odoo database.                                                              |
| init-module               | [db][path,module]    | Initialize Odoo module.                                                                    |
| init-venv                 |                      | Initialize python virtual env.                                                             |
| install                   |                      | Install Odoo requirements in source folder.                                                |
| install-odoo-scripts      |                      | Install Odoo scripts.                                                                      |
| install-requirements      | [db][path]           | Install python packages from requirements.txt.                                             |
| install-snippet           | [env][path]          | Install snippet definition.                                                                |
| install-vuepress          |                      | Install Node build dependencies.                                                           |
| lint                      |                      | Run precommit for this project.                                                            |
| lint-module               | [path]               | Run pylint odoo for module.                                                                |
| lint-module-repo          | [path]               | Run pylint odoo for modules in repo folder.                                                |
| lint-snippets             |                      | Run checks for all snippets.                                                               |
| list-env                  |                      | List env files.                                                                            |
| list-git-folder           | [grep]               | List path and url of git folders.                                                          |
| list-modules              | [path]               | Get modules in path as list.                                                               |
| list-revision             |                      | List available Odoo revisions.                                                             |
| list-versions             |                      | List available Odoo versions.                                                              |
| load-env                  | [env]                | Load and export env file.                                                                  |
| load-language             | [db][lang]           | Install language package in Odoo db.                                                       |
| load-version              | [version]            | Load git refs from  version folder.                                                        |
| load-ssh-key              |                      | Load SSH private key from env var.                                                         |
| logs                      | [name]               | Tail container logs. Default is 'odoo'.                                                    |
| ls-module                 | [grep]               | List Odoo addons path space separated.                                                     |
| ls-git-folder             | [grep]               | List git folders path space separated.                                                     |
| odoocli                   | [param]              | Execute odoocli cli.                                                                       |
| patch-database            | [db][path]           | Apply sql file to database.                                                                |
| publish                   | [Dockerfile]         | Publish Odoo container image.                                                              |
| pull-git-folder           |                      | Pull all git folders listed in the .gitmodules file.                                       |
| push-git-folder           |                      | Push all git folders in path.                                                              |
| psql                      | [db]                 | Start interactive psql shell.                                                              |
| pytest-module             | [db][name,path]      | Run module tests with pytest.                                                              |
| release-module            | [path]               | Create GitHub release for a module.                                                        |
| remove                    | [name]               | Remove containers and volumes.                                                             |
| remove-env                | [env]                | Remove environment config.                                                                 |
| remove-git-submodule      | [path]               | Remove a git submodule.                                                                    |
| remove-module             | [db][name]           | Remove target Odoo module.                                                                 |
| remove-snippet            | [env][path]          | Remove snippet definition.                                                                 |
| rename-env                | [env][env]           | Rename env file.                                                                           |
| record-with-memray        | [name]               | Record application memory usage with memray. Options: native.                              |
| record-with-py-spy        | [pid]                | Record and create flamechart for a process.                                                |
| reset-git-folder          |                      | Abort rebase and reset submodules listed in the .gitmodules file.                          |
| reset-views               | [db][key]            | Execute hard reset on views matching keys.                                                 |
| restart                   | [name]               | Restart container.                                                                         |
| restore-env-files         | [path]               | Extract and copy env files from backup file.                                               |
| restore-dotenv            |                      | Restore content of .env from pass entry.                                                   |
| run                       | [name][cmd]          | Run container with command.                                                                |
| save-version              |                      | Save git folder refs to version folder.                                                    |
| serve-vuepress            |                      | Serve Vuepress build.                                                                      |
| set-addons-path           |                      | Set Odoo addons path env variable.                                                         |
| set-admin                 | [db]                 | Sets the password for the first user in database.                                          |
| setup-mail                | [db]                 | Setup mail config in Odoo db.                                                              |
| shell                     | [db][code]           | Start interactive odoo shell or run code.                                                  |
| show-env                  | [env]                | Output content of the env file.                                                            |
| show-revision             | [revision]           | Show references of Odoo revision.                                                          |
| source                    |                      | Source the Python virtual env.                                                             |
| stage-git-folder          | [path]               | Stage all files in git folders in path.                                                    |
| start                     | [name][db]           | Start application. Options: none, admin, db, mailgate, mailpit, native, odoo.              |
| stop                      | [name]               | Stop containers.                                                                           |
| store-dotenv              |                      | Store content of .env in pass entry.                                                       |
| switch-git-folder         | [version]            | Switch branch for all git folders listed in the .gitmodules file.                          |
| sync-git-folder           |                      | Switch, stash and pull all git folders.                                                    |
| template-compose          |                      | Template the Docker compose file.                                                          |
| template-odoo-rc          |                      | Template the Odoo config file.                                                             |
| template-repo             | [path]               | Update the repo folder from template.                                                      |
| test-image                | [Dockerfile]         | Test internals of Docker image.                                                            |
| test-module               | [db][name,path]      | Test target Odoo module.                                                                   |
| test-module-repo          | [db][path]           | Test target Odoo modules in repo folder.                                                   |
| test-project              | [clean]              | Run tests for this project.                                                                |
| test-xmlrpc               | [env]                | Test json rpc connection.                                                                  |
| translate-module          | [path][lang][db]     | Generate translation for Odoo module.                                                      |
| update-docs               |                      | Update all project docs.                                                                   |
| update-help-docs          |                      | Write help table to task.md file.                                                          |
| update-module             | [db][name,path]      | Update target Odoo module.                                                                 |
| update-module-license     | [grep]               | Update LICENSE file for each matching module.                                              |
| update-module-list        | [db]                 | Update module list of Odoo database.                                                       |
| update-modules-docs       |                      | Update modules docs file.                                                                  |
| update-repo-docs          | [path]               | Update Readme file of the repo.                                                            |
| update-revision-docs      |                      | Update revisions doc file.                                                                 |
| update-snippet            | [env][path]          | Update snippet definition.                                                                 |
| update-snippet-docs       |                      | Update snippets doc file.                                                                  |
| update-with-llm           | [glob][prompt]       | Feed module files with prompt to LLM and apply file changes.                               |
| upgrade-module            | [path][version]      | Upgrade code of module from target Odoo version.                                           |
| upgrade-odoo              | [db][version][mode]  | Run the Odoo upgrade scripts. Default mode ist 'test'.                                     |
| upload-module             | [env][path]          | Zip and upload Odoo module.                                                                |
| version                   |                      | Show version of required tools.                                                            |
| visualize-dependencies    | [path]               | Generate visualizations of module dependencies.                                            |
| zip-module                | [path]               | Create zip file for module.                                                                |
