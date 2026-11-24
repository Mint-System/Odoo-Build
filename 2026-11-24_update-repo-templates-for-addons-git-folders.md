---
commit_ref:
title: "Update repo templates for addons git folders"
author: "Janik von Rotz <login@janikvonrotz.ch>"
session_id:
action: execute
state: draft
date_completed: YYYY-MM-DD
harness:
provider:
model:
input_tokens:
output_tokens:
---

# Update repo templates for addons git folders

Note: @Clanker refers to the "ai agent" (you) who is working on this prompt file.

@Clanker when working on this prompt file, make sure to:

- Read the `AGENTS.md` to get an understanding of the project
- Read task section and prepare a list of todos
- Update the todo list while working on task

@Clanker When task is completed set frontmatter state to review. If you have access to session info add token count and session id. Prompt the author to verify the results.

## Task

For each Odoo version from 15.0 to 20.0 I want to update the templates and docs for each repo in the `addons` folder.

I will present you an example and then I would like you to repeat this for each version and repo.

### Example

Checkout the Odoo version:

```bash
[main][~/Odoo-Build]$ task checkout 15.0
```

List all managed git folders:

```bash
[main][~/Odoo-Build]$ task list-git-folder addons
| PATH                                | URL                                                | BRANCH   |
|-------------------------------------|----------------------------------------------------|----------|
| addons/manufacture                  | Mint-System/Odoo-Apps-Manufacture                  | 15.0     |
| addons/vertical_forestry            | Mint-System/Odoo-Apps-Vertical-Forestry            | 15.0     |
| addons/hr                           | Mint-System/Odoo-Apps-HR                           | 15.0     |
| addons/stock_logistics_workflow     | Mint-System/Odoo-Apps-Stock-Logistics-Workflow     | 15.0     |
| addons/purchase_workflow            | Mint-System/Odoo-Apps-Purchase-Workflow            | 15.0     |
| addons/server_tools                 | Mint-System/Odoo-Apps-Server-Tools                 | 15.0     |
| addons/project                      | Mint-System/Odoo-Apps-Project                      | 15.0     |
| addons/sale_workflow                | Mint-System/Odoo-Apps-Sale-Workflow                | 15.0     |
| addons/account_invoicing            | Mint-System/Odoo-Apps-Account-Invoicing            | 15.0     |
| addons/social                       | Mint-System/Odoo-Apps-Social                       | 15.0     |
| addons/website                      | Mint-System/Odoo-Apps-Website                      | 15.0     |
| addons/partner_contact              | mint-system/odoo-apps-partner-contact              | 15.0     |
| addons/contract                     | Mint-System/Odoo-Apps-Contract                     | 15.0     |
| addons/vertical_saas                | Mint-System/Odoo-Apps-SaaS                         | 15.0     |
| addons/product_attribute            | Mint-System/Odoo-Apps-Product-Attribute            | 15.0     |
| addons/account_financial_reporting  | Mint-System/Odoo-Apps-Account-Financial-Reporting  | 15.0     |
```

Update the templates for a repo:

```bash
[main][~/Odoo-Build]$ task generate-repo-docs addons/server_tools
Copy task file to addons/server_tools.
Template README.md to addons/server_tools.
Copy 15.0 template files to addons/server_tools.
Remove deprecated repo files.
```

Navigate into the repo folder and run the `docs` command:

```bash
*[main][~/Odoo-Build]$ cd addons/server_tools
*[15.0][~/Odoo-Build/addons/server_tools]$ task docs
Update index.html for all modules
Clear modules table in README.md
Add summary of auth_impersonate_user to readme file.
Add summary of auth_oauth_keycloak to readme file.
Add summary of auth_totp_ip_check to readme file.
Add summary of base_recursion_limit to readme file.
Add summary of board_users to readme file.
Add summary of home_background_image to readme file.
Add summary of ir_attachment_edit to readme file.
Add summary of mail_server_filter to readme file.
Add summary of mail_service_users to readme file.
Add summary of prometheus_exporter to readme file.
```

Ensure that there is no `prompt.md` file:

```bash
[15.0][~/Odoo-Build/addons/server_tools]$ rm -f prompt.md
```

Navigate back to project root and stage all changes:

```bash
[main][~/Odoo-Build]$ task stage-git-folder addons/server_tools
Stage all files in addons/server_tools.
```

Check status:

```bash
*[main][~/Odoo-Build]$ t status-git-folder addons/server_tools
Show status in git folders...

Git status of addons/server_tools:

On branch 15.0
Your branch is up to date with 'origin/15.0'.

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	new file:   .editorconfig
	new file:   .eslintrc.yml
	new file:   .gitattributes
	new file:   .github/workflows/build-and-publish.yaml
	modified:   .gitignore
	modified:   .pre-commit-config.yaml
	new file:   .prettierrc.yml
	modified:   .pylintrc
	new file:   LICENSE
	modified:   auth_impersonate_user/static/description/index.html
	modified:   auth_oauth_keycloak/static/description/index.html
	modified:   auth_totp_ip_check/static/description/index.html
	modified:   base_recursion_limit/static/description/index.html
	modified:   board_users/static/description/index.html
	modified:   home_background_image/static/description/index.html
	modified:   ir_attachment_edit/static/description/index.html
	modified:   mail_server_filter/static/description/index.html
	modified:   mail_service_users/static/description/index.html
	modified:   prometheus_exporter/static/description/index.html
	modified:   task
```

Commit the changes:

```bash
[main][~/Odoo-Build]$ task commit-git-folder addons/server_tools "feat(docs): update repo templates"
Commit in addons/server_tools.
[15.0 1e75292] feat(docs): update repo templates
 20 files changed, 1263 insertions(+), 148 deletions(-)
 create mode 100644 .editorconfig
 create mode 100644 .eslintrc.yml
 create mode 100644 .gitattributes
 create mode 100644 .github/workflows/build-and-publish.yaml
 create mode 100644 .prettierrc.yml
 create mode 100644 LICENSE
```

Push the commit:

```bash
[main][~/Odoo-Build]$ t push-git-folder addons/server_tools
Push in addons/server_tools.
Enumerating objects: 81, done.
Counting objects: 100% (81/81), done.
Delta compression using up to 16 threads
Compressing objects: 100% (44/44), done.
Writing objects: 100% (54/54), 23.86 KiB | 7.95 MiB/s, done.
Total 54 (delta 22), reused 6 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (22/22), completed with 13 local objects.
To github.com:Mint-System/Odoo-Apps-Server-Tools.git
   0b6dbdc..1e75292  15.0 -> 15.0
```

### Warnings

Make sure that `tmp` is not committed. Here is an example where `tmp` is not in `.gitgnore`:

```bash
[main][~/Odoo-Build]$ t status-git-folder addons/hr
Show status in git folders...

Git status of addons/hr:

On branch 15.0
Your branch is up to date with 'origin/15.0'.

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	new file:   dist/odoo_addon_hr_holidays_attendance_overtime-19.0.1.0.0-py3-none-any.whl
	new file:   dist/odoo_addon_hr_holidays_attendance_overtime-19.0.1.0.0.dev1-py3-none-any.whl
	new file:   dist/odoo_addon_hr_holidays_attendance_overtime-19.0.1.0.0.dev1.tar.gz
	new file:   dist/odoo_addon_hr_holidays_attendance_overtime-19.0.1.0.0.tar.gz
	new file:   dist/odoo_apps_hr-19.0.20261117.0-py3-none-any.whl
	new file:   dist/odoo_apps_hr-19.0.20261117.0.tar.gz
	new file:   setup/_metapackage/odoo_apps_hr.egg-info/PKG-INFO
	new file:   setup/_metapackage/odoo_apps_hr.egg-info/SOURCES.txt
	new file:   setup/_metapackage/odoo_apps_hr.egg-info/dependency_links.txt
	new file:   setup/_metapackage/odoo_apps_hr.egg-info/requires.txt
	new file:   setup/_metapackage/odoo_apps_hr.egg-info/top_level.txt
	new file:   tmp/llm_prompt
	new file:   tmp/llm_prompt_result
	new file:   tmp/prompt-log
```

Do not run any other command than `docs` in the folder.

Most repos should be up to date. Especially in the 15.0 < versions.

The GitHub action will most likely fail. That is not your concern.

### Execute

Do not try to shortcut this process. Really walk through every repo and version.

Ask for review for the first execution. Then when confirmed proceed with the remaining repos for 15.0 version.

Then ask for confirmation again and it looks good. Proceed with all repos of the next version.

## Worklog

@Clanker Add a summary here once the task has been completed.

@Clanker If author confirms results set frontmatter state to completed, otherwise to aborted. Update date, harness, provider and model. If you have access to session info update token count. Finally, update the changelog with the most important changes.
