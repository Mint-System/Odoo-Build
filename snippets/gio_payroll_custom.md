---
prev: ./snippets
---
# Gio Payroll Custom
## Gio View Hr Contract Form  
### Holiday Wage As Percentage  
ID: `mint_system.gio_payroll_custom.gio_view_hr_contract_form.holiday_wage_as_percentage`  
```xml
<?xml version="1.0"?>
<data inherit_id="gio_payroll_custom.gio_view_hr_contract_form" priority="50">

    <field name="gio_holiday_rate" position="attributes">
        <attribute name="widget">percentage</attribute>
    </field>

</data>

```
Source: [snippets/gio_payroll_custom.gio_view_hr_contract_form.holiday_wage_as_percentage.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/gio_payroll_custom.gio_view_hr_contract_form.holiday_wage_as_percentage.xml)

## Hr Payroll Report View  
### New Report  
ID: `mint_system.gio_payroll_custom.hr_payroll_report_view.new_report`  
```xml
<?xml version="1.0"?>
<data inherit_id="gio_payroll_custom.hr_payroll_report_view" priority="50">

    <xpath expr="/t" position="replace">
        <template id="hr_payroll_report_view">
            <t t-foreach="docs" t-as="doc">
                <t t-call="web.html_container">

                    <t t-call="web.external_layout">
                        <!-- <t t-set="doc" t-value="doc.with_context(lang=lang)" /> -->

                        <br/>
                        <br/>
                        <br/>

                        <div class="row">
                            <div class="col-8" />
                            <div class="col-4" t-field="doc.employee_id.address_home_id" t-options='{"widget": "contact", "fields": ["address", "name", "phone"], "no_marker": True, "phone_icons": True}'/>
                        </div>

                        <div class="page">
                            <style>
                                div.page {
                                    font-size: 0.75rem;
                                }
                            </style>

                            <br/>
                            <br/>
                            <br/>

                            <h4 t-esc="doc.name"/>

                            <br/>

                            <div class="row">
                                <div class="col-2">
                                    <span>Datum</span>
                                </div>
                                <div class="col-3">
                                    <span t-esc="context_timestamp(datetime.datetime.now()).strftime('%d.%m.%Y')"/>
                                </div>
                                <div class="col-3">
                                    <span>Periode</span>
                                </div>
                                <div class="col-4">
                                    <span t-field="doc.date_from"/> - <span t-field="doc.date_to"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-2">
                                    <span>Personalnr.</span>
                                </div>
                                <div class="col-3">
                                    <span t-esc="doc.employee_id.registration_number"/>
                                </div>
                                <div class="col-3">
                                    <span>Geleistete Stunden</span>
                                </div>
                                <div class="col-4">
                                    <span t-esc="doc.gio_worked_hours"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-2">
                                    <span>Sozialvers. Nr.</span>
                                </div>
                                <div class="col-3">
                                    <span t-esc="doc.employee_id.identification_id"/>
                                </div>
                            </div>

                            <br/>

                            <table class="table td-no-top">
                                <style>
                                    .table.td-no-top td {
                                        border-top: none;
                                        padding: 0.25rem;
                                    }
                                </style>
                                <thead>
                                    <tr>
                                        <th>Lohnart</th>
                                        <th>Ansatz</th>
                                        <th class="text-right">
                                            <span>Basis</span>
                                        </th>
                                        <th class="text-right">
                                            <span>Betrag</span>
                                        </th>
                                    </tr>
                                </thead>

                                <t t-foreach="doc.line_ids" t-as="line">
                                    <t t-if="line.salary_rule_id.appears_on_payslip and line.amount != 0.00">
                                        <tr>
                                            <td>
                                                <t t-if="line.name=='Bruttolohn' or line.name=='Nettolohn'">
                                                    <span class="o_bold" t-field="line.name"/><br/><br/>
                                                </t>
                                                <t t-if="not line.name=='Bruttolohn' and not line.name=='Nettolohn'">
                                                    <span t-field="line.name"/>
                                                </t>
                                            </td>
                                            <td>
                                                <t t-if="line.name=='Ferienentschädigung'">
                                                    <span t-esc="'%.2f' % (doc.contract_id.gio_holiday_rate*100)"/><span> %</span>
                                                </t>
                                                <t t-if="line.name=='Ausbildungszulage'">
                                                    <span t-esc="'%.2f' % doc.contract_id.gio_name.gio_training_allowances"/>
                                                </t>
                                                <t t-if="line.name=='Kinderzulage'">
                                                    <span t-esc="'%.2f' % doc.contract_id.gio_name.gio_child_allowances"/>
                                                </t>
                                                <t t-if="line.name=='AHV/IV/EO'">
                                                    <span t-esc="'%.3f' % doc.contract_id.gio_name.gio_ahv"/><span> %</span>
                                                </t>
                                                <t t-if="line.name=='ALV'">
                                                    <span t-field="doc.contract_id.gio_name.gio_alv"/><span> %</span>
                                                </t>
                                                <t t-if="line.name=='ALV 2'">
                                                    <span t-field="doc.contract_id.gio_name.gio_alv2"/><span> %</span>
                                                </t>
                                                <t t-if="line.name=='NBU'">
                                                    <span t-field="doc.contract_id.gio_name.gio_nbu"/><span> %</span>
                                                </t>
                                                <t t-if="line.name=='KTG w'">
                                                    <span t-field="doc.contract_id.gio_name.gio_ktgf"/><span> %</span>
                                                </t>
                                                <t t-if="line.name=='KTG m'">
                                                    <span t-field="doc.contract_id.gio_name.gio_ktgm"/><span> %</span>
                                                </t>
                                                <t t-if="line.name=='UVG Zuschlag'">
                                                    <span t-esc="'%.2f' % doc.contract_id.gio_name.gio_uvg_supplementary_insurance"/>
                                                </t>
                                                <t t-if="line.name=='UVG Zuschlag2'">
                                                    <span t-esc="'%.2f' % doc.contract_id.gio_name.gio_uvg_supplementary_insurance2"/>
                                                </t>
                                            </td>
                                            <td class="text-right">
                                                <t t-if="line.gio_amount">
                                                    <span t-field="line.gio_amount"/>
                                                </t>
                                            </td>
                                            <td class="text-right">
                                                <t t-if="line.name=='Bruttolohn' or line.name=='Nettolohn'">
                                                    <span class="o_bold" t-field="line.amount"/>
                                                </t>
                                                <t t-if="not line.name=='Bruttolohn' and not line.name=='Nettolohn'">
                                                    <span t-field="line.amount"/>
                                                </t>
                                            </td>
                                        </tr>
                                    </t>
                                </t>
                            </table>

                            <table class="table td-bottom-line">
                                <style>
                                    .table.td-bottom-line tr:nth-child(2n) td {
                                        border-bottom: 2px solid #dee2e6;
                                    }
                                </style>
                                <t t-foreach="doc.line_ids" t-as="line">
                                    <t t-if="line.category_id.name == 'Netto'">
                                        <tr>
                                            <td>
                                                <span class="o_bold">Nettolohn</span>
                                            </td>
                                            <td class="text-right">
                                                <span class="o_bold" t-esc="line.amount" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span class="o_bold">Auszahlung</span>
                                            </td>
                                            <td class="text-right">
                                                <span class="o_bold" t-esc="line.total" />
                                            </td>
                                        </tr>
                                    </t>
                                </t>
                            </table>

                            <br/>

                            <p>Auszahlungsdetails:</p>

                            <t t-foreach="doc.line_ids" t-as="line">
                                <t t-if="line.category_id.name == 'Netto'">
                                    <p>CHF <span t-field="line.amount"/> Überweisung an <span t-field="doc.employee_id.bank_account_id.bank_id.name"/>, Konto <span t-field="doc.employee_id.bank_account_id.acc_number"/>
                                    <br/>Begünstigter: <span t-field="doc.employee_id.name"/></p>
                                </t>
                            </t>

                        </div>
                    </t>

                </t>
            </t>
        </template>
  </xpath>

</data>

```
Source: [snippets/gio_payroll_custom.hr_payroll_report_view.new_report.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/gio_payroll_custom.hr_payroll_report_view.new_report.xml)

