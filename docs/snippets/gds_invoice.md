# Gds Invoice

## Report Invoice Document

### Hide Payment Communications

ID: `mint_system.gds_invoice.report_invoice_document.hide_payment_communications`\
Inherit ID: `gds_invoice.report_invoice_document`

```xml
<data priority="50">
    <xpath expr="//p[@name='payment_communication']/.." position="replace"/>
</data>
```
Edit: [snippets/mint_system.gds_invoice.report_invoice_document.hide_payment_communications.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.gds_invoice.report_invoice_document.hide_payment_communications.xml)\
Source: [snippets/mint_system.gds_invoice.report_invoice_document.hide_payment_communications.xml](https://odoo.build/snippets/mint_system.gds_invoice.report_invoice_document.hide_payment_communications.xml)

### Payment Term Align Left

ID: `mint_system.gds_invoice.report_invoice_document.payment_term_align_left`\
Inherit ID: `gds_invoice.report_invoice_document`

```xml
<data priority="50">
    <xpath expr="//div[@id='payment_term']" position="attributes">
        <attribute name="style">float: left; clear: both;</attribute>
    </xpath>
</data>
```
Edit: [snippets/mint_system.gds_invoice.report_invoice_document.payment_term_align_left.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.gds_invoice.report_invoice_document.payment_term_align_left.xml)\
Source: [snippets/mint_system.gds_invoice.report_invoice_document.payment_term_align_left.xml](https://odoo.build/snippets/mint_system.gds_invoice.report_invoice_document.payment_term_align_left.xml)

