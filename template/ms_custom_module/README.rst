{{ name|replace('_',' ')|capitalize }}
{{ '=' * name|length }}

<img width="150" src="./static/description/icon.png" />

Module summary.

## Usage

Clone module into Odoo addon directory.

```bash
git clone git@gitlab.com:mint-system/odoo-app-{{ name|replace('_', '-') }}.git ./addons/{{ name }}
```
