---
commit_ref:
title: "Provide modules.md as modules.csv"
author: "Janik von Rotz <login@janikvonrotz.ch>"
action: implement
state: draft
date_completed: YYYY-MM-DD
harness:
provider:
model:
input_tokens:
output_tokens:
---

# Provide modules.md as modules.csv

Note: @Clanker refers to the "ai agent" (you) who is working on this prompt file.

@Clanker when working on this prompt file, make sure to:

- Read the `AGENTS.md` and `README.md` to get an understanding of the project
- Read entire task section and prepare a list of todos
- Update the todo list while working on task

## Task

The `update-modules-doc` creates the `docs/modules.md`. Update the `bin/update-modules-doc` to also create `docs/modules.csv`.

The command takes a long time to finish. Maybe it is possible to speed it up or gather the module data in a different way.

One idea would reading the `./versions/**/.gitmodules` files and then list folders of the remotes.

@Clanker When task is completed set frontmatter state to review. Prompt the author to verify the results.

## Worklog

@Clanker Add a summary here once the task has been completed.

@Clanker If author confirms results set frontmatter state to completed, otherwise to aborted. Update date, harness, provider and model. If you have access to session info also add token count.
