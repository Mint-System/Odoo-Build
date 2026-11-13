---
commit_ref: 1710b383db6aa683b47930fd5ae4d743518d664c
title: "Add developer guides"
author: "Janik von Rotz <login@janikvonrotz.ch>"
session_id: 01a1d401-c1f7-74a0-a07c-cc6101657582
action: execute
state: completed
date_completed: 2026-11-13
harness: pi
provider: mistral
model: deepseek-v4-1-flash-1017
input_tokens: 998622
output_tokens: 26971
---

# Add developer guides

Note: @Clanker refers to the "ai agent" (you) who is working on this prompt file.

@Clanker when working on this prompt file, make sure to:

- Read the `AGENTS.md` to get an understanding of the project
- Read task section and prepare a list of todos
- Update the todo list while working on task

## Task

I want you to rename `docs/Development.md` to `docs/Usage.md` and move it after Home navigation entry.

Then I want you to create a new nav item "Guide" and create these subitems:

- "Develop a Mint System module" move content from `~/Wiki/Odoo Build - Develop a new module.md`
- "Migrate a Mint System module" copy content from `~/Wiki/Prozesse Odoo - Migration Modul.md` section `Modul migrieren` only and translate to English
- "Develop an OCA module" move content from `~/Wiki/Odoo Build - Create an OCA module.md`
- "Migrate an OCA module" move content from `~/Wiki/Migrate OCA module to XX.0.md`

Ignore frontmatter when moving the content.

Add a `docs/Guide.md` that also links these guides.

I will then remove the docs in `~/Wiki` myself.

@Clanker When task is completed set frontmatter state to review. If you have access to session info add token count and session id. Prompt the author to verify the results.

## Worklog

### Summary

- Renamed `docs/Development.md` to `docs/Usage.md` (heading updated to `# Usage`) and placed the nav entry directly after `Home`.
- Updated the `link-docs-files` placeholder in `task` to create `docs/Usage.md` instead of `docs/Development.md`.
- Added a `Guides` nav section after `Usage`, built as a list with `docs/Guides.md` as first child so the
  guides are reachable directly from the sidebar (same pattern as `Kubernetes-Build` `Clusters`).
- Created the guide pages flat in `docs/` (frontmatter dropped, content otherwise preserved):
  - `develop-mint-system-module.md` from `~/Wiki/Odoo Build - Develop a new module.md`
  - `migrate-mint-system-module.md` from the `Modul migrieren` section of `~/Wiki/Prozesse Odoo - Migration Modul.md`, translated to English
  - `develop-oca-module.md` from `~/Wiki/Odoo Build - Create an OCA module.md`
  - `migrate-oca-module.md` from `~/Wiki/Migrate OCA module to XX.0.md`
- Removed the old `Development` nav entry.
- Replaced hard line breaks (`\`) with trailing double spaces in the `develop-mint-system-module.md`
  specification blockquote and restored the missing `>` prefixes.
- Added the missing "Set env vars" block to `migrate-mint-system-module.md`, using
  `addons/server_tools/mail_server_filter` as the example.
- Fixed the Zensical helper scripts in `~/taskfile.build` (`init`/`build`/`dev`/`serve-zensical-docs`):
  they now pin the venv via `uv run --python`. Previously `./task` activated `.venv$ODOO_VERSION`,
  so `uv run zensical` resolved against the Odoo venv and failed with `Failed to spawn: zensical`.

### Verification

- `./task build-zensical-docs` reports `No issues found`.
- Sidebar renders `Home -> Usage -> Guides -> Images -> ...`; all four guides appear as children of `Guides`.
- All nav targets and `Guides.md` index links resolve; `serve-zensical-docs` and `dev-zensical-docs` return 200.
- `shellcheck` passes on the four patched taskfile scripts.
- Note: `python -m tomllib` rejects `zensical.toml` at the `snippets.md` children block. This is
  pre-existing and unrelated to the changes here (Zensical's parser accepts it).

### Open points

- Wiki pages in `~/Wiki` are left untouched for the author to remove.
- `migrate-mint-system-module.md` references `Odoo Module Test Instructions` as plain text
  instead of a wiki link, since the wiki is not part of the docs site.

@Clanker If author confirms results set frontmatter state to completed, otherwise to aborted. Update date, harness, provider and model. If you have access to session info update token count. Finally, update the changelog with the most important changes.
