---
prev: ./snippets.md
---
# Hr Timesheet
## Hr Timesheet Line Tree  
### Always Show So Line  
ID: `mint_system.hr_timesheet.hr_timesheet_line_tree.always_show_so_line`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr_timesheet.hr_timesheet_line_tree" priority="50">

  <xpath expr="//field[@name='so_line']" position="attributes">
    <attribute name="optional">show</attribute>
  </xpath>

</data>

```
Source: [snippets/hr_timesheet.hr_timesheet_line_tree.always_show_so_line.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/hr_timesheet.hr_timesheet_line_tree.always_show_so_line.xml)

### Disable Editable  
ID: `mint_system.hr_timesheet.hr_timesheet_line_tree.disable_editable`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr_timesheet.hr_timesheet_line_tree" priority="50">

  <xpath expr="//tree" position="attributes">
    <attribute name="editable"></attribute>
  </xpath>

</data>

```
Source: [snippets/hr_timesheet.hr_timesheet_line_tree.disable_editable.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/hr_timesheet.hr_timesheet_line_tree.disable_editable.xml)

### Filter Partner Is Company  
ID: `mint_system.hr_timesheet.hr_timesheet_line_tree.filter_partner_is_company`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr_timesheet.hr_timesheet_line_tree" priority="50">

  <xpath expr="//field[@name='partner_id']" position="attributes">
    <attribute name="domain">[('is_company', '=', True)]</attribute>
  </xpath>

</data>

```
Source: [snippets/hr_timesheet.hr_timesheet_line_tree.filter_partner_is_company.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/hr_timesheet.hr_timesheet_line_tree.filter_partner_is_company.xml)

### Invoice Details  
ID: `mint_system.hr_timesheet.hr_timesheet_line_tree.invoice_details`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr_timesheet.hr_timesheet_line_tree" priority="50">

  <xpath expr="//field[@name='unit_amount']" position="after">
    <field name="timesheet_invoice_type" string="Verrechnungstyp"/>
    <field name="timesheet_invoice_id" string="Rechnung"/>
  </xpath>

</data>

```
Source: [snippets/hr_timesheet.hr_timesheet_line_tree.invoice_details.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/hr_timesheet.hr_timesheet_line_tree.invoice_details.xml)

### Show Partner Id  
ID: `mint_system.hr_timesheet.hr_timesheet_line_tree.show_partner_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr_timesheet.hr_timesheet_line_tree" priority="50">

  <xpath expr="//field[@name='project_id']" position="before">
    <field name="partner_id"/>
  </xpath>

  <xpath expr="//field[@name='project_id']" position="attributes">
    <attribute name="domain">[('partner_id', '=', partner_id)]</attribute>
  </xpath>

</data>

```
Source: [snippets/hr_timesheet.hr_timesheet_line_tree.show_partner_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/hr_timesheet.hr_timesheet_line_tree.show_partner_id.xml)

### So Line Domain  
ID: `mint_system.hr_timesheet.hr_timesheet_line_tree.so_line_domain`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr_timesheet.hr_timesheet_line_tree" priority="50">

  <xpath expr="//field[@name='so_line']" position="attributes">
    <attribute name="domain">[('order_id', '=', x_sale_order_id), ('is_service', '=', True), ('is_expense', '=', False)]</attribute>
  </xpath>

</data>

```
Source: [snippets/hr_timesheet.hr_timesheet_line_tree.so_line_domain.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/hr_timesheet.hr_timesheet_line_tree.so_line_domain.xml)

### Task Id Required  
ID: `mint_system.hr_timesheet.hr_timesheet_line_tree.task_id_required`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr_timesheet.hr_timesheet_line_tree" priority="50">

  <xpath expr="//field[@name='task_id']" position="attributes">
    <attribute name="required">1</attribute>
  </xpath>

</data>

```
Source: [snippets/hr_timesheet.hr_timesheet_line_tree.task_id_required.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/hr_timesheet.hr_timesheet_line_tree.task_id_required.xml)

### X Sale Order Id  
ID: `mint_system.hr_timesheet.hr_timesheet_line_tree.x_sale_order_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr_timesheet.hr_timesheet_line_tree" priority="50">

  <xpath expr="//field[@name='so_line']" position="after">
    <field name="x_sale_order_id" optional="hide" />
  </xpath>

</data>

```
Source: [snippets/hr_timesheet.hr_timesheet_line_tree.x_sale_order_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/hr_timesheet.hr_timesheet_line_tree.x_sale_order_id.xml)

## Portal My Timesheets  
### Show Billable  
ID: `mint_system.hr_timesheet.portal_my_timesheets.show_billable`  
```xml
<?xml version="1.0"?>
<!-- Show billable field for timesheet entries -->
<data inherit_id="hr_timesheet.portal_my_timesheets" priority="50">

  <xpath expr="//thead/tr/th[4]" position="after">
    <th>Invoice Type</th>
  </xpath>

  <xpath expr="//tbody/t/tr/td[3]" position="after">
    <td>
      <span t-field="timesheet.timesheet_invoice_type"/>
    </td>
  </xpath>

</data>

```
Source: [snippets/hr_timesheet.portal_my_timesheets.show_billable.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/hr_timesheet.portal_my_timesheets.show_billable.xml)

## Report Timesheet  
### Group By Invoice Type  
ID: `mint_system.hr_timesheet.report_timesheet.group_by_invoice_type`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr_timesheet.report_timesheet" priority="50">

    <xpath expr="//table/tbody/tr[1]" position="replace">

        <!-- Get all invoice types -->
        <t t-set="timesheet_invoice_type" t-value="[]"/>
        <t t-foreach="docs" t-as="l">
            <t t-set="timesheet_invoice_type" t-value="timesheet_invoice_type+[l.timesheet_invoice_type]"/>
        </t>
        
        <style>
          td#date {
            white-space: nowrap;
          }
        </style>

        <!-- Foreach timesheet type list entries -->
        <t t-foreach="set(timesheet_invoice_type)" t-as="type">
            <tr>
                <td colspan="5">
                    <br/>
                    <p class="lead"><span t-esc="{False: False, 'non_billable': 'Nicht abrechenbare Aufwände', 'billable_time': 'Abrechenbare Aufwände'}[type]"/>:</p>
                </td>
            </tr>
            <tr t-foreach="docs" t-as="l">
                <t t-if="type==l.timesheet_invoice_type">

                    <td id="date">
                        <span t-field="l.date"/><br/><span t-field="l.employee_id.name"/>
                    </td>
                    <td>
                        <span t-field="l.name" t-options="{'widget': 'text'}"/>
                    </td>
                    <td t-if="show_project">
                        <span t-field="l.project_id.name"/>
                    </td>
                    <td t-if="show_task">
                        <t t-if="l.task_id">
                            <span t-field="l.task_id.name"/>
                        </t>
                    </td>
                    <td class="text-right">
                        <span t-field="l.unit_amount" t-options="{'widget': 'duration', 'digital': True, 'unit': 'hour', 'round': 'minute'}"/>
                    </td>

                </t>
            </tr>
            
            <tr>
              <td/>
              <td t-if="show_project"/>
              <td t-if="show_task"/>
              <td class="text-right"><strong>Zwischensumme</strong></td>
              <td class="text-right"><strong t-esc="sum(docs.filtered(lambda l: type==l.timesheet_invoice_type).mapped('unit_amount'))" t-options="{'widget': 'duration', 'digital': True, 'unit': 'hour', 'round': 'minute'}"/></td>
            </tr>
        </t>
    </xpath>

</data>

```
Source: [snippets/hr_timesheet.report_timesheet.group_by_invoice_type.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/hr_timesheet.report_timesheet.group_by_invoice_type.xml)

### User Report  
ID: `mint_system.hr_timesheet.report_timesheet.user_report`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr_timesheet.report_timesheet" priority="50">

    <!-- New title -->
    <xpath expr="/t/t/t/div/div[2]" position="after">
        <t t-set="min_date" t-value="min(docs.mapped('date'))"/>
        <t t-set="max_date" t-value="max(docs.mapped('date'))"/>
        <h3>Arbeitsrapport
            <t t-if="len(docs.mapped('project_id')) == 1">
                für das Projekt "<t t-esc="docs.mapped('project_id')[0].name"/>"
            </t>
        </h3>
        <p>
        Von <t t-esc="min_date"/> bis <t t-esc="max_date"/>
        </p>
        <p>
        Kunde: <t t-esc="docs.mapped('project_id')[0].partner_id.name"/><br/>
        Erstellt von: <span t-field="user.name"/>
        </p>
        <br/>
    </xpath>

    <!-- Remove responsible -->
    <xpath expr="//table[1]/tbody[1]/tr[1]/td[2]" position="replace"/>
    <xpath expr="//table[1]/thead[1]/tr[1]/th[2]" position="replace"/>
    <xpath expr="//table[1]/tbody[1]/tr[2]/td[2]" position="replace"/>
    <xpath expr="/t[1]/t[1]/t[1]/div[1]/div[2]/div[1]" position="replace"/>
    
    <!--Combine Responsible and Date-->
    <xpath expr="//table[1]/thead[1]/tr[1]/th[1]" position="replace">
      <th><span>Datum</span><br/><span>Author</span></th>
    </xpath>
    <xpath expr="//table[1]/tbody[1]/tr[1]/td[1]" position="replace">
      <td><span t-field="l.date"/><br/><span t-field="l.employee_id.name"/></td>
    </xpath>
    
    
</data>

```
Source: [snippets/hr_timesheet.report_timesheet.user_report.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/hr_timesheet.report_timesheet.user_report.xml)

## Timesheet View Tree User  
### Show Billable Type  
ID: `mint_system.hr_timesheet.timesheet_view_tree_user.show_billable_type`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr_timesheet.timesheet_view_tree_user" priority="50">

  <xpath expr="//field[@name='unit_amount']" position="after">
    <field name="timesheet_invoice_type" string="Verrechnungstyp"/>
    <field name="timesheet_invoice_id" string="Rechnung"/>
  </xpath>

</data>

```
Source: [snippets/hr_timesheet.timesheet_view_tree_user.show_billable_type.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/hr_timesheet.timesheet_view_tree_user.show_billable_type.xml)

