---
title: "Script to add module repos to apps.odoo.com"
---

# Run 25

Note: @Agent refers to the AI agent (you) who is working on this task.

@Agent when working on this task, make sure to:

- Read context and task section first
- Prepare a list of todos
- Update the todo list while working on the task

## Context

Read the `AGENTS.md` and `README.md` to get an understanding of the project.

## Task

I have this Odoo module repos in my project:

```
[main][~/Odoo-Build]$ task list-git-folder addons
| PATH                                | URL                                                | BRANCH   |
|-------------------------------------|----------------------------------------------------|----------|
| addons/server_tools                 | Mint-System/Odoo-Apps-Server-Tools                 | 19.0     |
| addons/management_system            | Mint-System/Odoo-Apps-Management-System            | 19.0     |
| addons/sale_workflow                | Mint-System/Odoo-Apps-Sale-Workflow                | 19.0     |
| addons/account_invoicing            | Mint-System/Odoo-Apps-Account-Invoicing            | 19.0     |
| addons/purchase_workflow            | Mint-System/Odoo-Apps-Purchase-Workflow            | 19.0     |
| addons/stock_logistics_workflow     | Mint-System/Odoo-Apps-Stock-Logistics-Workflow     | 19.0     |
| addons/spreadsheet                  | Mint-System/Odoo-Apps-Spreadsheet                  | 19.0     |
| addons/product_attribute            | Mint-System/Odoo-Apps-Product-Attribute            | 19.0     |
| addons/website                      | Mint-System/Odoo-Apps-Website                      | 19.0     |
```

I would like to register all of them on app.odoo.com.

Here is the request to reigster:

```
curl 'https://apps.odoo.com/apps/upload_repo' \
  --compressed \
  -X POST \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:140.0) Gecko/20100101 Firefox/140.0' \
  -H 'Accept: */*' \
  -H 'Accept-Language: en-US,en;q=0.5' \
  -H 'Accept-Encoding: gzip, deflate, br, zstd' \
  -H 'Referer: https://apps.odoo.com/apps/upload' \
  -H 'Content-Type: application/json' \
  -H 'Origin: https://apps.odoo.com' \
  -H 'DNT: 1' \
  -H 'Sec-GPC: 1' \
  -H 'Connection: keep-alive' \
  -H 'Cookie: frontend_lang=en_US; session_id=uClcf_a6u8TFfkrmJ3BrP4yY3EK-zqDw8C8lhRjBRP_WReMx0ORtGLinkNnhn0DX251njzQy_5ym19A6Q2MS; tz=Europe/Paris' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'Priority: u=0' \
  -H 'TE: trailers' \
  --data-raw '{"id":0,"jsonrpc":"2.0","method":"call","params":{"url":"git@github.com:Mint-System/Odoo-Apps-Sale-Workflow.git#18.0"}}'
```

If the repos does not exist yet, the answer is:

```
{"jsonrpc": "2.0", "id": 0, "result": {"repo_id": 72598, "state": "draft", "scan_log": ""}}
```

If the repo exists the answer is:

```
{"jsonrpc": "2.0", "id": 0, "result": {"error": "This repository and branch are already registered."}}%
```

To enable auto-scan on the repo request:

```
curl 'https://apps.odoo.com/apps/repo_auto_scan' \
  --compressed \
  -X POST \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:140.0) Gecko/20100101 Firefox/140.0' \
  -H 'Accept: */*' \
  -H 'Accept-Language: en-US,en;q=0.5' \
  -H 'Accept-Encoding: gzip, deflate, br, zstd' \
  -H 'Referer: https://apps.odoo.com/apps/dashboard/repos' \
  -H 'Content-Type: application/json' \
  -H 'Origin: https://apps.odoo.com' \
  -H 'DNT: 1' \
  -H 'Sec-GPC: 1' \
  -H 'Connection: keep-alive' \
  -H 'Cookie: frontend_lang=en_US; session_id=uClcf_a6u8TFfkrmJ3BrP4yY3EK-zqDw8C8lhRjBRP_WReMx0ORtGLinkNnhn0DX251njzQy_5ym19A6Q2MS; tz=Europe/Paris' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'Priority: u=0' \
  --data-raw '{"id":0,"jsonrpc":"2.0","method":"call","params":{"repo_id":"72597","auto_scan":true}}'
```

To scan a repo run this:

```
  curl 'https://apps.odoo.com/apps/scan_repo' \
  --compressed \
  -X POST \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:140.0) Gecko/20100101 Firefox/140.0' \
  -H 'Accept: */*' \
  -H 'Accept-Language: en-US,en;q=0.5' \
  -H 'Accept-Encoding: gzip, deflate, br, zstd' \
  -H 'Referer: https://apps.odoo.com/apps/dashboard/repos' \
  -H 'Content-Type: application/json' \
  -H 'Origin: https://apps.odoo.com' \
  -H 'DNT: 1' \
  -H 'Sec-GPC: 1' \
  -H 'Connection: keep-alive' \
  -H 'Cookie: frontend_lang=en_US; session_id=uClcf_a6u8TFfkrmJ3BrP4yY3EK-zqDw8C8lhRjBRP_WReMx0ORtGLinkNnhn0DX251njzQy_5ym19A6Q2MS; tz=Europe/Paris' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'Priority: u=0' \
  -H 'TE: trailers' \
  --data-raw '{"id":1,"jsonrpc":"2.0","method":"call","params":{"repo_id":"72597"}}'
```

Your task is to create a Python script that registers the repo and enables auto scan.

The scripts takes a folder path with git projects as input. For every .git project it gets the ssh remote url.

The name of the Python script is: register-module-repos

The script also prompts for a cookie. It gives instructions on how to open the browser, login into apps.odoo.com and retrieve the cookie.

## Summary

The script was created at `register-module-repos` with the following features:

1. **Git repository discovery**: Scans a given folder for git repositories with remote URLs
2. **Odoo version filtering**: Optional parameter to filter repos by branch name (e.g., `19.0`)
3. **Cookie handling**: Prompts for session_id and constructs the full cookie string
4. **Repo registration**: Registers each repository on apps.odoo.com via the `/apps/upload_repo` API
5. **Auto-scan enablement**: Enables auto-scan for newly registered repos via `/apps/repo_auto_scan` API
6. **Duplicate handling**: Gracefully skips already registered repositories
7. **Summary output**: Shows registration statistics at the end

### Usage

```bash
# Direct script usage
./register-module-repos <folder_path> [odoo_version]

# Examples
./register-module-repos addons
./register-module-repos addons 19.0
```

### Task script integration

Added `register-module-repos` command to `task` script:

```bash
./task register-module-repos [version] [path]

# Examples
./task register-module-repos 19.0 addons
./task register-module-repos  # Uses ODOO_VERSION env var and defaults to addons
```

### Execution results

Successfully registered 8 new repositories on apps.odoo.com for Odoo 19.0:
- spreadsheet (repo_id: 72600)
- stock_logistics_workflow (repo_id: 72601)
- management_system (repo_id: 72602)
- product_attribute (repo_id: 72603)
- website (repo_id: 72604)
- account_invoicing (repo_id: 72605)
- purchase_workflow (repo_id: 72606)
- server_tools (repo_id: 72607)

Skipped 2 already registered repositories:
- sale_workflow
- thirdparty
