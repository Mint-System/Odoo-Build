---
prev: ./snippets.md
---
# Hr Holidays
## Hr Leave View Form Manager Approve  
### Add Meeting Id  
ID: `mint_system.hr_holidays.hr_leave_view_form_manager_approve.add_meeting_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr_holidays.hr_leave_view_form_manager_approve" priority="50">

  <field name="employee_id" position="after">
    <field name="meeting_id"/>
  </field>

</data>

```
Source: [snippets/hr_holidays.hr_leave_view_form_manager_approve.add_meeting_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/hr_holidays.hr_leave_view_form_manager_approve.add_meeting_id.xml)

### Report Note Group  
ID: `mint_system.hr_holidays.hr_leave_view_form_manager_approve.report_note_group`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr_holidays.hr_leave_view_form_manager_approve" priority="50">

  <xpath expr="//div[@groups='hr_holidays.group_hr_holidays_manager']" position="replace">
    <div groups="hr_holidays.group_hr_holidays_responsible">
      <separator string="Manager's Comment"/>
      <field name="report_note" placeholder="e.g. Report to the next month..."/>
    </div>
  </xpath>

</data>

```
Source: [snippets/hr_holidays.hr_leave_view_form_manager_approve.report_note_group.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/hr_holidays.hr_leave_view_form_manager_approve.report_note_group.xml)

## Hr Leave View Timeline  
### View  
ID: `mint_system.hr_holidays.hr_leave_view_timeline.view`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="hr_holidays.hr_leave_view_timeline.view" model="ir.ui.view">
    <field name="name">mint_system.hr_holidays.hr_leave_view_timeline.view</field>
    <field name="model">hr.leave</field>
    <field name="type">timeline</field>
    <field name="arch" type="xml">
      <timeline date_start="date_from" date_stop="date_to" default_group_by="employee_id" event_open_popup="true" />
    </field>
  </record>

</odoo>

```
Source: [snippets/hr_holidays.hr_leave_view_timeline.view.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/hr_holidays.hr_leave_view_timeline.view.xml)

## Hr Leave View Tree  
### Add Synced Field  
ID: `mint_system.hr_holidays.hr_leave_view_tree.add_synced_field`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr_holidays.hr_leave_view_tree" priority="50">

  <xpath expr="//field[@name='state']" position="after">
    <field name="x_synced" widget="toggle_button"/>
  </xpath>

</data>

```
Source: [snippets/hr_holidays.hr_leave_view_tree.add_synced_field.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/hr_holidays.hr_leave_view_tree.add_synced_field.xml)

### Remove Payslip  
ID: `mint_system.hr_holidays.hr_leave_view_tree.remove_payslip`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr_holidays.hr_leave_view_tree" priority="50">

  <xpath expr="//field[@name='payslip_status']" position="replace">
  </xpath>

</data>

```
Source: [snippets/hr_holidays.hr_leave_view_tree.remove_payslip.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/hr_holidays.hr_leave_view_tree.remove_payslip.xml)

### Show Days  
ID: `mint_system.hr_holidays.hr_leave_view_tree.show_days`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr_holidays.hr_leave_view_tree" priority="50">

  <field name="duration_display" position="before">
    <field name="number_of_days" sum="Number of Days" optional="hide" />
  </field>

</data>

```
Source: [snippets/hr_holidays.hr_leave_view_tree.show_days.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/hr_holidays.hr_leave_view_tree.show_days.xml)

