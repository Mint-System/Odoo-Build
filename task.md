| Command                    | Option               | Description                                                                    |
|----------------------------|----------------------|--------------------------------------------------------------------------------|
| backup-env-files           | [path]               | Archive and copy env files to target location.                                 |
| copy-env                   | [env][env]           | Copy env file.                                                                 |
| create-nextcloud-env       | [env]                | Create env file for Nextcloud instance.                                        |
| create-odoo-env            | [env]                | Create env file for Odoo instance.                                             |
| edit-env                   | [env]                | Open env file in default editor.                                               |
| list-env                   |                      | List env files.                                                                |
| load-dotenv                |                      | Restore content of .env from pass entry.                                       |
| load-env                   | [env]                | Load and export env file.                                                      |
| remove-env                 | [env]                | Remove environment config.                                                     |
| remove-venv                |                      | Remove virtualenv.                                                             |
| rename-env                 | [env][env]           | Rename env file.                                                               |
| restore-env-files          | [path]               | Extract and copy env files from backup file.                                   |
| save-dotenv                |                      | Store content of .env in pass entry.                                           |
| show-env                   | [env]                | Output content of the env file.                                                |
| add-git-submodule          | [url] [path]         | Add git submodule.                                                             |
| checkout                   | [version]            | Checkout Odoo version.                                                         |
| checkout-git-folder        |                      | Checkout git commit.                                                           |
| commit-git-folder          | [message][path]      | Commit all changes in path.                                                    |
| clean-git-folder           |                      | Clean git folder.                                                              |
| clone-git-folder           | [submodule][version] | Clone git folder listed in the .gitmodules file.                               |
| create-git-feature-branch  | [path]               | Create feature branch for Odoo module.                                         |
| create-git-mig-branch      | [path]               | Create migration branch for Odoo module.                                       |
| download-git-folder        | [grep]               | Download git folder listed in the .gitmodules file.                            |
| status-git-folder          | [path]               | Show status for git folder in path.                                            |
| list-git-folder            | [grep]               | List path and url of git folders.                                              |
| pull-git-folder            |                      | Pull all git folders listed in the .gitmodules file.                           |
| push-git-folder            |                      | Push all git folders in path.                                                  |
| remove-git-folders         |                      | Delete all git folders.                                                        |
| remove-git-submodule       | [path]               | Remove a git submodule.                                                        |
| ls-git-folder              | [grep]               | List git folders path space separated.                                         |
| reset-git-folder           |                      | Abort rebase and reset submodules listed in the .gitmodules file.              |
| stage-git-folder           | [path]               | Stage all files in git folders in path.                                        |
| switch-git-folder          | [version]            | Switch branch for all git folders listed in the .gitmodules file.              |
| sync-git-folder            |                      | Switch, stash and pull all git folders.                                        |
| archive-docker-tags        |                      | Archive Docker image tags on hub older than 1 year.                            |
| build                      | [folder][output]     | Build Docker image from target folder.                                         |
| login-docker               | [user][token]        | Setup Docker Hub login credentials.                                            |
| login-podman               | [user][token]        | Login into registry with podman.                                               |
| container-ps               |                      | List container processes.                                                      |
| push                       | [folder]             | Publish Docker image from target folder.                                       |
| remove                     | [name]               | Remove containers and volumes.                                                 |
| test-image                 | [folder]             | Test Docker image from target folder.                                          |
| build-vuepress             |                      | Create Vuepress build.                                                         |
| install-vuepress           |                      | Install Node build dependencies.                                               |
| dev-vuepress               |                      | Start Vuepress development server.                                             |
| serve-vuepress             |                      | Serve Vuepress build.                                                          |
| change-uuid                | [env]                | Change database uuid via xmlrpc.                                               |
| clear-assets               | [db]                 | Clear all assets of Odoo database.                                             |
| clear-filestore            | [db]                 | Clear local filestore folder. No param will clear all filestores.              |
| clear-views                | [db]                 | Clear all views of Odoo database.                                              |
| cloc-odoo                  | [db]                 | Count custom line of codes.                                                    |
| drop-db                    | [db]                 | Drop target Odoo database.                                                     |
| init-db                    | [db]                 | Initialize the Odoo database.                                                  |
| load-language              | [db][lang]           | Install language package in Odoo db.                                           |
| patch-database             | [db][path]           | Apply sql file to database.                                                    |
| reset-views                | [db][key]            | Execute hard reset on views matching keys.                                     |
| set-admin                  | [db]                 | Sets the password for the first user in database.                              |
| update-module              | [db][name,path]      | Update target Odoo module.                                                     |
| update-module-list         | [db]                 | Update module list of Odoo database.                                           |
| checkout-latest-revision   | [version]            | Checkout the latest revision of the Odoo version.                              |
| checkout-revision          | [revision]           | Load Odoo revision env var and checkout git folders.                           |
| commit-and-push-revision   | [revision]           | Commit all changes and tag with current revision.                              |
| create-revision            | [revision]           | Create new Odoo revision.                                                      |
| list-revision              |                      | List available Odoo revisions.                                                 |
| load-latest-revision       | [version]            | Load the latest revision of the Odoo version.                                  |
| load-revision              | [revision]           | Load env var from specified revision.                                          |
| show-revision              | [revision]           | Show references of Odoo revision.                                              |
| commit-with-llm            |                      | Commit with llm generated commit message.                                      |
| show-odoo-mcp-config       |                      | Show the Odoo MCP server config.                                               |
| update-with-llm            | [glob][prompt]       | Feed module files with prompt to LLM and apply file changes.                   |
| create-snippet             | [id]                 | Create snippet from template.                                                  |
| install-snippet            | [env][path]          | Install snippet definition.                                                    |
| disable-snippet            | [env][path]          | Disable snippet definition.                                                    |
| lint-snippets              |                      | Run checks for all snippets.                                                   |
| remove-snippet             | [env][path]          | Remove snippet definition.                                                     |
| update-snippet             | [env][path]          | Update snippet definition.                                                     |
| activate-venv              |                      | Activate virtualenv.                                                           |
| init-venv                  |                      | Initialize python virtual env.                                                 |
| disable-mailserver         | [env]                | Disable mail server settings via xmlrpc.                                       |
| install                    |                      | Install Odoo requirements in source folder.                                    |
| install-odoo-scripts       |                      | Install Odoo scripts.                                                          |
| install-requirements       | [db][path]           | Install python packages from requirements.txt.                                 |
| list-packages              |                      | List installed python packages.                                                |
| init-module                | [db][path,module]    | Initialize Odoo module.                                                        |
| set-addons-path            |                      | Set Odoo addons path env variable.                                             |
| export-website-data        | [env]                | Export website data from Odoo database.                                        |
| import-csv                 | [db][path]           | Import data from csv. Filename must match PostgreSQL table name.               |
| import-website-data        | [env]                | Import website data to Odoo database.                                          |
| generate-module-docs       | [path]               | Generate readme file for module with OCA tools.                                |
| generate-module-model      | [path][model]        | Generate model in module folder.                                               |
| generate-module-inherit    | [path][model]        | Generate inherited model in module folder.                                     |
| generate-module-views      | [path][model]        | Generate model views in module folder.                                         |
| generate-module-security   | [path][model]        | Generate model access file.                                                    |
| generate-module-snippet    | [path][model][ref]   | Generate snippet for referefenced view.                                        |
| generate-module-wizard     | [path][model]        | Generate wizard for a model in module folder.                                  |
| generate-module            | [path]               | Create new Odoo module from template.                                          |
| generate-module-repo       | [path]               | Initialize Odoo module repo from template.                                     |
| lint-module                | [path]               | Run pylint odoo for module.                                                    |
| lint-module-repo           | [path]               | Run pylint odoo for modules in repo folder.                                    |
| list-modules               | [path]               | Get modules in path as bash array.                                             |
| pytest-module              | [db][name,path]      | Run module tests with pytest.                                                  |
| release-module             | [path]               | Create GitHub release for a module.                                            |
| remove-module              | [db][name]           | Remove target Odoo module.                                                     |
| test-module                | [db][name,path]      | Test target Odoo module.                                                       |
| test-module-repo           | [db][path]           | Test target Odoo modules in repo folder.                                       |
| translate-module           | [path][lang][db]     | Generate translation for Odoo module.                                          |
| upload-module              | [env][path]          | Zip and upload Odoo module.                                                    |
| visualize-dependencies     | [path]               | Generate visualizations of module dependencies.                                |
| zip-module                 | [path]               | Create zip file for module.                                                    |
| generate-admin-password    | [pass]               | Generate hash for Odoo master password.                                        |
| generate-ssh-keys          |                      | Generate ssh key pair.                                                         |
| generate-pg-ssl-keys       |                      | Generate PostgreSQL SSL key material.                                          |
| get-addons-path            |                      | Output addons path.                                                            |
| get-modules                | [path][option]       | Get list of modules in path. Option is 'basename' or 'dirname'.                |
| get-module-version         | [path]               | Get module version from manifest.                                              |
| get-module-checksum        | [path]               | Get module checksum.                                                           |
| help                       | [grep]               | Show help for commands.                                                        |
| info                       |                      | Show values of project env vars.                                               |
| load-ssh-key               |                      | Load SSH private key from env var.                                             |
| update-module-license      | [grep]               | Update LICENSE file for each matching module.                                  |
| debug                      | [name]               | Debugg application. Options: source.                                           |
| exec                       | [name][cmd]          | Run command in container.                                                      |
| logs                       | [name]               | Tail container logs. Default is 'odoo'.                                        |
| odoocli                    | [param]              | Execute odoocli cli.                                                           |
| psql                       | [db]                 | Start interactive psql shell.                                                  |
| restart                    | [name]               | Restart container.                                                             |
| run                        | [name][cmd]          | Run container with command.                                                    |
| shell                      | [db][code]           | Start interactive odoo shell or run code.                                      |
| source                     |                      | Source the Python virtual env.                                                 |
| start                      | [name][db]           | Start application. Options: none, admin, db, mailgate, mailpit, source, odoo, hatch. |
| stop                       | [name]               | Stop containers.                                                               |
| test-xmlrpc                | [env]                | Test json rpc connection.                                                      |
| lint                       |                      | Run precommit for this project.                                                |
| list-versions              |                      | List available Odoo versions.                                                  |
| check-version              |                      | Check if Odoo source is the correct version.                                   |
| load-version               | [version]            | Load git refs from  version folder.                                            |
| save-version               |                      | Save git folder refs to version folder.                                        |
| template-compose           |                      | Template the Docker compose file.                                              |
| template-odoo-rc           |                      | Template the Odoo config file.                                                 |
| template-repo              | [path]               | Update the repo folder from template.                                          |
| test-project               | [clean]              | Run tests for this project.                                                    |
| version                    |                      | Show version of required tools.                                                |
| record-with-memray         | [name]               | Record application memory usage with memray. Options: source.                  |
| record-with-py-spy         | [pid]                | Record and create flamechart for a process.                                    |
| update-docs                |                      | Update all project docs.                                                       |
| update-help-doc            |                      | Write help table to task.md file.                                              |
| update-modules-doc         |                      | Update modules docs file.                                                      |
| update-revisions-doc       |                      | Update revisions doc file.                                                     |
| update-snippets-doc        |                      | Update snippets doc file.                                                      |
| migrate-module             | [path]               | Migrate module code from to target Odoo version.                               |
| upgrade-odoo               | [db][version][mode]  | Run the Odoo upgrade scripts. Default mode ist 'test'.                         |
