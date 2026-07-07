# L10n Ch Hr Payroll Elm Transmission

## L10n Ch Elm Report Payslip

### Address To Envelope Position

ID: `mint_system.l10n_ch_hr_payroll_elm_transmission.l10n_ch_elm_report_payslip.address_to_envelope_position`\
Inherit ID: `l10n_ch_hr_payroll_elm_transmission.l10n_ch_elm_report_payslip`

```xml
<data priority="50">

    <xpath expr="//tr[td/strong[contains(text(), 'Name')]]" position="replace"/>
    <xpath expr="//tr[td/strong[contains(text(), 'Ad')]]" position="replace"/>
    <xpath expr="//h2[@id='payslip_name']" position="replace"/>
    
    <xpath expr="//div[hasclass('page')]/table[hasclass('o_table_ch_infos')]" position="before">
        <table class="table table-bordered table-sm o_table_ch o_table_ch_infos mb-5">
            <tbody style="border: none;">
                <tr>
                    <td><span t-field="o.employee_id"/></td>
                </tr>
                <tr>
                    <td><span t-field="o.employee_id.private_street"/></td>
                </tr>
                <tr>
                    <td t-if="o.employee_id.private_street2"><span t-field="o.employee_id.private_street2"/></td>
                </tr>
                <tr>
                    <td>
                        <span t-field="o.employee_id.private_zip"/>
                        <span t-field="o.employee_id.private_city"/>
                    </td>
                </tr>
                <tr>
                    <td><span t-field="o.employee_id.private_country_id"/></td>
                </tr>
            </tbody>
        </table>
        <h2 id="payslip_name"><span t-field="o.name"/></h2>
    </xpath>
</data>
```
Edit: [snippets/mint_system.l10n_ch_hr_payroll_elm_transmission.l10n_ch_elm_report_payslip.address_to_envelope_position.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.l10n_ch_hr_payroll_elm_transmission.l10n_ch_elm_report_payslip.address_to_envelope_position.xml)\
Source: [snippets/mint_system.l10n_ch_hr_payroll_elm_transmission.l10n_ch_elm_report_payslip.address_to_envelope_position.xml](https://odoo.build/snippets/mint_system.l10n_ch_hr_payroll_elm_transmission.l10n_ch_elm_report_payslip.address_to_envelope_position.xml)

### Removed Border

ID: `mint_system.l10n_ch_hr_payroll_elm_transmission.l10n_ch_elm_report_payslip.removed_border`\
Inherit ID: `l10n_ch_hr_payroll_elm_transmission.l10n_ch_elm_report_payslip`

```xml
<data priority="50">
    <xpath expr="//table[not(contains(@class, 'mb-5')) and contains(@class, 'o_table_ch_infos')]/tbody" position="attributes">
        <attribute name="style">border: none;</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.l10n_ch_hr_payroll_elm_transmission.l10n_ch_elm_report_payslip.removed_border.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.l10n_ch_hr_payroll_elm_transmission.l10n_ch_elm_report_payslip.removed_border.xml)\
Source: [snippets/mint_system.l10n_ch_hr_payroll_elm_transmission.l10n_ch_elm_report_payslip.removed_border.xml](https://odoo.build/snippets/mint_system.l10n_ch_hr_payroll_elm_transmission.l10n_ch_elm_report_payslip.removed_border.xml)

### Smaller Header

ID: `mint_system.l10n_ch_hr_payroll_elm_transmission.l10n_ch_elm_report_payslip.smaller_header`\
Inherit ID: `l10n_ch_hr_payroll_elm_transmission.l10n_ch_elm_report_payslip`

```xml
<data priority="50">
    <xpath expr="//h2[@id='payslip_name']" position="attributes">
        <attribute name="style">font-size: 20px;</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.l10n_ch_hr_payroll_elm_transmission.l10n_ch_elm_report_payslip.smaller_header.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.l10n_ch_hr_payroll_elm_transmission.l10n_ch_elm_report_payslip.smaller_header.xml)\
Source: [snippets/mint_system.l10n_ch_hr_payroll_elm_transmission.l10n_ch_elm_report_payslip.smaller_header.xml](https://odoo.build/snippets/mint_system.l10n_ch_hr_payroll_elm_transmission.l10n_ch_elm_report_payslip.smaller_header.xml)

