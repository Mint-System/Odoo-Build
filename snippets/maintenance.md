# Maintenance
## Hr Equipment Request View Tree  
### Show Schedule Date  
ID: `mint_system.maintenance.hr_equipment_request_view_tree.show_schedule_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="maintenance.hr_equipment_request_view_tree" priority="50">

 <xpath expr="//field[@name='name']" position="after">
    <field name="schedule_date"/>    
  </xpath>

</data>
```
Source: [snippets/maintenance.hr_equipment_request_view_tree.show_schedule_date.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/maintenance.hr_equipment_request_view_tree.show_schedule_date.xml)

## Hr Equipment View Form  
### X Calibrated Until  
ID: `mint_system.maintenance.hr_equipment_view_form.x_calibrated_until`  
```xml
<?xml version="1.0"?>
<data inherit_id="maintenance.hr_equipment_view_form" priority="50">

 <xpath expr="//field[@name='workcenter_id']" position="after">
    <field name="x_calibrated_until"/>    
  </xpath>

</data>
```
Source: [snippets/maintenance.hr_equipment_view_form.x_calibrated_until.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/maintenance.hr_equipment_view_form.x_calibrated_until.xml)

### X Date Action Required  
ID: `mint_system.maintenance.hr_equipment_view_form.x_date_action_required`  
```xml
<?xml version="1.0"?>
<data inherit_id="maintenance.hr_equipment_view_form" priority="50">

 <xpath expr="//field[@name='workcenter_id']" position="after">
    <field name="x_date_action_required"/>    
  </xpath>

</data>
```
Source: [snippets/maintenance.hr_equipment_view_form.x_date_action_required.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/maintenance.hr_equipment_view_form.x_date_action_required.xml)

### X Lead Time Recovery Work  
ID: `mint_system.maintenance.hr_equipment_view_form.x_lead_time_recovery_work`  
```xml
<?xml version="1.0"?>
<data inherit_id="maintenance.hr_equipment_view_form" priority="50">

 <xpath expr="//field[@name='workcenter_id']" position="after">
    <field name="x_lead_time_recovery_work"/>    
  </xpath>

</data>
```
Source: [snippets/maintenance.hr_equipment_view_form.x_lead_time_recovery_work.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/maintenance.hr_equipment_view_form.x_lead_time_recovery_work.xml)

