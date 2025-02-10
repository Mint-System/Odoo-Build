# Purchase Requisition Send
## View Purchase Requisition Form  
### Relocate Send Button  
ID: `mint_system.purchase_requisition_send.view_purchase_requisition_form.relocate_send_button`  
```xml
<data inherit_id="purchase_requisition_send.view_purchase_requisition_form" priority="50">
    <xpath expr="//button[@name='action_order_send']" position="replace"/>
    <xpath expr="//button[@name='493']" position="after">
        <button name="action_order_send" states="draft,sent,ongoing,open" string="Send by Email" type="object" class="btn-primary"/>
    </xpath>
</data>

```
Source: [snippets/purchase_requisition_send.view_purchase_requisition_form.relocate_send_button.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/purchase_requisition_send.view_purchase_requisition_form.relocate_send_button.xml)

