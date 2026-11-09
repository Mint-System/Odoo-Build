---
commit_ref: 486b26433ed9bbdaacf70728626bf8a7c67182f4
title: "Provide modules.md as modules.csv"
author: "Janik von Rotz <login@janikvonrotz.ch>"
action: implement
state: completed
date_completed: 2026-11-05
harness: pi
provider: mistral
model: deepseek-v4-1-flash-1017
input_tokens: 21240
output_tokens: 7321
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

Rewrote `bin/update-modules-doc` to read the submodules from `versions/<version>/.gitmodules`
instead of checking out every version. The modules of a submodule are the directories at the
root of the pinned commit, read with `git ls-tree` from the local git folder or from a bare
mirror cached in `tmp/modules-doc-cache`. The script now writes both `docs/modules.md` and
`docs/modules.csv` (columns `forge,organisation,repo,module,versions`) from one data pass.

Speed: a run takes ~1m50s, dominated by the `git fetch` of the local checkouts. Output is
reproducible — a repeated `./bin/update-modules-doc --no-fetch` produces no diff. Flags
`--offline` (skip all fetches) and `--no-fetch` (skip mirror updates) allow faster runs.

Verification: `docs/modules.csv` and `docs/modules.md` both hold 3649 module rows across 88
repositories and are consistent with each other. Two warnings are expected and correct:
`OCA/contract` and `OCA/mass-mailing` at `19.0` pin commits that contain no module
directories (only `.github`).

Note: the changes were committed by the author as `ea5b9e37` and `7d5b3d04`.

@Clanker The task is complete. Please verify the results.

@Clanker If author confirms results set frontmatter state to completed, otherwise to aborted. Update date, harness, provider and model. If you have access to session info also add token count.
