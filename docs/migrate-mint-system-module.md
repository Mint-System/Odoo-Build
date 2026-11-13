# Migrate a Mint System module

## Prepare

Set env vars.

```bash
source_version=17.0
target_version=18.0
repo=server_tools
module=mail_server_filter
```

- Checkout the new Odoo version in Odoo Build:

```bash
task checkout $target_version
```

- Checkout the module from the previous version:

```bash
cd addons/$repo
git checkout $source_version $module
```

## Migrate

```bash
task migrate-module addons/$repo/$module
```

- Update the module docs:

```bash
task generate-module-docs addons/$repo/$module
```

- Install and test the module:

```bash
task init-module addons/$repo/$module
task test-module addons/$repo/$module
```

- Lint the repo and update the docs:

```bash
cd addons/$repo/
task all
```

- Create test instructions (see `Odoo Module Test Instructions` in the Mint System Wiki)

## Commit

- Commit the migration:

```bash
git -C addons/$repo add --all
git -C addons/$repo commit -m "feat($module): migrate"
```

- Optionally create a pull request:
	- Create a feature branch `git switch -c mig-$module`
	- Create a PR with the CLI `gh pr create`
	- Once the PR is merged, deploy the submodule repo
- Push the changes:

```bash
git -C addons/$repo push
```
