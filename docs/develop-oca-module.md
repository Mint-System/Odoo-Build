# Develop an OCA module

This tutorial is based on <https://github.com/OCA/maintainer-tools>.

Clone the maintainer tools.

```bash
cd ~
git clone git@github.com:OCA/maintainer-tools.git
cd maintainer-tools
```

```bash
uv venv
source .venv/bin/activate
uv pip install .
```

## Prepare

In this tutorial we are going to create a new module `cron_log` in <https://github.com/OCA/server-tools>.

First create a fork of the Repo with <https://github.com/OCA/server-tools/fork>. In Odoo Build navigate to the repo folder and add the Fork as `mintsystem` origin.

```bash
cd oca/server-tools
git remote add mintsystem git@github.com:Mint-System/server-tools.git
```

Check if local repo is update to date.

```bash
git pull mintsystem 16.0
git push mintsystem 16.0
```

## Setup

Create the module folder and init files.

```bash
mkdir -p cron_log/readmes
touch cron_log/readmes/CONTRIBUTORS.md
echo "- Janik von Rotz <janik.vonrotz@sozialinfo.ch> (https://www.sozialinfo.ch/)" > cron_log/readmes/CONTRIBUTORS.md
touch cron_log/readmes/DESCRIPTION.md
touch cron_log/__init__.py
echo "from . import models" > cron_log/__init__.py
touch cron_log/__manifest__.py
```

Copy the content of another `__manifest__.py` file in the repo and adjust it.

**__manifest__.py**

```python
# License AGPL-3.0 or later (https://www.gnu.org/licenses/agpl).
{
    "name": "Cron Log",
    "summary": "Log cron job exection time and duration.",
    "version": "16.0.1.0.0",
    "category": "Tools",
    "website": "https://github.com/OCA/server-tools",
    "author": "Sozialinfo, Odoo Community Association (OCA)",
    "license": "AGPL-3",
    "installable": True,
    "maintainers": ["janikvonrotz"],
    "depends": [
        "base",
    ],
    "data": [
        "security/ir.model.access.csv",
        "views/ir_cron_views.xml",
        "views/ir_cron_execution_views.xml",
    ],
}
```

Copy the `README.rst` file.

```bash
cp ~/maintainer-tools/template/module/README.rst cron_log/
```

Generate a new model.

```bash
task generate-module-models oca/server-tools/cron_log ir.cron.execution
```

Create an inherited model manually.

```bash
touch cron_log/models/ir_cron.py
echo "from . import ir_cron" >> cron_log/models/__init__.py
```

**ir_cron.py**

```python
# License AGPL-3.0 or later (https://www.gnu.org/licenses/agpl).

import logging

from odoo import api, fields, models

_logger = logging.getLogger(__name__)


class IrCron(models.Model):
    _inherit = "ir.cron"
```

Generate views and snippet.

```bash
task generate-module-view oca/server-tools/cron_log ir.cron.execution
task generate-module-inherit-view oca/server-tools/cron_log base.ir_cron_view_form
```

Update the views files.

And module security.

```bash
task generate-module-security oca/server-tools/cron_log ir.cron.execution
```
