---
prev: ./snippets.md
---
# Project
## View Task Form2  
### Parent Domain  
ID: `mint_system.project.view_task_form2.parent_domain`  
```xml
<?xml version="1.0"?>
<data inherit_id="project.view_task_form2" priority="50">

    <xpath expr="//field[@name='parent_id']" position="replace">
        <field name="parent_id" domain="[('parent_id', '=', False),('project_id', '=', project_id)]" attrs="{'invisible' : [('subtask_count', '&gt;', 0)]}" groups="project.group_subtask_project"/>
    </xpath>

</data>

```
Source: [snippets/project.view_task_form2.parent_domain.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.view_task_form2.parent_domain.xml)

### Show Gantt Dates  
ID: `mint_system.project.view_task_form2.show_gantt_dates`  
```xml
<?xml version="1.0"?>
<data inherit_id="project.view_task_form2" priority="50">

    <field name="date_deadline" position="after">
        <label for="planned_date_begin" string="Planned Date"/>
        <div class="w-100">
            <div class="o_row">
                <field name="planned_date_begin" widget="daterange" options='{"related_end_date": "planned_date_end"}'/>
                <i class="fa fa-long-arrow-right mx-2 oe_edit_only" aria-label="Arrow icon" title="Arrow"/>
                <i class="fa fa-long-arrow-right mx-2 oe_read_only" aria-label="Arrow icon" title="Arrow" attrs="{'invisible': [('planned_date_begin', '=', False), ('planned_date_end', '=', False)]}"/>
                <field name="planned_date_end" widget="daterange" options='{"related_start_date": "planned_date_begin"}'/>
            </div>
        </div>
    </field>

</data>

```
Source: [snippets/project.view_task_form2.show_gantt_dates.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.view_task_form2.show_gantt_dates.xml)

### Show Invoice Type  
ID: `mint_system.project.view_task_form2.show_invoice_type`  
```xml
<?xml version="1.0"?>
<data inherit_id="project.view_task_form2" priority="50">

  <xpath expr="//field[@name='timesheet_ids']/tree[1]/field[@name='unit_amount']" position="after">
    <field name="timesheet_invoice_type"/>
  </xpath>

</data>

```
Source: [snippets/project.view_task_form2.show_invoice_type.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.view_task_form2.show_invoice_type.xml)

### Show Key  
ID: `mint_system.project.view_task_form2.show_key`  
```xml
<?xml version="1.0"?>
<data inherit_id="project.view_task_form2" priority="50">

    <xpath expr="//field[@name='dependency_task_ids']/tree[1]/field[1]" position="before">
        <field name="key"/>
    </xpath>

</data>

```
Source: [snippets/project.view_task_form2.show_key.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.view_task_form2.show_key.xml)

### Timesheet Sort Date Desc  
ID: `mint_system.project.view_task_form2.timesheet_sort_date_desc`  
```xml
<?xml version="1.0"?>
<data inherit_id="project.view_task_form2" priority="50">

  <xpath expr="//field[@name='timesheet_ids']/tree" position="attributes">
    <attribute name="default_order">date desc</attribute>
  </xpath>

</data>

```
Source: [snippets/project.view_task_form2.timesheet_sort_date_desc.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.view_task_form2.timesheet_sort_date_desc.xml)

### X Business Requirement Id  
ID: `mint_system.project.view_task_form2.x_business_requirement_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="project.view_task_form2" priority="50">

	<field name="partner_id" position="before">
	   <field name="x_business_requirement_id" domain="[('x_project_id', '=', project_id)]" context="{'default_project_id': project_id}"/>
  </field>

</data>

```
Source: [snippets/project.view_task_form2.x_business_requirement_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.view_task_form2.x_business_requirement_id.xml)

### X Vehicle Id  
ID: `mint_system.project.view_task_form2.x_vehicle_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="project.view_task_form2" priority="50">

    <xpath expr="//field[@name='user_ids']" position="after">
        <field name="x_vehicle_id"/>
    </xpath>

</data>

```
Source: [snippets/project.view_task_form2.x_vehicle_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.view_task_form2.x_vehicle_id.xml)

## View Task Tree2  
### Sale Line Optional  
ID: `mint_system.project.view_task_tree2.sale_line_optional`  
```xml
<?xml version="1.0"?>
<data inherit_id="project.view_task_tree2" priority="50">

    <field name="stage_id" position="after">
         <field name="sale_line_id" optional="hide"/>
    </field>

</data>

```
Source: [snippets/project.view_task_tree2.sale_line_optional.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.view_task_tree2.sale_line_optional.xml)

