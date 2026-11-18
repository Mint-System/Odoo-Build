---
commit_ref:
title: "Fix Odoo 20 registry crash on stale po entries"
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

# Fix Odoo 20 registry crash on stale po entries

Note: @Clanker refers to the "ai agent" (you) who is working on this prompt file.

@Clanker when working on this prompt file, make sure to:

- Read the `AGENTS.md` to get an understanding of the project
- Read task section and prepare a list of todos
- Update the todo list while working on task
- Change only the files listed under "Scope"
- State findings without making suggestions

## Issue

On `themis` the `odoo43` container serves a blank page for the production database `odoo`. The staging database `staging` on the same container and image works.

Two symptoms, both from the same line:

Update path (`click-odoo-update`):

```
File "/opt/odoo/odoo/tools/translate.py", line 1413, in __iter__
    _, module = match.groups()
AttributeError: 'NoneType' object has no attribute 'groups'
```

Request path:

```
GET /web/webclient/translations?hash=&lang=de_CH HTTP/1.1" 500
  File "/opt/odoo/odoo/tools/translate.py", line 2640, in get_web_translations
  File "/opt/odoo/odoo/tools/translate.py", line 1413, in __iter__
AttributeError: 'NoneType' object has no attribute 'groups'
```

## Analysis

`odoo/tools/translate.py:1412` calls `match.groups()` without checking for `None`:

```python
match = re.match(r"(module[s]?): (\w+)", entry.comment)
_, module = match.groups()
```

`entry.comment` is empty for translations that were removed from the module source but are still present in `de.po`. These entries have no `#.` comment and no `#:` occurrence, so nothing can fill in `module:`.

Confirmed on `themis`, `/opt/odoo/addons/bus/i18n/de.po`:

```
msgid  : 'Save your work and refresh to get the latest updates and avoid potential issues.'
comment: ''
tcomment: ''
occurrences: []
```

The string no longer exists in `odoo/addons/bus` nor in any `.pot` file.

`PoFileReader.__init__` merges the sibling `.pot` into the `.po` to refresh outdated comments. That merge only repairs entries which still exist in the `.pot`. The image deletes all `.pot` files from the core Odoo tree:

```
images/odoo/Dockerfile:55
find /opt/odoo -type f \( -name "*.pot" -o -name "*.md" -o -name "*.rst" \) -delete;
```

Measured on `themis`:

| Path | `.pot` files |
| --- | --- |
| `/opt/odoo` (core addons) | 0 |
| `/mnt/enterprise`, `/mnt/addons` (mounted) | 855 |

Effect of the `.pot` merge:

| Module | `.pot` | entries failing `re.match` before | after merge |
| --- | --- | --- | --- |
| `account_loans` | yes | 2 | 0 |
| `web_map` | yes | 20 | 0 |
| `bus` | no | 2 | 2 |
| `digest` | no | 1 | 1 |
| `mail_bot` | no | 1 | 1 |

Why only production is affected: `_update_translations` loads `.po` files only for installed languages. `de_CH` falls back to `de` through `get_base_langs`.

| Database | Active languages |
| --- | --- |
| `odoo` | `en_US`, `de_CH` |
| `staging` | `en_US` |

## Task

Keep the `.pot` files in the image, so the existing merge repairs stale comments. This restores the intended behaviour but does not fix the underlying crash.

@Clanker Ask the author which option to implement before changing code.

## Scope

- `images/odoo/Dockerfile`
- `odoo/odoo/tools/translate.py` (Option A only)
- `images/odoo/CHANGELOG.md`
- `CHANGELOG.md`

@Clanker For a patched `odoo/` tree, capture the change so it survives a fresh checkout of the Odoo source, for example as a patch file or a documented `./task` step. Ask the author for the preferred mechanism.

## Verification

1. Build the image with `./task build-odoo`.
2. Start the image and enable `AUTO_UPDATE_TRANSLATIONS=true`.
3. Load `de_CH` translations for `bus`, `digest` and `mail_bot`; the import must complete without `AttributeError`.
4. Request `/web/webclient/translations?lang=de_CH` and expect HTTP 200.

## WIP

@Clanker When the author says stop, capture the progress here and set the frontmatter state to `wip`.
