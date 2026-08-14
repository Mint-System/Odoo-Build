# L10n Din5008 Stock

## Report Delivery Document

### Show Partner Reference

ID: `mint_system.l10n_din5008_stock.report_delivery_document.show_partner_reference`\
Inherit ID: `l10n_din5008_stock.report_delivery_document`

```xml
<data priority="50">
    <xpath expr="//td[@class='shipping_address']/t[3]" position="after">
        <div t-if="o.partner_id.ref" class="mb-0" name="div_partner_id">
            <strong>Customer Ref.</strong>
            <div t-esc="o.partner_id.ref" class="m-0"/>
        </div>
    </xpath>
</data>

```
Edit: [snippets/mint_system.l10n_din5008_stock.report_delivery_document.show_partner_reference.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.l10n_din5008_stock.report_delivery_document.show_partner_reference.xml)\
Source: [snippets/mint_system.l10n_din5008_stock.report_delivery_document.show_partner_reference.xml](https://odoo.build/snippets/mint_system.l10n_din5008_stock.report_delivery_document.show_partner_reference.xml)

