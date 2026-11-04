# L10n Din5008 Stock

## Report Delivery Document

### Add Phone Number

ID: `mint_system.l10n_din5008_stock.report_delivery_document.add_phone_number`\
Inherit ID: `l10n_din5008_stock.report_delivery_document`

```xml
<data priority="50">
    <xpath expr="//div[@t-if='o.partner_id.vat']" position="after">
        <t t-set="display_phone" t-value="o.sale_id.x_studio_customer_phone or o.partner_id.commercial_partner_id.phone"/>
        <div t-if="display_phone">
            <span>Tel.</span> <span t-esc="display_phone"/>
        </div>
    </xpath>
</data>
```
Edit: [snippets/mint_system.l10n_din5008_stock.report_delivery_document.add_phone_number.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.l10n_din5008_stock.report_delivery_document.add_phone_number.xml)\
Source: [snippets/mint_system.l10n_din5008_stock.report_delivery_document.add_phone_number.xml](https://odoo.build/snippets/mint_system.l10n_din5008_stock.report_delivery_document.add_phone_number.xml)

### Hide Phone

ID: `mint_system.l10n_din5008_stock.report_delivery_document.hide_phone`\
Inherit ID: `l10n_din5008_stock.report_delivery_document`

```xml
<data priority="50">
    <xpath expr="(//address[@t-esc='o.partner_id.commercial_partner_id'])[1]" position="attributes">
        <attribute name="t-options">{"widget": "contact", "fields": ["address", "name"], "no_marker": True}</attribute>
    </xpath>
    <xpath expr="(//address[@t-esc='o.partner_id.commercial_partner_id'])[2]" position="attributes">
        <attribute name="t-options">{"widget": "contact", "fields": ["address", "name"], "no_marker": True}</attribute>
    </xpath>
</data>
```
Edit: [snippets/mint_system.l10n_din5008_stock.report_delivery_document.hide_phone.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.l10n_din5008_stock.report_delivery_document.hide_phone.xml)\
Source: [snippets/mint_system.l10n_din5008_stock.report_delivery_document.hide_phone.xml](https://odoo.build/snippets/mint_system.l10n_din5008_stock.report_delivery_document.hide_phone.xml)

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

