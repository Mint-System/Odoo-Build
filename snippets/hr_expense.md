# Hr Expense
## Hr Expense View Form  
### Hide Payment Mode  
ID: `mint_system.hr_expense.hr_expense_view_form.hide_payment_mode`  
```xml
<data inherit_id="hr_expense.hr_expense_view_form" priority="50">
    <xpath expr="//label[@for='payment_mode']" position="attributes">
        <attribute name="invisible">True</attribute>
    </xpath>
    <xpath expr="//div[@id='payment_mode']" position="attributes">
        <attribute name="invisible">True</attribute>
    </xpath>
</data>

```
Source: [snippets/hr_expense.hr_expense_view_form.hide_payment_mode.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/hr_expense.hr_expense_view_form.hide_payment_mode.xml)

### Set Group Tax Ids  
ID: `mint_system.hr_expense.hr_expense_view_form.set_group_tax_ids`  
```xml
<data inherit_id="hr_expense.hr_expense_view_form" priority="50">
    <xpath expr="//field[@name='tax_ids']" position="attributes">
        <attribute name="groups"/>
    </xpath>
</data>

```
Source: [snippets/hr_expense.hr_expense_view_form.set_group_tax_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/hr_expense.hr_expense_view_form.set_group_tax_ids.xml)

### Show Payment Mode  
ID: `mint_system.hr_expense.hr_expense_view_form.show_payment_mode`  
```xml
<data inherit_id="hr_expense.hr_expense_view_form" priority="50">
    <xpath expr="//label[@for='payment_mode']" position="attributes">
        <attribute name="attrs">{}</attribute>
    </xpath>
    <xpath expr="//div[@id='payment_mode']" position="attributes">
        <attribute name="attrs">{}</attribute>
    </xpath>
</data>

```
Source: [snippets/hr_expense.hr_expense_view_form.show_payment_mode.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/hr_expense.hr_expense_view_form.show_payment_mode.xml)

### X Partner Id  
ID: `mint_system.hr_expense.hr_expense_view_form.x_partner_id`  
```xml
<data inherit_id="hr_expense.hr_expense_view_form" priority="50">
    <xpath expr="//field[@name='sale_order_id']" position="before">
        <field name="x_partner_id" attrs="{'invisible': [('can_be_reinvoiced', '=', False)], 'readonly': [('sheet_is_editable', '=', False)]}" options="{'no_open': True, 'no_create': True, 'no_edit': True}" domain="[('is_company', '=', True)]"/>
    </xpath>
    <xpath expr="//field[@name='sale_order_id']" position="attributes">
        <attribute name="domain">[('partner_id', '=', x_partner_id)]</attribute>
    </xpath>
</data>

```
Source: [snippets/hr_expense.hr_expense_view_form.x_partner_id.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/hr_expense.hr_expense_view_form.x_partner_id.xml)

