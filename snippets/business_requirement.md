# Business Requirement
## View Business Requirement Form  
### Clickable State  
ID: `mint_system.business_requirement.view_business_requirement_form.clickable_state`  
```xml
<?xml version="1.0"?>
<data inherit_id="business_requirement.view_business_requirement_form" priority="50">

    <field name="state" position="attributes">
        <attribute name="clickable">1</attribute>
    </field>

</data>
```
Source: [snippets/business_requirement.view_business_requirement_form.clickable_state.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/business_requirement.view_business_requirement_form.clickable_state.xml)

### Hide Scenario  
ID: `mint_system.business_requirement.view_business_requirement_form.hide_scenario`  
```xml
<?xml version="1.0"?>
<data inherit_id="business_requirement.view_business_requirement_form" priority="50">
  
    <xpath expr="//field[@name='scenario']/.." position="replace" />

</data>
```
Source: [snippets/business_requirement.view_business_requirement_form.hide_scenario.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/business_requirement.view_business_requirement_form.hide_scenario.xml)

### Hide Terms And Conditions  
ID: `mint_system.business_requirement.view_business_requirement_form.hide_terms_and_conditions`  
```xml
<?xml version="1.0"?>
<data inherit_id="business_requirement.view_business_requirement_form" priority="50">
  
    <xpath expr="//field[@name='terms_and_conditions']/.." position="replace" />

</data>
```
Source: [snippets/business_requirement.view_business_requirement_form.hide_terms_and_conditions.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/business_requirement.view_business_requirement_form.hide_terms_and_conditions.xml)

### Hide Test Case  
ID: `mint_system.business_requirement.view_business_requirement_form.hide_test_case`  
```xml
<?xml version="1.0"?>
<data inherit_id="business_requirement.view_business_requirement_form" priority="50">
  
    <xpath expr="//field[@name='test_case']/.." position="replace" />

</data>
```
Source: [snippets/business_requirement.view_business_requirement_form.hide_test_case.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/business_requirement.view_business_requirement_form.hide_test_case.xml)

### X Planned Hours X Estimated Cost  
ID: `mint_system.business_requirement.view_business_requirement_form.x_planned_hours_x_estimated_cost`  
```xml
<?xml version="1.0"?>
<data inherit_id="business_requirement.view_business_requirement_form" priority="50">

    <field name="category_ids" position="after">
        <field name="x_planned_hours" />
        <field name="x_estimated_cost" widget="monetary" />
    </field>

</data>
```
Source: [snippets/business_requirement.view_business_requirement_form.x_planned_hours_x_estimated_cost.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/business_requirement.view_business_requirement_form.x_planned_hours_x_estimated_cost.xml)

### X Project Id  
ID: `mint_system.business_requirement.view_business_requirement_form.x_project_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="business_requirement.view_business_requirement_form" priority="50">
  
    <field name="origin" position="before">
       <field name="x_project_id" />
  </field>

</data>
```
Source: [snippets/business_requirement.view_business_requirement_form.x_project_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/business_requirement.view_business_requirement_form.x_project_id.xml)

### X Task Id  
ID: `mint_system.business_requirement.view_business_requirement_form.x_task_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="business_requirement.view_business_requirement_form" priority="50">
  
    <field name="category_ids" position="before">
       <field name="x_task_id" domain="[('project_id', '=', x_project_id)]" context="{'default_project_id': x_project_id}"/>
  </field>

</data>
```
Source: [snippets/business_requirement.view_business_requirement_form.x_task_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/business_requirement.view_business_requirement_form.x_task_id.xml)

## View Business Requirement Search  
### X Project Id  
ID: `mint_system.business_requirement.view_business_requirement_search.x_project_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="business_requirement.view_business_requirement_search" priority="50">
  
    <field name="name" position="after">
       <field name="x_project_id" string="Project"/>
  </field>

</data>
```
Source: [snippets/business_requirement.view_business_requirement_search.x_project_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/business_requirement.view_business_requirement_search.x_project_id.xml)

## View Business Requirement Tree  
### Hide Category Ids  
ID: `mint_system.business_requirement.view_business_requirement_tree.hide_category_ids`  
```xml
<?xml version="1.0"?>
<data inherit_id="business_requirement.view_business_requirement_tree" priority="50">

    <field name="category_ids" position="replace" />

</data>
```
Source: [snippets/business_requirement.view_business_requirement_tree.hide_category_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/business_requirement.view_business_requirement_tree.hide_category_ids.xml)

### X Planned Hours  
ID: `mint_system.business_requirement.view_business_requirement_tree.x_planned_hours`  
```xml
<?xml version="1.0"?>
<data inherit_id="business_requirement.view_business_requirement_tree" priority="50">
  
    <field name="state" position="after">
       <field name="x_planned_hours" optional="show" sum="Geplante Stunden"/>
  </field>

</data>
```
Source: [snippets/business_requirement.view_business_requirement_tree.x_planned_hours.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/business_requirement.view_business_requirement_tree.x_planned_hours.xml)

### X Project Id  
ID: `mint_system.business_requirement.view_business_requirement_tree.x_project_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="business_requirement.view_business_requirement_tree" priority="50">
  
    <field name="category_ids" position="before">
       <field name="x_project_id" />
  </field>

</data>
```
Source: [snippets/business_requirement.view_business_requirement_tree.x_project_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/business_requirement.view_business_requirement_tree.x_project_id.xml)

