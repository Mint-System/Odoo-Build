---
prev: ./snippets.md
---
# Hr Payroll
## Hr Payslip Line  
### View Pivot  
ID: `mint_system.hr_payroll.hr_payslip_line.view_pivot`  
```xml
<?xml version="1.0"?>
<odoo>

    <record model="ir.ui.view" id="hr_payroll.hr_payslip_line.view_pivot">
        <field name="name">hr_payroll.hr_payslip_line.view_pivot</field>
        <field name="model">hr.payslip.line</field>
        <field name="arch" type="xml">
            <pivot string="Lohnabrechnungszeilen" default_order="sequence">
                <field name="total"  type="measure" string="Total"/>
            </pivot>
        </field>
    </record>

</odoo>

```
Source: [snippets/hr_payroll.hr_payslip_line.view_pivot.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/hr_payroll.hr_payslip_line.view_pivot.xml)

## Hr Salary Rule Form  
### Switch Account  
ID: `mint_system.hr_payroll.hr_salary_rule_form.switch_account`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr_payroll.hr_salary_rule_form" priority="50">

  <xpath expr="//field[@name='account_debit']" position="before">
    <xpath expr="//field[@name='account_credit']" position="move"/>
  </xpath>

</data>

```
Source: [snippets/hr_payroll.hr_salary_rule_form.switch_account.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/hr_payroll.hr_salary_rule_form.switch_account.xml)

## View Hr Payslip Form  
### Show Gio Amount  
ID: `mint_system.hr_payroll.view_hr_payslip_form.show_gio_amount`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr_payroll.view_hr_payslip_form" priority="50">

  <field name="salary_rule_id" position="before">
    <field name="gio_amount" string="Basis" optional="show"/>
  </field>

</data>

```
Source: [snippets/hr_payroll.view_hr_payslip_form.show_gio_amount.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/hr_payroll.view_hr_payslip_form.show_gio_amount.xml)

## View Hr Payslip Line Tree  
### Slip Show Optional  
ID: `mint_system.hr_payroll.view_hr_payslip_line_tree.slip_show_optional`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr_payroll.view_hr_payslip_line_tree" priority="50">

  <field name="total" position="after">
    <field name="slip_id" optional="show"/>
  </field>

</data>

```
Source: [snippets/hr_payroll.view_hr_payslip_line_tree.slip_show_optional.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/hr_payroll.view_hr_payslip_line_tree.slip_show_optional.xml)

