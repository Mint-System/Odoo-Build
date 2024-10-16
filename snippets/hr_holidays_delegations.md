# Hr Holidays Delegations
## Hr Leave View Form Inherit  
### Delegate Groups  
ID: `mint_system.hr_holidays_delegations.hr_leave_view_form_inherit.delegate_groups`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr_holidays_delegations.hr_leave_view_form_inherit" priority="50">
    <xpath expr="//p[@name='delegate_employee_id']" position="replace">
        <field name="delegate_employee_id" groups="hr_holidays.group_hr_holidays_responsible" options="{'no_create': 1, 'no_open': 1}" domain="[('user_id', '!=', False), ('id', '!=', employee_id)]"/>
    </xpath>
</data>

```
Source: [snippets/hr_holidays_delegations.hr_leave_view_form_inherit.delegate_groups.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/hr_holidays_delegations.hr_leave_view_form_inherit.delegate_groups.xml)

