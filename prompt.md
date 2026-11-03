---
title: "Migrate from Vuepress to Zensical"
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

# Migrate from Vuepress to Zensical

Note: @Clanker refers to the "ai agent" (you) who is working on this prompt file.

@Clanker when working on this prompt file, make sure to:

- Read the `AGENTS.md` and `README.md` to get an understanding of the project
- Read entire task section and prepare a list of todos
- Update the todo list while working on task

## Task

I want to replace Vuepress with Zensical.

### Reference

This task has also been completed for `~/Wiki`.

The prompt file is `~/Wiki/tmp/prompt-log/2026-10-26_migrate-from-vuepress-to-zensical.md`

### Remove Vuepress

Remove everything related to Vuepress:

- `.vuepress` config dir
- `package.json` packge file
- `pnpm-lock.yaml` pnpm lock file

In `task` remove the help rows.

### Prepare docs command

Create a new command `prepare-docs` that runs these commands:

- update-modules-doc
- update-revisions-doc
- update-snippets-doc

All the output (revisions.md, snippets.md, modules.md) must go into a `docs` folder.

Remove the existing files from root.

### Symlink docs

All the `*.md` in `images` folder have to be symlinked from `docs/images`.



### Install Zensical

The Taskfile alreay provides the command to install, preview and build with Zensical.

Run `init-zensical-docs` and update task help rows.

Then Zensical should build from `docs`.

### File naming

In `docs` rename `README.md` to `index.md`.

Use clean urls like `/tutorial/` instead of `/tutorial.html`.

### Add plausible

The Vupress project injected plausible.js code. Do the same with extra.js in Zensical. Use the same domain.

### Mint System link

The Vuepress site shows a button `[Mint System GmbH](https://www.mint-system.ch/)` in the nav.

Replicate this for Zensical. See reference on how it was done.

Make sure the button looks good in dark mode.

### Footer

And configure Zensical to link Mint System GmbH in the footer <https://zensical.org/docs/setup/footer/>.

### Top navigation

Ensure the main navigation is on the top.


@Clanker When task is completed set frontmatter state to review. Prompt the author to verify the results.

## Worklog

@Clanker Add a summary here once the task has been completed.

@Clanker If author confirms results set frontmatter state to completed, otherwise to aborted. Update date, harness, provider and model. If you have access to session info also add token count.
