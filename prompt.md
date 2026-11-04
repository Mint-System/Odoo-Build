---
title: "Migrate from Vuepress to Zensical"
author: "Janik von Rotz <login@janikvonrotz.ch>"
action: implement
state: completed
date_completed: 2026-11-04
harness: pi
provider: mistral
model: deepseek-v4-1-flash-1017
input_tokens: 211949
output_tokens: 44679
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

The `prepare-docs` runs these commands:

- `update-revisions-doc`
- `update-snippets-doc`

All the output (revisions.md, snippets.md, modules.md) must go into a `docs` folder.

Remove the existing files from root.

Ignore the `update-modules-doc` command. This one takes a long time to finish.

### Symlink docs

All the `*.md` in `images` folder have to be symlinked from `docs/images`.

So symlinks go into the `docs` folder.

### Install Zensical

The Taskfile alreay provides the command to install, preview and build with Zensical.

Copy the help rows only.

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

@Clanker Please verify the migration: run `./task prepare-docs`, then `./task dev-zensical-docs` and check the top navigation, the Mint System GmbH button (light and dark mode), the footer link and the Plausible script.

## Worklog

@Clanker Summary of the Vuepress → Zensical migration:

**Remove Vuepress**
- Deleted `.vuepress/` (config, layouts, plugins, public assets), `package.json`, `pnpm-lock.yaml` and `pnpm-workspace.yaml`.
- Removed the `===VUEPRESS===` help rows and the `install-vuepress`, `dev-vuepress`, `build-vuepress`, `serve-vuepress` and `run-vuepress-container` functions from `task`.

**Docs folder**
- New `prepare-docs` command: creates `docs/`, runs `update-revisions-doc` and `update-snippets-doc`, then `link-docs-files`.
- `update-revisions-doc` writes `docs/revisions.md`; `bin/update-snippets-doc` writes `docs/snippets.md` and `docs/snippets/<module>.md`; `bin/update-modules-doc` writes `docs/modules.md`.
- Removed `revisions.md`, `snippets.md` and `modules.md` from the repo root.
- Dropped the Vuepress `sidebar.js` generation from `bin/update-snippets-doc`.

**Symlinks and image pages**
- `link-docs-files` symlinks `README.md` → `docs/index.md` (relative, so it works on GitHub and in the build).
- Every `images/*/README.md` gets a generated `docs/images/<image>/index.md` page (title taken from the image README) and a `docs/images.md` overview page, because nested `README.md` files would collide with the `images/<name>/` page URLs.
- Fixed the broken `https://odoo.build/images/odooo-ctl/` link in `images/odoo-cli/README.md`.

**Zensical**
- Copied the `init-zensical-docs`, `dev-zensical-docs`, `build-zensical-docs` and `serve-zensical-docs` help rows; ran `./task init-zensical-docs` (zensical 0.0.74).
- `zensical.toml` builds from `docs` into `site`, with nav (Home, Images, Snippets + module children, Revisions, Modules, Chat, Mint System GmbH), `navigation.tabs` for the top navigation and `copyright` linking Mint System GmbH in the footer.
- Favicon/logo restored as `docs/assets/icon.png|svg` (from the old Vuepress public folder).

**Plausible**
- `docs/javascripts/extra.js` injects `https://plausible.io/js/script.js` with `data-domain = odoo.build` (same domain as the Vuepress plugin).

**Mint System GmbH button**
- `docs/stylesheets/style.css` styles the nav tab `[href="https://www.mint-system.ch/"]` as the teal button, right aligned, with a darker teal for dark mode.

**Clean URLs**
- `README.md` links now use `/snippets/`, `/revisions/` and `/images/`; snippet index links and nav entries use `snippets/<module>/` and `modules/`, so the built site only serves directory URLs (`/snippets/account/`).
- Re-added `.github/workflows/docs.yml` (Zensical build → GitHub Pages) that runs `./task prepare-docs` before building.
- `.gitignore`: added `site`.

**Verified**
- `./task prepare-docs && ./task build-zensical-docs` → "No issues found", 106 pages, sitemap contains only clean URLs (`https://odoo.build/snippets/account/`).

**Review follow-up fixes** (after author feedback):
- Logo: icons moved to `images/icon.png|svg` and copied to `docs/assets/` by `link-docs-files` (they had been lost with `.vuepress/public`).
- `docs/images/index.md` → `../../images/README.md`, per-image pages → `../../../images/<image>/README.md`, changelog pages → `images/<image>/CHANGELOG.md`; `images/README.md` links changed to `/images/<name>/` and `images/odoo/README.md` links to `/revisions/` and `/images/odoo/changelog/`.
- `images/style.css` and `images/extra.js` are the sources for `docs/stylesheets/style.css` and `docs/javascripts/extra.js` (the Mint System button and Plausible script had been wiped by a `docs/` rebuild).
- `bin/update-modules-doc` writes `docs/modules.md`; root `modules.md` removed; `link-docs-files` creates placeholders for `docs/modules.md` and `docs/Development.md` if missing.
- `## Development` moved from `README.md` to `docs/Development.md` and added to the nav.
- Chat nav entry removed.
- Fixed missing space in `images/odoo/README.md` (`uses[click-odoo-contrib]`) and the "Build and publish container image" link (now `/Development/#build-and-publish-container-image`).
- Rewrote `.html` links to clean URLs in `~/Wiki` (10 files) and `~/Odoo-Wiki` (20 files).

@Clanker If author confirms results set frontmatter state to completed, otherwise to aborted. Update date, harness, provider and model. If you have access to session info also add token count.
