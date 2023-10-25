# Ir Model
## Account Analytic Line  
### X Sale Order Id  
ID: `mint_system.ir_model.account_analytic_line.x_sale_order_id`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_sale_order_id" model="ir.model.fields">
    <field name="field_description">Verkaufsauftrag</field>
    <field name="model">account.move.line</field>
    <field name="model_id" ref="account.model_account_analytic_line"/>
    <field name="name">x_sale_order_id</field>
    
    <field name="readonly" eval="True"/>
    <field name="store" eval="False"/>
    <field name="copied" eval="False"/>
    <field name="ttype">many2one</field>
    <field name="relation">sale.order</field>
    <field name="related">task_id.sale_order_id</field>
  </record>
  
</odoo>

```
Source: [snippets/ir_model.account_analytic_line.x_sale_order_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.account_analytic_line.x_sale_order_id.xml)

### X Timesheet Invoice Type  
ID: `mint_system.ir_model.account_analytic_line.x_timesheet_invoice_type`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_timesheet_invoice_type" model="ir.model.fields">
    <field name="field_description">Abrechenbarer Typ</field>
    <field name="model">account.move.line</field>
    <field name="model_id" ref="account.model_account_analytic_line"/>
    <field name="name">x_timesheet_invoice_type</field>
    <field name="readonly" eval="True"/>
    <field name="store" eval="False"/>
    <field name="copied" eval="False"/>
    <field name="ttype">many2one</field>
    <field name="depends">so_line</field>
    <field name="selection">[('non_billable','Nicht abrechenbare Aufwände'),('billable_time','Abrechenbare Aufwände')]</field>
    <field name="compute">for rec in self:
  rec['x_timesheet_invoice_type'] = 'billable_time' if rec.so_line.price_unit > 0 else 'non_billable'</field>
  </record>
  
</odoo>

```
Source: [snippets/ir_model.account_analytic_line.x_timesheet_invoice_type.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.account_analytic_line.x_timesheet_invoice_type.xml)

## Account Bank Statement  
### X Cashbox End Ids  
ID: `mint_system.ir_model.account_bank_statement.x_cashbox_end_ids`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_cashbox_end_ids" model="ir.model.fields">
    <field name="field_description">Kassenprüfung Endpositionen</field>
    <field name="model">account.bank.statement</field>
    <field name="model_id" ref="account.model_account_bank_statement"/>
    <field name="name">x_cashbox_end_ids</field>
        <field name="store" eval="False"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">many2one</field>
    <field name="related">cashbox_end_id.cashbox_lines_ids</field>
    <field name="relation">account.cashbox.line</field>
    <field name="relation_fields">cashbox_id</field>
  </record>
  
</odoo>

```
Source: [snippets/ir_model.account_bank_statement.x_cashbox_end_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.account_bank_statement.x_cashbox_end_ids.xml)

### X Cashbox Start Ids  
ID: `mint_system.ir_model.account_bank_statement.x_cashbox_start_ids`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_cashbox_start_ids" model="ir.model.fields">
    <field name="field_description">Kassenprüfung Startpositionen</field>
    <field name="model">account.bank.statement</field>
    <field name="model_id" ref="account.model_account_bank_statement"/>
    <field name="name">x_cashbox_start_ids</field>
    <field name="store" eval="False"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">many2one</field>
    <field name="related">cashbox_start_id.cashbox_lines_ids</field>
    <field name="relation">account.cashbox.line</field>
    <field name="relation_fields">cashbox_id</field>
  </record>
  
</odoo>

```
Source: [snippets/ir_model.account_bank_statement.x_cashbox_start_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.account_bank_statement.x_cashbox_start_ids.xml)

## Account Move Line  
### X Sale Order Id  
ID: `mint_system.ir_model.account_move_line.x_sale_order_id`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_sale_order_id" model="ir.model.fields">
    <field name="field_description">Verkaufsauftrag</field>
    <field name="model">account.move.line</field>
    <field name="model_id" ref="account.model_account_move_line"/>
    <field name="name">x_sale_order_id</field>
    <field name="store" eval="False"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">many2one</field>
    <field name="relation">sale.order</field>
    <field name="depends">sale_line_ids</field>
    <field name="compute">for record in self:
  record['x_sale_order_id'] = record.sale_line_ids[0].order_id if record.sale_line_ids else 0
    </field>
  </record>
  
</odoo>

```
Source: [snippets/ir_model.account_move_line.x_sale_order_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.account_move_line.x_sale_order_id.xml)

## Account Move  
### X Account Codes  
ID: `mint_system.ir_model.account_move.x_account_codes`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_account_codes" model="ir.model.fields">
    <field name="field_description">Kontos</field>
    <field name="model">account.move</field>
    <field name="model_id" ref="account.model_account_move"/>
    <field name="name">x_account_codes</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">text</field>
    <field name="depends">line_ids</field>
    <field name="compute">for record in self:
  codes = record.line_ids.mapped('account_id.code')
  codes.sort()
  record['x_account_codes'] = ",".join(codes)
    </field>
  </record>

</odoo>

```
Source: [snippets/ir_model.account_move.x_account_codes.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.account_move.x_account_codes.xml)

### X Date Done  
ID: `mint_system.ir_model.account_move.x_date_done`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_date_done" model="ir.model.fields">
    <field name="field_description">date_done</field>
    <field name="model">account.move</field>
    <field name="model_id" ref="account.model_account_move"/>
    <field name="name">x_date_done</field>
    <field name="store" eval="False"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">date</field>
    <field name="related">picking_ids.date_done</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.account_move.x_date_done.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.account_move.x_date_done.xml)

### X Duplicate Found  
ID: `mint_system.ir_model.account_move.x_duplicate_found`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_duplicate_found" model="ir.model.fields">
    <field name="field_description">Duplikat Gefunden</field>
    <field name="model">account.move</field>
    <field name="model_id" ref="account.model_account_move"/>
    <field name="name">x_duplicate_found</field>
    <field name="store" eval="False"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">boolean</field>
    <field name="depends">partner_id,amount_total,state</field>
    <field name="compute">for rec in self:
      if rec.state == 'draft' and rec.move_type == 'in_invoice':
        invoice_id = self.env['account.move'].search([
          ('state', '=', 'posted'),
          ('partner_id', '=', rec.partner_id.id),
          ('amount_total', '=', rec.amount_total)
        ], limit=1)
        if invoice_id:
          rec['x_duplicate_found'] = True
        else:
          rec['x_duplicate_found'] = False
      else:
        rec['x_duplicate_found'] = False</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.account_move.x_duplicate_found.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.account_move.x_duplicate_found.xml)

### X Has Downpayment  
ID: `mint_system.ir_model.account_move.x_has_downpayment`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_has_downpayment" model="ir.model.fields">
    <field name="field_description">Hat Anzahlung</field>
    <field name="model">account.move</field>
    <field name="model_id" ref="account.model_account_move"/>
    <field name="name">x_has_downpayment</field>
    <field name="store" eval="False"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">boolean</field>
    <field name="depends">invoice_line_ids.sale_line_ids</field>
    <field name="compute">for rec in self:
  if any(line.is_downpayment for line in rec.invoice_line_ids.sale_line_ids.order_id.order_line):
    rec['x_has_downpayment'] = True
  else:
    rec['x_has_downpayment'] = False</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.account_move.x_has_downpayment.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.account_move.x_has_downpayment.xml)

### X Hr Expense Sheet Ids  
ID: `mint_system.ir_model.account_move.x_hr_expense_sheet_ids`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_hr_expense_sheet_ids" model="ir.model.fields">
    <field name="field_description">Auslagen Abrechnungen</field>
    <field name="model">account.move</field>
    <field name="model_id" ref="account.model_account_move"/>
    <field name="name">x_hr_expense_sheet_ids</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">one2many</field>
    <field name="relation">hr.expense.sheet</field>
    <field name="relation_field">account_move_id</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.account_move.x_hr_expense_sheet_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.account_move.x_hr_expense_sheet_ids.xml)

### X Invoice Warn Msg  
ID: `mint_system.ir_model.account_move.x_invoice_warn_msg`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_invoice_warn_msg" model="ir.model.fields">
    <field name="field_description">Nachricht zu Rechnung</field>
    <field name="model">account.move</field>
    <field name="model_id" ref="account.model_account_move"/>
    <field name="name">x_invoice_warn_msg</field>
    <field name="store" eval="False"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">text</field>
    <field name="relation">partner_id.invoice_warn_msg</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.account_move.x_invoice_warn_msg.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.account_move.x_invoice_warn_msg.xml)

### X Picking List  
ID: `mint_system.ir_model.account_move.x_picking_list`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_picking_list" model="ir.model.fields">
    <field name="field_description">Picking List</field>
    <field name="model">account.move</field>
    <field name="model_id" ref="account.model_account_move"/>
    <field name="name">x_picking_list</field>
    <field name="store" eval="False"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">text</field>
    <field name="depends">picking_ids</field>
    <field name="compute">for record in self:
      picking_ids = record.picking_ids.mapped('name')
      if picking_ids:
        picking_list = ", ".join(picking_ids)
        record['x_picking_list'] = picking_list
        record['invoice_origin'] = picking_list</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.account_move.x_picking_list.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.account_move.x_picking_list.xml)

### X Recurring Inverval  
ID: `mint_system.ir_model.account_move.x_recurring_inverval`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_recurring_inverval" model="ir.model.fields">
    <field name="field_description">Abrechnungsintervall</field>
    <field name="model">account.move</field>
    <field name="model_id" ref="account.model_account_move"/>
    <field name="name">x_recurring_inverval</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="False"/>
    <field name="ttype">selection</field>
    <field name="selection_id">[
      {'value':'daily','name':'Daily'},
      {'value':'monthly','name':'Monthly'},
      {'value':'quarterly','name':'Quarterly'},
      {'value':'yearly','name':'Yearly'}
    ]</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.account_move.x_recurring_inverval.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.account_move.x_recurring_inverval.xml)

### X Studio Description  
ID: `mint_system.ir_model.account_move.x_studio_description`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_studio_description" model="ir.model.fields">
    <field name="field_description">Beschreibung Rechnung</field>
    <field name="model">account.move</field>
    <field name="model_id" ref="sale.model_sale_order"/>
    <field name="name">x_studio_description</field>
    <field name="store" eval="True"/>
    <field name="ttype">text</field>
    <field name="copied" eval="True"/>
  </record>

</odoo>

```
Source: [snippets/ir_model.account_move.x_studio_description.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.account_move.x_studio_description.xml)

## Agreement Agreement  
### X Group Ids  
ID: `mint_system.ir_model.agreement_agreement.x_group_ids`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_group_ids" model="ir.model.fields">
    <field name="field_description">Gruppen</field>
    <field name="model">agreement.agreement</field>
    <field name="model_id" ref="crm.model_crm_lead"/>
    <field name="name">x_group_ids</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">many2many</field>
    <field name="relation">res.groups</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.agreement_agreement.x_group_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.agreement_agreement.x_group_ids.xml)

### X User Ids  
ID: `mint_system.ir_model.agreement_agreement.x_user_ids`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_user_ids" model="ir.model.fields">
    <field name="field_description">Benutzer</field>
    <field name="model">agreement.agreement</field>
    <field name="model_id" ref="crm.model_crm_lead"/>
    <field name="name">x_user_ids</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">many2many</field>
    <field name="relation">res.users</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.agreement_agreement.x_user_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.agreement_agreement.x_user_ids.xml)

## Business Requirement  
### X Estimated Cost  
ID: `mint_system.ir_model.business_requirement.x_estimated_cost`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_estimated_cost" model="ir.model.fields">
    <field name="field_description">Estimated Cost</field>
    <field name="model">business.requirement</field>
    <field name="model_id" ref="business_requirement.model_business_requirement"/>
    <field name="name">x_estimated_cost</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">monetary</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.business_requirement.x_estimated_cost.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.business_requirement.x_estimated_cost.xml)

### X Planned Hours  
ID: `mint_system.ir_model.business_requirement.x_planned_hours`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_planned_hours" model="ir.model.fields">
    <field name="field_description">Planned Hours</field>
    <field name="model">business.requirement</field>
    <field name="model_id" ref="business_requirement.model_business_requirement"/>
    <field name="name">x_planned_hours</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">float</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.business_requirement.x_planned_hours.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.business_requirement.x_planned_hours.xml)

### X Project Id  
ID: `mint_system.ir_model.business_requirement.x_project_id`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_project_id" model="ir.model.fields">
    <field name="field_description">Project</field>
    <field name="model">business.requirement</field>
    <field name="model_id" ref="business_requirement.model_business_requirement"/>
    <field name="name">x_project_id</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">many2one</field>
    <field name="relation">project.project</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.business_requirement.x_project_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.business_requirement.x_project_id.xml)

### X Task Id  
ID: `mint_system.ir_model.business_requirement.x_task_id`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_task_id" model="ir.model.fields">
    <field name="field_description">Task</field>
    <field name="model">business.requirement</field>
    <field name="model_id" ref="business_requirement.model_business_requirement"/>
    <field name="name">x_task_id</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">many2one</field>
    <field name="relation">project.task</field>
    <!-- <field name="depends">x_project_id</field>
    <field name="compute">for record in self:
  record['x_task_id'] = self.env['project.task'].search([('x_business_requirement_id', '=', record.id)], limit=1) -->
    <!-- </field> -->
  </record>

</odoo>

```
Source: [snippets/ir_model.business_requirement.x_task_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.business_requirement.x_task_id.xml)

## Calendar Event  
### X Color  
ID: `mint_system.ir_model.calendar_event.x_color`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_color" model="ir.model.fields">
    <field name="field_description">Farbkennzeichnung</field>
    <field name="model">calendar.event</field>
    <field name="model_id" ref="calendar.model_calendar_event"/>
    <field name="name">x_color</field>
    <field name="store" eval="False"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">integer</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.calendar_event.x_color.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.calendar_event.x_color.xml)

## Crm Lead  
### X Date Start  
ID: `mint_system.ir_model.crm_lead.x_date_start`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_date_start" model="ir.model.fields">
    <field name="field_description">Date Start</field>
    <field name="model">crm.lead</field>
    <field name="model_id" ref="crm.model_crm_lead"/>
    <field name="name">x_date_start</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">datetime</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.crm_lead.x_date_start.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.crm_lead.x_date_start.xml)

### X Date Stop  
ID: `mint_system.ir_model.crm_lead.x_date_stop`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_date_stop" model="ir.model.fields">
    <field name="field_description">Date Stop</field>
    <field name="model">crm.lead</field>
    <field name="model_id" ref="crm.model_crm_lead"/>
    <field name="name">x_date_stop</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">datetime</field>
    <field name="depends">x_date_start</field>
    <field name="compute">for record in self:
  record['x_date_stop'] = (record.x_date_start + datetime.timedelta(minutes=30))
    </field>
  </record>

</odoo>

```
Source: [snippets/ir_model.crm_lead.x_date_stop.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.crm_lead.x_date_stop.xml)

### X Mobile  
ID: `mint_system.ir_model.crm_lead.x_mobile`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_mobile" model="ir.model.fields">
    <field name="field_description">Mobile</field>
    <field name="model">crm.lead</field>
    <field name="model_id" ref="crm.model_crm_lead"/>
    <field name="name">x_mobile</field>
    <field name="store" eval="False"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="False"/>
    <field name="ttype">many2one</field>
    <field name="relation">res.partner</field>
    <field name="related">partner_id.mobile</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.crm_lead.x_mobile.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.crm_lead.x_mobile.xml)

### X Task Id  
ID: `mint_system.ir_model.crm_lead.x_task_id`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_task_id" model="ir.model.fields">
    <field name="field_description">Aufgabe</field>
    <field name="model">business.requirement</field>
    <field name="model_id" ref="crm.model_crm_lead"/>
    <field name="name">x_task_id</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">many2one</field>
    <field name="relation">project.task</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.crm_lead.x_task_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.crm_lead.x_task_id.xml)

## Helpdesk Ticket  
### X Date Deadline  
ID: `mint_system.ir_model.helpdesk_ticket.x_date_deadline`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_date_deadline" model="ir.model.fields">
    <field name="field_description">Frist</field>
    <field name="model">helpdesk.ticket</field>
    <field name="model_id" ref="helpdesk.model_helpdesk_ticket"/>
    <field name="name">x_date_deadline</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="False"/>
    <field name="ttype">datetime</field>    
  </record>

</odoo>

```
Source: [snippets/ir_model.helpdesk_ticket.x_date_deadline.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.helpdesk_ticket.x_date_deadline.xml)

## Hr Applicant  
### X Gdpr  
ID: `mint_system.ir_model.hr_applicant.x_gdpr`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_gdpr" model="ir.model.fields">
    <field name="field_description">Datenschutz</field>
    <field name="model">hr.applicant</field>
    <field name="model_id" ref="hr.model_hr_applicant"/>
    <field name="name">x_date_order</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">boolean</field>
    <field name="website_form_blacklisted" eval="False"/>
  </record>

</odoo>

```
Source: [snippets/ir_model.hr_applicant.x_gdpr.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.hr_applicant.x_gdpr.xml)

## Hr Contract  
### X Struct Id  
ID: `mint_system.ir_model.hr_contract.x_struct_id`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_struct_id" model="ir.model.fields">
    <field name="field_description">Lohnstruktur</field>
    <field name="model">hr.applicant</field>
    <field name="model_id" ref="hr.model_hr_contract"/>
    <field name="name">x_struct_id</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">many2one</field>
    <field name="relation">hr.payroll.structure</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.hr_contract.x_struct_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.hr_contract.x_struct_id.xml)

## Hr Expense  
### X Partner Id  
ID: `mint_system.ir_model.hr_expense.x_partner_id`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_partner_id" model="ir.model.fields">
    <field name="field_description">Kunde</field>
    <field name="model">hr.expense</field>
    <field name="model_id" ref="hr.model_hr_expense"/>
    <field name="name">x_partner_id</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">many2one</field>
    <field name="relation">res.partner</field>
  </record>

</odoo>
```
Source: [snippets/ir_model.hr_expense.x_partner_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.hr_expense.x_partner_id.xml)

## Hr Leave  
### X Number Of Hours  
ID: `mint_system.ir_model.hr_leave.x_number_of_hours`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_number_of_hours" model="ir.model.fields">
    <field name="field_description">Dauer (Stunden)</field>
    <field name="model">hr.leave</field>
    <field name="model_id" ref="hr.model_hr_leave"/>
    <field name="name">x_number_of_hours</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">float</field>
    <field name="depends">number_of_hours_display</field>
    <field name="compute">for leave in self:
      leave['x_number_of_hours'] = round(leave.number_of_hours_display, 2)</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.hr_leave.x_number_of_hours.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.hr_leave.x_number_of_hours.xml)

### X Requires Allocation  
ID: `mint_system.ir_model.hr_leave.x_requires_allocation`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_requires_allocation" model="ir.model.fields">
    <field name="field_description">Erfordert Zuweisung</field>
    <field name="model">hr.leave</field>
    <field name="model_id" ref="hr.model_hr_leave"/>
    <field name="name">x_requires_allocation</field>
    <field name="store" eval="False"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">selection</field>
    <field name="related">holiday_status_id.requires_allocation</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.hr_leave.x_requires_allocation.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.hr_leave.x_requires_allocation.xml)

## Hr Payslip Line  
### X Code Name  
ID: `mint_system.ir_model.hr_payslip_line.x_code_name`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_code_name" model="ir.model.fields">
    <field name="field_description">Code mit Name</field>
    <field name="model">hr.payslip.line</field>
    <field name="model_id" ref="hr_payroll.model_hr_payslip_line"/>
    <field name="name">x_code_name</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">char</field>
    <field name="depends">name,code</field>
    <field name="compute">for rec in self:
      rec['x_code_name'] = rec.code + ' ' + rec.name</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.hr_payslip_line.x_code_name.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.hr_payslip_line.x_code_name.xml)

## Mrp Bom  
### X Note  
ID: `mint_system.ir_model.mrp_bom.x_note`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_note" model="ir.model.fields">
    <field name="field_description">Notiz</field>
    <field name="model">mrp.bom</field>
    <field name="model_id" ref="mrp.model_mrp_bom"/>
    <field name="name">x_note</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="False"/>
    <field name="ttype">text</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.mrp_bom.x_note.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.mrp_bom.x_note.xml)

### X Type Description  
ID: `mint_system.ir_model.mrp_bom.x_type_description`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_type_description" model="ir.model.fields">
    <field name="field_description">Typenbezeichnung</field>
    <field name="model">mrp.bom</field>
    <field name="model_id" ref="mrp.model_mrp_bom"/>
    <field name="name">x_type_description</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="False"/>
    <field name="ttype">char</field>
    <field name="related">product_tmpl_id.type_description</field>
    <field name="depends">product_tmpl_id.type_description</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.mrp_bom.x_type_description.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.mrp_bom.x_type_description.xml)

## Mrp Production  
### X Date Deadline  
ID: `mint_system.ir_model.mrp_production.x_date_deadline`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_date_deadline" model="ir.model.fields">
    <field name="field_description">Frist</field>
    <field name="model">mrp.production</field>
    <field name="model_id" ref="mrp.model_mrp_production"/>
    <field name="name">x_date_deadline</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="False"/>
    <field name="ttype">datetime</field>    
  </record>

</odoo>

```
Source: [snippets/ir_model.mrp_production.x_date_deadline.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.mrp_production.x_date_deadline.xml)

### X Note  
ID: `mint_system.ir_model.mrp_production.x_note`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_note" model="ir.model.fields">
    <field name="field_description">Notiz</field>
    <field name="model">mrp.production</field>
    <field name="model_id" ref="mrp.model_mrp_production"/>
    <field name="name">x_note</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="False"/>
    <field name="ttype">text</field>
    <field name="depends">product_id,bom_id</field>
    <field name="compute">for record in self:
  if not record.x_note:
    record['x_note'] = record.bom_id.x_note
    </field>
  </record>

</odoo>

```
Source: [snippets/ir_model.mrp_production.x_note.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.mrp_production.x_note.xml)

### X Quality Check Ids  
ID: `mint_system.ir_model.mrp_production.x_quality_check_ids`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_quality_check_ids" model="ir.model.fields">
    <field name="field_description">Qualitätsprüfungen</field>
    <field name="model">mrp.production</field>
    <field name="model_id" ref="mrp.model_mrp_production"/>
    <field name="name">x_quality_check_ids</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">One2many</field> 
    <field name="relation">quality.check</field>
    <field name="relation_field">production_id</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.mrp_production.x_quality_check_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.mrp_production.x_quality_check_ids.xml)

## Mrp Workorder  
### X Reservation State  
ID: `mint_system.ir_model.mrp_workorder.x_reservation_state`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_reservation_state" model="ir.model.fields">
    <field name="field_description">Materialverfügbarkeit</field>
    <field name="model">mrp.workorder</field>
    <field name="model_id" ref="mrp.model_mrp_workorder"/>
    <field name="name">x_reservation_state</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">selection</field>
    <field name="related">production_id.reservation_state</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.mrp_workorder.x_reservation_state.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.mrp_workorder.x_reservation_state.xml)

### X Type Description2  
ID: `mint_system.ir_model.mrp_workorder.x_type_description2`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_type_description2" model="ir.model.fields">
    <field name="field_description">Typenbezeichnung 2</field>
    <field name="model">mrp.workorder</field>
    <field name="model_id" ref="mrp.model_mrp_workorder"/>
    <field name="name">x_type_description2</field>
    <field name="store" eval="False"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="related">product_id.type_description2</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.mrp_workorder.x_type_description2.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.mrp_workorder.x_type_description2.xml)

### X Type Description  
ID: `mint_system.ir_model.mrp_workorder.x_type_description`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_type_description" model="ir.model.fields">
    <field name="field_description">Typenbezeichnung</field>
    <field name="model">mrp.workorder</field>
    <field name="model_id" ref="mrp.model_mrp_workorder"/>
    <field name="name">x_type_description</field>
    <field name="store" eval="False"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="related">product_id.type_description</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.mrp_workorder.x_type_description.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.mrp_workorder.x_type_description.xml)

## Product Category  
### X Relevant For Certificate  
ID: `mint_system.ir_model.product_category.x_relevant_for_certificate`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_relevant_for_certificate" model="ir.model.fields">
    <field name="field_description">Für Werkszeugnis relevant</field>
    <field name="model">product.category</field>
    <field name="model_id" ref="product.product_category"/>
    <field name="name">x_relevant_for_certificate</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="False"/>
    <field name="ttype">boolean</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.product_category.x_relevant_for_certificate.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.product_category.x_relevant_for_certificate.xml)

## Product Packaging  
### X Description  
ID: `mint_system.ir_model.product_packaging.x_description`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_description" model="ir.model.fields">
    <field name="field_description">Beschreibung</field>
    <field name="model">product.packaging</field>
    <field name="model_id" ref="product.model_product_packaging"/>
    <field name="name">x_description</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">char</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.product_packaging.x_description.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.product_packaging.x_description.xml)

### X Qty Description  
ID: `mint_system.ir_model.product_packaging.x_qty_description`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_qty_description" model="ir.model.fields">
    <field name="field_description">Label Gewicht</field>
    <field name="model">product.packaging</field>
    <field name="model_id" ref="product.model_product_packaging"/>
    <field name="name">x_qty_description</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">char</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.product_packaging.x_qty_description.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.product_packaging.x_qty_description.xml)

## Product Set Line  
### X Categ Id  
ID: `mint_system.ir_model.product_set_line.x_categ_id`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_categ_id" model="ir.model.fields">
    <field name="field_description">Produktkategorie</field>
    <field name="model">product.set.line</field>
    <field name="model_id" ref="product.model_product_set_line"/>
    <field name="name">x_categ_id</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">many2one</field>
    <field name="relation">product.category</field>
    <field name="related">product_id.categ_id</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.product_set_line.x_categ_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.product_set_line.x_categ_id.xml)

## Product Template  
### X Calibre  
ID: `mint_system.ir_model.product_template.x_calibre`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_calibre" model="ir.model.fields">
    <field name="field_description">Kaliber</field>
    <field name="model">product.template</field>
    <field name="model_id" ref="product.model_product_template"/>
    <field name="name">x_calibre</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">char</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.product_template.x_calibre.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.product_template.x_calibre.xml)

### X Expiration Days  
ID: `mint_system.ir_model.product_template.x_expiration_days`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_expiration_days" model="ir.model.fields">
    <field name="field_description">Haltbarkeit in Tagen</field>
    <field name="model">product.template</field>
    <field name="model_id" ref="product.model_product_template"/>
    <field name="name">x_expiration_days</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">int</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.product_template.x_expiration_days.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.product_template.x_expiration_days.xml)

### X Hide On Delivery  
ID: `mint_system.ir_model.product_template.x_hide_on_delivery`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_hide_on_delivery" model="ir.model.fields">
    <field name="field_description">Auf Lieferschein ausblenden</field>
    <field name="model">product.template</field>
    <field name="model_id" ref="product.model_product_template"/>
    <field name="name">x_hide_on_delivery</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">boolean</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.product_template.x_hide_on_delivery.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.product_template.x_hide_on_delivery.xml)

### X Hide On Invoice  
ID: `mint_system.ir_model.product_template.x_hide_on_invoice`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_hide_on_invoice" model="ir.model.fields">
    <field name="field_description">Auf Rechnung ausblenden</field>
    <field name="model">product.template</field>
    <field name="model_id" ref="product.model_product_template"/>
    <field name="name">x_hide_on_invoice</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">boolean</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.product_template.x_hide_on_invoice.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.product_template.x_hide_on_invoice.xml)

### X Hide On Sale Order  
ID: `mint_system.ir_model.product_template.x_hide_on_sale_order`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_hide_on_sale_order" model="ir.model.fields">
    <field name="field_description">Auf Verkaufsangebot ausblenden</field>
    <field name="model">product.template</field>
    <field name="model_id" ref="product.model_product_template"/>
    <field name="name">x_hide_on_sale_order</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">boolean</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.product_template.x_hide_on_sale_order.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.product_template.x_hide_on_sale_order.xml)

### X Product Label  
ID: `mint_system.ir_model.product_template.x_product_label`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_product_label" model="ir.model.fields"> 
    <field name="field_description">Label Layout</field>
    <field name="model">product.template</field>
    <field name="model_id" ref=" product.model_product_template"/>
    <field name="name">x_product_label</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">Many2One</field>
    <field name="help">Label to be used when printing</field>
    <field name="relation">ir.actions.report</field>
    <field name="group_expand" eval="False"/> 
    <field name="on_delete">Set NULL</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.product_template.x_product_label.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.product_template.x_product_label.xml)

### X Storage Temperature  
ID: `mint_system.ir_model.product_template.x_storage_temperature`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_storage_temperature" model="ir.model.fields">
    <field name="field_description">Aufbewahrung bei</field>
    <field name="model">product.template</field>
    <field name="model_id" ref="product.model_product_template"/>
    <field name="name">x_storage_temperature</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">int</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.product_template.x_storage_temperature.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.product_template.x_storage_temperature.xml)

### X Warranty  
ID: `mint_system.ir_model.product_template.x_warranty`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_warranty" model="ir.model.fields">
    <field name="field_description">Garantie</field>
    <field name="model">product.template</field>
    <field name="model_id" ref="product.model_product_template"/>
    <field name="name">x_warranty</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">char</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.product_template.x_warranty.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.product_template.x_warranty.xml)

### X Xml Id  
ID: `mint_system.ir_model.product_template.x_xml_id`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_xml_id" model="ir.model.fields">
    <field name="field_description">External ID</field>
    <field name="model">product.template</field>
    <field name="model_id" ref="product.model_product_template"/>
    <field name="name">x_xml_id</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">char</field>
    <field name="depends">name</field>
    <field name="compute">res = self.get_external_id()
for record in self:
  record['x_xml_id'] = res.get(record.id)
    </field>
  </record>

</odoo>
```
Source: [snippets/ir_model.product_template.x_xml_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.product_template.x_xml_id.xml)

## Project Task  
### X Business Requirement Id  
ID: `mint_system.ir_model.project_task.x_business_requirement_id`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_business_requirement_id" model="ir.model.fields">
    <field name="field_description">Business Requirement</field>
    <field name="model">project.task</field>
    <field name="model_id" ref="project.model_project_task"/>
    <field name="name">x_business_requirement_id</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="False"/>
    <field name="ttype">many2one</field>
    <field name="relation">business.requirement</field>
    <field name="depends">project_id,name,partner_id</field>
    <field name="compute">for rec in self:
      rec['x_business_requirement_id'] = self.env['business.requirement'].search([('x_task_id', '=', rec.id)], limit=1)</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.project_task.x_business_requirement_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.project_task.x_business_requirement_id.xml)

### X Lead Id  
ID: `mint_system.ir_model.project_task.x_lead_id`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_lead_id" model="ir.model.fields">
    <field name="field_description">Lead</field>
    <field name="model">project.task</field>
    <field name="model_id" ref="product.model_project_task"/>
    <field name="name">x_lead_id</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">many2one</field>
    <field name="relation">crm.lead</field>
    <field name="depends">project_id,name,partner_id</field>
    <field name="compute">for rec in self:
  rec['x_lead_id'] = self.env['crm.lead'].search([('x_task_id', '=', rec.id)], limit=1)</field>
  </record>

</odoo>
```
Source: [snippets/ir_model.project_task.x_lead_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.project_task.x_lead_id.xml)

### X Not Billable  
ID: `mint_system.ir_model.project_task.x_not_billable`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_not_billable" model="ir.model.fields">
    <field name="field_description">Nicht Verrechenbar</field>
    <field name="model">project.task</field>
    <field name="model_id" ref="product.model_project_task"/>
    <field name="name">x_not_billable</field>
    <field name="readonly" eval="False"/>
    <field name="store" eval="True"/>
    <field name="copied" eval="True"/>
    <field name="ttype">boolean</field>
  </record>

</odoo>
```
Source: [snippets/ir_model.project_task.x_not_billable.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.project_task.x_not_billable.xml)

### X Systemname  
ID: `mint_system.ir_model.project_task.x_systemname`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_systemname" model="ir.model.fields">
    <field name="field_description">Benutzer</field>
    <field name="model">project.task</field>
    <field name="model_id" ref="project.model_project_task"/>
    <field name="ttype">char</field>
    <field name="name">x_systemname</field>
    <field name="required" eval="True"/>
    <field name="store" eval="True"/>
    <field name="copied" eval="True"/>        
  </record>

</odoo>

```
Source: [snippets/ir_model.project_task.x_systemname.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.project_task.x_systemname.xml)

### X User Text  
ID: `mint_system.ir_model.project_task.x_user_text`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_user_text" model="ir.model.fields">
    <field name="field_description">Benutzer</field>
    <field name="model">project.task</field>
    <field name="model_id" ref="project.model_project_task"/>
    <field name="ttype">char</field>
    <field name="name">x_user_text</field>
    <field name="required" eval="True"/>
    <field name="store" eval="True"/>
    <field name="copied" eval="True"/>        
  </record>

</odoo>

```
Source: [snippets/ir_model.project_task.x_user_text.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.project_task.x_user_text.xml)

### X Vehicle Id  
ID: `mint_system.ir_model.project_task.x_vehicle_id`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_vehicle_id" model="ir.model.fields">
    <field name="field_description">Fahrzeug</field>
    <field name="model">project.task</field>
    <field name="model_id" ref="product.model_project_task"/>
    <field name="name">x_vehicle_id</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">many2one</field>
    <field name="relation">fleet.vehicle</field>
  </record>

</odoo>
```
Source: [snippets/ir_model.project_task.x_vehicle_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.project_task.x_vehicle_id.xml)

## Purchase Order Line  
### X Date Approve  
ID: `mint_system.ir_model.purchase_order_line.x_date_approve`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_date_approve" model="ir.model.fields">
    <field name="field_description">Bestätigung am</field>
    <field name="model">purchase.order.line</field>
    <field name="model_id" ref="purchase.model_purchase_order_line"/>
    <field name="name">x_date_approve</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">date</field>
    <field name="related">order_id.date_approve</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.purchase_order_line.x_date_approve.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.purchase_order_line.x_date_approve.xml)

### X Drawing File  
ID: `mint_system.ir_model.purchase_order_line.x_drawing_file`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_drawing_file" model="ir.model.fields">
    <field name="field_description">Zeichnung</field>
    <field name="model">purchase.order.line</field>
    <field name="model_id" ref="purchase.model_purchase_order_line"/>
    <field name="name">x_drawing_file</field>
    <field name="store" eval="False"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">many2one</field>
    <field name="related">product_id.drawing_file</field>
  </record>

</odoo>
```
Source: [snippets/ir_model.purchase_order_line.x_drawing_file.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.purchase_order_line.x_drawing_file.xml)

### X Origin  
ID: `mint_system.ir_model.purchase_order_line.x_origin`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_origin" model="ir.model.fields">
    <field name="field_description">Referenzbeleg</field>
    <field name="model">purchase.order.line</field>
    <field name="model_id" ref="purchase.model_purchase_order_line"/>
    <field name="name">x_origin</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">char</field>
    <field name="related">order_id.origin</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.purchase_order_line.x_origin.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.purchase_order_line.x_origin.xml)

### X Partner Ref  
ID: `mint_system.ir_model.purchase_order_line.x_partner_ref`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_partner_ref" model="ir.model.fields">
    <field name="field_description">Lieferantenreferenz</field>
    <field name="model">purchase.order.line</field>
    <field name="model_id" ref="purchase.model_purchase_order_line"/>
    <field name="name">x_partner_ref</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">text</field>
    <field name="related">order_id.partner_ref</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.purchase_order_line.x_partner_ref.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.purchase_order_line.x_partner_ref.xml)

### X State  
ID: `mint_system.ir_model.purchase_order_line.x_state`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_state" model="ir.model.fields">
    <field name="field_description">Status Bestellposition</field>
    <field name="model">purchase.order.line</field>
    <field name="model_id" ref="purchase.model_purchase_order_line"/>
    <field name="name">x_state</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">selection</field>
    <field name="related">order_id.state</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.purchase_order_line.x_state.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.purchase_order_line.x_state.xml)

### X User Id  
ID: `mint_system.ir_model.purchase_order_line.x_user_id`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_user_id" model="ir.model.fields">
    <field name="field_description">Einkaufsbeauftragter</field>
    <field name="model">purchase.order.line</field>
    <field name="model_id" ref="purchase.model_purchase_order_line"/>
    <field name="name">x_user_id</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">many2one</field>
    <field name="relation">res.users</field>
    <field name="related">order_id.user_id</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.purchase_order_line.x_user_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.purchase_order_line.x_user_id.xml)

## Purchase Order  
### X Comment  
ID: `mint_system.ir_model.purchase_order.x_comment`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_comment" model="ir.model.fields">
    <field name="field_description">Kommentar</field>
    <field name="model">purchase.order</field>
    <field name="model_id" ref="purchase.model_purchase_order"/>
    <field name="name">x_comment</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">text</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.purchase_order.x_comment.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.purchase_order.x_comment.xml)

### X Payment State  
ID: `mint_system.ir_model.purchase_order.x_payment_state`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_payment_state" model="ir.model.fields">
    <field name="field_description">Zahlungsstatus</field>
    <field name="model">purchase.order</field>
    <field name="model_id" ref="purchase.model_purchase_order"/>
    <field name="name">x_payment_state</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">selection</field>
    <field name="selection_id">[
      {'value':'not_paid','name':'Nicht Bezahlt'},
      {'value':'in_payment','name':'In Zahlung'},
      {'value':'paid','name':'Bezahlt'},
    ]</field>
    <field name="depends">invoice_ids,invoice_ids.payment_state</field>
    <field name="compute">for rec in self:
      if rec.invoice_ids:
        has_only_paid_invoices = all(rec.invoice_ids.mapped(lambda i: i.payment_state == 'paid'))
        has_in_payment_invoices = any(rec.invoice_ids.mapped(lambda i: i.payment_state == 'in_payment'))
        has_not_paid_invoices = any(rec.invoice_ids.mapped(lambda i: i.payment_state == 'not_paid'))
      
        if has_only_paid_invoices:
          rec['x_payment_state'] = 'paid'
        elif has_in_payment_invoices:
          rec['x_payment_state'] = 'in_payment'
        elif has_not_paid_invoices:
          rec['x_payment_state'] = 'not_paid'
      else:
        rec['x_payment_state'] = 'not_paid' </field>
  </record>

</odoo>

```
Source: [snippets/ir_model.purchase_order.x_payment_state.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.purchase_order.x_payment_state.xml)

### X Recurring Inverval  
ID: `mint_system.ir_model.purchase_order.x_recurring_inverval`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_recurring_inverval" model="ir.model.fields">
    <field name="field_description">Vertragsintervall</field>
    <field name="model">purchase.order</field>
    <field name="model_id" ref="purchase.model_purchase_order"/>
    <field name="name">x_recurring_inverval</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="False"/>
    <field name="ttype">selection</field>
    <field name="selection_id">[
      {'value':'daily','name':'Daily'},
      {'value':'monthly','name':'Monthly'},
      {'value':'quarterly','name':'Quarterly'},
      {'value':'yearly','name':'Yearly'}
    ]</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.purchase_order.x_recurring_inverval.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.purchase_order.x_recurring_inverval.xml)

## Quality Check  
### X Active  
ID: `mint_system.ir_model.quality_check.x_active`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_active" model="ir.model.fields">
    <field name="field_description">Aktiv</field>
    <field name="model">quality.check</field>
    <field name="model_id" ref="quality.model_quality_check"/>
    <field name="name">x_active</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="False"/>
    <field name="ttype">boolean</field>
    <field name="depends">test_type_id</field>
    <field name="compute">for rec in self:
  if rec.test_type_id.technical_name == 'register_consumed_materials':
    rec['x_active'] = False
  else:
    rec['x_active'] = True</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.quality_check.x_active.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.quality_check.x_active.xml)

## Res Partner  
### X Birthdate  
ID: `mint_system.ir_model.res_partner.x_birthdate`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_birthdate" model="ir.model.fields">
    <field name="field_description">Geburtstag</field>
    <field name="model">res.partner</field>
    <field name="model_id" ref="base.model_res_partner"/>
    <field name="name">x_birthdate</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">date</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.res_partner.x_birthdate.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.res_partner.x_birthdate.xml)

### X Created On  
ID: `mint_system.ir_model.res_partner.x_created_on`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_created_on" model="ir.model.fields">
    <field name="field_description">Erstellt am</field>
    <field name="model">res.partner</field>
    <field name="model_id" ref="base.model_res_partnee"/>
    <field name="name">x_created_on</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">date</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.res_partner.x_created_on.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.res_partner.x_created_on.xml)

### X Eori  
ID: `mint_system.ir_model.res_partner.x_eori`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_eori" model="ir.model.fields">
    <field name="domain">[]</field>
    <field name="field_description">EORI</field>
    <field name="model">res.partner</field>
    <field name="model_id" ref="base.model_res_partner"/>
    <field name="name">x_eori</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="False"/>
    <field name="ttype">char</field>
  </record>

</odoo>
```
Source: [snippets/ir_model.res_partner.x_eori.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.res_partner.x_eori.xml)

### X External Ref  
ID: `mint_system.ir_model.res_partner.x_external_ref`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_external_ref" model="ir.model.fields">
    <field name="field_description">Externe Referenz</field>
    <field name="model">res.partner</field>
    <field name="model_id" ref="base.model_res_partner"/>
    <field name="name">x_external_ref</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="False"/>
    <field name="ttype">char</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.res_partner.x_external_ref.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.res_partner.x_external_ref.xml)

### X First Sale Date  
ID: `mint_system.ir_model.res_partner.x_first_sale_date`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_first_sale_date" model="ir.model.fields">
    <field name="field_description">Erstes Verkaufsdatum</field>
    <field name="model">res.partner</field>
    <field name="model_id" ref="base.model_res_partnee"/>
    <field name="name">x_first_sale_date</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">date</field>
    <field name="depends">sale_order_ids</field>
    <field name="compute">for rec in self:
      first_sale_order = rec.sale_order_ids.filtered(lambda s: s.state == 'sale').sorted('date_order')[:1]
      if first_sale_order:
        rec['x_first_sale_date'] = first_sale_order.date_order
      else:
        rec['x_first_sale_date'] = False
    </field>
  </record>

</odoo>

```
Source: [snippets/ir_model.res_partner.x_first_sale_date.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.res_partner.x_first_sale_date.xml)

### X Global Location Number  
ID: `mint_system.ir_model.res_partner.x_global_location_number`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_global_location_number" model="ir.model.fields">
    <field name="domain">[]</field>
    <field name="field_description">VSTGLN</field>
    <field name="model">res.partner</field>
    <field name="model_id" ref="base.model_res_partner"/>
    <field name="name">x_global_location_number</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="False"/>
    <field name="ttype">char</field>
  </record>

</odoo>
```
Source: [snippets/ir_model.res_partner.x_global_location_number.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.res_partner.x_global_location_number.xml)

### X Packaging Ref  
ID: `mint_system.ir_model.res_partner.x_packaging_ref`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_packaging_ref" model="ir.model.fields">
    <field name="field_description">Verpackungsreferenz</field>
    <field name="model">res.partner</field>
    <field name="model_id" ref="base.model_res_partner"/>
    <field name="name">x_packaging_ref</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="False"/>
    <field name="ttype">char</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.res_partner.x_packaging_ref.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.res_partner.x_packaging_ref.xml)

### X Privacy Visibility  
ID: `mint_system.ir_model.res_partner.x_privacy_visibility`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_privacy_visibility" model="ir.model.fields">
    <field name="domain">[]</field>
    <field name="field_description">Sichtbarkeit</field>
    <field name="model">res.partner</field>
    <field name="model_id" ref="base.model_res_partner"/>
    <field name="name">x_privacy_visibility</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">boolean</field>
  </record>

</odoo>
```
Source: [snippets/ir_model.res_partner.x_privacy_visibility.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.res_partner.x_privacy_visibility.xml)

### X Stock Move Ids  
ID: `mint_system.ir_model.res_partner.x_stock_move_ids`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_stock_move_ids" model="ir.model.fields">
    <field name="field_description">Lagerbuchungen</field>
    <field name="model">res.partner</field>
    <field name="model_id" ref="base.model_res_partner"/>
    <field name="name">x_stock_move_ids</field>
    <field name="store" eval="False"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">one2many</field>
    <field name="relation">stock.move</field>
    <field name="relation_field">x_picking_partner_id</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.res_partner.x_stock_move_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.res_partner.x_stock_move_ids.xml)

### X Vst  
ID: `mint_system.ir_model.res_partner.x_vst`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_vst" model="ir.model.fields">
    <field name="domain">[]</field>
    <field name="field_description">VST</field>
    <field name="model">res.partner</field>
    <field name="model_id" ref="base.model_res_partner"/>
    <field name="name">x_vst</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="False"/>
    <field name="ttype">char</field>
  </record>

</odoo>
```
Source: [snippets/ir_model.res_partner.x_vst.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.res_partner.x_vst.xml)

## Sale Blanket Order Line  
### X Product Uom Category Id  
ID: `mint_system.ir_model.sale_blanket_order_line.x_product_uom_category_id`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_product_uom_category_id" model="ir.model.fields">
    <field name="field_description">Kategorie</field>
    <field name="model">sale.blanket.order.line</field>
    <field name="model_id" ref="sale.model_sale_blanket_order_line"/>
    <field name="name">x_product_uom_category_id</field>
    <field name="store" eval="False"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">Many2One</field>
    <field name="relation">uom.category</field>
    <field name="related">product_id.uom_id.category_id</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.sale_blanket_order_line.x_product_uom_category_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.sale_blanket_order_line.x_product_uom_category_id.xml)

## Sale Order Line  
### X Client Order Ref  
ID: `mint_system.ir_model.sale_order_line.x_client_order_ref`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_client_order_ref" model="ir.model.fields">
    <field name="field_description">Kundenreferenz</field>
    <field name="model">sale.order.line</field>
    <field name="model_id" ref="sale.model_sale_order_line"/>
    <field name="name">x_client_order_ref</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">text</field>
    <field name="related">order_id.client_order_ref</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.sale_order_line.x_client_order_ref.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.sale_order_line.x_client_order_ref.xml)

### X Commitment Date  
ID: `mint_system.ir_model.sale_order_line.x_commitment_date`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_commitment_date" model="ir.model.fields">
    <field name="field_description">Lieferdatum</field>
    <field name="model">sale.order.line</field>
    <field name="model_id" ref="sale.model_sale_order_line"/>
    <field name="name">x_commitment_date</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">date</field>
    <field name="related">order_id.commitment_date</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.sale_order_line.x_commitment_date.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.sale_order_line.x_commitment_date.xml)

### X Date Order  
ID: `mint_system.ir_model.sale_order_line.x_date_order`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_date_order" model="ir.model.fields">
    <field name="field_description">Auftragsdatum</field>
    <field name="model">sale.order.line</field>
    <field name="model_id" ref="sale.model_sale_order_line"/>
    <field name="name">x_date_order</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">datetime</field>
    <field name="related">order_id.date_order</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.sale_order_line.x_date_order.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.sale_order_line.x_date_order.xml)

### X Drawing File  
ID: `mint_system.ir_model.sale_order_line.x_drawing_file`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_drawing_file" model="ir.model.fields">
    <field name="field_description">Zeichnung</field>
    <field name="model">sale.order.line</field>
    <field name="model_id" ref="sale.model_sale_order_line"/>
    <field name="name">x_drawing_file</field>
    <field name="store" eval="False"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">many2one</field>
    <field name="related">product_id.drawing_file</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.sale_order_line.x_drawing_file.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.sale_order_line.x_drawing_file.xml)

### X Industry Id  
ID: `mint_system.ir_model.sale_order_line.x_industry_id`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_industry_id" model="ir.model.fields">
    <field name="field_description">Branche</field>
    <field name="model">sale.order.line</field>
    <field name="model_id" ref="sale.model_sale_order_line"/>
    <field name="name">x_industry_id</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">many2one</field>
    <field name="related">order_partner_id.industry_id</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.sale_order_line.x_industry_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.sale_order_line.x_industry_id.xml)

### X Margin Percent  
ID: `mint_system.ir_model.sale_order_line.x_margin_percent`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_margin_percent" model="ir.model.fields">
    <field name="field_description">Marge (%)</field>
    <field name="help">Marge Aufschlagsrechnung</field>
    <field name="model">sale.order.line</field>
    <field name="model_id" ref="sale.model_sale_order_line"/>
    <field name="name">x_margin_percent</field>
    <field name="store" eval="False"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">float</field>
    <field name="depends">margin_percent</field>
    <field name="compute">for line in self:
  if line.product_id.type == 'product' and line.purchase_price != 0:
    line['x_margin_percent'] = (line.price_unit-line.purchase_price)/(line.purchase_price)
  else:
    line['x_margin_percent'] = 0
    line['margin'] = 0</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.sale_order_line.x_margin_percent.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.sale_order_line.x_margin_percent.xml)

### X Pricelist Id  
ID: `mint_system.ir_model.sale_order_line.x_pricelist_id`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_pricelist_id" model="ir.model.fields">
    <field name="field_description">Preisliste</field>
    <field name="model">sale.order.line</field>
    <field name="model_id" ref="sale.model_sale_order_line"/>
    <field name="name">x_pricelist_id</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">many2one</field>
    <field name="related">order_id.pricelist_id</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.sale_order_line.x_pricelist_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.sale_order_line.x_pricelist_id.xml)

### X Service Policy  
ID: `mint_system.ir_model.sale_order_line.x_service_policy`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_service_policy" model="ir.model.fields">
    <field name="field_description">Faktierungsregel</field>
    <field name="model">sale.order.line</field>
    <field name="model_id" ref="sale.model_sale_order_line"/>
    <field name="name">x_service_policy</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">selection</field>
    <field name="related">product_id.service_policy</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.sale_order_line.x_service_policy.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.sale_order_line.x_service_policy.xml)

### X Service Tracking  
ID: `mint_system.ir_model.sale_order_line.x_service_tracking`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_service_tracking" model="ir.model.fields">
    <field name="field_description">Dienstverfolgung</field>
    <field name="model">sale.order.line</field>
    <field name="model_id" ref="sale.model_sale_order_line"/>
    <field name="name">x_service_tracking</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">selection</field>
    <field name="related">product_id.service_tracking</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.sale_order_line.x_service_tracking.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.sale_order_line.x_service_tracking.xml)

### X State  
ID: `mint_system.ir_model.sale_order_line.x_state`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_state" model="ir.model.fields">
    <field name="field_description">Status Auftragsposition</field>
    <field name="model">sale.order.line</field>
    <field name="model_id" ref="sale.model_sale_order_line"/>
    <field name="name">x_state</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">selection</field>
    <field name="related">order_id.state</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.sale_order_line.x_state.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.sale_order_line.x_state.xml)

### X Taxed Amount Invoiced  
ID: `mint_system.ir_model.sale_order_line.x_taxed_amount_invoiced`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_taxed_amount_invoiced" model="ir.model.fields">
    <field name="field_description">Rechnungsbetrag inkl. MWST</field>
    <field name="model">sale.order.line</field>
    <field name="model_id" ref="sale.model_sale_order_line"/>
    <field name="name">x_taxed_amount_invoiced</field>
    <field name="store" eval="True" />
    <field name="readonly" eval="False" />
    <field name="copied" eval="False" />
    <field name="ttype">float</field>
    <field name="depends">untaxed_amount_invoiced,price_tax</field>
    <field name="compute">for rec in self:
  rec['x_taxed_amount_invoiced'] = rec.price_unit * (1 - (rec.discount or 0.0) / 100.0) * (rec.qty_delivered or rec.product_uom_qty) + rec.price_tax</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.sale_order_line.x_taxed_amount_invoiced.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.sale_order_line.x_taxed_amount_invoiced.xml)

### X Taxed Amount  
ID: `mint_system.ir_model.sale_order_line.x_taxed_amount`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_taxed_amount" model="ir.model.fields">
    <field name="field_description">Total inkl. MWST</field>
    <field name="model">sale.order.line</field>
    <field name="model_id" ref="sale.model_sale_order_line"/>
    <field name="name">x_taxed_amount</field>
    <field name="store" eval="True" />
    <field name="readonly" eval="True" />
    <field name="copied" eval="False" />
    <field name="ttype">float</field>
    <field name="depends">price_unit,discount,qty_delivered,product_uom_qty,price_tax</field>
    <field name="compute">for rec in self:
  rec['x_taxed_amount'] = rec.price_unit * (1 - (rec.discount or 0.0) / 100.0) * (rec.qty_delivered or rec.product_uom_qty) + rec.price_tax</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.sale_order_line.x_taxed_amount.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.sale_order_line.x_taxed_amount.xml)

### X Untaxed Amount  
ID: `mint_system.ir_model.sale_order_line.x_untaxed_amount`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_untaxed_amount" model="ir.model.fields">
    <field name="field_description">Total exkl. MWST</field>
    <field name="model">sale.order.line</field>
    <field name="model_id" ref="sale.model_sale_order_line"/>
    <field name="name">x_untaxed_amount</field>
    <field name="store" eval="True" />
    <field name="readonly" eval="True" />
    <field name="copied" eval="False" />
    <field name="ttype">float</field>
    <field name="depends">price_unit,discount,qty_delivered,product_uom_qty</field>
    <field name="compute">for rec in self:
  rec['x_untaxed_amount'] = rec.price_unit * (1 - (rec.discount or 0.0) / 100.0) * (rec.qty_delivered or rec.product_uom_qty)</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.sale_order_line.x_untaxed_amount.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.sale_order_line.x_untaxed_amount.xml)

### X Weight Delivered  
ID: `mint_system.ir_model.sale_order_line.x_weight_delivered`  
```xml
<?xml version='1.0' encoding='UTF-8'?>
<odoo>

  <record id="x_weight_delivered" model="ir.model.fields">
    <field name="field_description">Geliefertes Gewicht</field>
    <field name="model">sale.order.line</field>
    <field name="model_id" ref="sale.model_sale_order_line" />
    <field name="name">x_weight_delivered</field>
    <field name="store" eval="True" />
    <field name="readonly" eval="True" />
    <field name="copied" eval="False" />
    <field name="ttype">float</field>
    <field name="depends">qty_delivered,product_id.weight</field>
    <field name="compute">for rec in self:
      rec['x_weight_delivered'] = rec.product_id.weight * rec.qty_delivered</field>
  </record>

</odoo>
```
Source: [snippets/ir_model.sale_order_line.x_weight_delivered.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.sale_order_line.x_weight_delivered.xml)

## Sale Order  
### X As4import  
ID: `mint_system.ir_model.sale_order.x_as4import`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_as4import" model="ir.model.fields">
    <field name="field_description">AS4 Import</field>
    <field name="model">sale.order</field>
    <field name="model_id" ref="sale.model_sale_order"/>
    <field name="name">x_as4import</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">boolean</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.sale_order.x_as4import.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.sale_order.x_as4import.xml)

### X Client Project Ref  
ID: `mint_system.ir_model.sale_order.x_client_project_ref`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_client_project_ref" model="ir.model.fields">
    <field name="field_description">Projektnummer Kunde</field>
    <field name="model">sale.order</field>
    <field name="model_id" ref="sale.model_sale_order"/>
    <field name="name">x_client_project_ref</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">Char</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.sale_order.x_client_project_ref.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.sale_order.x_client_project_ref.xml)

### X Incoterm Blanket Order  
ID: `mint_system.ir_model.sale_order.x_incoterm_blanket_order`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_incoterm_blanket_order" model="ir.model.fields">
    <field name="field_description">Incoterm Rahmenauftrag</field>
    <field name="model">sale.order</field>
    <field name="model_id" ref="sale.model_sale_order"/>
    <field name="name">x_incoterm_blanket_order</field>
    <field name="store" eval="False"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">many2one</field>
    <field name="relation">account.incoterms</field>
    <field name="related">blanket_order_id.incoterm</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.sale_order.x_incoterm_blanket_order.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.sale_order.x_incoterm_blanket_order.xml)

### X Industry Id  
ID: `mint_system.ir_model.sale_order.x_industry_id`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_industry_id" model="ir.model.fields">
    <field name="field_description">Branche</field>
    <field name="model">sale.order</field>
    <field name="model_id" ref="sale.model_sale_order_line"/>
    <field name="name">x_industry_id</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">char</field>
    <field name="related">partner_id.industry_id.name</field>
  </record>

</odoo>


```
Source: [snippets/ir_model.sale_order.x_industry_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.sale_order.x_industry_id.xml)

### X Order Number  
ID: `mint_system.ir_model.sale_order.x_order_number`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_order_number" model="ir.model.fields">
    <field name="field_description">Bestellnummer Kunde</field>
    <field name="model">sale.order</field>
    <field name="model_id" ref="sale.model_sale_order"/>
    <field name="name">x_order_number</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">Char</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.sale_order.x_order_number.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.sale_order.x_order_number.xml)

### X Payment State  
ID: `mint_system.ir_model.sale_order.x_payment_state`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_payment_state" model="ir.model.fields">
    <field name="field_description">Zahlungsstatus</field>
    <field name="model">sale.order</field>
    <field name="model_id" ref="sale.model_sale_order"/>
    <field name="name">x_payment_state</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">selection</field>
    <field name="selection_id">[
      {'value':'not_paid','name':'Nicht Bezahlt'},
      {'value':'in_payment','name':'In Zahlung'},
      {'value':'paid','name':'Bezahlt'},
    ]</field>
    <field name="depends">invoice_ids,invoice_ids.payment_state</field>
    <field name="compute">for rec in self:
      if rec.invoice_ids:
        has_only_paid_invoices = all(rec.invoice_ids.mapped(lambda i: i.payment_state == 'paid'))
        has_in_payment_invoices = any(rec.invoice_ids.mapped(lambda i: i.payment_state == 'in_payment'))
        has_not_paid_invoices = any(rec.invoice_ids.mapped(lambda i: i.payment_state == 'not_paid'))
      
        if has_only_paid_invoices:
          rec['x_payment_state'] = 'paid'
        elif has_in_payment_invoices:
          rec['x_payment_state'] = 'in_payment'
        elif has_not_paid_invoices:
          rec['x_payment_state'] = 'not_paid'
      else:
        rec['x_payment_state'] = 'not_paid' </field>
  </record>

</odoo>

```
Source: [snippets/ir_model.sale_order.x_payment_state.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.sale_order.x_payment_state.xml)

### X Payment Term Blanket Order  
ID: `mint_system.ir_model.sale_order.x_payment_term_blanket_order`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_payment_term_blanket_order" model="ir.model.fields">
    <field name="field_description">Zahlungsbedingungen Rahmenauftrag</field>
    <field name="model">sale.order</field>
    <field name="model_id" ref="sale.model_sale_order"/>
    <field name="name">x_payment_term_blanket_order</field>
    <field name="store" eval="False"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">many2one</field>
    <field name="relation">account.payment.terms</field>
    <field name="related">order_line.blanket_order_line.order_id.payment_term_id</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.sale_order.x_payment_term_blanket_order.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.sale_order.x_payment_term_blanket_order.xml)

### X Product Uom Qty  
ID: `mint_system.ir_model.sale_order.x_product_uom_qty`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_product_uom_qty" model="ir.model.fields">
    <field name="field_description">Gesamtmenge</field>
    <field name="model">sale.order</field>
    <field name="model_id" ref="sale.model_sale_order"/>
    <field name="name">x_product_uom_qty</field>
    <field name="store" eval="False"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">float</field>
    <field name="depends">order_line</field>
    <field name="compute">for rec in self:
      lines = rec.order_line.filtered(lambda l: l.product_id.categ_id.name == 'Ware')
      rec['x_product_uom_qty'] = sum(lines.mapped(lambda l: l.product_id.weight * l.product_uom_qty))</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.sale_order.x_product_uom_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.sale_order.x_product_uom_qty.xml)

### X Studio Description  
ID: `mint_system.ir_model.sale_order.x_studio_description`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_studio_description" model="ir.model.fields">
    <field name="field_description">Beschreibung Verkausauftrag</field>
    <field name="model">sale.order</field>
    <field name="model_id" ref="sale.model_sale_order"/>
    <field name="name">x_studio_description</field>
    <field name="store" eval="True"/>
    <field name="ttype">text</field>
    <field name="copied" eval="True"/>
  </record>

</odoo>

```
Source: [snippets/ir_model.sale_order.x_studio_description.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.sale_order.x_studio_description.xml)

## Stock Location  
### X Should Be Valued  
ID: `mint_system.ir_model.stock_location.x_should_be_valued`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_should_be_valued" model="ir.model.fields">
    <field name="field_description">Should be valued</field>
    <field name="model">stock.location</field>
    <field name="model_id" ref="stock.model_stock_location"/>
    <field name="name">x_should_be_valued</field>
    <field name="store" eval="False"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">boolean</field> 
    <field name="depends">usage</field>
    <field name="compute">for rec in self:
      rec['x_should_be_valued'] = rec._should_be_valued()
    </field>
  </record>

</odoo>
```
Source: [snippets/ir_model.stock_location.x_should_be_valued.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.stock_location.x_should_be_valued.xml)

## Stock Move  
### X Count Boxes  
ID: `mint_system.ir_model.stock_move.x_count_boxes`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

    <record id="x_count_boxes" model="ir.model.fields">
        <field name="field_description">Anzahl Kisten</field>
        <field name="help">Count the number of packaging boxes.</field>
        <field name="model">stock.move</field>
        <field name="model_id" ref="stock.model_stock_move"/>
        <field name="name">x_count_boxes</field>
        <field name="store" eval="True"/>
        <field name="readonly" eval="True"/>
        <field name="copied" eval="False"/>
        <field name="ttype">int</field>
        <field name="depends">quantity_done</field>
        <field name="compute">for rec in self:
            rec['x_count_boxes'] = 0
            if rec.product_packaging and rec.product_packaging.qty:
                
                rec['x_count_boxes'] = rec.quantity_done // rec.product_packaging.qty
                
                if rec.product_packaging.parent_packaging and rec.product_packaging.parent_packaging.qty:
                
                rec['x_count_boxes'] = (rec.quantity_done + rec.product_packaging.qty)/rec.product_packaging.parent_packaging.qty

        </field>
    </record>
    
</odoo>

```
Source: [snippets/ir_model.stock_move.x_count_boxes.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.stock_move.x_count_boxes.xml)

### X Count Packaging  
ID: `mint_system.ir_model.stock_move.x_count_packaging`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_count_packaging" model="ir.model.fields">
    <field name="field_description">Anzahl Verpackungen</field>
    <field name="help">Counts the number of packages for dispaying in on the picking report.</field>
    <field name="model">stock.move</field>
    <field name="model_id" ref="stock.model_stock_move"/>
    <field name="name">x_count_packaging</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">int</field>
    <field name="depends">product_uom_qty</field>
    <field name="compute">for rec in self:
	if rec.product_packaging:
	  rec['x_count_packaging'] = rec.product_uom_qty // rec.product_packaging.qty</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.stock_move.x_count_packaging.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.stock_move.x_count_packaging.xml)

### X Label Qty  
ID: `mint_system.ir_model.stock_move.x_label_qty`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_label_qty" model="ir.model.fields">
    <field name="field_description">Anzahl Etiketten</field>
    <field name="model">stock.move</field>
    <field name="model_id" ref="stock.model_stock_move"/>
    <field name="name">x_label_qty</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="False"/>
    <field name="ttype">int</field>
    <field name="depends">product_uom_qty</field>
    <field name="compute">for rec in self:
      rec['x_label_qty'] = 1
    </field>
  </record>

</odoo>

```
Source: [snippets/ir_model.stock_move.x_label_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.stock_move.x_label_qty.xml)

### X Operation Qty  
ID: `mint_system.ir_model.stock_move.x_operation_qty`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_operation_qty" model="ir.model.fields">
    <field name="field_description">Inventory +/-</field>
    <field name="model">stock.move</field>
    <field name="model_id" ref="stock.model_stock_move"/>
    <field name="name">x_operation_qty</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">float</field>
    <field name="depends">product_uom_qty</field>
    <field name="compute">for record in self:
  if (record.location_id.usage == 'internal'):
    record['x_operation_qty'] = -1 * record.product_uom_qty
  else:
    record['x_operation_qty'] = record.product_uom_qty
    </field>
  </record>

</odoo>

```
Source: [snippets/ir_model.stock_move.x_operation_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.stock_move.x_operation_qty.xml)

### X Packaging Uom Id  
ID: `mint_system.ir_model.stock_move.x_packaging_uom_id`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_packaging_uom_id" model="ir.model.fields">
    <field name="field_description">Mengeneinheit</field>
    <field name="model">product.packaging</field>
    <field name="model_id" ref="product.model_product_packaging"/>
    <field name="name">x_packaging_uom_id</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">many2one</field>
    <field name="relation">uom.uom</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.stock_move.x_packaging_uom_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.stock_move.x_packaging_uom_id.xml)

### X Picking Partner Id  
ID: `mint_system.ir_model.stock_move.x_picking_partner_id`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_picking_partner_id" model="ir.model.fields">
    <field name="field_description">Lieferadresse</field>
    <field name="model">stock.move</field>
    <field name="model_id" ref="stock.model_stock_move"/>
    <field name="name">x_picking_partner_id</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">many2one</field>
    <field name="relation">res.partner</field>
    <field name="related">picking_id.partner_id</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.stock_move.x_picking_partner_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.stock_move.x_picking_partner_id.xml)

### X Print Parent Only  
ID: `mint_system.ir_model.stock_move.x_print_parent_only`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_print_parent_only" model="ir.model.fields">
    <field name="field_description">Nur übergeordnete Verpackung drucken</field>
    <field name="model">product.packaging</field>
    <field name="model_id" ref="product.model_product_packaging"/>
    <field name="name">x_print_parent_only</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">boolean</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.stock_move.x_print_parent_only.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.stock_move.x_print_parent_only.xml)

### X Print Without Parent  
ID: `mint_system.ir_model.stock_move.x_print_without_parent`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_print_without_parent" model="ir.model.fields">
    <field name="field_description">Ohne übergeordnete Verpackung drucken</field>
    <field name="model">product.packaging</field>
    <field name="model_id" ref="product.model_product_packaging"/>
    <field name="name">x_print_without_parent</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">boolean</field>
  </record>

</odoo>

```
Source: [snippets/ir_model.stock_move.x_print_without_parent.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.stock_move.x_print_without_parent.xml)

### X Scrap Id  
ID: `mint_system.ir_model.stock_move.x_scrap_id`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_scrap_id" model="ir.model.fields">
    <field name="field_description">Buchung Lagerschwund</field>
    <field name="model">product.packaging</field>
    <field name="model_id" ref="product.model_product_packaging"/>
    <field name="name">x_scrap_id</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="True"/>
    <field name="ttype">many2one</field>
    <field name="relation">stock.move</field>
    <field name="depends">state</field>
    <field name="compute">for record in self:
  if record.state == 'done':
    
    record['x_scrap_id'] = 1
  else:
    
    record['x_scrap_id'] = 0
    </field>
  </record>

</odoo>
```
Source: [snippets/ir_model.stock_move.x_scrap_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.stock_move.x_scrap_id.xml)

## Stock Picking  
### X Autocomplete  
ID: `mint_system.ir_model.stock_picking.x_autocomplete`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_autocomplete" model="ir.model.fields">
    <field name="field_description">Automatisch Erledigen</field>
    <field name="model">stock.picking</field>
    <field name="model_id" ref="stock.model_stock_picking"/>
    <field name="name">x_autocomplete</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">boolean</field> 
  </record>

</odoo>
```
Source: [snippets/ir_model.stock_picking.x_autocomplete.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.stock_picking.x_autocomplete.xml)

### X Client Order Ref  
ID: `mint_system.ir_model.stock_picking.x_client_order_ref`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_client_order_ref" model="ir.model.fields">
    <field name="field_description">Bestellnummer Kunde</field>
    <field name="model">stock.picking</field>
    <field name="model_id" ref="stock.model_stock_picking"/>
    <field name="name">x_client_order_ref</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">char</field> 
    <field name="related">sale_id.client_order_ref</field>
  </record>

</odoo>
```
Source: [snippets/ir_model.stock_picking.x_client_order_ref.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.stock_picking.x_client_order_ref.xml)

### X Date Order  
ID: `mint_system.ir_model.stock_picking.x_date_order`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_date_order" model="ir.model.fields">
    <field name="field_description">Bestelldatum</field>
    <field name="model">stock.picking</field>
    <field name="model_id" ref="stock.model_stock_picking"/>
    <field name="name">x_date_order</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">datetime</field> 
    <field name="related">sale_id.date_order</field>
  </record>

</odoo>
```
Source: [snippets/ir_model.stock_picking.x_date_order.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.stock_picking.x_date_order.xml)

### X Vst  
ID: `mint_system.ir_model.stock_picking.x_vst`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_vst" model="ir.model.fields">
    <field name="field_description">VST</field>
    <field name="model">stock.picking</field>
    <field name="model_id" ref="stock.model_stock_picking"/>
    <field name="name">x_vst</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">char</field> 
    <field name="related">sale_id.x_vst</field>
  </record>

</odoo>
```
Source: [snippets/ir_model.stock_picking.x_vst.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.stock_picking.x_vst.xml)

## Stock Production Lot  
### X Autoremove  
ID: `mint_system.ir_model.stock_production_lot.x_autoremove`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_autoremove" model="ir.model.fields">
    <field name="field_description">Automatisch Entfernen</field>
    <field name="model">stock.production.lot</field>
    <field name="model_id" ref="stock.model_stock_production_lot"/>
    <field name="name">x_autoremove</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="False"/>
    <field name="copied" eval="True"/>
    <field name="ttype">boolean</field> 
  </record>

</odoo>
```
Source: [snippets/ir_model.stock_production_lot.x_autoremove.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.stock_production_lot.x_autoremove.xml)

### X Production Ids  
ID: `mint_system.ir_model.stock_production_lot.x_production_ids`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_production_ids" model="ir.model.fields">
    <field name="field_description">Fertigungsaufträge</field>
    <field name="model">stock.production.lot</field>
    <field name="model_id" ref="stock.model_stock_production_lot"/>
    <field name="name">x_production_ids</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">One2many</field>
    <field name="relation">mrp.production</field>
    <field name="relation_field">lot_producing_id</field>    
  </record>

</odoo>
```
Source: [snippets/ir_model.stock_production_lot.x_production_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.stock_production_lot.x_production_ids.xml)

### X Production Id  
ID: `mint_system.ir_model.stock_production_lot.x_production_id`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_production_id" model="ir.model.fields">
    <field name="field_description">Fertigungsauftrag</field>
    <field name="model">stock.production.lot</field>
    <field name="model_id" ref="stock.model_stock_production_lot"/>
    <field name="name">x_production_id</field>
    <field name="store" eval="False"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">char</field>
    <field name="depends">x_production_ids</field>
    <field name="compute">for rec in self:
      if rec.x_production_ids:
        rec['x_production_id'] = rec.x_production_ids[0].name.split('-')[0]
      else:
        rec['x_production_id'] = ''
    </field>
  </record>

</odoo>
```
Source: [snippets/ir_model.stock_production_lot.x_production_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.stock_production_lot.x_production_id.xml)

### X Weight Uom  
ID: `mint_system.ir_model.stock_production_lot.x_weight_uom`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_weight_uom" model="ir.model.fields">
    <field name="field_description">Nettogewicht [kg]</field>
    <field name="model">stock.production.lot</field>
    <field name="model_id" ref="stock.model_stock_production_lot"/>
    <field name="name">x_weight_uom</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">float</field> 
    <field name="depends">product_qty, product_id.weight, product_id.weight_uom_id</field>
    <field name="compute">for record in self:
  record['x_weight_uom'] = record.product_qty * record.product_id.product_tmpl_id.weight_uom_id._compute_quantity(record.product_id.weight, self.env.ref('uom.product_uom_kgm'))
    </field>
  </record>

</odoo>
```
Source: [snippets/ir_model.stock_production_lot.x_weight_uom.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.stock_production_lot.x_weight_uom.xml)

## Stock Quant  
### X Expiration Date  
ID: `mint_system.ir_model.stock_quant.x_expiration_date`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_expiration_date" model="ir.model.fields">
    <field name="field_description">Ablaufdatum</field>
    <field name="model">stock.quant</field>
    <field name="model_id" ref="stock.model_stock_quant"/>
    <field name="name">x_expiration_date</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">datetime</field>
    <field name="relation">stock.lot</field>
    <field name="related">lot_id.x_expiration_date</field>
  </record>

</odoo>
```
Source: [snippets/ir_model.stock_quant.x_expiration_date.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.stock_quant.x_expiration_date.xml)

### X Last Delivery Partner Id  
ID: `mint_system.ir_model.stock_quant.x_last_delivery_partner_id`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="x_last_delivery_partner_id" model="ir.model.fields">
    <field name="field_description">Lieferadresse</field>
    <field name="model">stock.quant</field>
    <field name="model_id" ref="stock.model_stock_quant"/>
    <field name="name">x_last_delivery_partner_id</field>
    <field name="store" eval="True"/>
    <field name="readonly" eval="True"/>
    <field name="copied" eval="False"/>
    <field name="ttype">many2one</field>
    <field name="relation">res.partner</field>
    <field name="related">lot_id.last_delivery_partner_id</field>
  </record>

</odoo>
```
Source: [snippets/ir_model.stock_quant.x_last_delivery_partner_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.stock_quant.x_last_delivery_partner_id.xml)

## Stock Valuation Layer  
### X Quant Location Id  
ID: `mint_system.ir_model.stock_valuation_layer.x_quant_location_id`  
```xml
<?xml version='1.0' encoding='UTF-8'?>
<odoo>

  <record id="x_quant_location_id" model="ir.model.fields">
    <field name="field_description">Lagerort Bestand</field>
    <field name="model">stock.valuation.layer</field>
    <field name="model_id" ref="stock.model_stock_valuation_layer" />
    <field name="name">x_quant_location_id</field>
    <field name="store" eval="True" />
    <field name="readonly" eval="True" />
    <field name="copied" eval="False" />
    <field name="ttype">many2one</field>
    <field name="relation">stock.location</field>
    <field name="depends">stock_move_id.location_id,stock_move_id.location_dest_id</field>
    <field name="compute">for record in self:
      if (record.stock_move_id.picking_code == "outgoing"):
        record['x_quant_location_id'] = record.stock_move_id.location_id.id
      elif (record.stock_move_id.picking_code == "incoming"):
        record['x_quant_location_id'] = record.stock_move_id.location_dest_id.id
      else:
        record['x_quant_location_id'] = record.stock_move_id.location_dest_id.id
    </field>
  </record>

</odoo>
```
Source: [snippets/ir_model.stock_valuation_layer.x_quant_location_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/ir_model.stock_valuation_layer.x_quant_location_id.xml)

