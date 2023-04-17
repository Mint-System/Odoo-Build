---
prev: ./snippets
---
# Project
## Edit Project  
### Domain Action View So  
ID: `mint_system.project.edit_project.domain_action_view_so`  
```xml
<?xml version="1.0"?>
<data inherit_id="project.edit_project" priority="50">

    <button name="action_view_so" position="attributes">
      <attribute name="attrs">{}</attribute>
    </button>

</data>

```
Source: [snippets/project.edit_project.domain_action_view_so.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.edit_project.domain_action_view_so.xml)

### Show Date Start  
ID: `mint_system.project.edit_project.show_date_start`  
```xml
<?xml version="1.0"?>
<data inherit_id="project.edit_project" priority="50">

    <field name="description" position="before">
        <group>
            <field name="date_start" />
        </group>
    </field>

</data>

```
Source: [snippets/project.edit_project.show_date_start.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.edit_project.show_date_start.xml)

### Show Date  
ID: `mint_system.project.edit_project.show_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="project.edit_project" priority="50">

    <field name="description" position="before">
      <group>
        <field name="date" />
      </group>
    </field>

</data>

```
Source: [snippets/project.edit_project.show_date.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.edit_project.show_date.xml)

### Show Gantt Dates  
ID: `mint_system.project.edit_project.show_gantt_dates`  
```xml
<?xml version="1.0"?>
<data inherit_id="project.edit_project" priority="50">

    <field name="description" position="before">
        <label for="date_start" string="Planned Date"/>
        <div class="w-100">
            <div class="o_row">
                <field name="date_start" widget="daterange" options='{"related_end_date": "date"}'/>
                <i class="fa fa-long-arrow-right mx-2 oe_edit_only" aria-label="Arrow icon" title="Arrow"/>
                <i class="fa fa-long-arrow-right mx-2 oe_read_only" aria-label="Arrow icon" title="Arrow" attrs="{'invisible': [('date', '=', False), ('date_start', '=', False)]}"/>
                <field name="date" widget="daterange" options='{"related_start_date": "date_start"}'/>
            </div>
        </div>
    </field>

</data>

```
Source: [snippets/project.edit_project.show_gantt_dates.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.edit_project.show_gantt_dates.xml)

## View Project Calendar  
### View  
ID: `mint_system.project.view_project_calendar.view`  
```xml
<?xml version="1.0"?>
<record id="project.view_project_calendar.view" model="ir.ui.view">
    <field name="name">mint_system.project.view_project_calendar.view</field>
    <field name="model">project.project</field>
    <field name="type">calendar</field>
    <field name="arch" type="xml">
        <calendar date_start="date_start" string="Tasks" mode="month" color="color" event_limit="5" hide_time="true" quick_add="False" js_class="attendee_calendar">
            <field name="user_id" avatar_field="image_128" filters="1" />
            <field name="date" />
        </calendar>
    </field>
  </record>
```
Source: [snippets/project.view_project_calendar.view.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.view_project_calendar.view.xml)

## View Project  
### Disable Create  
ID: `mint_system.project.view_project.disable_create`  
```xml
<?xml version="1.0"?>
<data inherit_id="project.view_project" priority="50">

    <xpath expr="//tree" position="attributes">
         <attribute name="create">0</attribute>
    </xpath>

</data>

```
Source: [snippets/project.view_project.disable_create.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.view_project.disable_create.xml)

### Show Date Start  
ID: `mint_system.project.view_project.show_date_start`  
```xml
<?xml version="1.0"?>
<data inherit_id="project.view_project" priority="50">

    <field name="user_id" position="before">
        <field name="date_start" optional="show" />
    </field>

</data>

```
Source: [snippets/project.view_project.show_date_start.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.view_project.show_date_start.xml)

## View Project Kanban  
### Disable Create  
ID: `mint_system.project.view_project_kanban.disable_create`  
```xml
<?xml version="1.0"?>
<data inherit_id="project.view_project_kanban" priority="50">

    <xpath expr="//kanban" position="attributes">
         <attribute name="create">0</attribute>
    </xpath>

</data>

```
Source: [snippets/project.view_project_kanban.disable_create.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.view_project_kanban.disable_create.xml)

## View Project  
### Disable Create  
ID: `mint_system.project.view_project.disable_create`  
```xml
<?xml version="1.0"?>
<data inherit_id="project.view_project" priority="50">

    <xpath expr="//tree" position="attributes">
         <attribute name="create">0</attribute>
    </xpath>

</data>

```
Source: [snippets/project.view_project.disable_create.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.view_project.disable_create.xml)

### Show Date Start  
ID: `mint_system.project.view_project.show_date_start`  
```xml
<?xml version="1.0"?>
<data inherit_id="project.view_project" priority="50">

    <field name="user_id" position="before">
        <field name="date_start" optional="show" />
    </field>

</data>

```
Source: [snippets/project.view_project.show_date_start.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.view_project.show_date_start.xml)

## View Task Form2  
### Domain Active Sale Line  
ID: `mint_system.project.view_task_form2.domain_active_sale_line`  
```xml
<?xml version="1.0"?>
<data inherit_id="project.view_task_form2" priority="50">

    <xpath expr="//field[@name='sale_line_id']" position="attributes">
        <attribute name="domain">[('order_id.active', '=', True),('company_id', '=', company_id), ('is_service', '=', True), ('order_partner_id', 'child_of', commercial_partner_id), ('is_expense', '=', False), ('state', 'in', ['sale', 'done']), ('order_id', '=?', project_sale_order_id)]</attribute>
    </xpath>

</data>

```
Source: [snippets/project.view_task_form2.domain_active_sale_line.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.view_task_form2.domain_active_sale_line.xml)

### Domain Gantt Dates  
ID: `mint_system.project.view_task_form2.domain_gantt_dates`  
```xml
<?xml version="1.0"?>
<data inherit_id="project.view_task_form2" priority="50">

    <label for="planned_date_begin" position="attributes">
        <attribute name="attrs"></attribute>
    </label>

    <xpath expr="//label[@for='planned_date_begin']/../div[1]" position="attributes">
        <attribute name="attrs"></attribute>
    </xpath>

</data>

```
Source: [snippets/project.view_task_form2.domain_gantt_dates.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.view_task_form2.domain_gantt_dates.xml)

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

### Remove Timer Buttons  
ID: `mint_system.project.view_task_form2.remove_timer_buttons`  
```xml
<?xml version="1.0"?>

<data inherit_id="project.view_task_form2" priority="50">

  <button name="action_timer_start" position="replace"/>
  <button name="action_timer_stop" position="replace"/>
  <button name="action_timer_pause" position="replace"/>
  <button name="action_timer_resume" position="replace"/>

</data>

```
Source: [snippets/project.view_task_form2.remove_timer_buttons.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.view_task_form2.remove_timer_buttons.xml)

### Show Allow Timesheets  
ID: `mint_system.project.view_task_form2.show_allow_timesheets`  
```xml
<?xml version="1.0"?>
<data inherit_id="project.view_task_form2" priority="50">

  <xpath expr="//field[@name='analytic_account_id']" position="after">
    <field name="allow_timesheets"/>
  </xpath>

</data>

```
Source: [snippets/project.view_task_form2.show_allow_timesheets.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.view_task_form2.show_allow_timesheets.xml)

### Show Analytic Account Active  
ID: `mint_system.project.view_task_form2.show_analytic_account_active`  
```xml
<?xml version="1.0"?>
<data inherit_id="project.view_task_form2" priority="50">

  <xpath expr="//field[@name='analytic_account_id']" position="after">
    <field name="analytic_account_active"/>
  </xpath>

</data>

```
Source: [snippets/project.view_task_form2.show_analytic_account_active.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.view_task_form2.show_analytic_account_active.xml)

### Show Display Timesheet Timer  
ID: `mint_system.project.view_task_form2.show_display_timesheet_timer`  
```xml
<?xml version="1.0"?>
<data inherit_id="project.view_task_form2" priority="50">

  <xpath expr="//field[@name='analytic_account_id']" position="after">
    <field name="display_timesheet_timer"/>
  </xpath>

</data>

```
Source: [snippets/project.view_task_form2.show_display_timesheet_timer.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.view_task_form2.show_display_timesheet_timer.xml)

### Show Encode Uom In Days  
ID: `mint_system.project.view_task_form2.show_encode_uom_in_days`  
```xml
<?xml version="1.0"?>
<data inherit_id="project.view_task_form2" priority="50">

  <xpath expr="//field[@name='analytic_account_id']" position="after">
    <field name="encode_uom_in_days"/>
  </xpath>

</data>

```
Source: [snippets/project.view_task_form2.show_encode_uom_in_days.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.view_task_form2.show_encode_uom_in_days.xml)

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

### X Lead Id  
ID: `mint_system.project.view_task_form2.x_lead_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="project.view_task_form2" priority="50">

	<field name="partner_id" position="before">
	   <field name="x_lead_id" attrs="{'invisible': [('x_lead_id','=', False)]}" />
  </field>

</data>

```
Source: [snippets/project.view_task_form2.x_lead_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.view_task_form2.x_lead_id.xml)

### X Not Billable  
ID: `mint_system.project.view_task_form2.x_not_billable`  
```xml
<?xml version="1.0"?>
<data inherit_id="project.view_task_form2" priority="50">

    <field name="partner_id" position="after">
        <field name="x_not_billable" />
    </field>

</data>
```
Source: [snippets/project.view_task_form2.x_not_billable.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/project.view_task_form2.x_not_billable.xml)

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

