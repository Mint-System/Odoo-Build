# Delivery
## Report Delivery Document2  
### Remove Hs Code  
ID: `mint_system.delivery.report_delivery_document2.remove_hs_code`  
```xml
<?xml version="1.0"?>
<data inherit_id="delivery.report_delivery_document2" priority="50">

  <xpath expr="//t[@t-set='has_hs_code']" position="replace">
  </xpath>

</data>

```
Source: [snippets/delivery.report_delivery_document2.remove_hs_code.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/delivery.report_delivery_document2.remove_hs_code.xml)

## View Picking Withcarrier Out Form  
### Modify Readonly Carrier Id  
ID: `mint_system.delivery.view_picking_withcarrier_out_form.modify_readonly_carrier_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="delivery.view_picking_withcarrier_out_form" priority="50">

  <xpath expr="//field[@name='carrier_id']" position="attributes">
    <attribute name="attrs">{'readonly': ['|', ('is_locked', '=', True), ('state', 'in', [('done', 'cancel')])]}</attribute>
  </xpath>

</data>

```
Source: [snippets/delivery.view_picking_withcarrier_out_form.modify_readonly_carrier_id.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/delivery.view_picking_withcarrier_out_form.modify_readonly_carrier_id.xml)

