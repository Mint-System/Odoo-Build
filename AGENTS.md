# AGENTS.md

## General agent guidance

This section outlines the universal rules and expectations for any LLM agent working within this repository.

**Safety and Quality First:** The highest priority is to produce secure, well-documented, and high-quality code. Do not introduce vulnerabilities, hardcoded secrets, or unreadable code.

**Propose a Plan:** For any new task, first provide a brief plan of action. This plan should clearly outline the intended changes and the rationale behind them.

**Maintain Context:** Before making any changes, an agent must read and understand the relevant files, including the project's main documentation and existing code structure.

**Be Sparse:** Only introduce new code if needed. Comment only what is worth commenting. When testing focus on the business use case. 

## Project structure

- `task`: The main entry point. It manages the entire project.
- `addons/`: 
- `bin/`: Contains helper scripts for the task file.
- `enterprise/`: Here is the Odoo enterprise source code.
- `images/`: This folder contains the build files for multiple Docker images.
	- `odoo/`: This is the main image.
- `odoo/`: Here is the Odoo enterprise source code.
- `revisions/`: Generated Odoo revision files.
- `snippets/`: Big folder with XML-edit files. Ignore.
- `templates/`: Templates for Odoo modules and git repos.
- `themes/`: Official Odoo website themes.

## Environment & tooling

### Taskfile

This project uses the <https://taskfile.build/> standard.

The `./task` file is a bash script that provides all functions necessary to work with this project.

Always try to run a command with the `./task` file script.

## Common tasks

### Install

Install project dependencies.

```bash
task install
```

### Module Development

To create module code use the `task generate-module-*` commands.

```bash
task generate-module-views addons/project/project_sprint project.sprint
```

If the database is running (`task start db`) then install the module like this:

```bash
task init-module addons/project/project_sprint
```

Use `lint-module` to lint the module code. You can also run the `task lint` in the module repo folder.

You can also uninstall a module.

```bash
task uninstall-module addons/project/project_sprint
```

## Coding conventions

### Odoo - XML / Python / Javascript

When developing Odoom modules refer to the [Odoo Coding Guidelines](https://www.odoo.com/documentation/master/contributing/development/coding_guidelines.html) and the [OCA Guidelines](https://github.com/OCA/odoo-community.org/blob/master/website/Contribution/CONTRIBUTING.rst). Both documents are very detailed; here are the key points:

### XML

**Module structure:** Organize files into the conventional folders (`models/`, `views/`, `wizard/`, `report/`, `security/`, `data/`, `static/`). Wizards (transient models) get their own `<name>.py` + `<name>_views.xml` pair inside `wizard/`.

**Record declaration:** Use the `<record>` notation rather than the deprecated shortcuts. For field declaration, the `name` attribute always comes first, then the value (in the tag or `eval`), then other attributes ordered by importance.

**Grouping:** Group records by model in the file; this convention can be relaxed when there are dependencies between actions/menus/views.

**noupdate data:** Use `<data>` only to scope `noupdate="1"` records. If the whole file is non-updatable, put `noupdate="1"` directly on `<odoo>` and skip the `<data>` tag.

**XML ID naming:** Views use `<model_name>_view_<view_type>` (kanban, form, list, search…). The main action for a model is `<model_name>_action`; secondary actions get a `_<detail>` suffix. Groups use `<module_name>_group_<group_name>`, and rules use `<model_name>_rule_<concerned_group>`.

**Inherited views:** Suffix the `name` field with `.inherit.<details>` so the override's purpose is clear at a glance; new primary views don't need this suffix.

### Python

**Class naming:** Odoo Python classes use Pascal case (this changed from camelcase in older versions — be aware which Odoo version a codebase targets).

**Model naming:** Use the singular dot notation for model names (`res.partner`, not `res.partners`), and a `<related_base_model>.report.<action>` pattern for report/SQL-view models.

**Attribute/method ordering inside a model:** private attributes (`_name`, `_description`, …) first, then default methods (`_default_*`), then field declarations, then compute/onchange/constraint methods, then CRUD overrides, then action methods, and finally other business methods. Action methods are prefixed `action_`, operate on a single record, and should call `self.ensure_one()` first.

**Variable naming:** Suffix variables with `_id`/`_ids` only when they hold an actual id or list of ids — not a recordset. One2many/Many2many fields always take the `_ids` suffix; Many2one fields take `_id`.

**Style baseline:** Follow PEP8 (4-space indents, grouped/ordered imports: stdlib, third-party, local).

**Odoo idioms:** Avoid creating your own generators and decorators — use only the ones the Odoo API provides — and prefer `filtered`, `mapped`, `sorted`, etc. over manual loops for readability and performance. Remember the context is a frozendict and cannot be mutated.

**Documentation:** Document code with docstrings on methods and comments on tricky parts.

### JavaScript

**Static layout:** Files in a module's `static/` folder are served at a URL prefixed with the module name (e.g. `static/src/js/some_file.js` → `your-server.com/<module>/static/src/js/some_file.js`). Third-party JS libraries go under `static/lib/<libname>/`.

**File organization:** Each component lives in its own, meaningfully-named file, mirroring the same logic used for Python models; subdirectories structure larger "packages." The same per-component-file logic applies to QWeb templates and SCSS.

**Class naming:** Prefix CSS/JS classes with `o_<module_name>` (technical module name, or main route for website-style modules).

**Assets:** Never link to external images or libraries by URL — vendor them into the codebase instead.

A few of these (Pascal case for Python classes, `tree` vs `list` view type) changed between Odoo versions, so worth double-checking the exact version your guideline doc targets.

### Bash

The following guideline is heavily based on the [Bash Style Guide | ysap.sh](https://style.ysap.sh/), which should be considered the primary reference for style. Adhere to the following principles to ensure scripts are safe, predictable, and maintainable.

**Shebang:** Start scripts with `#!/usr/bin/env bash` for portability.

**Quoting:** This is critical.

- Use double quotes `"` for strings that require variable expansion.
- Use single quotes `'` for all other strings.

**Always quote variable expansions** `"$var"` to prevent word-splitting and globbing issues.

**Variables:** Distinct between local and environment vars.

- Use `local` for all variables inside functions.
- Use lowercase names for local variables (e.g., `buildx_output`).
- Use uppercase names for environment variables (e.g. `export BUILDX_PLATFORM`)

**Functions:**

- Do not use the `function` keyword.
- Use `my-func() { ... }` syntax.
- Function names are in kebab case.

**Conditionals:**

- Always use `[[ ... ]]` for conditional testing, not `[ ... ]` or `test`.
- Use `((...))` for arithmetic comparisons (e.g., `((a > b))`).
- When replacing `[]` with `[[]]` make sure to escape the brackets. The `[]` is a regex filter.

**Command Substitution:**

- Always use `$(...)` for command substitution, not backticks.

**Arrays:**

- Use Bash arrays to manage lists of items instead of space-separated strings.
- Iterate over arrays using `for item in "${my_array[@]}"; do ... done`.

**Avoid External Commands:**

- Use Bash's built-in parameter expansion for string manipulation (e.g., `${var/foo/bar}`).
- Use globbing (`*`) to iterate over files, not `ls`.
- Avoid `cat` when a command can read a file directly (e.g., `grep "pattern" file`).

**`eval`:** Never use `eval`.