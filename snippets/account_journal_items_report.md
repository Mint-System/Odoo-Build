---
prev: ./snippets
---
# Account Journal Items Report
## Account Move Line Template  
### Call Layout  
ID: `mint_system.account_journal_items_report.account_move_line_template.call_layout`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_journal_items_report.account_move_line_template" priority="50">

  <xpath expr="//t[@t-call='web.external_layout']" position="attributes">
     <attribute name="t-call">web.internal_layout</attribute> 
  </xpath>
 
</data>
```
Source: [snippets/account_journal_items_report.account_move_line_template.call_layout.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account_journal_items_report.account_move_line_template.call_layout.xml)

