# Account Reports
## View Archived Tag Move Tree  
### Vat  
ID: `mint_system.account_reports.view_archived_tag_move_tree.vat`  
```xml
<data inherit_id="account_reports.view_archived_tag_move_tree" priority="50">
    <xpath expr="//tree/field[@name='partner_id']" position="after">
        <field name="partner_vat" string="USt-IdNr"/>
    </xpath>
</data>

```
Source: [snippets/account_reports.view_archived_tag_move_tree.vat.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/account_reports.view_archived_tag_move_tree.vat.xml)

