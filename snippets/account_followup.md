# Account Followup

## Customer Statements Form View

### Remove Blocked

ID: `mint_system.account_followup.customer_statements_form_view.remove_blocked`

```xml
<data inherit_id="account.view_move_form" priority="50">
    <field name="blocked" position="replace" />
</data>

```

Source: [snippets/account_followup.customer_statements_form_view.remove_blocked.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/account_followup.customer_statements_form_view.remove_blocked.xml)

## Report Followup Print All

### Style Sozialinfo

ID: `mint_system.account_followup.report_followup_print_all.style_sozialinfo`

```xml
<data inherit_id="account_followup.report_followup_print_all" priority="50">
    <t t-call-assets="account_followup.assets_followup_report" position="after">
        <style>
        table.o_account_reports_table {
            white-space: nowrap;
        }

        table.o_account_reports_table th:nth-child(3),
        table.o_account_reports_table td:nth-child(3) {
            display: none;
        }
        </style>
    </t>
</data>
```

Source: [snippets/account_followup.report_followup_print_all.style_sozialinfo.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/account_followup.report_followup_print_all.style_sozialinfo.xml)

## Template Followup Report

### Format Table

ID: `mint_system.account_followup.template_followup_report.format_table`

```xml
<data inherit_id="account_followup.template_followup_report" priority="50">
    <tbody position="before">
        <style>
            .o_account_followup th {
                text-align: left;
            }
        </style>
    </tbody>
</data>

```

Source: [snippets/account_followup.template_followup_report.format_table.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/account_followup.template_followup_report.format_table.xml)

### Padding Before Table

ID: `mint_system.account_followup.template_followup_report.padding_before_table`

```xml
<data inherit_id="account_followup.template_followup_report" priority="50">
    <xpath expr="//table[hasclass('o_account_reports_table')]" position="attributes">
        <attribute name="style">padding-top: 2rem</attribute>
    </xpath>
</data>

```

Source: [snippets/account_followup.template_followup_report.padding_before_table.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/account_followup.template_followup_report.padding_before_table.xml)

### Remove Summary Placeholder

ID: `mint_system.account_followup.template_followup_report.remove_summary_placeholder`

```xml
<data inherit_id="account_followup.template_followup_report" priority="50">
    <xpath expr="//span[hasclass('o_account_report_summary_placeholder')]" position="replace"/>
</data>

```

Source: [snippets/account_followup.template_followup_report.remove_summary_placeholder.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/account_followup.template_followup_report.remove_summary_placeholder.xml)
