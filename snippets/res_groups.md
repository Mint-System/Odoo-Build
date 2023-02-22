---
prev: ./snippets
---
# Res Groups
## Hr Holidays  
### Holidays Self Responsible  
ID: `mint_system.res_groups.hr_holidays.holidays_self_responsible`  
```xml
<?xml version="1.0" encoding="utf-8"?>
<odoo>

    <record id="res_groups.hr_holidays.holidays_self_responsible" model="res.groups">
        <field name="name">Verantwortlich mit Selbstfreigabe</field>
        <field name="category_id" ref="base.module_category_human_resources_time_off"/>
        <field name="implied_ids" eval="[(4, ref('hr_holidays.group_hr_holidays_responsible'))]"/>
    </record>

</odoo>

```
Source: [snippets/res_groups.hr_holidays.holidays_self_responsible.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/res_groups.hr_holidays.holidays_self_responsible.xml)

