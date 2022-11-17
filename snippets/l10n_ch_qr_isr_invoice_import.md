---
prev: ./snippets.md
---
# L10n Ch Qr Isr Invoice Import
## Account Invoice Import Form  
### Show Partner Id  
ID: `mint_system.l10n_ch_qr_isr_invoice_import.account_invoice_import_form.show_partner_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="l10n_ch_qr_isr_invoice_import.account_invoice_import_form" priority="50">

  <field name="partner_id" position="attributes">
    <attribute name="attrs">{'readonly': ['|',('scan_type', '!=', 'qr'), ('state', '!=', 'select-partner')], 'invisible': [('state', 'in', ('import', 'reference-update'))]}</attribute>
  </field>

</data>

```
Source: [snippets/l10n_ch_qr_isr_invoice_import.account_invoice_import_form.show_partner_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/l10n_ch_qr_isr_invoice_import.account_invoice_import_form.show_partner_id.xml)

