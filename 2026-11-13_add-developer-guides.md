---
commit_ref:
title: "Add developer guides"
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

@Clanker Add a summary here once the task has been completed.

@Clanker If author confirms results set frontmatter state to completed, otherwise to aborted. Update date, harness, provider and model. If you have access to session info update token count. Finally, update the changelog with the most important changes.
