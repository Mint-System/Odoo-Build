# Develop a Mint System module

In this guide I'll walk you through the development of a module. From specification to the final commit.

## Specification

Let's assume have received the following specification.

> **Develop CRM Lead Template**  
>  
> Module: crm_lead_template  
> Version: 19.0  
> Repo: addons/sale_workflow  
> Depends: crm  
> Summary: Create lead notes from template.  
>  
> Add model crm.lead.template. Add menu to configuration.  
> Model has field description and tag_ids.  
> Add field crm.lead:template_id -> cr.lead.template. When field is selected, the content of description and tag_ids is copied. Copy field content if is empty.

There are some meta information (Module, Version, Repo, Depends, Summary) and broad description what the module should do.

As an experienced Odoo developer you realize that this functionality also exists for sale order and that you can lookup the implementation there.

## Enviroment

It is assumed that the Odoo Build enviroment is running.

We have access to the Odoo source code.

On the terminal we have use zsh git aliases and the helix editor. 

## Bootstrap

First checkout the correct Odoo version.

```bash
[main][~/Odoo-Build]$ task checkout 19.0
```

Then create the module.

```bash
[main][~/Odoo-Build]$ task create-module addons/sale_workflow/crm_lead_template
```

This command will prompt you for values.

```bash
Prompt for module manifest values...
Summary: Create lead notes from template.
License (AGPL-3/OPL-1): AGPL-3
Depends (comma-separated): crm
Demo? (y/n): n
```

Let's add a new model.

```bash
[main][~/Odoo-Build]$ task generate-module-model addons/sale_workflow/crm_lead_template crm.lea
d.template
```

And views for this model.

```bash
[main][~/Odoo-Build]$ task generate-module-view addons/sale_workflow/crm_lead_template crm.lead.template
```

We will extend the `crm.lead` model as well.

```bash
task generate-module-inherit-model addons/sale_workflow/crm_lead_template crm.lead
```

We need to update the `crm.crm_lead_view_form` form.

```bash
[main][~/Odoo-Build]$ task generate-module-inherit-view addons/sale_workflow/crm_lead_template crm.crm_lead_view_form crm.lead
```

Don't forget about the security rules.

```bash
[main][~/Odoo-Build]$ task generate-module-security addons/sale_workflow/crm_lead_template crm.
lead.template
```

## Metadata

Let's edit the metadata of the module

```bash
[main][~/Odoo-Build]$ hx addons/sale_workflow/crm_lead_template/__manifest__.py
```

I performed the following actions:

- Renamed name from `Crm` to `CRM`
- Added `"views/crm_lead_views.xml",` and `"views/crm_lead_template_views.xml",` to the data list

## Model

According to the spec we need to add two fields the model. Let's lookup the definition.

```bash
[main][~/Odoo-Build]$ rg --no-line-number "description = fields" odoo/addons/crm/**/*.py
odoo/addons/crm/models/crm_lead.py
    description = fields.Html('Notes')
```

```bash
[main][~/Odoo-Build]$ rg --no-line-number "tag_ids = fields" odoo/addons/crm/**/*.py -A2
odoo/addons/crm/report/crm_activity_report.py
    tag_ids = fields.Many2many(related="lead_id.tag_ids", readonly=True)
    won_status = fields.Selection([
        ('won', 'Won'),

odoo/addons/crm/models/crm_lead.py
    tag_ids = fields.Many2many(
        'crm.tag', 'crm_tag_rel', 'lead_id', 'tag_id', string='Tags',
        help="Classify and analyze your lead/opportunity categories like: Training, Service")
```

Now we can copy these definition to the model.

```bash
[19.0][~/Odoo-Build/addons/sale_workflow/crm_lead_template]$ hx models/crm_lead_template.py
```

- Rename class from `CrmLeadTemplate` to `CRMLeadTemplate`
- Rename name from `Crm` to `CRM`
- Remove `value` field
- Add `description` and `tag_ids` 

```python
description = fields.Html("Notes")
tag_ids = fields.Many2many(
	"crm.tag",
	"crm_template_tag_rel",
	"lead_template_id",
	"tag_id",
	string="Tags",
	help="Classify and analyze your lead/opportunity categories like: Training, Service",
)
```

Do not worry about formatting.

```bash
[19.0][~/Odoo-Build/addons/sale_workflow/crm_lead_template]$ hx views/crm_lead_template_views.xml
```

- Remove content inside of `header`
- Add `tags_ids` before `notebook`.

```xml
<group>
	<field name="tag_ids" widget="many2many_tags" />
</group>
```

- Replace `value` with `description`.

```xml
<group>
	<field name="description" placeholder="Add a description..."  />
</group>
```

- Remove `value` from list and search view.
- Replace menu item definition.

```xml
<menuitem 
	id="crm_lead_template.menu_crm_lead_template"
	name="Lead Templates" 
	parent="crm.crm_menu_config"
	action="crm_lead_template.action_crm_lead_template_view"
	sequence="7"
/>
```

## Inherit

Let's have a look at the the `sale_management` module.

```bash
[main][~/Odoo-Build]$ rg --no-line-number "sale_order_template_id = fields" odoo/addons/sale_management/**/*.py -A5
odoo/addons/sale_management/models/sale_order.py
    sale_order_template_id = fields.Many2one(
        comodel_name='sale.order.template',
        string="Quotation Template",
        compute='_compute_sale_order_template_id',
        store=True, readonly=False, check_company=True, precompute=True,
        domain="['|', ('company_id', '=', False), ('company_id', '=', company_id)]")
```

Let's add the `template_id` field and the business logic.

```bash
[19.0][~/Odoo-Build/addons/sale_workflow/crm_lead_template]$ hx models/crm_lead.py
```

- Rename class from `CrmLead` to `CRMLead`
- Add the `temlate_id` field

```python
template_id = fields.Many2one(
	comodel_name="crm.lead.template",
	string="Lead Template",
	inverse="_inverse_template_id",
	store=True,
	readonly=False,
)
```

- Add the `_compute_template_id` method

```python
def _inverse_template_id(self):
	"""
	Update templated fiels if they are empty and template is updated.
	"""
	for lead in self:
		if not lead.description:
			lead.description = lead.template_id.description
		if not lead.tag_ids:
			lead.tag_ids = lead.template_id.tag_ids
```

Then update the inherited form.

```bash
[19.0][~/Odoo-Build/addons/sale_workflow/crm_lead_template]$ hx views/crm_lead_views.xml
```

- Add `template_id` after `user_id`.

```xml
<field name="user_id" position="after">
	<field name="template_id" />
</field>
```

## Lint

In the repo folder update the docs and lint the modules.

```bash
[19.0][~/Odoo-Build/addons/sale_workflow]$ task docs
[19.0][~/Odoo-Build/addons/sale_workflow]$ task lint
```

## Test

Reset the database.

```bash
[main][~/Odoo-Build]$ task drop-db,init-db
```

And install the module.

```bash
[main][~/Odoo-Build]$ task init-module addons/sale_workflow/crm_lead_template
```

If everything went well, start the Odoo server.

```bash
[main][~/Odoo-Build]$ task start source
```

Create a template and and add it on a lead.

## Commit

Add changes and push them.

```bash
[19.0][~/Odoo-Build/addons/sale_workflow]$ gaa
[19.0][~/Odoo-Build/addons/sale_workflow]$ gcmsg "feat(crm_lead_template): init module"
[19.0][~/Odoo-Build/addons/sale_workflow]$ gp
```
