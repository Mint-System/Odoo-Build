# Hr Timesheet

## Hr Timesheet Line Search

### Filter Project Code

ID: `mint_system.hr_timesheet.hr_timesheet_line_search.filter_project_code`

```xml
<data inherit_id="hr_timesheet.hr_timesheet_line_search" priority="50">
    <field name="project_id" position="replace">
        <field name="project_id" filter_domain="['|', ('project_id', 'ilike', self), ('project_id.code', 'ilike', self)]"/>
    </field>
</data>

```
Edit: [snippets/mint_system.hr_timesheet.hr_timesheet_line_search.filter_project_code.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.hr_timesheet_line_search.filter_project_code.xml)

Source: [snippets/mint_system.hr_timesheet.hr_timesheet_line_search.filter_project_code.xml](https://odoo.build/snippets/mint_system.hr_timesheet.hr_timesheet_line_search.filter_project_code.xml)

### Filter Project Id

ID: `mint_system.hr_timesheet.hr_timesheet_line_search.filter_project_id`

```xml
<data inherit_id="hr_timesheet.hr_timesheet_line_search" priority="50">
    <field name="date" position="before">
        <field name="project_id" position="move"/>
    </field>
    <field name="project_id" position="replace">
        <field name="project_id" filter_domain="['|', ('project_id', 'ilike', self), ('account_id', 'ilike', self)]"/>
    </field>
</data>

```
Edit: [snippets/mint_system.hr_timesheet.hr_timesheet_line_search.filter_project_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.hr_timesheet_line_search.filter_project_id.xml)

Source: [snippets/mint_system.hr_timesheet.hr_timesheet_line_search.filter_project_id.xml](https://odoo.build/snippets/mint_system.hr_timesheet.hr_timesheet_line_search.filter_project_id.xml)

### Filter Validated

ID: `mint_system.hr_timesheet.hr_timesheet_line_search.filter_validated`

```xml
<data inherit_id="hr_timesheet.hr_timesheet_line_search" priority="50">
    <filter name="non_billable" position="after">
        <filter string="Validiert" name="validated"/>
    </filter>
</data>

```
Edit: [snippets/mint_system.hr_timesheet.hr_timesheet_line_search.filter_validated.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.hr_timesheet_line_search.filter_validated.xml)

Source: [snippets/mint_system.hr_timesheet.hr_timesheet_line_search.filter_validated.xml](https://odoo.build/snippets/mint_system.hr_timesheet.hr_timesheet_line_search.filter_validated.xml)

## Hr Timesheet Line Tree

### Always Show So Line

ID: `mint_system.hr_timesheet.hr_timesheet_line_tree.always_show_so_line`

```xml
<data inherit_id="hr_timesheet.hr_timesheet_line_tree" priority="50">
    <xpath expr="//field[@name='so_line']" position="attributes">
        <attribute name="optional">show</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.always_show_so_line.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.always_show_so_line.xml)

Source: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.always_show_so_line.xml](https://odoo.build/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.always_show_so_line.xml)

### Disable Editable

ID: `mint_system.hr_timesheet.hr_timesheet_line_tree.disable_editable`

```xml
<data inherit_id="hr_timesheet.hr_timesheet_line_tree" priority="50">
    <xpath expr="//tree" position="attributes">
        <attribute name="editable"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.disable_editable.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.disable_editable.xml)

Source: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.disable_editable.xml](https://odoo.build/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.disable_editable.xml)

### Filter Partner Is Company

ID: `mint_system.hr_timesheet.hr_timesheet_line_tree.filter_partner_is_company`

```xml
<data inherit_id="hr_timesheet.hr_timesheet_line_tree" priority="50">
    <xpath expr="//field[@name='partner_id']" position="attributes">
        <attribute name="domain">[('is_company', '=', True)]</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.filter_partner_is_company.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.filter_partner_is_company.xml)

Source: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.filter_partner_is_company.xml](https://odoo.build/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.filter_partner_is_company.xml)

### Invoice Details

ID: `mint_system.hr_timesheet.hr_timesheet_line_tree.invoice_details`

```xml
<data inherit_id="hr_timesheet.hr_timesheet_line_tree" priority="50">
    <xpath expr="//field[@name='unit_amount']" position="after">
        <field name="timesheet_invoice_type" string="Verrechnungstyp"/>
        <field name="timesheet_invoice_id" string="Rechnung"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.invoice_details.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.invoice_details.xml)

Source: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.invoice_details.xml](https://odoo.build/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.invoice_details.xml)

### Options Enable Open

ID: `mint_system.hr_timesheet.hr_timesheet_line_tree.options_enable_open`

```xml
<data inherit_id="hr_timesheet.hr_timesheet_line_tree" priority="50">
    <xpath expr="//field[@name='task_id']" position="attributes">
        <attribute name="options">{'no_create_edit': True}</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.options_enable_open.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.options_enable_open.xml)

Source: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.options_enable_open.xml](https://odoo.build/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.options_enable_open.xml)

### Show Helpdesk Ticket Id

ID: `mint_system.hr_timesheet.hr_timesheet_line_tree.show_helpdesk_ticket_id`

```xml
<data inherit_id="hr_timesheet.hr_timesheet_line_tree" priority="50">
    <xpath expr="//field[@name='task_id']" position="after">
        <field name="helpdesk_ticket_id" optional="hide"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.show_helpdesk_ticket_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.show_helpdesk_ticket_id.xml)

Source: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.show_helpdesk_ticket_id.xml](https://odoo.build/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.show_helpdesk_ticket_id.xml)

### Show Partner Id

ID: `mint_system.hr_timesheet.hr_timesheet_line_tree.show_partner_id`

```xml
<data inherit_id="hr_timesheet.hr_timesheet_line_tree" priority="50">
    <xpath expr="//field[@name='project_id']" position="before">
        <field name="partner_id"/>
    </xpath>
    <xpath expr="//field[@name='project_id']" position="attributes">
        <attribute name="domain">[('partner_id', '=', partner_id)]</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.show_partner_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.show_partner_id.xml)

Source: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.show_partner_id.xml](https://odoo.build/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.show_partner_id.xml)

### So Line Domain

ID: `mint_system.hr_timesheet.hr_timesheet_line_tree.so_line_domain`

```xml
<data inherit_id="hr_timesheet.hr_timesheet_line_tree" priority="50">
    <xpath expr="//field[@name='so_line']" position="attributes">
        <attribute name="domain">[('order_id', '=', x_sale_order_id), ('is_service', '=', True), ('is_expense', '=', False)]</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.so_line_domain.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.so_line_domain.xml)

Source: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.so_line_domain.xml](https://odoo.build/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.so_line_domain.xml)

### So Line Readonly

ID: `mint_system.hr_timesheet.hr_timesheet_line_tree.so_line_readonly`

```xml
<data inherit_id="hr_timesheet.hr_timesheet_line_tree" priority="50">
    <xpath expr="//field[@name='so_line']" position="attributes">
        <attribute name="readonly">True</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.so_line_readonly.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.so_line_readonly.xml)

Source: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.so_line_readonly.xml](https://odoo.build/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.so_line_readonly.xml)

### Task Id Required

ID: `mint_system.hr_timesheet.hr_timesheet_line_tree.task_id_required`

```xml
<data inherit_id="hr_timesheet.hr_timesheet_line_tree" priority="50">
    <xpath expr="//field[@name='task_id']" position="attributes">
        <attribute name="required">1</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.task_id_required.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.task_id_required.xml)

Source: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.task_id_required.xml](https://odoo.build/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.task_id_required.xml)

### X Not Billable

ID: `mint_system.hr_timesheet.hr_timesheet_line_tree.x_not_billable`

```xml
<data inherit_id="hr_timesheet.hr_timesheet_line_tree" priority="50">
    <xpath expr="//field[@name='task_id']" position="attributes">
        <attribute name="domain">[
      '&amp;',
      '|',
        ('x_not_billable', '=', True),
        '&amp;',
          ('x_not_billable', '=', False),
          ('sale_line_id', '!=', False),
      ('project_id', '=', project_id)
    ]</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.x_not_billable.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.x_not_billable.xml)

Source: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.x_not_billable.xml](https://odoo.build/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.x_not_billable.xml)

### X Parent Id Display Name

ID: `mint_system.hr_timesheet.hr_timesheet_line_tree.x_parent_id_display_name`

```xml
<data inherit_id="hr_timesheet.hr_timesheet_line_tree" priority="50">
    <xpath expr="//field[@name='task_id']" position="before">
        <field name="x_parent_id_display_name" optional="hide"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.x_parent_id_display_name.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.x_parent_id_display_name.xml)

Source: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.x_parent_id_display_name.xml](https://odoo.build/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.x_parent_id_display_name.xml)

### X Phase Id Name

ID: `mint_system.hr_timesheet.hr_timesheet_line_tree.x_phase_id_name`

```xml
<data inherit_id="hr_timesheet.hr_timesheet_line_tree" priority="50">
    <xpath expr="//field[@name='task_id']" position="before">
        <field name="x_phase_id_name" optional="hide"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.x_phase_id_name.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.x_phase_id_name.xml)

Source: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.x_phase_id_name.xml](https://odoo.build/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.x_phase_id_name.xml)

### X Sale Order Id

ID: `mint_system.hr_timesheet.hr_timesheet_line_tree.x_sale_order_id`

```xml
<data inherit_id="hr_timesheet.hr_timesheet_line_tree" priority="50">
    <xpath expr="//field[@name='so_line']" position="after">
        <field name="x_sale_order_id" optional="hide"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.x_sale_order_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.x_sale_order_id.xml)

Source: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.x_sale_order_id.xml](https://odoo.build/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.x_sale_order_id.xml)

### X Vehicle Id

ID: `mint_system.hr_timesheet.hr_timesheet_line_tree.x_vehicle_id`

```xml
<data inherit_id="hr_timesheet.hr_timesheet_line_tree" priority="50">
    <xpath expr="//tree/field[@name='category_id']" position="after">
        <field name="x_vehicle_id" optional="hide"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.x_vehicle_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.x_vehicle_id.xml)

Source: [snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.x_vehicle_id.xml](https://odoo.build/snippets/mint_system.hr_timesheet.hr_timesheet_line_tree.x_vehicle_id.xml)

## Portal My Timesheets

### Show Billable

ID: `mint_system.hr_timesheet.portal_my_timesheets.show_billable`

```xml
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
Edit: [snippets/mint_system.hr_timesheet.portal_my_timesheets.show_billable.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.portal_my_timesheets.show_billable.xml)

Source: [snippets/mint_system.hr_timesheet.portal_my_timesheets.show_billable.xml](https://odoo.build/snippets/mint_system.hr_timesheet.portal_my_timesheets.show_billable.xml)

## Report Timesheet

### Group By Invoice Type

ID: `mint_system.hr_timesheet.report_timesheet.group_by_invoice_type`

```xml
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
                    <p class="lead"><span t-esc="{False: False, 'non_billable': 'Nicht abrechenbare Aufw&#xE4;nde', 'billable_time': 'Abrechenbare Aufw&#xE4;nde'}[type]"/>:</p>
                </td>
            </tr>
            <tr t-foreach="docs" t-as="l">
                <t t-if="type==l.timesheet_invoice_type">
                    <td id="date">
                        <span t-field="l.date"/>
                        <br/>
                        <span t-field="l.employee_id.name"/>
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
                <td class="text-right">
                    <strong>Zwischensumme</strong>
                </td>
                <td class="text-right">
                    <strong t-esc="sum(docs.filtered(lambda l: type==l.timesheet_invoice_type).mapped('unit_amount'))" t-options="{'widget': 'duration', 'digital': True, 'unit': 'hour', 'round': 'minute'}"/>
                </td>
            </tr>
        </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.hr_timesheet.report_timesheet.group_by_invoice_type.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.report_timesheet.group_by_invoice_type.xml)

Source: [snippets/mint_system.hr_timesheet.report_timesheet.group_by_invoice_type.xml](https://odoo.build/snippets/mint_system.hr_timesheet.report_timesheet.group_by_invoice_type.xml)

### Group By X Timesheet Invoice Type

ID: `mint_system.hr_timesheet.report_timesheet.group_by_x_timesheet_invoice_type`

```xml
<data inherit_id="hr_timesheet.report_timesheet" priority="50">
    <xpath expr="//table/tbody/tr[1]" position="replace">
        <!-- Get all invoice types -->
        <t t-set="x_timesheet_invoice_type" t-value="[]"/>
        <t t-foreach="docs" t-as="doc">
            <t t-set="x_timesheet_invoice_type" t-value="x_timesheet_invoice_type+[doc.x_timesheet_invoice_type]"/>
        </t>
        <style>
          td#date {
            white-space: nowrap;
          }
        </style>
        <!-- Foreach timesheet type list entries -->
        <t t-foreach="set(x_timesheet_invoice_type)" t-as="type">
            <tr>
                <td colspan="5">
                    <br/>
                    <p class="lead"><span t-esc="{False: False, 'non_billable': 'Nicht abrechenbare Aufw&#xE4;nde', 'billable_time': 'Abrechenbare Aufw&#xE4;nde'}[type]"/>:</p>
                </td>
            </tr>
            <tr t-foreach="docs" t-as="l">
                <t t-if="type==l.x_timesheet_invoice_type">
                    <td id="date">
                        <span t-field="l.date"/>
                        <br/>
                        <span t-field="l.employee_id.name"/>
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
                <td class="text-right">
                    <strong>Zwischensumme</strong>
                </td>
                <td class="text-right">
                    <strong t-esc="sum(docs.filtered(lambda l: type==l.timesheet_invoice_type).mapped('unit_amount'))" t-options="{'widget': 'duration', 'digital': True, 'unit': 'hour', 'round': 'minute'}"/>
                </td>
            </tr>
        </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.hr_timesheet.report_timesheet.group_by_x_timesheet_invoice_type.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.report_timesheet.group_by_x_timesheet_invoice_type.xml)

Source: [snippets/mint_system.hr_timesheet.report_timesheet.group_by_x_timesheet_invoice_type.xml](https://odoo.build/snippets/mint_system.hr_timesheet.report_timesheet.group_by_x_timesheet_invoice_type.xml)

### User Report

ID: `mint_system.hr_timesheet.report_timesheet.user_report`

```xml
<data inherit_id="hr_timesheet.report_timesheet" priority="50">
    <!-- New title -->
    <xpath expr="/t/t/t/div/div[2]" position="after">
        <t t-set="min_date" t-value="min(docs.mapped('date'))"/>
        <t t-set="max_date" t-value="max(docs.mapped('date'))"/>
        <t t-set="default_project" t-value="docs.filtered(lambda d: d.project_id.partner_id)[:1].project_id"/>
        <h3>Arbeitsrapport f&#xFC;r das Projekt "<t t-esc="default_project.name"/>"</h3>
        <p>Zeitraum: <t t-esc="min_date" t-options="{'widget': 'date'}"/> bis <t t-esc="max_date" t-options="{'widget': 'date'}"/>
    </p>
        <p>Kunde: <t t-esc="default_project.partner_id.name"/><br/> Erstellt von: <span t-field="user.name"/>
    </p>
        <br/>
    </xpath>
    <!-- Remove responsible -->
    <xpath expr="//table[1]/tbody[1]/tr[1]/td[2]" position="replace"/>
    <xpath expr="//table[1]/thead[1]/tr[1]/th[2]" position="replace"/>
    <xpath expr="//table[1]/tbody[1]/tr[2]/td[2]" position="replace"/>
    <xpath expr="/t[1]/t[1]/t[1]/div[1]/div[2]/div[1]" position="replace"/>
    <!--Combine
  Responsible and Date-->
    <xpath expr="//table[1]/thead[1]/tr[1]/th[1]" position="replace">
        <th>
            <span>Datum</span>
            <br/>
            <span>Author</span>
        </th>
    </xpath>
    <xpath expr="//table[1]/tbody[1]/tr[1]/td[1]" position="replace">
        <td>
            <span t-field="l.date"/>
            <br/>
            <span t-field="l.employee_id.name"/>
        </td>
    </xpath>
</data>

```
Edit: [snippets/mint_system.hr_timesheet.report_timesheet.user_report.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.report_timesheet.user_report.xml)

Source: [snippets/mint_system.hr_timesheet.report_timesheet.user_report.xml](https://odoo.build/snippets/mint_system.hr_timesheet.report_timesheet.user_report.xml)

## Timesheet View Tree User

### Show Billable Type

ID: `mint_system.hr_timesheet.timesheet_view_tree_user.show_billable_type`

```xml
<data inherit_id="hr_timesheet.timesheet_view_tree_user" priority="50">
    <xpath expr="//field[@name='unit_amount']" position="after">
        <field name="timesheet_invoice_type" string="Verrechnungstyp"/>
        <field name="timesheet_invoice_id" string="Rechnung"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.hr_timesheet.timesheet_view_tree_user.show_billable_type.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.timesheet_view_tree_user.show_billable_type.xml)

Source: [snippets/mint_system.hr_timesheet.timesheet_view_tree_user.show_billable_type.xml](https://odoo.build/snippets/mint_system.hr_timesheet.timesheet_view_tree_user.show_billable_type.xml)

### Show Helpdesk Ticket

ID: `mint_system.hr_timesheet.timesheet_view_tree_user.show_helpdesk_ticket`

```xml
<data inherit_id="hr_timesheet.timesheet_view_tree_user" priority="50">
    <xpath expr="//field[@name='task_id']" position="after">
        <field name="helpdesk_ticket_id" optional="show"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.hr_timesheet.timesheet_view_tree_user.show_helpdesk_ticket.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.timesheet_view_tree_user.show_helpdesk_ticket.xml)

Source: [snippets/mint_system.hr_timesheet.timesheet_view_tree_user.show_helpdesk_ticket.xml](https://odoo.build/snippets/mint_system.hr_timesheet.timesheet_view_tree_user.show_helpdesk_ticket.xml)

### Show Product Uom Id

ID: `mint_system.hr_timesheet.timesheet_view_tree_user.show_product_uom_id`

```xml
<data inherit_id="hr_timesheet.timesheet_view_tree_user" priority="50">
    <xpath expr="//field[@name='unit_amount']" position="after">
        <field name="product_uom_category_id" invisible="1"/>
        <field name="product_uom_id" optional="show"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.hr_timesheet.timesheet_view_tree_user.show_product_uom_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.timesheet_view_tree_user.show_product_uom_id.xml)

Source: [snippets/mint_system.hr_timesheet.timesheet_view_tree_user.show_product_uom_id.xml](https://odoo.build/snippets/mint_system.hr_timesheet.timesheet_view_tree_user.show_product_uom_id.xml)

### X Timesheet Invoice Type

ID: `mint_system.hr_timesheet.timesheet_view_tree_user.x_timesheet_invoice_type`

```xml
<data inherit_id="hr_timesheet.timesheet_view_tree_user" priority="50">
    <xpath expr="//field[@name='timesheet_invoice_type']" position="replace">
        <field name="x_timesheet_invoice_type"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.hr_timesheet.timesheet_view_tree_user.x_timesheet_invoice_type.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_timesheet.timesheet_view_tree_user.x_timesheet_invoice_type.xml)

Source: [snippets/mint_system.hr_timesheet.timesheet_view_tree_user.x_timesheet_invoice_type.xml](https://odoo.build/snippets/mint_system.hr_timesheet.timesheet_view_tree_user.x_timesheet_invoice_type.xml)

