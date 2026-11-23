Development
===

How to develop the Odoo Build project.

## Build and publish container image

Ensure the host machine can build [multi-platform images](https://docs.docker.com/desktop/features/containerd/#build-multi-platform-images).

Checkout latest revision of the Odoo version.

```bash
task checkout-latest-revision
```

Build and publish the Odoo image.

```bash
task build images/odoo --push
```

## Create Odoo revision

Check the latest official Odoo image tag on <https://hub.docker.com/_/odoo/tags>.

Replace the `-` with a `.` in the tag name and create a revision:

```bash
task create-revision "$VERSION.YYYYDDMM"
```

Replace all image references in the docs.

Commit and push revision with tag:

```bash
task commit-and-push-revision
```

## Update repo template from OCA repo template

Prepare the enviroment:

```bash
export VERSION=20.0
source .venv$VERSION/bin/activate
uv tool install copier
```

Run copier to copy the OCA template files:

```bash
copier copy --UNSAFE https://github.com/OCA/oca-addons-repo-template.git "templates/$VERSION"
```

Answer with:

- Version: `$VERSION`
- Organisation slug: `Mint-System`
- Organisation name: `Mint System GmbH`
- Repo slug: `template`
- Accepts default for all remaining questions.

Remove unnecessary linter files.

```bash
cd "templates/$VERSION"
rm .copier-answers.yml
rm .pylintrc-mandatory
rm README.md
rm renovate.json
rm checklog-odoo.cfg
```

Copy the `templates/$VERSION/.github` from last version.

```bash
rm -rf .github
cp -r ../19.0/.github .
```

Extend the `templates/$VERSION/.gitignore` with:

```txt
# Odoo Build
tmp
prompt.md
```

In `.pre-commit-config.yaml` remove the mandatory `pylint_odoo` rule:

```yaml
  - id: pylint_odoo
    args:
      - --rcfile=.pylintrc-mandatory
```

Then set `https://www.mint-system.ch/` as arg for `oca-fix-manifest-website`.

In `.ruff.toml` at line 1 enter:

```toml
line-length = 120
```

Template the server tools repo and run the linter:

```bash
task generate-repo-docs addons/server_tools
cd addons/server_tools
task all
```

The first run of the linter will take some time.

Refine the templates based on the linter results.