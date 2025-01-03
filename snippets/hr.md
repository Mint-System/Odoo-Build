# Hr
## Hr Employee Public View Form  
### Add Action Time Off Dashboard  
ID: `mint_system.hr.hr_employee_public_view_form.add_action_time_off_dashboard`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr.hr_employee_public_view_form" priority="50">
    <xpath expr="//div[hasclass('oe_button_box')]" position="inside">
        <button name="action_time_off_dashboard" type="object" class="oe_stat_button" icon="fa-calendar" context="{'search_default_employee_id': id}" groups="base.group_user" help="Remaining leaves">
            <div class="o_field_widget o_stat_info">
                <span class="o_stat_value"><field name="allocation_used_display"/>/<field name="allocation_display"/> Days
                </span>
                <span class="o_stat_text">
                    Time Off
                </span>
            </div>
        </button>
    </xpath>
</data>

```
Source: [snippets/hr.hr_employee_public_view_form.add_action_time_off_dashboard.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/hr.hr_employee_public_view_form.add_action_time_off_dashboard.xml)

## Hr Employee Public View Kanban  
### Add Mobile Phone  
ID: `mint_system.hr.hr_employee_public_view_kanban.add_mobile_phone`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr.hr_employee_public_view_kanban" priority="50">
    <xpath expr="//ul/li[3]" position="after">
        <li t-if="record.mobile_phone.raw_value" class="o_force_ltr">
            <field name="mobile_phone"/>
        </li>
    </xpath>
</data>

```
Source: [snippets/hr.hr_employee_public_view_kanban.add_mobile_phone.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/hr.hr_employee_public_view_kanban.add_mobile_phone.xml)

### Show Identification Id  
ID: `mint_system.hr.hr_employee_public_view_kanban.show_identification_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr.hr_employee_public_view_kanban" priority="50">
    <xpath expr="//templates" position="before">
        <field name="identification_id"/>
    </xpath>
    <xpath expr="//field[@name='name']" position="before">
        <div t-if="record.identification_id.raw_value" class="float-right">
            <span style="padding-right: 5px; padding-left: 5px">
                <field name="identification_id"/>
            </span>
        </div>
    </xpath>
</data>

```
Source: [snippets/hr.hr_employee_public_view_kanban.show_identification_id.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/hr.hr_employee_public_view_kanban.show_identification_id.xml)

### Show Leave  
ID: `mint_system.hr.hr_employee_public_view_kanban.show_leave`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr.hr_employee_public_view_kanban" priority="50">
    <xpath expr="//templates" position="before">
        <field name="current_leave_id"/>
        <field name="current_leave_state"/>
        <field name="leave_date_from"/>
        <field name="leave_date_to"/>
    </xpath>
    <xpath expr="//li[@id='last_login']" position="inside">
        <span t-if="record.current_leave_id.raw_value" style="font-size: 100%" t-att-class="record.current_leave_state.raw_value=='validate'?'oe_kanban_button oe_kanban_color_3':'oe_kanban_button oe_kanban_color_2'" t-att-title="moment(record.leave_date_from.raw_value).format('ddd Do MMM') + ' - ' + moment(record.leave_date_to.raw_value).format('ddd Do MMM')">
            <field name="current_leave_id"/>
        </span>
    </xpath>
</data>

```
Source: [snippets/hr.hr_employee_public_view_kanban.show_leave.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/hr.hr_employee_public_view_kanban.show_leave.xml)

## Hr Employee Public View Tree  
### Add Mobile Phone  
ID: `mint_system.hr.hr_employee_public_view_tree.add_mobile_phone`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr.hr_employee_public_view_tree" priority="50">
    <field name="work_phone" position="after">
        <field name="mobile_phone" class="o_force_ltr"/>
    </field>
</data>

```
Source: [snippets/hr.hr_employee_public_view_tree.add_mobile_phone.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/hr.hr_employee_public_view_tree.add_mobile_phone.xml)

### Show Birthday Public  
ID: `mint_system.hr.hr_employee_public_view_tree.show_birthday_public`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr.hr_employee_public_view_tree" priority="50">
    <xpath expr="//field[@name='parent_id']" position="after">
        <field name="birthday_public"/>
    </xpath>
</data>

```
Source: [snippets/hr.hr_employee_public_view_tree.show_birthday_public.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/hr.hr_employee_public_view_tree.show_birthday_public.xml)

## Hr Kanban View Employees  
### Add Mobile Phone  
ID: `mint_system.hr.hr_kanban_view_employees.add_mobile_phone`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr.hr_kanban_view_employees" priority="50">
    <xpath expr="//ul/li[3]" position="after">
        <li t-if="record.mobile_phone.raw_value" class="o_force_ltr">
            <field name="mobile_phone"/>
        </li>
    </xpath>
</data>

```
Source: [snippets/hr.hr_kanban_view_employees.add_mobile_phone.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/hr.hr_kanban_view_employees.add_mobile_phone.xml)

## Plan Wizard  
### Plan Permission  
ID: `mint_system.hr.plan_wizard.plan_permission`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr.plan_wizard" priority="50">
    <xpath expr="//footer/button[1]" position="attributes">
        <attribute name="groups">hr.group_hr_user</attribute>
    </xpath>
</data>

```
Source: [snippets/hr.plan_wizard.plan_permission.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/hr.plan_wizard.plan_permission.xml)

## Res Users View Form Profile  
### Show Identification Id  
ID: `mint_system.hr.res_users_view_form_profile.show_identification_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr.res_users_view_form_profile" priority="50">
    <xpath expr="//field[@name='job_title']/.." position="before">
        <h2 class="col-12">
            <field name="identification_id" attrs="{'readonly': True}"/>
        </h2>
    </xpath>
</data>

```
Source: [snippets/hr.res_users_view_form_profile.show_identification_id.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/hr.res_users_view_form_profile.show_identification_id.xml)

## View Employee Form  
### Plan Permission  
ID: `mint_system.hr.view_employee_form.plan_permission`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr.view_employee_form" priority="50">
    <xpath expr="//header/button[@groups='hr.group_hr_manager']" position="attributes">
        <attribute name="groups">hr.group_hr_user</attribute>
    </xpath>
</data>

```
Source: [snippets/hr.view_employee_form.plan_permission.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/hr.view_employee_form.plan_permission.xml)

### Show Last Attendance  
ID: `mint_system.hr.view_employee_form.show_last_attendance`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr.view_employee_form" priority="50">
    <xpath expr="//field[@name='user_id']" position="after">
        <field name="last_attendance_id"/>
    </xpath>
</data>

```
Source: [snippets/hr.view_employee_form.show_last_attendance.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/hr.view_employee_form.show_last_attendance.xml)

### User Id Domain  
ID: `mint_system.hr.view_employee_form.user_id_domain`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr.view_employee_form" priority="50">
    <xpath expr="//field[@name='user_id']" position="attributes">
        <attribute name="domain">[]</attribute>
    </xpath>
</data>

```
Source: [snippets/hr.view_employee_form.user_id_domain.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/hr.view_employee_form.user_id_domain.xml)

## View Employee Tree  
### Add Mobile Phone  
ID: `mint_system.hr.view_employee_tree.add_mobile_phone`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr.view_employee_tree" priority="50">
    <field name="work_phone" position="after">
        <field name="mobile_phone" class="o_force_ltr"/>
    </field>
</data>

```
Source: [snippets/hr.view_employee_tree.add_mobile_phone.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/hr.view_employee_tree.add_mobile_phone.xml)

## View Hr Job Form  
### Description Widget Html  
ID: `mint_system.hr.view_hr_job_form.description_widget_html`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr.view_hr_job_form" priority="50">
    <field name="description" position="attributes">
        <attribute name="widget">html</attribute>
    </field>
</data>

```
Source: [snippets/hr.view_hr_job_form.description_widget_html.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/hr.view_hr_job_form.description_widget_html.xml)

