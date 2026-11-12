---
commit_ref: a1dcacd970fdc2481fb54d7e25c951de3b66e54b
title: "Fix install from pypi.org check"
author: "Janik von Rotz <login@janikvonrotz.ch>"
session_id: 2026-11-12T16-26-38-636Z_01a1d095-28ab-7257-8897-a31b4f15abbe
action: execute
state: completed
date_completed: 2026-11-12
harness: pi
provider: mistral
model: deepseek-v4-1-flash-1017
input_tokens: 19733
output_tokens: 1908
---

# Fix install from pypi.org check

Note: @Clanker refers to the "ai agent" (you) who is working on this prompt file.

@Clanker when working on this prompt file, make sure to:

- Read the `AGENTS.md` to get an understanding of the project
- Read task section and prepare a list of todos
- Update the todo list while working on task

## Task

There is a issue in `images/odoo/bin/install-python-packages`.

If the pypi.org check fails the scripts exits and the entire entrypoint.sh is aborted:

```
oot@pict-dcv-od001:~# docker logs odoo01 --tail 10 -f
| | | |/ _| |/ _ \ / _ \  |  _ \| | | | | |/ _| |
| |_| | (_| | (_) | (_) | | |_) | |_| | | | (_| |
 \___/ \__,_|\___/ \___/  |____/ \__,_|_|_|\__,_|

Maintainer: Mint System GmbH <info@mint-system.ch>
ENTRYPOINT: Run as user with id: uid=0(root) gid=0(root) groups=0(root)
ENTRYPOINT: Assemble addons path /mnt/addons/,/mnt/enterprise...
ENTRYPOINT: Prepend /mnt/extra-addons to addons path.
ENTRYPOINT: Prepend /mnt/enterprise to addons path.
ENTRYPOINT: Resolve addons path for Odoo 17.0...
ENTRYPOINT: Run envsubst on /etc/odoo/odoo.conf.template and output: /etc/odoo/odoo.conf
ENTRYPOINT: Check status of PyPi.
root@pict-dcv-od001:~# curl -s --head --request GET https://pypi.org/simple/ --connect-timeout 5 --max-time 10
root@pict-dcv-od001:~# echo $?
28
root@pict-dcv-od001:~#
```

Please fix the script so it does not exit.

@Clanker When task is completed set frontmatter state to review. If you have access to session info add token count and session id. Prompt the author to verify the results.

## Worklog

**Root cause:** `images/odoo/bin/install-python-packages` runs under `set -e`. The PyPI check assigned the output of `curl ... | grep 'HTTP/2 200'` to `http_pypi_ok`. When `curl` failed (exit 28, timeout) `grep` received no input and exited `1`, so the assignment returned non-zero and `set -e` aborted the whole `entrypoint.sh` right after the "Check status of PyPi" log line.

**Fix:** Added `|| true` to the check command so a failed probe is non-fatal. The existing warning is still logged and the script continues to install `PYTHON_INSTALL` packages and `requirements.txt`.

```bash
http_pypi_ok=$(curl -s --head --request GET https://pypi.org/simple/ --connect-timeout 5 --max-time 10 | grep 'HTTP/2 200') || true
```

**Verification:**
- `bash -n` on the script passes.
- Reproduced the failure with an unreachable host: previously exit 1 and abort, now logs `PyPI is unreachable...` and continues (`CONTINUED OK`, exit 0).
- `images/odoo/CHANGELOG.md` updated under `Unreleased > Fixed`.

**Files changed:**
- `images/odoo/bin/install-python-packages`
- `images/odoo/CHANGELOG.md`

Note: `uv pip install` failures still abort the entrypoint intentionally, as those are real install errors.

@Clanker If author confirms results set frontmatter state to completed, otherwise to aborted. Update date, harness, provider and model. If you have access to session info update token count. Finally, update the changelog with the most important changes.
