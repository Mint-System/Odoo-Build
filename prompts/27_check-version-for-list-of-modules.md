---
title: "Check version for list of modules"
state: draft
model: 
input_tokens: 
---

# Run 27

Note: @Clanker refers to the "ai agent" (you) who is working on this task.

@Clanker when working on this task, make sure to:

- Read context and task section first
- Prepare a list of todos
- Update the todo list while working on the task

## Context

@Clanker Read the `AGENTS.md` and `README.md` to get an understanding of the project.

## Task

First I want you to update the `bin/update-modules-doc` script. It should also produce a `modules.csv` file.

The file looks like this:

```csv
forge, organisation, repo, module, versions
github.com, Mint-System, odoo-apps-account-financial-reporting, account_financial_report_contra_accounts, 14.0,15.0;16.0
...
```

Note that command `task update-modules-doc` that is executing this script will take a long time. For every Odoo version all submodules are checked out synced:

```python

# Switch to the version
subprocess.run(["./task", "checkout", version])

# Pull all submodules
subprocess.run(["./task", "sync-git-folder"])

# Get all submodules
submodules = read_gitmodules(".gitmodules")
```

Do not execute the script. I will do it myself.

Then I would like to have a command `check-module-versions` that takes a list as input:

```
account_financial_report
account_reconcile_oca
account_statement_base
account_statement_import_base
account_statement_import_camt
account_statement_import_camt54
account_statement_import_file
account_usability
auth_impersonate_user
contract
contract_sale
contract_sale_generation
date_range
helpdesk_mgmt
mass_mailing_list_dynamic
mass_mailing_partner
mis_builder
mis_template_financial_report
partner_deduplicate_acl
partner_firstname
prometheus_exporter
report_xlsx
subscription_oca
web_responsive
```

And then looks up every module in `modules.csv` and returns a table with available versions:

```
| name                  | versions   |
|-----------------------|------------|
| account_reconcile_oca | 14.0, 16.0 |
...
```

Of course the width of the table seperator and space is dynamic. See `help-table` for details.

## Worklog

@Clanker Add a summary here once the task has been completed.

@Clanker Set frontmatter state to completed and update info about model and token usage.
