---
prev: ./snippets
---
# Contract
## Contract Contract Form View  
### Edit Last Date Invoiced  
ID: `mint_system.contract.contract_contract_form_view.edit_last_date_invoiced`  
```xml
<?xml version="1.0"?>
<data inherit_id="contract.contract_contract_form_view" priority="50">

    <field name="last_date_invoiced" position="attributes" >
        <attribute name="readonly">0</attribute>
        <attribute name="groups"></attribute>
    </field>

</data>
```
Source: [snippets/contract.contract_contract_form_view.edit_last_date_invoiced.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/contract.contract_contract_form_view.edit_last_date_invoiced.xml)

### Show Recurring Create Invoice  
ID: `mint_system.contract.contract_contract_form_view.show_recurring_create_invoice`  
```xml
<?xml version="1.0"?>
<data inherit_id="contract.contract_contract_form_view" priority="50">

    <button name="recurring_create_invoice" position="attributes" >
        <attribute name="groups"></attribute>
    </button>

</data>
```
Source: [snippets/contract.contract_contract_form_view.show_recurring_create_invoice.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/contract.contract_contract_form_view.show_recurring_create_invoice.xml)

## Contract Contract Tree View  
### Show Recurring Next Date  
ID: `mint_system.contract.contract_contract_tree_view.show_recurring_next_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="contract.contract_contract_tree_view" priority="50">

    <field name="partner_id" position="after">
        <field name="recurring_next_date" optional="show"/>
    </field>

</data>
```
Source: [snippets/contract.contract_contract_tree_view.show_recurring_next_date.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/contract.contract_contract_tree_view.show_recurring_next_date.xml)

