# Hr Contract
## Hr Contract View Form  
### X Struct Id  
ID: `mint_system.hr_contract.hr_contract_view_form.x_struct_id`  
```xml
<data inherit_id="hr_contract.hr_contract_view_form" priority="50">
    <field name="structure_type_id" position="after">
        <field name="x_struct_id"/>
    </field>
</data>

```
Source: [snippets/hr_contract.hr_contract_view_form.x_struct_id.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/hr_contract.hr_contract_view_form.x_struct_id.xml)

## Hr Contract View Kanban  
### Show Start Date  
ID: `mint_system.hr_contract.hr_contract_view_kanban.show_start_date`  
```xml
<data inherit_id="hr_contract.hr_contract_view_kanban" priority="50">
    <xpath expr="//field[@name='job_id']" position="after">
        <br/>
        <field name="date_start"/>
    </xpath>
</data>

```
Source: [snippets/hr_contract.hr_contract_view_kanban.show_start_date.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/hr_contract.hr_contract_view_kanban.show_start_date.xml)

