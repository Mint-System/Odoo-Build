# Account Followup
## Template Followup Report  
### Padding Before Table  
ID: `mint_system.account_followup.template_followup_report.padding_before_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_followup.template_followup_report" priority="50">

  <xpath expr="//table[hasclass('o_account_reports_table')]" position="attributes">
    <attribute name="style">padding-top: 2rem</attribute>
  </xpath>

</data>
```
Source: [snippets/account_followup.template_followup_report.padding_before_table.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/account_followup.template_followup_report.padding_before_table.xml)

### Remove Summary Placeholder  
ID: `mint_system.account_followup.template_followup_report.remove_summary_placeholder`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_followup.template_followup_report" priority="50">

  <xpath expr="//span[hasclass('o_account_report_summary_placeholder')]" position="replace" />

</data>
```
Source: [snippets/account_followup.template_followup_report.remove_summary_placeholder.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/account_followup.template_followup_report.remove_summary_placeholder.xml)

