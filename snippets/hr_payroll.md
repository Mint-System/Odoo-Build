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

## Hr Payslip Line View Search Register  
### Filter Date From  
ID: `mint_system.hr_payroll.hr_payslip_line_view_search_register.filter_date_from`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr_payroll.hr_payslip_line_view_search_register" priority="50">

  <xpath expr="//filter[@name='last_quarter']" position="after">
    <separator/>
    <filter string="Datum" name="date_filter" date="date_from" default_period="last_year"/>
  </xpath>

</data>

```
Source: [snippets/hr_payroll.hr_payslip_line_view_search_register.filter_date_from.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/hr_payroll.hr_payslip_line_view_search_register.filter_date_from.xml)

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

## Report Payslip  
### Gio Custom Payroll  
ID: `mint_system.hr_payroll.report_payslip.gio_custom_payroll`  
```xml
<?xml version="1.0"?>
<data inherit_id="hr_payroll.report_payslip" priority="50">

  <template id="gio_payslip_replace" inherit_id="hr_payroll.report_payslip">
    <xpath expr="//div[@class='page']" position="replace">

      <div class="page" style="font-family:dinot !important;">
        <div class="row">
          <div class="col-6">
            <table name="informations" class="table table-sm information-table mb-0">
              <tr name="tr_name">
                <th name="th_name" class="text-left m-0 p-0 qweb-border-none lato-medium">
                  <h2 class="m-0 p-0 h2_custom_info">Payroll</h2>
                </th>
              </tr>
              <tr name="tr_identification_id">
                <th name="th_identification_id" class="text-left m-0 p-0 lato-medium"
                  style="border-top: 1px solid black;">
                  <span>Identification number</span>
                </th>
                <td name="td_identification_id" class="text-right m-0 p-0 lato-medium"
                  style="border-top: 1px solid black;">
                  <t t-if="o.employee_id and o.employee_id.identification_id">
                    <span t-field="o.employee_id.identification_id" />
                  </t>
                </td>
              </tr>
              <tr name="tr_payslip_run_id">
                <th name="th_payslip_run_id" class="text-left m-0 p-0 lato-medium"
                  style="border-top: 1px solid black;">
                  <span>Payslip run ID</span>
                </th>
                <td name="td_payslip_run_id" class="text-right m-0 p-0 lato-medium"
                  style="border-top: 1px solid black;">
                  <t t-if="o.payslip_run_id and o.payslip_run_id.name">
                    <span t-field="o.payslip_run_id.name" />
                  </t>
                </td>
              </tr>
            </table>
          </div>
        </div>
        <div id="total">
          <table class="table table-sm o_main_table">
            <thead class="o_black_border">
              <tr>
                <th class="lato-bold text-left">LA</th>
                <th class="lato-bold text-left">Name</th>
                <th class="lato-bold text-right">Estimate</th>
                <th class="lato-bold text-right">Deduction Base</th>
                <th class="lato-bold text-right">Amount</th>
              </tr>
            </thead>
            <tbody>
              <t t-set="total_deductions" t-value="0" />
              <t t-set="amount_payout" t-value="0" />
              <span t-foreach="o.line_ids.filtered(lambda line: line.appears_on_payslip)"
                t-as="line">
                <t t-set="line_style" />
                <t t-set="line_class" t-value="'lato-medium'" />
                <t t-if="line.code == '5000'">
                  <t t-set="line_style" t-value="" />
                  <t t-set="line_class" t-value="'lato-bold'" />
                  <!-- empty row -->
                  <tr>
                    <td colspan="5">
                      <p></p>
                    </td>
                  </tr>
                </t>
                <t t-if="line.code == 'NET'">
                  <t t-set="line_style" t-value="'color:#875A7B;'" />
                  <t t-set="line_class" t-value="'o_total o_border_bottom lato-bold'" />
                  <t t-set="amount_payout" t-value="line.total" />
                  <tr class="lato-bold" name="tr_deduction">
                    <td></td>
                    <td class="text-left">
                      <span>Deductions</span>
                    </td>
                    <td name="td_deductions" colspan="3" class="text-right">
                      <span t-esc="'{:.2f}'.format(total_deductions)" />
                      <t t-if="o.currency_id and o.currency_id.name">
                        <span t-esc="' %s' % (o.currency_id.name)" />
                      </t>
                    </td>
                  </tr>
                </t>
                <t t-if="(line.code == 'BASIC') or (line.code == 'GROSS')">
                  <t t-set="line_style" t-value="'color:#00A09D;'" />
                  <t t-set="line_class" t-value="'o_subtotal o_border_bottom'" />
                </t>
                <tr t-att-class="line_class" t-att-style="line_style">
                  <td class="text-left">
                    <span t-field="line.code" />
                  </td>
                  <td class="text-left">
                    <span t-field="line.name" />
                  </td>
                  <td class="text-right">
                    <t t-if="o.contract_id and o.contract_id.gio_name">
                      <t t-if="'AHV' in line.name">
                        <span t-esc="'{:.3f}'.format(o.contract_id.gio_name.gio_ahv)" />
                        <span t-esc="' %'" />
                        <t t-set="total_deductions" t-value="total_deductions + line.total" />
                      </t>
                      <t t-if="'ALV' in line.name and not 'ALV 2' in line.name">
                        <span t-esc="'{:.3f}'.format(o.contract_id.gio_name.gio_alv)" />
                        <span t-esc="' %'" />
                        <t t-set="total_deductions" t-value="total_deductions + line.total" />
                      </t>
                      <t t-if="'ALV 2' in line.name">
                        <span t-esc="'{:.3f}'.format(o.contract_id.gio_name.gio_alv2)" />
                        <span t-esc="' %'" />
                        <t t-set="total_deductions" t-value="total_deductions + line.total" />
                      </t>
                      <t t-if="'NBU' in line.name">
                        <span t-esc="'{:.3f}'.format(o.contract_id.gio_name.gio_nbu)" />
                        <span t-esc="' %'" />
                        <t t-set="total_deductions" t-value="total_deductions + line.total" />
                      </t>
                      <t t-if="'KTG m' in line.name">
                        <span t-esc="'{:.3f}'.format(o.contract_id.gio_name.gio_ktgm)" />
                        <span t-esc="' %'" />
                        <t t-set="total_deductions" t-value="total_deductions + line.total" />
                      </t>
                      <t t-if="'KTG f' in line.name">
                        <span t-esc="'{:.3f}'.format(o.contract_id.gio_name.gio_ktgf)" />
                        <span t-esc="' %'" />
                        <t t-set="total_deductions" t-value="total_deductions + line.total" />
                      </t>
                      <t t-if="'UVG Zuschlag' in line.name and not 'UVG Zuschlag 2' in line.name">
                        <span
                          t-esc="'{:.3f}'.format(o.contract_id.gio_name.gio_uvg_supplementary_insurance)" />
                        <span t-esc="' %'" />
                        <t t-set="total_deductions" t-value="total_deductions + line.total" />
                      </t>
                      <t t-if="'UVG Zuschlag 2' in line.name">
                        <span
                          t-esc="'{:.3f}'.format(o.contract_id.gio_name.gio_uvg_supplementary_insurance2)" />
                        <span t-esc="' %'" />
                        <t t-set="total_deductions" t-value="total_deductions + line.total" />
                      </t>
                    </t>
                    <t t-if="'Quellensteuer' in line.name">
                      <t t-set="total_deductions" t-value="total_deductions + line.total" />
                    </t>
                    <span t-if="line.quantity > 1" t-esc="line.quantity" />
                  </td>
                  <td class="text-right">
                    <!-- <t
                      t-if="line.salary_rule_id.gio_amount_python_compute != 'result=0' and line.salary_rule_id.gio_amount_python_compute != 'result = 0'">
                      <span t-esc="line.get_amount_in_report(line.salary_rule_id)"
                        t-options='{"widget": "monetary", "display_currency": o.company_id.currency_id}'
                      />
                    </t> -->
                  </td>
                  <td class="text-right">
                    <span t-esc="line.total"
                      t-options='{"widget": "monetary", "display_currency": o.company_id.currency_id}' />
                  </td>
                </tr>
              </span>
              <br />
              <!-- Bank informations -->
              <!-- empty row -->

              <tr>
                <td colspan="5">
                  <span>Paid to</span>
                </td>
              </tr>
              <tr class="pt-3">
                <td></td>
                <td class="lato-medium text-left" name="bank_name">
                  <t t-if="o.employee_id.bank_account_id and o.employee_id.bank_account_id.bank_id">
                    <span t-field="o.employee_id.bank_account_id.bank_id.name" />
                  </t>
                </td>
                <td colspan="3" class="lato-medium text-right" name="total_payout">
                  <strong t-esc="amount_payout"
                    t-options='{"widget": "monetary", "display_currency": o.company_id.currency_id}' />
                </td>
              </tr>
              <tr>
                <td></td>
                <td class="lato-medium text-left" name="bank_iban">
                  <t t-if="o.employee_id.bank_account_id">
                    <span>IBAN:</span>
                    <span t-field="o.employee_id.bank_account_id.acc_number" />
                  </t>
                </td>
                <td></td>
                <td></td>
                <td></td>
              </tr>
              <tr>
                <td></td>
                <td class="lato-medium text-left" name="bank_bic">
                  <t t-if="o.employee_id.bank_account_id and o.employee_id.bank_account_id.bank_id">
                    <span>BIC:</span>
                    <span t-field="o.employee_id.bank_account_id.bank_id.bic" />
                  </t>
                </td>
                <td></td>
                <td></td>
                <td></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </xpath>
  </template>

</data>
```
Source: [snippets/hr_payroll.report_payslip.gio_custom_payroll.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/hr_payroll.report_payslip.gio_custom_payroll.xml)

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

