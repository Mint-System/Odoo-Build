# Project

## Edit Project

### Domain Action View So

ID: `mint_system.project.edit_project.domain_action_view_so`

Inherit ID: `project.edit_project`

```xml
<data priority="50">
    <button name="action_view_so" position="attributes">
        <attribute name="attrs">{}</attribute>
    </button>
</data>

```
Source: [snippets/mint_system.project.edit_project.domain_action_view_so.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.edit_project.domain_action_view_so.xml)

### Show Collaborator Ids

ID: `mint_system.project.edit_project.show_collaborator_ids`

Inherit ID: `project.edit_project`

```xml
<data priority="50">
    <field name="privacy_visibility" position="after">
        <field name="collaborator_ids"/>
    </field>
</data>

```
Source: [snippets/mint_system.project.edit_project.show_collaborator_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.edit_project.show_collaborator_ids.xml)

### Show Date

ID: `mint_system.project.edit_project.show_date`

Inherit ID: `project.edit_project`

```xml
<data priority="50">
    <field name="description" position="before">
        <group>
            <field name="date"/>
        </group>
    </field>
</data>

```
Source: [snippets/mint_system.project.edit_project.show_date.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.edit_project.show_date.xml)

### Show Date Start

ID: `mint_system.project.edit_project.show_date_start`

Inherit ID: `project.edit_project`

```xml
<data priority="50">
    <field name="description" position="before">
        <group>
            <field name="date_start"/>
        </group>
    </field>
</data>

```
Source: [snippets/mint_system.project.edit_project.show_date_start.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.edit_project.show_date_start.xml)

### Show Gantt Dates

ID: `mint_system.project.edit_project.show_gantt_dates`

Inherit ID: `project.edit_project`

```xml
<data priority="50">
    <field name="description" position="before">
        <label for="date_start" string="Planned Date"/>
        <div class="w-100">
            <div class="o_row">
                <field name="date_start" widget="daterange" options="{&quot;related_end_date&quot;: &quot;date&quot;}"/>
                <i class="fa fa-long-arrow-right mx-2 oe_edit_only" aria-label="Arrow icon" title="Arrow"/>
                <i class="fa fa-long-arrow-right mx-2 oe_read_only" aria-label="Arrow icon" title="Arrow" attrs="{'invisible': [('date', '=', False), ('date_start', '=', False)]}"/>
                <field name="date" widget="daterange" options="{&quot;related_start_date&quot;: &quot;date_start&quot;}"/>
            </div>
        </div>
    </field>
</data>

```
Source: [snippets/mint_system.project.edit_project.show_gantt_dates.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.edit_project.show_gantt_dates.xml)

## View Project

### Disable Create

ID: `mint_system.project.view_project.disable_create`

Inherit ID: `project.view_project`

```xml
<data priority="50">
    <xpath expr="//tree" position="attributes">
        <attribute name="create">0</attribute>
    </xpath>
</data>

```
Source: [snippets/mint_system.project.view_project.disable_create.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_project.disable_create.xml)

### Show Alias Name

ID: `mint_system.project.view_project.show_alias_name`

Inherit ID: `project.view_project`

```xml
<data priority="50">
    <field name="name" position="after">
        <field name="alias_name" optional="hide"/>
    </field>
</data>

```
Source: [snippets/mint_system.project.view_project.show_alias_name.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_project.show_alias_name.xml)

### Show Date Start

ID: `mint_system.project.view_project.show_date_start`

Inherit ID: `project.view_project`

```xml
<data priority="50">
    <field name="user_id" position="before">
        <field name="date_start" optional="show"/>
    </field>
</data>

```
Source: [snippets/mint_system.project.view_project.show_date_start.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_project.show_date_start.xml)

### Show Privacy Visibility

ID: `mint_system.project.view_project.show_privacy_visibility`

Inherit ID: `project.view_project`

```xml
<data priority="50">
    <field name="user_id" position="after">
        <field name="privacy_visibility" optional="hide"/>
    </field>
</data>

```
Source: [snippets/mint_system.project.view_project.show_privacy_visibility.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_project.show_privacy_visibility.xml)

## View Project Calendar

### View

ID: `mint_system.project.view_project_calendar.view`

Inherit ID: `project.view_project_calendar`

```xml
<record id="project.view_project_calendar.view" model="ir.ui.view">
    <field name="name">mint_system.project.view_project_calendar.view</field>
    <field name="model">project.project</field>
    <field name="type">calendar</field>
    <field name="arch" type="xml">
        <calendar date_start="date_start" string="Tasks" mode="month" color="color" event_limit="5" hide_time="true" quick_add="False" js_class="attendee_calendar">
            <field name="user_id" avatar_field="image_128" filters="1"/>
            <field name="date"/>
        </calendar>
    </field>
</record>

```
Source: [snippets/mint_system.project.view_project_calendar.view.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_project_calendar.view.xml)

## View Project Kanban

### Disable Create

ID: `mint_system.project.view_project_kanban.disable_create`

Inherit ID: `project.view_project_kanban`

```xml
<data priority="50">
    <xpath expr="//kanban" position="attributes">
        <attribute name="create">0</attribute>
    </xpath>
</data>

```
Source: [snippets/mint_system.project.view_project_kanban.disable_create.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_project_kanban.disable_create.xml)

### Sort Date Desc

ID: `mint_system.project.view_project_kanban.sort_date_desc`

Inherit ID: `project.view_project_kanban`

```xml
<data priority="50">
    <xpath expr="//kanban" position="attributes">
        <attribute name="default_order">date desc</attribute>
      </xpath>
</data>

```
Source: [snippets/mint_system.project.view_project_kanban.sort_date_desc.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_project_kanban.sort_date_desc.xml)

## View Task Form2

### Domain Gantt Dates

ID: `mint_system.project.view_task_form2.domain_gantt_dates`

Inherit ID: `project.view_task_form2`

```xml
<data priority="50">
    <label for="planned_date_begin" position="attributes">
        <attribute name="attrs"/>
    </label>
    <xpath expr="//label[@for='planned_date_begin']/../div[1]" position="attributes">
        <attribute name="attrs"/>
    </xpath>
</data>

```
Source: [snippets/mint_system.project.view_task_form2.domain_gantt_dates.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_task_form2.domain_gantt_dates.xml)

### Domain Sale Line Id Active

ID: `mint_system.project.view_task_form2.domain_sale_line_id_active`

Inherit ID: `project.view_task_form2`

```xml
<data priority="50">
    <xpath expr="//field[@name='sale_line_id']" position="attributes">
        <attribute name="domain">[('x_service_policy', '=', 'delivered_timesheet'),('order_id.active', '=', True),('company_id', '=', company_id), ('is_service', '=', True), ('order_partner_id', 'child_of', commercial_partner_id), ('is_expense', '=', False), ('state', 'in', ['sale'])]</attribute>
    </xpath>
</data>

```
Source: [snippets/mint_system.project.view_task_form2.domain_sale_line_id_active.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_task_form2.domain_sale_line_id_active.xml)

### Domain Sale Line Id Service

ID: `mint_system.project.view_task_form2.domain_sale_line_id_service`

Inherit ID: `project.view_task_form2`

```xml
<data priority="50">
    <xpath expr="//field[@name='sale_line_id']" position="attributes">
        <attribute name="domain">[('x_service_policy', '=', 'delivered_timesheet'),('company_id', '=', company_id), ('is_service', '=', True), ('order_partner_id', 'child_of', commercial_partner_id), ('is_expense', '=', False), ('state', 'in', ['sale', 'done']), ('order_id', '=?', project_sale_order_id)]</attribute>
    </xpath>
</data>

```
Source: [snippets/mint_system.project.view_task_form2.domain_sale_line_id_service.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_task_form2.domain_sale_line_id_service.xml)

### Parent Domain

ID: `mint_system.project.view_task_form2.parent_domain`

Inherit ID: `project.view_task_form2`

```xml
<data priority="50">
    <xpath expr="//field[@name='parent_id']" position="replace">
        <field name="parent_id" domain="[('parent_id', '=', False),('project_id', '=', project_id)]" attrs="{'invisible' : [('subtask_count', '&gt;', 0)]}" groups="project.group_subtask_project"/>
    </xpath>
</data>

```
Source: [snippets/mint_system.project.view_task_form2.parent_domain.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_task_form2.parent_domain.xml)

### Remove Timer Buttons

ID: `mint_system.project.view_task_form2.remove_timer_buttons`

Inherit ID: `project.view_task_form2`

```xml
<data priority="50">
    <button name="action_timer_start" position="replace"/>
    <button name="action_timer_stop" position="replace"/>
    <button name="action_timer_pause" position="replace"/>
    <button name="action_timer_resume" position="replace"/>
</data>

```
Source: [snippets/mint_system.project.view_task_form2.remove_timer_buttons.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_task_form2.remove_timer_buttons.xml)

### Show Allow Timesheets

ID: `mint_system.project.view_task_form2.show_allow_timesheets`

Inherit ID: `project.view_task_form2`

```xml
<data priority="50">
    <xpath expr="//field[@name='analytic_account_id']" position="after">
        <field name="allow_timesheets"/>
    </xpath>
</data>

```
Source: [snippets/mint_system.project.view_task_form2.show_allow_timesheets.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_task_form2.show_allow_timesheets.xml)

### Show Analytic Account Active

ID: `mint_system.project.view_task_form2.show_analytic_account_active`

Inherit ID: `project.view_task_form2`

```xml
<data priority="50">
    <xpath expr="//field[@name='analytic_account_id']" position="after">
        <field name="analytic_account_active"/>
    </xpath>
</data>

```
Source: [snippets/mint_system.project.view_task_form2.show_analytic_account_active.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_task_form2.show_analytic_account_active.xml)

### Show Commercial Partner Id

ID: `mint_system.project.view_task_form2.show_commercial_partner_id`

Inherit ID: `project.view_task_form2`

```xml
<data priority="50">
    <xpath expr="//field[@name='partner_id']" position="after">
        <field name="commercial_partner_id" />
    </xpath>
</data>
```
Source: [snippets/mint_system.project.view_task_form2.show_commercial_partner_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_task_form2.show_commercial_partner_id.xml)

### Show Display Timesheet Timer

ID: `mint_system.project.view_task_form2.show_display_timesheet_timer`

Inherit ID: `project.view_task_form2`

```xml
<data priority="50">
    <xpath expr="//field[@name='analytic_account_id']" position="after">
        <field name="display_timesheet_timer"/>
    </xpath>
</data>

```
Source: [snippets/mint_system.project.view_task_form2.show_display_timesheet_timer.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_task_form2.show_display_timesheet_timer.xml)

### Show Encode Uom In Days

ID: `mint_system.project.view_task_form2.show_encode_uom_in_days`

Inherit ID: `project.view_task_form2`

```xml
<data priority="50">
    <xpath expr="//field[@name='analytic_account_id']" position="after">
        <field name="encode_uom_in_days"/>
    </xpath>
</data>

```
Source: [snippets/mint_system.project.view_task_form2.show_encode_uom_in_days.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_task_form2.show_encode_uom_in_days.xml)

### Show Gantt Dates

ID: `mint_system.project.view_task_form2.show_gantt_dates`

Inherit ID: `project.view_task_form2`

```xml
<data priority="50">
    <field name="date_deadline" position="after">
        <label for="planned_date_begin" string="Planned Date"/>
        <div class="w-100">
            <div class="o_row">
                <field name="planned_date_begin" widget="daterange" options="{&quot;related_end_date&quot;: &quot;planned_date_end&quot;}"/>
                <i class="fa fa-long-arrow-right mx-2 oe_edit_only" aria-label="Arrow icon" title="Arrow"/>
                <i class="fa fa-long-arrow-right mx-2 oe_read_only" aria-label="Arrow icon" title="Arrow" attrs="{'invisible': [('planned_date_begin', '=', False), ('planned_date_end', '=', False)]}"/>
                <field name="planned_date_end" widget="daterange" options="{&quot;related_start_date&quot;: &quot;planned_date_begin&quot;}"/>
            </div>
        </div>
    </field>
</data>

```
Source: [snippets/mint_system.project.view_task_form2.show_gantt_dates.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_task_form2.show_gantt_dates.xml)

### Show Invoice Type

ID: `mint_system.project.view_task_form2.show_invoice_type`

Inherit ID: `project.view_task_form2`

```xml
<data priority="50">
    <xpath expr="//field[@name='timesheet_ids']/tree[1]/field[@name='unit_amount']" position="after">
        <field name="timesheet_invoice_type"/>
    </xpath>
</data>

```
Source: [snippets/mint_system.project.view_task_form2.show_invoice_type.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_task_form2.show_invoice_type.xml)

### Show Key

ID: `mint_system.project.view_task_form2.show_key`

Inherit ID: `project.view_task_form2`

```xml
<data priority="50">
    <xpath expr="//field[@name='dependency_task_ids']/tree[1]/field[1]" position="before">
        <field name="key"/>
    </xpath>
</data>

```
Source: [snippets/mint_system.project.view_task_form2.show_key.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_task_form2.show_key.xml)

### Show Partner Mobile

ID: `mint_system.project.view_task_form2.show_partner_mobile`

Inherit ID: `project.view_task_form2`

```xml
<data priority="50">
    <xpath expr="//field[@name='partner_phone']" position="after">
        <field name="partner_mobile" widget="phone"/>
    </xpath>
</data>

```
Source: [snippets/mint_system.project.view_task_form2.show_partner_mobile.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_task_form2.show_partner_mobile.xml)

### Show Personal Stage

ID: `mint_system.project.view_task_form2.show_personal_stage`

Inherit ID: `project.view_task_form2`

```xml
<data priority="50">
    <xpath expr="//field[@name='user_ids']" position="after">
        <field name="personal_stage_type_id" domain="[('user_id','=', uid)]" readonly="0" string="Personal Stage"/>
    </xpath>
</data>
```
Source: [snippets/mint_system.project.view_task_form2.show_personal_stage.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_task_form2.show_personal_stage.xml)

### Timesheet Sort Date Desc

ID: `mint_system.project.view_task_form2.timesheet_sort_date_desc`

Inherit ID: `project.view_task_form2`

```xml
<data priority="50">
    <xpath expr="//field[@name='timesheet_ids']/tree" position="attributes">
        <attribute name="default_order">date desc</attribute>
    </xpath>
</data>

```
Source: [snippets/mint_system.project.view_task_form2.timesheet_sort_date_desc.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_task_form2.timesheet_sort_date_desc.xml)

### X Business Requirement Id

ID: `mint_system.project.view_task_form2.x_business_requirement_id`

Inherit ID: `project.view_task_form2`

```xml
<data priority="50">
    <field name="partner_id" position="before">
        <field name="x_business_requirement_id" domain="[('x_project_id', '=', project_id)]" context="{'default_project_id': project_id}"/>
    </field>
</data>

```
Source: [snippets/mint_system.project.view_task_form2.x_business_requirement_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_task_form2.x_business_requirement_id.xml)

### X Lead Id

ID: `mint_system.project.view_task_form2.x_lead_id`

Inherit ID: `project.view_task_form2`

```xml
<data priority="50">
    <field name="partner_id" position="before">
        <field name="x_lead_id" attrs="{'invisible': [('x_lead_id','=', False)]}"/>
    </field>
</data>

```
Source: [snippets/mint_system.project.view_task_form2.x_lead_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_task_form2.x_lead_id.xml)

### X Not Billable

ID: `mint_system.project.view_task_form2.x_not_billable`

Inherit ID: `project.view_task_form2`

```xml
<data priority="50">
    <field name="partner_id" position="after">
        <field name="x_not_billable"/>
    </field>
</data>

```
Source: [snippets/mint_system.project.view_task_form2.x_not_billable.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_task_form2.x_not_billable.xml)

### X Systemname

ID: `mint_system.project.view_task_form2.x_systemname`

Inherit ID: `project.view_task_form2`

```xml
<data priority="50">
    <xpath expr="//field[@name='tag_ids']" position="after">
        <field name="x_systemname"/>
    </xpath>
</data>

```
Source: [snippets/mint_system.project.view_task_form2.x_systemname.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_task_form2.x_systemname.xml)

### X User Text

ID: `mint_system.project.view_task_form2.x_user_text`

Inherit ID: `project.view_task_form2`

```xml
<data priority="50">
    <xpath expr="//field[@name='tag_ids']" position="after">
        <field name="x_user_text"/>
    </xpath>
</data>

```
Source: [snippets/mint_system.project.view_task_form2.x_user_text.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_task_form2.x_user_text.xml)

### X Vehicle Id

ID: `mint_system.project.view_task_form2.x_vehicle_id`

Inherit ID: `project.view_task_form2`

```xml
<data priority="50">
    <xpath expr="//field[@name='user_ids']" position="after">
        <field name="x_vehicle_id"/>
    </xpath>
</data>

```
Source: [snippets/mint_system.project.view_task_form2.x_vehicle_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_task_form2.x_vehicle_id.xml)

## View Task Kanban

### Show Planned Date Begin

ID: `mint_system.project.view_task_kanban.show_planned_date_begin`

Inherit ID: `project.view_task_kanban`

```xml
<data priority="50">
    <div name="date_deadline" position="replace">
        <div t-if="record.planned_date_begin.raw_value" name="planned_date_begin" attrs="{'invisible': [('is_closed', '=', True)]}">
            <field name="planned_date_begin" widget="remaining_days"/>
        </div>
    </div>
</data>

```
Source: [snippets/mint_system.project.view_task_kanban.show_planned_date_begin.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_task_kanban.show_planned_date_begin.xml)

## View Task Tree2

### Sale Line Optional

ID: `mint_system.project.view_task_tree2.sale_line_optional`

Inherit ID: `project.view_task_tree2`

```xml
<data priority="50">
    <field name="stage_id" position="after">
        <field name="sale_line_id" optional="hide"/>
    </field>
</data>

```
Source: [snippets/mint_system.project.view_task_tree2.sale_line_optional.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.project.view_task_tree2.sale_line_optional.xml)

