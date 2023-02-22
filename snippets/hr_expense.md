---
prev: ./snippets
---
# Hr Expense
## Hr Expense View Form  
### X Partner Id  
ID: `mint_system.hr_expense.hr_expense_view_form.x_partner_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr_expense.hr_expense_view_form" priority="50">

  <xpath expr="//field[@name='sale_order_id']" position="before">
    <field name="x_partner_id" attrs="{'invisible': [('can_be_reinvoiced', '=', False)], 'readonly': [('sheet_is_editable', '=', False)]}" options="{'no_open': True, 'no_create': True, 'no_edit': True}" domain="[('is_company', '=', True)]" />
  </xpath>

  <xpath expr="//field[@name='sale_order_id']" position="attributes">
    <attribute name="domain">[('partner_id', '=', x_partner_id)]</attribute>
  </xpath>

</data>

```
Source: [snippets/hr_expense.hr_expense_view_form.x_partner_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/hr_expense.hr_expense_view_form.x_partner_id.xml)

