# L10n Din5008 Sale

## Report Saleorder Document

### L10n Din5008 Sale Blanket Order

ID: `mint_system.l10n_din5008_sale.report_saleorder_document.l10n_din5008_sale_blanket_order`\
Inherit ID: `l10n_din5008_sale.report_saleorder_document`

```xml
<data priority="50">
    <!-- Based on l10n_din5008_sale.report_saleorder_document this view is adopted to report_blanketorder_document -->
        <xpath expr="//t[@t-set='doc']" position="after">
            <t t-set="din5008_document_information">
                <div class="information_block">
                    <table>
                        <t t-if="doc.state in {'draft', 'sent'}">
                            <tr t-if="doc.name">
                                <td>Quotation No.:</td>
                                <td><div t-field="doc.name"/></td>
                            </tr>
                            <tr t-if="doc.validity_date">
                                <td>Expiration:</td>
                                <td><div t-field="doc.validity_date" t-options="{'widget': 'date'}"/></td>
                            </tr>
                        </t>
                        <t t-else="">
                            <tr t-if="doc.name">
                                <td>Blanket Order No.:</td>
                                <td><div t-field="doc.name"/></td>
                            </tr>
                            <!-- <tr t-if="doc.write_date">
                                <td>Last Edit:</td>
                                <td><div t-field="doc.write_date" t-options="{'widget': 'date'}"/></td>
                            </tr> -->
                            <tr t-if="doc.validity_date">
                                <td>Expiration:</td>
                                <td><div t-field="doc.validity_date" t-options="{'widget': 'date'}"/></td>
                            </tr>
                        </t>
                        <tr t-if="doc.client_order_ref">
                            <td>Customer Reference:</td>
                            <td><div t-field="doc.client_order_ref"/></td>
                        </tr>
                        <tr t-if="doc.user_id">
                            <td>Salesperson:</td>
                            <td><div t-field="doc.user_id.name"/></td>
                        </tr>
                    </table>
                </div>
            </t>
            <t t-set="address">
                <div t-field="doc.partner_id" class="mb-0" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}"/>
                <p t-if="doc.partner_id.vat" class="mb-0">
                    <t t-if="doc.company_id.account_fiscal_country_id.vat_label" t-out="doc.company_id.account_fiscal_country_id.vat_label"/>
                    <t t-else="">Tax ID</t>: <span t-field="doc.partner_id.vat"/>
                </p>
            </t>

            <t t-set="din5008_document_title">
                <t>Blanket Order</t>
            </t>
        </xpath>
        <!-- Remove Address from initial position -->
        <xpath expr="//div[@class='row'][1]" position="replace"/>
    </data>

```

Edit: [snippets/mint_system.l10n_din5008_sale.report_saleorder_document.l10n_din5008_sale_blanket_order.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.l10n_din5008_sale.report_saleorder_document.l10n_din5008_sale_blanket_order.xml)\
Source: [snippets/mint_system.l10n_din5008_sale.report_saleorder_document.l10n_din5008_sale_blanket_order.xml](https://odoo.build/snippets/mint_system.l10n_din5008_sale.report_saleorder_document.l10n_din5008_sale_blanket_order.xml)
