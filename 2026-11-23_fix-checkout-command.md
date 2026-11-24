---
commit_ref: fe10bbe0bea259584827d9adf2f9c24c76f46b82
title: "Fix checkout command"
author: "Janik von Rotz <login@janikvonrotz.ch>"
session_id: 01a2081f-3010-7195-87ec-85db205bd95c
action: execute
state: completed
date_completed: 2026-11-23
harness: pi
provider: mistral
model: deepseek-v4-1-flash-1017
input_tokens: 70217
output_tokens: 30983
---

# Fix checkout command

Note: @Clanker refers to the "ai agent" (you) who is working on this prompt file.

@Clanker when working on this prompt file, make sure to:

- Read the `AGENTS.md` to get an understanding of the project
- Read task section and prepare a list of todos
- Update the todo list while working on task

@Clanker When task is completed set frontmatter state to review. If you have access to session info add token count and session id. Prompt the author to verify the results.

## Task

The `checkout` command is not working:

```
[main][~/Odoo-Build]$ task checkout 17.0
Copy .gitmodules and .python-version from 'versions/17.0'.
Update revision var in .env file.
Load refs for revision: 17.0
Clone git folders
Skipping: 'enterprise' already exists and is not empty.
Skipping: 'odoo' already exists and is not empty.
Skipping: 'themes' already exists and is not empty.
Skipping: 'addons/server_tools' already exists and is not empty.
Skipping: 'addons/project' already exists and is not empty.
Skipping: 'oca/sale-workflow' already exists and is not empty.
Skipping: 'addons/hr' already exists and is not empty.
Skipping: 'addons/stock_logistics_workflow' already exists and is not empty.
Skipping: 'addons/manufacture' already exists and is not empty.
Skipping: 'oca/stock-logistics-workflow' already exists and is not empty.
Skipping: 'oca/management-system' already exists and is not empty.
Skipping: 'oca/hr-attendance' already exists and is not empty.
Skipping: 'oca/hr-holidays' already exists and is not empty.
Skipping: 'addons/connector' already exists and is not empty.
Skipping: 'oca/manufacture' already exists and is not empty.
Skipping: 'oca/brand' already exists and is not empty.
Skipping: 'oca/server-tools' already exists and is not empty.
Skipping: 'oca/partner-contact' already exists and is not empty.
Skipping: 'addons/sale_workflow' already exists and is not empty.
Skipping: 'oca/bank-statement-import' already exists and is not empty.
Skipping: 'oca/project' already exists and is not empty.
Skipping: 'addons/account_invoicing' already exists and is not empty.
Skipping: 'addons/product_attribute' already exists and is not empty.
Skipping: 'addons/purchase_workflow' already exists and is not empty.
Skipping: 'oca/contract' already exists and is not empty.
Skipping: 'oca/product-attribute' already exists and is not empty.
Skipping: 'oca/purchase-workflow' already exists and is not empty.
Skipping: 'addons/account_financial_reporting' already exists and is not empty.
Skipping: 'oca/maintenance' already exists and is not empty.
Skipping: 'addons/account_reconcile' already exists and is not empty.
Skipping: 'addons/partner_contact' already exists and is not empty.
Skipping: 'addons/contract' already exists and is not empty.
Skipping: 'oca/account-invoicing' already exists and is not empty.
Skipping: 'addons/management_system' already exists and is not empty.
Skipping: 'addons/social' already exists and is not empty.
Checkout selected commit in git folders
Stash changes enterprise
Checkout 53992cbae0a80c90e5c322eae48514ead923cca9 in enterprise
Stash changes odoo
Checkout b9140efbf62db41e5cddf649cbd31dba7d03c60b in odoo
Stash changes themes
Checkout 7a17f406df528d22b1224b42f495d39e65f3c773 in themes
Stash changes addons/server_tools
Checkout f00a55eb137fe98872dd94a02e987180a0527786 in addons/server_tools
Stash changes addons/project
Checkout 16134a40feca4e342d02964113de027d5dda9ca1 in addons/project
Stash changes oca/sale-workflow
Checkout f16058a1ac60e2df7ab4ec6b978ddfe5e6c48460 in oca/sale-workflow
Stash changes addons/hr
Checkout 568162fa4b21301eadac43ae0817819891840666 in addons/hr
Stash changes addons/stock_logistics_workflow
Checkout 45d6bac35d5ef93c9823d1885b985731d0ad6ee5 in addons/stock_logistics_workflow
Stash changes addons/manufacture
Checkout d06f868002e84708f6f569789f489788760411d6 in addons/manufacture
Stash changes oca/stock-logistics-workflow
Checkout 7cb946bccac3bcce50791c4f5e0e0673a5b550c1 in oca/stock-logistics-workflow
Stash changes oca/management-system
Checkout 16c6976885b91539edc063d45dd54d04e06f713e in oca/management-system
Stash changes oca/hr-attendance
Checkout 5dc02c22526c3a979a756949cee79ce2e673710c in oca/hr-attendance
Stash changes oca/hr-holidays
Checkout 2db826251f171758a597a26b8b2f9194d1519209 in oca/hr-holidays
Stash changes addons/connector
Checkout 01717d832c156208d3c34448fb4e273e3ab70130 in addons/connector
Stash changes oca/manufacture
Checkout f7b72c41cb5790f62a5296f97b603271a32e00bf in oca/manufacture
Stash changes oca/brand
Checkout 07c686f1f69b23ff31b04f625358961aa99c327c in oca/brand
Stash changes oca/server-tools
Checkout 393791fbf41fb93d3473e10691db2d46b1ff8a51 in oca/server-tools
Stash changes oca/partner-contact
Checkout 52e61db4c5d84170eaba2ff91b706872045df55a in oca/partner-contact
Stash changes addons/sale_workflow
Checkout b8ea908f9c0350df15db4663f00d5559bc1f2361 in addons/sale_workflow
Stash changes oca/bank-statement-import
Checkout a9cf151fb88fecbf11354b02727e8f49df9503e5 in oca/bank-statement-import
Stash changes oca/project
Checkout 406f5d123f60d45f0611a01e9cf76e28af4b7401 in oca/project
Stash changes addons/account_invoicing
Checkout 35acb03bee60e1ad6bf73a1e6e2f4b9f686a80a5 in addons/account_invoicing
Stash changes addons/product_attribute
Checkout f117e0d02ff1d4d3aaed1e39757894a9cf47f374 in addons/product_attribute
Stash changes addons/purchase_workflow
Checkout 0ec4a4b0485836f5490de649a9f85698fdf0df7f in addons/purchase_workflow
Stash changes oca/contract
Checkout d7d5ad5d58a4ad8aa54ad6795993ec03cdfd062d in oca/contract
Stash changes oca/product-attribute
Checkout 0af5f97faeb30545d5b75cb27cf8ed6a17b0079e in oca/product-attribute
Stash changes oca/purchase-workflow
Checkout 08133d050a24e3c3b94504da3b946f60612a3eaa in oca/purchase-workflow
Stash changes addons/account_financial_reporting
Checkout 60cfd429ef448222df5e207bcaf6d4e43dba401a in addons/account_financial_reporting
Stash changes oca/maintenance
Checkout a5dc92e2eb68749595f0165c6accccb9c448273e in oca/maintenance
Stash changes addons/account_reconcile
Checkout f00d0d6618f2b7c8ea04971214ccc71a07981c53 in addons/account_reconcile
Stash changes addons/partner_contact
Checkout 15b6e653ab9201eed1f038a6b4289bd848fec848 in addons/partner_contact
Stash changes addons/contract
Checkout 37130528cab0a98fec52c73a3b64082eb834cc58 in addons/contract
Stash changes oca/account-invoicing
Checkout 0003dcd770ec7a77dbeffb3fb3e9d588429788e8 in oca/account-invoicing
Stash changes addons/management_system
Checkout 4a013e253767b8fa5fc6f82740595fe7f6d12dbf in addons/management_system
Stash changes addons/social
Checkout b84af18095d38529828d5707516d551e54e63844 in addons/social
Checkout Odoo version branch in git folders
Fetch branch 17.0 (shallow) from origin and then switch.
Fetch branch 17.0 (shallow) from origin and then switch.
[main][~/Odoo-Build]$ t list-git-folder .
| PATH                                | URL                                                | BRANCH   |
|-------------------------------------|----------------------------------------------------|----------|
| enterprise                          | odoo/enterprise                                    | 17.0     |
| odoo                                | odoo/odoo                                          | 17.0     |
| themes                              | odoo/design-themes                                 | detached |
| addons/server_tools                 | Mint-System/Odoo-Apps-Server-Tools                 | detached |
| addons/project                      | Mint-System/Odoo-Apps-Project                      | detached |
| oca/sale-workflow                   | OCA/sale-workflow                                  | detached |
| addons/hr                           | Mint-System/Odoo-Apps-HR                           | detached |
| addons/stock_logistics_workflow     | Mint-System/Odoo-Apps-Stock-Logistics-Workflow     | detached |
| addons/manufacture                  | Mint-System/Odoo-Apps-manufacture                  | detached |
| oca/stock-logistics-workflow        | OCA/stock-logistics-workflow                       | detached |
| oca/management-system               | OCA/management-system                              | detached |
| oca/hr-attendance                   | OCA/hr-attendance                                  | detached |
| oca/hr-holidays                     | OCA/hr-holidays                                    | detached |
| addons/connector                    | Mint-System/Odoo-Apps-Connector                    | detached |
| oca/manufacture                     | OCA/manufacture                                    | detached |
| oca/brand                           | OCA/brand                                          | detached |
| oca/server-tools                    | OCA/server-tools                                   | detached |
| oca/partner-contact                 | OCA/partner-contact                                | detached |
| addons/sale_workflow                | Mint-System/Odoo-Apps-Sale-Workflow                | detached |
| oca/bank-statement-import           | OCA/bank-statement-import                          | detached |
| oca/project                         | OCA/project                                        | detached |
| addons/account_invoicing            | Mint-System/Odoo-Apps-Account-Invoicing            | detached |
| addons/product_attribute            | Mint-System/Odoo-Apps-Product-Attribute            | detached |
| addons/purchase_workflow            | Mint-System/Odoo-Apps-Purchase-Workflow            | detached |
| oca/contract                        | OCA/contract                                       | detached |
| oca/product-attribute               | OCA/product-attribute                              | detached |
| oca/purchase-workflow               | OCA/purchase-workflow                              | detached |
| addons/account_financial_reporting  | Mint-System/Odoo-Apps-Account-Financial-Reporting  | detached |
| oca/maintenance                     | OCA/maintenance                                    | detached |
| addons/account_reconcile            | Mint-System/Odoo-Apps-Account-Reconcile            | detached |
| addons/partner_contact              | Mint-System/Odoo-Apps-Partner-Contact              | detached |
| addons/contract                     | Mint-System/Odoo-Apps-Contract                     | detached |
| oca/account-invoicing               | OCA/account-invoicing                              | detached |
| addons/management_system            | Mint-System/Odoo-Apps-Management-System            | detached |
| addons/social                       | Mint-System/Odoo-Apps-Social                       | detached |
[main][~/Odoo-Build]$
```

## Worklog

**Root cause** — two independent bugs:

1. `switch-git-folder` (in `~/taskfile.build/bin/`) ran `git fetch origin <branch>` and then `git switch <branch>` only for folders with `shallow = true`. All other folders reached `.gitmodules` via commit checkout, so they sat on a detached `HEAD` with no local `<version>` branch — the `switch` failed and the folder stayed detached (the `detached` rows in `task list-git-folder`).
2. `task checkout` ran `checkout-git-folder` **before** `switch-git-folder`, so even a successful switch moved each folder to the branch **tip** instead of the pinned revision commit.

**Changes**

- `~/taskfile.build/bin/switch-git-folder`: always fetch, create a missing local branch as a tracking branch, then switch. Each folder logs the exact git command it runs, so a failure names the step (`Fetch …`, `Create branch …`, `Switch …`). Normalizes single-branch shallow clone refspecs (`remote.origin.fetch`) so tracking setup works. Uses `--depth 1` only for `shallow = true`.
- `~/taskfile.build/bin/checkout-git-folder`: after checking out the pinned commit, re-attaches the local branch and resets it onto that commit, so the folder keeps both the pinned revision and a branch label.
- `task` — `checkout` now switches the version branch first, then checks out the pinned commit; failures surface via `log-warning` instead of being silently swallowed.

**Verification** — `./task checkout 17.0` exits 0; all 34 folders report branch `17.0`, `HEAD` matches every `.gitmodules` `commit` (0 mismatches, 0 detached). Shallow-clone branch creation and the failure path were tested in throwaway repos under `tmp/`.

**Follow-up** — switching to `18.0` with `odoo` and `enterprise` marked `shallow = true` failed with `! [rejected] 18.0 -> origin/18.0 (non-fast-forward)`. Those repos already had an `origin/18.0` remote-tracking ref from a full fetch, and a `--depth 1` fetch with an explicit refspec tries to *rewrite* that ref onto the new shallow tip, which git rejects. Fixed by only fetching when `refs/remotes/origin/<branch>` is missing; an existing ref is left to the normal `switch` path. Re-running `task checkout 18.0` exits 0 with all 55 folders on branch `18.0` at their pinned commits, and `odoo`/`enterprise` pass `git fsck`.

**Follow-up 2** — log output trimmed: the per-folder messages no longer echo the git command (`Switch odoo to 18.0` instead of `Switch odoo to 18.0: git -C odoo switch 18.0`). Failures still report the step name plus the git error.

**Follow-up 3** — `versions/19.0/.gitmodules` had two broken entries, which only surface on a fresh clone because `clone-git-folder` skips existing directories and never re-points `origin`:

- `addons/account_financial_reporting` declared `Mint-System/Odoo-Apps-account_financial_reporting`, which does not exist on GitHub (versions 14.0–18.0 use `Odoo-Apps-Account-Financial-Reporting`). Corrected the URL; verified a fresh `--branch 19.0` clone resolves and lands on the pinned `076bab3`.
- `addons/hr/` used a trailing slash in both the submodule key and path, so `git config -f .gitmodules --get submodule.addons/hr.url` returned nothing, and its `commit` was the literal string `HEAD`. Renamed to `addons/hr` and set the real hash `e511b20`.

Left `addons/manufacture` and `addons/project` untouched: their declared URLs resolve (GitHub treats owner/repo case as an alias), and repointing `manufacture` would change which repository an existing clone tracks.

**Note** — `~/taskfile.build/tests/test_git` exits 1 at its own `git switch -c … || git switch …` line under `set -e`. This reproduces with the pristine library, so it is a pre-existing test bug unrelated to these changes.

Awaiting author verification.

**Result** — Confirmed by the author. Final state after `./task checkout 19.0`: all 32 git folders on branch `19.0` at their pinned commits (0 mismatches, 0 detached).

@Clanker If author confirms results set frontmatter state to completed, otherwise to aborted. Update date, harness, provider and model. If you have access to session info update token count. Finally, update the changelog with the most important changes.
