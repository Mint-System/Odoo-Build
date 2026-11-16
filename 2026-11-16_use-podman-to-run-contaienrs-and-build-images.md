---
commit_ref:
title: "Use podman to run contaienrs and build images"
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

# Use podman to run contaienrs and build images

Note: @Clanker refers to the "ai agent" (you) who is working on this prompt file.

@Clanker when working on this prompt file, make sure to:

- Read the `AGENTS.md` to get an understanding of the project
- Read task section and prepare a list of todos
- Update the todo list while working on task

## Task

I learned that podman supports multi platform builds: <https://oneuptime.com/blog/post/2026-03-16-build-multi-architecture-images-podman-build/view>

### Build

Intead of setting `CONTAINER_ENGINE` I want the `build-odoo`, `build-odoo-cli`, `build-odoo-mailgate` and `build-odoo-upgrade` to user Docker by default.

Then I want a new command `build-odoo-with-podman`. This command uses podman to build the image. The command has the same flags as `build-odoo`.

### Start

To run containers with podman I set `CONTAINER_ENGINE=podman`.

I have uninstalled `docker` and installed `podman`.

@Clanker When task is completed set frontmatter state to review. If you have access to session info add token count and session id. Prompt the author to verify the results.

## Worklog

@Clanker Add a summary here once the task has been completed.

@Clanker If author confirms results set frontmatter state to completed, otherwise to aborted. Update date, harness, provider and model. If you have access to session info update token count. Finally, update the changelog with the most important changes.
