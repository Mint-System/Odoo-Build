# Mrp Workorder
## Mrp Workorder View Form Tablet  
### Modify Readonly  
ID: `mint_system.mrp_workorder.mrp_workorder_view_form_tablet.modify_readonly`  
```xml
<?xml version="1.0"?>
<data inherit_id="mrp_workorder.mrp_workorder_view_form_tablet" priority="50">

  <xpath expr="//field[@name='finished_lot_id']" position="attributes">
    <attribute name="attrs">{'readonly': True}</attribute>
  </xpath>

  <xpath expr="//div/field[@name='lot_id']" position="attributes">
    <attribute name="attrs">{'readonly': True,'invisible': [('component_tracking', '=', 'none')]}</attribute>
  </xpath>

</data>
```
Source: [snippets/mrp_workorder.mrp_workorder_view_form_tablet.modify_readonly.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/mrp_workorder.mrp_workorder_view_form_tablet.modify_readonly.xml)

### Remove Button Action Continue  
ID: `mint_system.mrp_workorder.mrp_workorder_view_form_tablet.remove_button_action_continue`  
```xml
<?xml version="1.0"?>
<data inherit_id="mrp_workorder.mrp_workorder_view_form_tablet" priority="50">

  <xpath expr="//button[@name='action_continue'][3]" position="replace">    
  </xpath>

  <xpath expr="//button[@name='action_continue'][3]" position="replace">    
  </xpath>
  
</data>
```
Source: [snippets/mrp_workorder.mrp_workorder_view_form_tablet.remove_button_action_continue.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/mrp_workorder.mrp_workorder_view_form_tablet.remove_button_action_continue.xml)

### Remove Button Do Finish  
ID: `mint_system.mrp_workorder.mrp_workorder_view_form_tablet.remove_button_do_finish`  
```xml
<?xml version="1.0"?>
<data inherit_id="mrp_workorder.mrp_workorder_view_form_tablet" priority="50">

  <xpath expr="//button[@name='do_finish']" position="replace">    
  </xpath>
  
</data>
```
Source: [snippets/mrp_workorder.mrp_workorder_view_form_tablet.remove_button_do_finish.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/mrp_workorder.mrp_workorder_view_form_tablet.remove_button_do_finish.xml)

