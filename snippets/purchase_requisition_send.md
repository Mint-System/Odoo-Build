---
prev: ./snippets.md
---
# Purchase Requisition Send
## View Purchase Requisition Form  
### Relocate Button Action Order Send  
ID: `mint_system.purchase_requisition_send.view_purchase_requisition_form.relocate_button_action_order_send`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition_send.view_purchase_requisition_form" priority="50">

    <xpath expr="//button[@name='action_order_send']" position="replace"/>
    
    <xpath expr="//button[@name='493']" position="after">
        <button name="action_order_send" states="draft,sent,ongoing,open" string="Send by Email" type="object" class="btn-primary"/>
    </xpath>

</data>
```
Source: [snippets/purchase_requisition_send.view_purchase_requisition_form.relocate_button_action_order_send.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition_send.view_purchase_requisition_form.relocate_button_action_order_send.xml)

