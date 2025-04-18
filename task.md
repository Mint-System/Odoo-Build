| Command                   | Option               | Description                                                                                |
|---------------------------|----------------------|--------------------------------------------------------------------------------------------|
| activate-venv             |                      | Activate virtualenv.                                                                       |
| add-git-folder            | [url] [path]         | Add git submodule.                                                                         |
| build                     | [Dockerfile][platform] | Build Odoo Container image. Optionally define the target platform.                         |
| build-vuepress            |                      | Create Vuepress build.                                                                     |
| change-uuid               | [env]                | Change database uuid via xmlrpc.                                                           |
| checkout                  | [version]            | Checkout Odoo version.                                                                     |
| checkout-git-folder       |                      | Checkout submodule commits.                                                                |
| checkout-latest-revision  | [version]            | Checkout the latest revision of the Odoo version.                                          |
| checkout-revision         | [revision]           | Run Odoo revision script or checkout revision set by env var.                              |
| clear-assets              | [db]                 | Clear all assets of Odoo database.                                                         |
| clear-filestore           | [db]                 | Clear local filestore folder. No param will clear all filestores.                          |
| clear-views               | [db]                 | Clear all views of Odoo database.                                                          |
| clock-odoo                | [db]                 | Count custom line of codes.                                                                |
| clone-git-folder          |                      | Clone submodules listed in the .gitmodules file.                                           |
| commit-git-folder         | [message][path]      | Commit all changes in path.                                                                |
| container-login           | [user][pass]         | Setup container hub login credentials.                                                     |
| container-ps              |                      | List container processes.                                                                  |
| create-git-feature-branch | [path]               | Create feature branch for Odoo module.                                                     |
| create-git-mig-branch     | [path]               | Create migration branch for Odoo module.                                                   |
| create-module             | [path]               | Create new Odoo module from template.                                                      |
| create-module-repo        | [path]               | Initialize Odoo module repo from template.                                                 |
| create-nextcloud-env      | [env]                | Create env file for Nextcloud instance.                                                    |
| create-odoo-env           | [env]                | Create env file for Odoo Instance.                                                         |
| create-revision           | [revision]           | Create new Odoo revision.                                                                  |
| create-snippet            | [id]                 | Create snippet from template.                                                              |
| debug                     | [name]               | Debugg application. Options: native.                                                       |
| delete-git-folder         |                      | Delete all submodule folders.                                                              |
| dev-vuepress              |                      | Start Vuepress development server.                                                         |
| disable-mailserver        | [env]                | Disable mail server settings via xmlrpc.                                                   |
| disable-snippet           | [env][path]          | Disable snippet definition.                                                                |
| drop-db                   | [db]                 | Drop target Odoo database.                                                                 |
| edit-env                  | [env]                | Open env file in default editor.                                                           |
| generate-admin-passwd     | [pass]               | Generate hash for Odoo master password.                                                    |
| generate-help-docs        |                      | Write help table to task.md file.                                                          |
| generate-module-model     | [path][model]        | Generate model files from templates.                                                       |
| generate-module-overview  |                      | Update module overview docs file.                                                          |
| generate-module-security  | [path][model]        | Generate model access file for a selected model of a module.                               |
| generate-module-snippet   | [path][ref]          | Generate view snippet from template.                                                       |
| generate-revision-docs    |                      | Update revisions doc file.                                                                 |
| generate-snippet-docs     |                      | Update snippets doc file.                                                                  |
| get-addons-path           |                      | Output addons path.                                                                        |
| status-git-folder         | [path]               | Show status for submodules in path.                                                        |
| get-modules               | [path][option]       | Get list of modules in path. Option is 'basename' or 'dirname'.                            |
| get-module-version        | [path]               | Get module version from manifest.                                                          |
| import-csv                | [db][path]           | Import data from csv. Filename must match PostgreSQL table name.                           |
| info                      |                      | Show values of project env vars.                                                           |
| init-db                   | [db]                 | Initialize the Odoo database.                                                              |
| init-module               | [db][path,module]    | Initialize Odoo module.                                                                    |
| init-venv                 |                      | Initialize python virtual env.                                                             |
| install-native            |                      | Install Odoo requirements in source folder.                                                |
| install-odoo-scripts      |                      | Install Odoo scripts.                                                                      |
| install-requirements      | [db][path]           | Install python packages from requirements.txt.                                             |
| install-snippet           | [env][path]          | Install snippet definition.                                                                |
| install-vuepress          |                      | Install Node build dependencies.                                                           |
| lint-module               | [path]               | Run pylint odoo for module.                                                                |
| lint-module-repo          | [path]               | Run pylint odoo for modules in repo folder.                                                |
| lint-snippets             |                      | Run checks for all snippets.                                                               |
| list-env                  |                      | List env files.                                                                            |
| list-git-folder           | [grep]               | List path and url of submodules.                                                           |
| list-modules              | [path]               | Get modules in path as list.                                                               |
| list-revision             |                      | List available Odoo revisions.                                                             |
| list-versions             |                      | List available Odoo versions.                                                              |
| load-language             | [db][lang]           | Install language package in Odoo db.                                                       |
| load-version              | [version]            | Load submodule refs from  version folder.                                                  |
| load-ssh-key              |                      | Load SSH private key from env var.                                                         |
| logs                      |                      | Tail Odoo container logs.                                                                  |
| ls-module                 | [grep]               | List submodule path space separated.                                                       |
| ls-git-folder             | [grep]               | List submodule path space separated.                                                       |
| odooctl                   | [param]              | Execute odooctl cli.                                                                       |
| patch-database            | [db][path]           | Apply sql file to database.                                                                |
| publish                   | [Dockerfile]         | Publish Odoo container image.                                                              |
| pull-git-folder           |                      | Pull all submodules listed in the .gitmodules file.                                        |
| push-git-folder           |                      | Push all submodules in path.                                                               |
| pytest-module             | [db][name,path]      | Run module tests with pytest.                                                              |
| release-module            | [path]               | Create GitHub release for a module.                                                        |
| remove                    | [name]               | Remove containers and volumes. Options: none, db, admin, odoo, mail.                       |
| remove-env                | [env]                | Remove environment config.                                                                 |
| remove-git-folder         | [path]               | Remove a git submodule.                                                                    |
| remove-module             | [db][name]           | Remove target Odoo module.                                                                 |
| remove-snippet            | [env][path]          | Remove snippet definition.                                                                 |
| record-with-memray        | [name]               | Record application memory usage with memray. Options: native.                              |
| record-with-py-spy        | [pid]                | Record and create flamechart for a process.                                                |
| reset-git-folder          |                      | Abort rebase and reset submodules listed in the .gitmodules file.                          |
| reset-views               | [db][key]            | Execute hard reset on views matching keys.                                                 |
| restart                   | [name]               | Restart container.                                                                         |
| restore-dotenv            |                      | Restore content of .env from pass entry.                                                   |
| run                       | [name][cmd]          | Run container with command.                                                                |
| save-version              |                      | Save submodule refs to version folder.                                                     |
| serve-vuepress            |                      | Serve Vuepress build.                                                                      |
| set-addons-path           |                      | Set Odoo addons path env variable.                                                         |
| set-admin                 | [db]                 | Sets the password for the first user in database.                                          |
| setup-mail                | [db]                 | Setup mail config in Odoo db.                                                              |
| setup-mail-sql            | [db]                 | Setup mail config in Odoo db with SQL.                                                     |
| show-env                  | [env]                | Output content of the env file.                                                            |
| show-revision             | [revision]           | Show references of Odoo revision.                                                          |
| source                    |                      | Source the Python virtual env.                                                             |
| stage-git-folder          | [path]               | Stage all files in git folders in path.                                                    |
| start                     | [name][db]           | Start application. Options: db, admin, odoo, native, mail.                                 |
| start-psql                | [db]                 | Start PSQL shell in container container.                                                   |
| start-shell               | [db]                 | Start Odoo shell from source folder.                                                       |
| stop                      | [name]               | Stop containers.                                                                           |
| store-dotenv              |                      | Store content of .env in pass entry.                                                       |
| switch-git-folder         | [version]            | Switch branch for all submodules listed in the .gitmodules file.                           |
| sync-git-folder           |                      | Switch, stash and pull all submodules.                                                     |
| template-compose          |                      | Template the Docker compose file.                                                          |
| template-odoo-rc          |                      | Template the Odoo config file.                                                             |
| template-repo             | [path]               | Update the repo folder from template.                                                      |
| test-image                | [Dockerfile]         | Test Odoo container image.                                                                 |
| test-module               | [db][name,path]      | Test target Odoo module.                                                                   |
| test-module-repo          | [db][path]           | Test target Odoo modules in repo folder.                                                   |
| test-project              | [clean]              | Run tests for this project.                                                                |
| test-xmlrpc               | [env]                | Test json rpc connection.                                                                  |
| translate-module          | [db][path][lang]     | Generate translation for Odoo module.                                                      |
| update-app-list           | [db]                 | Update app list.                                                                           |
| update-docs               |                      | Update project docs.                                                                       |
| update-module             | [db][name,path]      | Update target Odoo module.                                                                 |
| update-module-docs        | [path]               | Update Readme file of the module.                                                          |
| update-module-license     | [grep]               | Update LICENSE file for each matching module.                                              |
| update-repo-docs          | [path]               | Update Readme file of the repo.                                                            |
| update-snippet            | [env][path]          | Update snippet definition.                                                                 |
| update-with-llm           | [path][prompt]       | Feed module files with prompt to LLM and apply file changes.                               |
| upgrade-module            | [path][version]      | Upgrade code of module from target Odoo version.                                           |
| upgrade-odoo              | [db][version][mode]  | Run the Odoo upgrade scripts. Default mode ist 'test'.                                     |
| upload-module             | [env][path]          | Zip and upload Odoo module.                                                                |
| version                   |                      | Show version of required tools.                                                            |
| visualize-dependencies    | [path]               | Generate visualizations of module dependencies.                                            |
| zip-module                | [path]               | Create zip file for module.                                                                |
