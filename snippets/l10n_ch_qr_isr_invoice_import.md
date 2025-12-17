# L10n Ch Qr Isr Invoice Import

## Account Invoice Import Form

### Show Partner Id

ID: `mint_system.l10n_ch_qr_isr_invoice_import.account_invoice_import_form.show_partner_id`

```xml
<data inherit_id="l10n_ch_qr_isr_invoice_import.account_invoice_import_form" priority="50">
    <field name="partner_id" position="attributes">
        <attribute name="attrs">{'readonly': ['|',('scan_type', '!=', 'qr'), ('state', '!=', 'select-partner')], 'invisible': [('state', 'in', ('import', 'reference-update'))]}</attribute>
    </field>
</data>

```
Edit: [snippets/mint_system.l10n_ch_qr_isr_invoice_import.account_invoice_import_form.show_partner_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.l10n_ch_qr_isr_invoice_import.account_invoice_import_form.show_partner_id.xml)

Source: [snippets/mint_system.l10n_ch_qr_isr_invoice_import.account_invoice_import_form.show_partner_id.xml](https://odoo.build/snippets/mint_system.l10n_ch_qr_isr_invoice_import.account_invoice_import_form.show_partner_id.xml)

