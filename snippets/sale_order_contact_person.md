# Sale Order Contact Person

## View Sale Order Form Contact Person

### Modify Readonly Partner Contact Id

ID: `mint_system.sale_order_contact_person.view_sale_order_form_contact_person.modify_readonly_partner_contact_id`

```xml
<data inherit_id="sale_order_contact_person.view_sale_order_form_contact_person" priority="50">
    <xpath expr="//field[@name='partner_contact_id']" position="attributes">
        <attribute name="attrs">{'readonly': [('state','not in',('draft','sent','sale'))]}</attribute>
    </xpath>
</data>

```

Source: [snippets/sale_order_contact_person.view_sale_order_form_contact_person.modify_readonly_partner_contact_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_order_contact_person.view_sale_order_form_contact_person.modify_readonly_partner_contact_id.xml)
