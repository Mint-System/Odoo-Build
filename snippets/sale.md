# Sale

## Report Blanketorder Document

### Add Drawing

ID: `mint_system.sale.report_blanketorder_document.add_drawing`

```xml
<data inherit_id="sale.report_blanketorder_document" priority="50">
    <xpath expr="//span[@t-field='l.name']" position="after">
        <br/>
        <span>Drawing: </span>
        <a t-attf-href="{{l.product_id.drawing_file.url}}">
            <span t-field="l.product_id.drawing_file.display_name"/>
        </a>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_blanketorder_document.add_drawing.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_blanketorder_document.add_drawing.xml)

Source: [snippets/mint_system.sale.report_blanketorder_document.add_drawing.xml](https://odoo.build/snippets/mint_system.sale.report_blanketorder_document.add_drawing.xml)

### Add Footer

ID: `mint_system.sale.report_blanketorder_document.add_footer`

```xml
<data inherit_id="sale.report_blanketorder_document" priority="50">
    <xpath expr="//table[@id='summary']" position="after">
        <style>
      table#footer {
        width: 100%;
        font-size: 8pt;
        line-height: 1.5;
      }
      table#footer tr, td {
        vertical-align: top;
      }
    </style>
        <table id="footer">
            <tr>
                <td width="40%" t-if="doc.payment_term_id">
                    <span>Zahlungsbedingungen </span>
                    <span t-field="doc.payment_term_id"/>
                </td>
                <td width="60%">
          Delivery according to our general delivery conditions
        </td>
            </tr>
            <tr>
                <td>
                    <span>VAT no: </span>
                    <span t-field="doc.company_id.vat"/>
                </td>
                <td>
                    <table width="100%">
                        <tr>
                            <td width="35%">
               Bank accounts:
            </td>
                            <td width="65%">
              UBS AG, 6301 Zug, BLZ 273, SWIFT UBSWCHZH80A
             </td>
                        </tr>
                        <tr>
                            <td>
            </td>
                            <td>
            (CHF) IBAN CH63 0027 3273 Q978 6962 0
            </td>
                        </tr>
                        <tr>
                            <td>
            </td>
                            <td>
            (EUR) IBAN CH59 0027 3273 HN10 3698 0
            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_blanketorder_document.add_footer.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_blanketorder_document.add_footer.xml)

Source: [snippets/mint_system.sale.report_blanketorder_document.add_footer.xml](https://odoo.build/snippets/mint_system.sale.report_blanketorder_document.add_footer.xml)

### Add Infotable

ID: `mint_system.sale.report_blanketorder_document.add_infotable`

```xml
<data inherit_id="sale.report_blanketorder_document" priority="50">
    <xpath expr="//h2" position="after">
        <style>
      table#info {
        width: 100%;
        margin-bottom: 25px;
        font-size: 9pt;
        font-family: arial;
        border-color: white;
      }
        table#info tr {
        line-height: 1.2;
        text-align: left;
      }
        .note {
        font-size: 9pt;
      }
    </style>
        <table id="info">
            <tr>
                <td width="17%">Date</td>
                <td width="40%">
                    <span t-field="doc.date_confirmed" t-options="{ &quot;widget&quot;: &quot;date&quot; }"/>
                </td>
                <td width="18%">Our Reference</td>
                <td width="25%">
                    <span t-field="doc.user_id"/>
                </td>
            </tr>
            <tr>
                <td>Customer No.</td>
                <td>
                    <span t-field="doc.partner_id.ref"/>
                </td>
                <td>Delivery Method</td>
                <td>
                    <span t-field="doc.carrier_id"/>
                </td>
            </tr>
            <tr>
                <td>Order</td>
                <td>
                    <span t-field="doc.client_order_ref"/>
                </td>
                <td>Incoterm</td>
                <td>
                    <span t-field="doc.incoterm"/>
                </td>
            </tr>
            <tr>
                <td>Reference</td>
                <td>
                    <span t-field="doc.comment"/>
                </td>
                <td>Validity Date</td>
                <td>
                    <span t-field="doc.validity_date"/>
                </td>
            </tr>
        </table>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_blanketorder_document.add_infotable.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_blanketorder_document.add_infotable.xml)

Source: [snippets/mint_system.sale.report_blanketorder_document.add_infotable.xml](https://odoo.build/snippets/mint_system.sale.report_blanketorder_document.add_infotable.xml)

### Add Payment Terms

ID: `mint_system.sale.report_blanketorder_document.add_payment_terms`

```xml
<data inherit_id="sale.report_blanketorder_document" priority="50">
    <xpath expr="/t/t/div/div[3]" position="after">
        <div class="row" style="margin-top: 1rem; margin-bottom: 1rem">
            <div class="col">
                <span>Payment Terms: </span>
                <span t-field="doc.payment_term_id.name"/>
            </div>
        </div>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_blanketorder_document.add_payment_terms.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_blanketorder_document.add_payment_terms.xml)

Source: [snippets/mint_system.sale.report_blanketorder_document.add_payment_terms.xml](https://odoo.build/snippets/mint_system.sale.report_blanketorder_document.add_payment_terms.xml)

### Address Block

ID: `mint_system.sale.report_blanketorder_document.address_block`

```xml
<data inherit_id="sale.report_blanketorder_document" priority="50">&gt;

    <xpath expr="/t/t/div/div[2]" position="replace"><t t-set="address"><t t-if="doc.partner_sale_id"><div t-esc="doc.partner_sale_id.parent_id.name"/><div t-esc="doc.partner_sale_id.parent_id.name2"/><span t-esc="doc.partner_sale_id.title.name"/><span t-esc="doc.partner_sale_id.name"/><div t-esc="doc.partner_sale_id.street"/><div t-esc="doc.partner_sale_id.street2"/><span t-esc="doc.partner_sale_id.zip"/><span t-esc="doc.partner_sale_id.city"/><t t-if="doc.partner_sale_id.country_id.code != 'CH'"><div t-esc="doc.partner_sale_id.country_id.name"/></t></t><t t-else=""><div t-field="doc.partner_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}"/><p t-if="doc.partner_id.vat"><t t-esc="doc.company_id.country_id.vat_label or 'Tax ID'"/>
:                    <span t-field="doc.partner_id.vat"/>
                </p></t></t><t t-if="doc.partner_shipping_id == doc.partner_invoice_id                              and doc.partner_invoice_id != doc.partner_id                              or doc.partner_shipping_id != doc.partner_invoice_id"><t t-set="information_block"><!--
                <strong t-if="doc.partner_shipping_id == doc.partner_invoice_id">Invoicing and Shipping Address:</strong>
                <strong t-if="doc.partner_shipping_id != doc.partner_invoice_id">Invoicing Address:</strong>
                <div t-field="doc.partner_invoice_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;, &quot;phone&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: True}"/>
                --><t t-if="doc.partner_shipping_id != doc.partner_invoice_id"><strong>Shipping Address:</strong><div t-field="doc.partner_shipping_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: True}"/></t></t></t></xpath>

</data>

```
Edit: [snippets/mint_system.sale.report_blanketorder_document.address_block.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_blanketorder_document.address_block.xml)

Source: [snippets/mint_system.sale.report_blanketorder_document.address_block.xml](https://odoo.build/snippets/mint_system.sale.report_blanketorder_document.address_block.xml)

### Change Column Order

ID: `mint_system.sale.report_blanketorder_document.change_column_order`

```xml
<data inherit_id="sale.report_blanketorder_document" priority="50">
    <xpath expr="//table[@class='table table-condensed table-borderless']/thead/tr" position="replace">    
        <tr>
            <th>Product</th>
            <th class="text-right">Original Qty</th>
            <th class="text-center">Scheduled Date</th>
            <th class="text-right">Unit Price</th>
            <th class="text-right">Amount</th>
        </tr>
    </xpath>
    <xpath expr="//tbody[@class='sale_tbody']/t" position="replace">
        <t t-foreach="doc.line_ids" t-as="l">
            <tr>
                <td>
                    <span t-field="l.name"/>
                </td>
                <td class="text-right">
                    <span t-field="l.original_uom_qty"/>
                    <span t-field="l.product_uom" groups="uom.group_uom"/>
                </td>
                <td class="text-center">
                    <span t-field="l.date_schedule"/>
                </td>
                <td class="text-right">
                    <span t-field="l.price_unit"/>
                </td>
                <td class="text-right">
                    <span t-field="l.price_subtotal" t-options="{&quot;widget&quot;: &quot;monetary&quot;, &quot;display_currency&quot;: l.currency_id}"/>
                </td>
            </tr>
        </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_blanketorder_document.change_column_order.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_blanketorder_document.change_column_order.xml)

Source: [snippets/mint_system.sale.report_blanketorder_document.change_column_order.xml](https://odoo.build/snippets/mint_system.sale.report_blanketorder_document.change_column_order.xml)

### Change Font

ID: `mint_system.sale.report_blanketorder_document.change_font`

```xml
<data inherit_id="sale.report_blanketorder_document" priority="50">
    <xpath expr="//table[@class='table table-condensed']" position="attributes">
        <attribute name="style" add="font-size:16px"/>
    </xpath>
    <xpath expr="//div[@class='col-xs-4 pull-right']" position="attributes">
        <attribute name="style" add="font-size:16px"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_blanketorder_document.change_font.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_blanketorder_document.change_font.xml)

Source: [snippets/mint_system.sale.report_blanketorder_document.change_font.xml](https://odoo.build/snippets/mint_system.sale.report_blanketorder_document.change_font.xml)

### Format Address Blocks

ID: `mint_system.sale.report_blanketorder_document.format_address_blocks`

```xml
<data inherit_id="sale.report_blanketorder_document" priority="50">
    <xpath expr="//div[@class='col-xs-6']/.." position="replace">
        <t t-set="doc" t-value="doc.with_context({'lang':doc.partner_id.lang})"/>
        <t t-set="address">
            <div t-field="doc.partner_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}" style="font-size:10pt; line-height: 1.2; padding-bottom:33mm"/>
            <p t-if="doc.partner_id.vat">
      </p>
        </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_blanketorder_document.format_address_blocks.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_blanketorder_document.format_address_blocks.xml)

Source: [snippets/mint_system.sale.report_blanketorder_document.format_address_blocks.xml](https://odoo.build/snippets/mint_system.sale.report_blanketorder_document.format_address_blocks.xml)

### Format Qty

ID: `mint_system.sale.report_blanketorder_document.format_qty`

```xml
<data inherit_id="sale.report_blanketorder_document" priority="50">
    <xpath expr="//span[@t-field='l.original_uom_qty']" position="replace">
        <t t-if="l.product_uom.id == 1">
            <span t-field="l.original_uom_qty" t-options="{'widget': 'integer'}"/>
        </t>
        <t t-else="">
            <span t-field="l.original_uom_qty"/>
        </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_blanketorder_document.format_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_blanketorder_document.format_qty.xml)

Source: [snippets/mint_system.sale.report_blanketorder_document.format_qty.xml](https://odoo.build/snippets/mint_system.sale.report_blanketorder_document.format_qty.xml)

### Format Title

ID: `mint_system.sale.report_blanketorder_document.format_title`

```xml
<data inherit_id="sale.report_blanketorder_document" priority="50">
    <xpath expr="//h2" position="attributes">
        <attribute name="style">color: black; font-size:13pt; font-weight:bold; margin-top:10mm; margin-bottom:3mm</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_blanketorder_document.format_title.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_blanketorder_document.format_title.xml)

Source: [snippets/mint_system.sale.report_blanketorder_document.format_title.xml](https://odoo.build/snippets/mint_system.sale.report_blanketorder_document.format_title.xml)

### Modify Main Table

ID: `mint_system.sale.report_blanketorder_document.modify_main_table`

```xml
<data inherit_id="sale.report_blanketorder_document" priority="50">
    <!-- add default_code   -->
    <xpath expr="//table/thead/tr/th[1]" position="after">
        <th>
            <span>Artikel Nr.</span>
        </th>
    </xpath>
    <xpath expr="//table/tbody/t/tr/t[1]/td[1]" position="after">
        <td>
            <span t-field="line.product_id.default_code"/>
        </td>
    </xpath>
    <!-- replace product description -->
    <xpath expr="//table/tbody/t[2]/tr/t[1]/td[3]/span" position="replace">
        <t>
            <span style="font-weight:bold;" t-field="line.product_id.type_description"/>
        </t>
    </xpath>
    <!-- add second row -->
    <xpath expr="//tbody//tr[1]" position="after">
        <tr>
            <td style="padding-bottom :10px; padding-left:3px; line-height: 1.2"/>
            <td style="padding:0; padding-left:3px; line-height: 1.2"/>
            <td style="padding:0; padding-left:3px; line-height: 1.2" colspan="4">
                <span t-field="line.name"/>
                <br/>
                <t t-if="line.product_id.country_of_origin_id.code">Ursprungsland: <span t-field="line.product_id.country_of_origin_id.code"/>
        </t>
                <t t-if="line.product_id.hs_code"> / Zollposition: <span t-field="line.product_id.hs_code"/>
        </t>
            </td>
            <td/>
        </tr>
        <tr style="border-bottom: 1px solid rgb(220,220,220)">
            <td colspan="8"/>
        </tr>
    </xpath>
    <!-- format main_table -->
    <xpath expr="//table[@class='table table-sm o_main_table']" position="attributes">
        <attribute name="style">width: 100%; font-size:9pt</attribute>
        <attribute name="class">table table-borderless table-sm</attribute>
    </xpath>
    <!-- header-->
    <xpath expr="//table[@class='table table-borderless table-sm']/thead/tr" position="attributes">
        <attribute name="style">border-top:solid 1px; border-bottom: solid 1px; color: black;</attribute>
    </xpath>
    <!-- header: position -->
    <xpath expr="//table[@class='table table-borderless table-sm']/thead/tr/th[1]" position="attributes"><attribute name="style">width: 5mm</attribute>/&gt;
  </xpath>
    <!-- header: default code -->
    <xpath expr="//table[@class='table table-borderless table-sm']/thead/tr/th[2]" position="attributes"><attribute name="style">width: 27mm; text-align: right; padding-right: 10px</attribute>"/&gt;
  </xpath>
    <!-- header: description -->
    <xpath expr="//table[@class='table table-borderless table-sm']/thead/tr/th[3]" position="attributes"><attribute name="style">width: 70mm</attribute>/&gt;
  </xpath>
    <!-- header: qty -->
    <xpath expr="//table[@class='table table-borderless table-sm']/thead/tr/th[5]" position="attributes"><attribute name="style">text-align: right; padding-right: 5px</attribute>"/&gt;
    <attribute name="style">width: 30mm</attribute>/&gt;
  </xpath>
    <!-- position -->
    <xpath expr="//table[@class='table table-borderless table-sm']/tbody/t[2]/tr/t[1]/td[1]" position="attributes"><attribute name="style">text-align: right</attribute>/&gt;
  </xpath>
    <!-- default code -->
    <xpath expr="//table[@class='table table-borderless table-sm']/tbody/t[2]/tr/t[1]/td[2]" position="attributes"><attribute name="style">text-align: right; padding-right: 10px</attribute>/&gt;
  </xpath>
    <!-- commitment date -->
    <xpath expr="//table[@class='table table-borderless table-sm']/tbody/t[2]/tr/t[1]/td[4]" position="attributes"><attribute name="style">text-align: left;</attribute>/&gt;
  </xpath>
    <!-- qty   -->
    <xpath expr="/t/t/div/table[2]/tbody/t[2]/tr[1]/t[1]/td[5]/span[1]" position="attributes">
        <attribute name="class" separator=" " add="o_bold"/>
        <attribute name="t-options-widget">"integer"</attribute>
    </xpath>
    <!-- price -->
    <xpath expr="//table[@class='table table-borderless table-sm']/tbody/t[2]/tr/t[1]/td[7]/span" position="replace">
        <span t-esc="'%g' % line.price_unit if str(line.price_unit)[::-1].find('.') &gt;= 3 else '%.2f' % line.price_unit"/>
    </xpath>
    <!-- remove taxes -->
    <xpath expr="//thead/tr[1]/th[9]" position="replace"/>
    <xpath expr="//tbody/t[2]/tr[1]/t[1]/td[9]" position="replace"/>
    <!-- margin -->
    <xpath expr="//table[@class='table table-borderless table-sm']/tbody/t[2]/tr/t[1]/td[8]/span" position="replace"><span t-field="line.discount"/>%
  </xpath>
    <!-- total price -->
    <xpath expr="//table[@class='table table-borderless table-sm']/tbody[1]/t[2]/tr[1]/t[1]/td[9]/span" position="replace">
        <span t-esc="'{0:,.2f}'.format(int(line.price_subtotal)).replace(',','\'')"/>
    </xpath>
    <xpath expr="//table[@class='table table-borderless table-sm']" position="after">
        <t t-if="doc.note_footer != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
            <span class="note" t-field="doc.note_footer"/>
        </t>
        <table class="table table-borderless table-sm" style="margin-top:20px; width:100%; color:black; font-family: arial; font-size:9pt; border-top-style:solid; border-bottom-style:solid; border-width:1px; border-color:black">
            <t t-foreach="doc.amount_by_group" t-as="amount_by_group">
                <tr>
                    <td style="width:15.5%; text-align:left">
                        <Strong>Warenwert</Strong>
                    </td>
                    <td style="width:23%; text-align:left">
                        <span t-field="doc.amount_untaxed"/>
                    </td>
                    <td style="width:12%; text-align:left">
                        <span t-esc="amount_by_group[0]"/>
                    </td>
                    <td style="width:17%; text-align:left">
                        <span t-esc="amount_by_group[1]" t-options="{&quot;widget&quot;: &quot;monetary&quot;, &quot;display_currency&quot;: doc.pricelist_id.currency_id}"/>
                    </td>
                    <td style="width:14%; text-align:right">
                        <Strong>Rechnungsbetrag</Strong>
                    </td>
                    <td style="width:18%; text-align:right">
                        <span t-field="doc.amount_total"/>
                    </td>
                </tr>
            </t>
        </table>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_blanketorder_document.modify_main_table.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_blanketorder_document.modify_main_table.xml)

Source: [snippets/mint_system.sale.report_blanketorder_document.modify_main_table.xml](https://odoo.build/snippets/mint_system.sale.report_blanketorder_document.modify_main_table.xml)

### Remove Informations

ID: `mint_system.sale.report_blanketorder_document.remove_informations`

```xml
<data inherit_id="sale.report_blanketorder_document" priority="50">
    <xpath expr="//div[@id='informations']" position="replace">
  </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_blanketorder_document.remove_informations.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_blanketorder_document.remove_informations.xml)

Source: [snippets/mint_system.sale.report_blanketorder_document.remove_informations.xml](https://odoo.build/snippets/mint_system.sale.report_blanketorder_document.remove_informations.xml)

### Remove Summary Table

ID: `mint_system.sale.report_blanketorder_document.remove_summary_table`

```xml
<data inherit_id="sale.report_blanketorder_document" priority="50">
    <xpath expr="//div[@class='col-xs-4 pull-right']" position="replace">
</xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_blanketorder_document.remove_summary_table.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_blanketorder_document.remove_summary_table.xml)

Source: [snippets/mint_system.sale.report_blanketorder_document.remove_summary_table.xml](https://odoo.build/snippets/mint_system.sale.report_blanketorder_document.remove_summary_table.xml)

### Replace Addressblock

ID: `mint_system.sale.report_blanketorder_document.replace_addressblock`

```xml
<data inherit_id="sale.report_blanketorder_document" priority="50">
    <xpath expr="//t/t/div/div[2]" position="replace">
        <t t-set="address">
            <div t-field="doc.partner_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}"/>
            <p t-if="doc.partner_id.vat"><t t-esc="doc.company_id.country_id.vat_label or 'Tax ID'"/>: <span t-field="doc.partner_id.vat"/></p>
        </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_blanketorder_document.replace_addressblock.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_blanketorder_document.replace_addressblock.xml)

Source: [snippets/mint_system.sale.report_blanketorder_document.replace_addressblock.xml](https://odoo.build/snippets/mint_system.sale.report_blanketorder_document.replace_addressblock.xml)

### Replace Infoblock

ID: `mint_system.sale.report_blanketorder_document.replace_infoblock`

```xml
<data inherit_id="sale.report_blanketorder_document" priority="50">
    <xpath expr="//div[@id='informations']" position="replace">
        <div class="row" id="informations">
            <div class="col-auto col-3 mw-100 mb-2" t-if="doc.client_order_ref">
                <strong>Your Reference</strong>
                <p t-field="doc.client_order_ref"/>
            </div>
            <div class="col-auto col-3 mw-100 mb-2" t-if="doc.partner_sale_id.name and doc.partner_sale_id.parent_id">
                <strong>Contact</strong>
                <p t-field="doc.partner_sale_id.name"/>
            </div>
            <div class="col-auto col-3 mw-100 mb-2">
                <strong>Order Date</strong>
                <p t-field="doc.create_date" t-options="{&quot;widget&quot;: &quot;date&quot;}"/>
            </div>
            <div class="col-auto col-3 mw-100 mb-2">
                <strong>Validity Date</strong>
                <p t-field="doc.validity_date"/>
            </div>
            <div class="col-auto col-3 mw-100 mb-2" t-if="doc.incoterm">
                <strong>Incoterm</strong>
                <p t-field="doc.incoterm"/>
            </div>
            <div class="col-auto col-3 mw-100 mb-2" t-if="doc.user_id.name">
                <strong>Salesperson</strong>
                <p t-field="doc.user_id"/>
            </div>
        </div>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_blanketorder_document.replace_infoblock.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_blanketorder_document.replace_infoblock.xml)

Source: [snippets/mint_system.sale.report_blanketorder_document.replace_infoblock.xml](https://odoo.build/snippets/mint_system.sale.report_blanketorder_document.replace_infoblock.xml)

### Replace Informations

ID: `mint_system.sale.report_blanketorder_document.replace_informations`

```xml
<data inherit_id="sale.report_blanketorder_document" priority="50">
    <xpath expr="//t/t/div/div[2]" position="replace">
        <div class="row" id="informations" style="font-size:16px; margin-bottom: 0rem">
            <div t-if="doc.client_order_ref" class="col-auto col-3 mw-100 mb-2">
                <strong>Your Reference</strong>
                <p t-field="doc.client_order_ref"/>
            </div>
            <div class="col-auto col-3 mw-100 mb-2">
                <strong>Order Date</strong>
                <p t-field="doc.create_date" t-options="{&quot;widget&quot;: &quot;date&quot;}"/>
            </div>
            <div class="col-auto col-3 mw-100 mb-2">
                <strong>Validity Date</strong>
                <p t-field="doc.validity_date"/>
            </div>
            <div class="col-auto col-3 mw-100 mb-2">
                <strong>Incoterm</strong>
                <p t-field="doc.incoterm"/>
            </div>
            <div t-if="doc.user_id.name" class="col-auto col-3 mw-100 mb-2">
                <strong>Salesperson</strong>
                <p t-field="doc.user_id"/>
            </div>
        </div>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_blanketorder_document.replace_informations.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_blanketorder_document.replace_informations.xml)

Source: [snippets/mint_system.sale.report_blanketorder_document.replace_informations.xml](https://odoo.build/snippets/mint_system.sale.report_blanketorder_document.replace_informations.xml)

### Replace Table Attribute

ID: `mint_system.sale.report_blanketorder_document.replace_table_attribute`

```xml
<data inherit_id="sale.report_blanketorder_document" priority="50">
    <xpath expr="//div[@class='col-xs-4 pull-right']" position="attributes">
        <attribute name="t-attf-class">#{'col-4' if report_type != 'html' else 'col-sm-7 col-md-5'} ml-auto</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_blanketorder_document.replace_table_attribute.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_blanketorder_document.replace_table_attribute.xml)

Source: [snippets/mint_system.sale.report_blanketorder_document.replace_table_attribute.xml](https://odoo.build/snippets/mint_system.sale.report_blanketorder_document.replace_table_attribute.xml)

### Replace Title

ID: `mint_system.sale.report_blanketorder_document.replace_title`

```xml
<data inherit_id="sale.report_blanketorder_document" priority="50">
    <xpath expr="//h2" position="replace">
        <h2>
            <span>Blanket Order # </span>
            <span t-field="doc.name"/>
        </h2>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_blanketorder_document.replace_title.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_blanketorder_document.replace_title.xml)

Source: [snippets/mint_system.sale.report_blanketorder_document.replace_title.xml](https://odoo.build/snippets/mint_system.sale.report_blanketorder_document.replace_title.xml)

### Sequence In Table

ID: `mint_system.sale.report_blanketorder_document.sequence_in_table`

```xml
<data inherit_id="sale.report_blanketorder_document" priority="50">
    <xpath expr="/t/t/div/table/thead/tr/th[1]" position="before">
        <th>
            <span>Pos</span>
        </th>
        <xpath expr="//table/tbody/t[2][@t-foreach='doc.order_line']" position="before">
            <t t-set="index" t-value="1"/>
        </xpath>
    </xpath>
    <xpath expr="/t/t/div/table/tbody/t[1]/tr[1]/td[1]" position="before">
        <td>
            <span t-esc="index"/>
            <t t-set="index" t-value="index+1"/>
        </td>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_blanketorder_document.sequence_in_table.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_blanketorder_document.sequence_in_table.xml)

Source: [snippets/mint_system.sale.report_blanketorder_document.sequence_in_table.xml](https://odoo.build/snippets/mint_system.sale.report_blanketorder_document.sequence_in_table.xml)

### Set Ids

ID: `mint_system.sale.report_blanketorder_document.set_ids`

```xml
<data inherit_id="sale.report_blanketorder_document" priority="50">
    <xpath expr="//div[1]/div[4]" position="attributes">
        <attribute name="id">table_total</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_blanketorder_document.set_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_blanketorder_document.set_ids.xml)

Source: [snippets/mint_system.sale.report_blanketorder_document.set_ids.xml](https://odoo.build/snippets/mint_system.sale.report_blanketorder_document.set_ids.xml)

## Report Purchaserequisitions

### Add Adressblock

ID: `mint_system.sale.report_purchaserequisitions.add_adressblock`

```xml
<data inherit_id="sale.report_purchaserequisitions" priority="50">
    <xpath expr="//div/div[1]" position="after">
        <div class="row address" style="font-size:16px; margin-bottom: 2rem">
            <div class="col-5"/>
            <div class="col-5 offset-2">
                <div t-field="o.vendor_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}"/>
            </div>
        </div>
    </xpath>
    <xpath expr="//div[1]/div[2]/div[2]/div[1]" position="attributes">
        <attribute name="t-options-fields">['name', 'address']</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_purchaserequisitions.add_adressblock.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_purchaserequisitions.add_adressblock.xml)

Source: [snippets/mint_system.sale.report_purchaserequisitions.add_adressblock.xml](https://odoo.build/snippets/mint_system.sale.report_purchaserequisitions.add_adressblock.xml)

### Add Description

ID: `mint_system.sale.report_purchaserequisitions.add_description`

```xml
<data inherit_id="sale.report_purchaserequisitions" priority="49">
    <xpath expr="//div/t[2]" position="after">
        <div style="font-size:16px; margin-top: 4rem">
            <p t-field="o.description"/>
        </div>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_purchaserequisitions.add_description.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_purchaserequisitions.add_description.xml)

Source: [snippets/mint_system.sale.report_purchaserequisitions.add_description.xml](https://odoo.build/snippets/mint_system.sale.report_purchaserequisitions.add_description.xml)

### Remove Details

ID: `mint_system.sale.report_purchaserequisitions.remove_details`

```xml
<data inherit_id="sale.report_purchaserequisitions" priority="55">
    <xpath expr="//div/t[2]" position="replace">

</xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_purchaserequisitions.remove_details.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_purchaserequisitions.remove_details.xml)

Source: [snippets/mint_system.sale.report_purchaserequisitions.remove_details.xml](https://odoo.build/snippets/mint_system.sale.report_purchaserequisitions.remove_details.xml)

### Replace Infoblock

ID: `mint_system.sale.report_purchaserequisitions.replace_infoblock`

```xml
<data inherit_id="sale.report_purchaserequisitions" priority="53">
    <xpath expr="//t/t/div/h2" position="after">
        <div class="row mt32 mb32" id="informations" style="font-size:16px; margin-bottom: 0rem">
            <div t-if="o.origin" class="col-auto col-3 mw-100 mb-2">
                <strong>Your Reference:</strong>
                <p t-field="o.origin"/>
            </div>
            <div class="col-auto col-3 mw-100 mb-2">
                <strong>Order Date:</strong>
                <p t-field="o.create_date" t-options="{&quot;widget&quot;: &quot;date&quot;}"/>
            </div>
            <div class="col-auto col-3 mw-100 mb-2">
                <strong>Validity Date:</strong>
                <p t-field="o.date_end" t-options="{&quot;widget&quot;: &quot;date&quot;}"/>
            </div>
            <div class="col-auto col-3 mw-100 mb-2">
                <strong>Salesperson:</strong>
                <p t-field="o.create_uid"/>
            </div>
        </div>
    </xpath>
    <xpath expr="//t/t/div/div[4]" position="replace">
  </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_purchaserequisitions.replace_infoblock.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_purchaserequisitions.replace_infoblock.xml)

Source: [snippets/mint_system.sale.report_purchaserequisitions.replace_infoblock.xml](https://odoo.build/snippets/mint_system.sale.report_purchaserequisitions.replace_infoblock.xml)

### Replace Product Description

ID: `mint_system.sale.report_purchaserequisitions.replace_product_description`

```xml
<data inherit_id="sale.report_purchaserequisitions" priority="50">
    <xpath expr="//th[@id='name']" position="replace"/>
    <xpath expr="//td[@id='name']" position="replace">
        <td id="name">
            <t t-if="line_ids.product_id.type_description">
                <span style="font-weight: bold" t-field="line_ids.product_id.type_description"/>
            </t>
            <t t-if="not line_ids.product_id.type_description">
                <span t-field="line_ids.product_description_variants"/>
            </t>
        </td>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_purchaserequisitions.replace_product_description.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_purchaserequisitions.replace_product_description.xml)

Source: [snippets/mint_system.sale.report_purchaserequisitions.replace_product_description.xml](https://odoo.build/snippets/mint_system.sale.report_purchaserequisitions.replace_product_description.xml)

### Replace Table

ID: `mint_system.sale.report_purchaserequisitions.replace_table`

```xml
<data inherit_id="sale.report_purchaserequisitions" priority="49">
    <xpath expr="//div/t[1]" position="replace">
        <t t-if="o.line_ids">
            <table class="table table-sm">
                <thead>
                    <tr>
                        <th>
                            <strong>Description</strong>
                        </th>
                        <th class="text-right">
                            <strong>Qty</strong>
                        </th>
                        <th class="text-right">
                            <strong>Scheduled Date</strong>
                        </th>
                        <th class="text-right">
                            <strong>Unit Price</strong>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr t-foreach="o.line_ids" t-as="line_ids">
                        <td>
                                        [ <span t-field="line_ids.product_id.code"/> ]
                                        <span t-field="line_ids.product_id.name"/>
                                    </td>
                        <td class="text-right">
                            <span t-field="line_ids.product_qty"/>
                            <span t-field="line_ids.product_uom_id.category_id.name"/>
                        </td>
                        <td class="text-right">
                            <span t-field="line_ids.schedule_date"/>
                        </td>
                        <td class="text-right">
                            <span t-field="line_ids.price_unit"/>
                            <span t-field="o.currency_id"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_purchaserequisitions.replace_table.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_purchaserequisitions.replace_table.xml)

Source: [snippets/mint_system.sale.report_purchaserequisitions.replace_table.xml](https://odoo.build/snippets/mint_system.sale.report_purchaserequisitions.replace_table.xml)

### Sequence In Table

ID: `mint_system.sale.report_purchaserequisitions.sequence_in_table`

```xml
<data inherit_id="sale.report_purchaserequisitions" priority="51">
    <xpath expr="//table/thead/tr[1]/th[1]" position="before">
        <th>
            <span>Pos</span>
        </th>
        <xpath expr="//table/tbody/tr[1]/td[1][@t-foreach='doc.order_line']" position="before">
            <t t-set="index" t-value="1"/>
        </xpath>
    </xpath>
    <xpath expr="//table/tbody/tr[1]/td[1]" position="before">
        <td>
            <span t-esc="index"/>
            <t t-set="index" t-value="index+1"/>
        </td>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_purchaserequisitions.sequence_in_table.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_purchaserequisitions.sequence_in_table.xml)

Source: [snippets/mint_system.sale.report_purchaserequisitions.sequence_in_table.xml](https://odoo.build/snippets/mint_system.sale.report_purchaserequisitions.sequence_in_table.xml)

## Report Saleconfirmation

### Base

ID: `mint_system.sale.report_saleconfirmation.base`

```xml
<t t-name="sale.report_saleconfirmation.base">
    <t t-call="web.html_container">
        <t t-foreach="docs" t-as="doc">
            <t t-set="is_confirmation" t-value="True"/>
            <t t-call="sale.report_saleorder_document" t-lang="doc.partner_id.lang"/>
        </t>
    </t>
</t>

```
Edit: [snippets/mint_system.sale.report_saleconfirmation.base.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleconfirmation.base.xml)

Source: [snippets/mint_system.sale.report_saleconfirmation.base.xml](https://odoo.build/snippets/mint_system.sale.report_saleconfirmation.base.xml)

## Report Saleorder Document

### Add Address

ID: `mint_system.sale.report_saleorder_document.add_address`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">

    <xpath expr="//t[@t-set='address']" position="after">

        <table name="logistic" style="margin-left: 0px; margin-top: 30px; border: transparent">

            <style>
    .company_invoice_line {
    margin-top: 1mm;
    margin-bottom: 2mm;
    }
            </style>

            <tr style="height: 80px;">

                <td style="width: 290px; vertical-align: top; padding-left: 5mm;">


                    <span style="font-size: 7pt">Warenempfänger</span>
                    <hr class="company_invoice_line"/>
                    <div>
                        <t>
                            <div t-field="doc.partner_shipping_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}"/>
                        </t>
                    </div>
                </td>
                <td style="width: 70px"/>
                <td style="width: 260px; vertical-align: top">
                    <span style="font-size: 7pt">Warenversender</span>
                    <hr class="company_invoice_line"/>
                    <div>
                        <t>
                            <div t-field="doc.warehouse_id.partner_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}"/>
                        </t>

                    </div>
                </td>
            </tr>
        </table>
        <table name="detailed_information" style="margin-left: 0px; margin-top: 20px; margin-bottom: 50px; border: transparent; line-height: 1.3">

            <tr>
                <td style="width: 120px; vertical-align: top; padding-left: 5mm;">
                    <t t-if="doc.partner_shipping_id.vat">
                        <div>USt-IdNr.</div>
                    </t>
                    <t t-if="doc.partner_shipping_id.x_vat">
                        <div>MWST Nr.</div>
                    </t>
                    <t t-if="doc.partner_shipping_id.x_eori">
                        <div>EORI Nr.</div>
                    </t>
                    <t t-if="doc.partner_shipping_id.x_zaz">
                        <div>ZAZ Konto Nr.</div>
                    </t>
                </td>
                <td style="width: 180px; vertical-align: top">
                    <t t-if="doc.partner_shipping_id.vat">
                        <div t-field="doc.partner_shipping_id.vat"/>
                    </t>
                    <t t-if="doc.partner_shipping_id.x_vat">
                        <div t-field="doc.partner_shipping_id.x_vat"/>
                    </t>
                    <t t-if="doc.partner_shipping_id.x_eori">
                        <div t-field="doc.partner_shipping_id.x_eori"/>
                    </t>
                    <t t-if="doc.partner_shipping_id.x_zaz">
                        <div t-field="doc.partner_shipping_id.x_zaz"/>
                    </t>
                </td>
                <td style="width: 60px"/>
                <td style="width: 100px; vertical-align: top">
                    <t t-if="doc.warehouse_id.partner_id.vat">
                        <div>USt-IdNr.</div>
                    </t>
                    <t t-if="doc.warehouse_id.partner_id.x_vat">
                        <div>MWST Nr.</div>
                    </t>
                    <t t-if="doc.warehouse_id.partner_id.x_eori">
                        <div>EORI Nr.</div>
                    </t>
                    <t t-if="doc.warehouse_id.partner_id.x_zaz">
                        <div>ZAZ Konto Nr.</div>
                    </t>
                </td>
                <td style="width: 180px; vertical-align: top">
                    <t t-if="doc.warehouse_id.partner_id.vat">
                        <div t-field="doc.warehouse_id.partner_id.vat"/>
                    </t>
                    <t t-if="doc.warehouse_id.partner_id.x_vat">
                        <div t-field="doc.warehouse_id.partner_id.x_vat"/>
                    </t>
                    <t t-if="doc.warehouse_id.partner_id.x_eori">
                        <div t-field="doc.warehouse_id.partner_id.x_eori"/>
                    </t>
                    <t t-if="doc.warehouse_id.partner_id.x_zaz">
                        <div t-field="doc.warehouse_id.partner_id.x_zaz"/>
                    </t>
                </td>
            </tr>

            <t t-if="is_pro_forma">
                <tr>
                    <td style="width: 280px; padding-top: 20px; vertical-align: top; padding-left: 5mm;" colspan="2">
                        <t t-if="doc.partner_shipping_id.x_remarks">
                            <div t-field="doc.partner_shipping_id.x_remarks"/>
                        </t>
                    </td>

                    <td style="width: 60px"/>

                    <td style="width: 280px; padding-top: 20px; vertical-align: top; padding-left: 0;" colspan="2">
                        <t t-if="doc.warehouse_id.partner_id.x_remarks">
                            <div t-field="doc.warehouse_id.partner_id.x_remarks"/>
                        </t>
                    </td>
                </tr>
            </t>

        </table>

    </xpath>
</data>
```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_address.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_address.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_address.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_address.xml)

### Add Address Space

ID: `mint_system.sale.report_saleorder_document.add_address_space`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <t t-set="address" position="before">
        <style>
            div.address {
                padding-top: 3rem
            }
        </style>
    </t>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_address_space.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_address_space.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_address_space.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_address_space.xml)

### Add Blanket Order Line

ID: `mint_system.sale.report_saleorder_document.add_blanket_order_line`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//td[@name='td_product_uom_qty']" position="inside">
        <t t-if="doc.x_incoterm_blanket_order">
            <p t-field="doc.x_incoterm_blanket_order.code"/>
        </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_blanket_order_line.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_blanket_order_line.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_blanket_order_line.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_blanket_order_line.xml)

### Add Commitment Date

ID: `mint_system.sale.report_saleorder_document.add_commitment_date`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//th[@name='th_description']" position="after">
        <th id="commitment_date">
            <span>Geplantes Datum ETD</span>
        </th>
    </xpath>
    <xpath expr="//td[@name='td_name']" position="after">
        <td id="commitment_datet">
            <span t-out="line.commitment_date"/>
        </td>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_commitment_date.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_commitment_date.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_commitment_date.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_commitment_date.xml)

### Add Country Of Origin

ID: `mint_system.sale.report_saleorder_document.add_country_of_origin`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//th[@name='th_quantity']" position="before">
        <th name="th_country_of_origin" class="text-start">Origin</th>
    </xpath>
    <xpath expr="//td[@name='td_quantity']" position="before">
        <td name="td_country_of_origin" class="text-start">
            <span t-field="line.product_id.country_of_origin.code"/>
        </td>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_country_of_origin.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_country_of_origin.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_country_of_origin.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_country_of_origin.xml)

### Add Default Code

ID: `mint_system.sale.report_saleorder_document.add_default_code`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//table/thead/tr/th[1]" position="before">
        <th id="header_default_code">
            <span>Referenz</span>
        </th>
    </xpath>
    <xpath expr="//t[1]/td[1]" position="before">
        <td id="default_code">
            <span t-field="line.product_id.default_code"/>
        </td>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_default_code.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_default_code.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_default_code.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_default_code.xml)

### Add Delivery

ID: `mint_system.sale.report_saleorder_document.add_delivery`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//div/table/thead/tr/th[4]" position="after">
        <th>
            <span>LS</span>
        </th>
    </xpath>
    <xpath expr="//div/table/tbody/t[2]/tr/t[1]/td[3]" position="after">
        <td>
            <span t-field="line.move_ids.picking_id"/>
            <br/>
            <span t-field="line.move_ids.picking_id.date_done"/>
        </td>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_delivery.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_delivery.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_delivery.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_delivery.xml)

### Add Delivery Date

ID: `mint_system.sale.report_saleorder_document.add_delivery_date`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <!-- Version 17-->

    <xpath expr="//th[@name='th_quantity']" position="after">
        <th class="text-start">
            <span>Lieferdatum</span>
        </th>
    </xpath>

    <xpath expr="//td[@name='td_quantity']" position="after">
        <td>
            <span t-field="line.commitment_date" t-options="{&quot;format&quot;: &quot;dd.MM.yyyy&quot;}"/>
        </td>
    </xpath>
    
    <!--
    <xpath expr="//div/table/thead/tr/th[4]" position="after">
        <th>
            <span>Del. Date</span>
        </th>
    </xpath>
    <xpath expr="//div/table/tbody/t[2]/tr/t[1]/td[4]" position="after">
        <td>
            <span t-field="line.commitment_date"/>
        </td>
    </xpath>
    <xpath expr="//div/table/tbody/t[2]/t[3]/tr/td" position="attributes">
        <attribute name="colspan">100</attribute>
    </xpath>
    <xpath expr="//div/table[1]/tbody[1]/t[2]/tr[1]/t[1]/td[5]/span[1]" position="attributes">
        <attribute name="t-options-widget">"date"</attribute>
    </xpath>    
    -->
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_delivery_date.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_delivery_date.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_delivery_date.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_delivery_date.xml)

### Add Delivery Dates

ID: `mint_system.sale.report_saleorder_document.add_delivery_dates`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//th[@name='th_priceunit']" position="before">
        <th name="th_delivery_dates" class="text-right">Delivery Date</th>
    </xpath>
    <xpath expr="//td[@name='td_priceunit']" position="before">
        <td name="td_delivery_dates" class="text-right">
            <span t-field="line.delivery_dates" t-options="{&quot;widget&quot;: &quot;date&quot;}"/>
        </td>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_delivery_dates.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_delivery_dates.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_delivery_dates.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_delivery_dates.xml)

### Add Drawing

ID: `mint_system.sale.report_saleorder_document.add_drawing`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//td[@name='td_name']" position="inside">
        <t t-if="line.product_id.drawing_file">
            <br/>
            <span>Drawing: </span>
            <a t-attf-href="{{line.product_id.drawing_file.url}}">
                <span t-field="line.product_id.drawing_file.display_name"/>
            </a>
        </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_drawing.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_drawing.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_drawing.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_drawing.xml)

### Add Footer

ID: `mint_system.sale.report_saleorder_document.add_footer`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//div/p[@name='order_note']/.." position="after">
        <style>
      table#footer {
        width: 100%;
        font-size: 8pt;
        margin-top: 25px;
        border-color: white;
        line-height: 1.5;
      }
      table#footer tr, td {
        vertical-align: top;
        border-color: white;
      }
    </style>
        <table id="footer">
            <tr>
                <td width="50%" t-if="doc.payment_term_id">
                    <span>Zahlungsbedingungen </span>
                    <span t-field="doc.payment_term_id"/>
                </td>
                <td width="50%" t-if="not doc.payment_term_id">
        </td>
                <td width="50%">
          Lieferung gem&#xE4;ss unseren allgemeinen Lieferbedingungen
        </td>
            </tr>
            <tr>
                <td>
                    <span>MWST-Nr: </span>
                    <span t-field="doc.company_id.vat"/>
                </td>
                <td>
                    <table width="100%">
                        <tr>
                            <td width="35%">
               Bankverbindungen:
            </td>
                            <td width="65%">
              UBS AG, 6301 Zug, BLZ 273, SWIFT UBSWCHZH80A
             </td>
                        </tr>
                        <tr>
                            <td>
            </td>
                            <td>
            (CHF) IBAN CH63 0027 3273 Q978 6962 0
            </td>
                        </tr>
                        <tr>
                            <td>
            </td>
                            <td>
            (EUR) IBAN CH59 0027 3273 HN10 3698 0
            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_footer.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_footer.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_footer.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_footer.xml)

### Add General Information

ID: `mint_system.sale.report_saleorder_document.add_general_information`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">

    <xpath expr="//div[@name='so_total_summary']" position="after">
        
        <t t-if="is_pro_forma">
        </t>
        
        <t t-else="">
            <t t-if="doc.company_id.id == 1">
                <table style="margin-left: 0px; margin-top: 30px; border: transparent">
                    <tr style="height: 100px;">
                        <td style="width: 335px; font-size: 6pt; padding-bottom: 0px">
                            <span>Es gelten die Allgemeinen Verkaufs- und Lieferbedingungen der Lapp Engineering AG</span><br/>
                            <span>Aktuelle Version siehe www.lapp.ch</span>
                        </td>
                        <td style="width: 50px"/>
                        <td style="width: 300px; vertical-align: top">
                            <div style="font-weight: bold; padding-bottom: 15px">
                                <span>Zahlung: </span>
                                <span t-field="doc.payment_term_id"/>
                            </div>
                            <div>
                                <t>
                                    <div t-field="doc.company_id.partner_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}"/>
                                    IBAN CH71 0483 5165 9043 4200 0 (EUR)
                                </t>
                            </div>
                        </td>
                    </tr>
                </table>
            </t>
            
           
                
             <t t-if="doc.company_id.id == 2">
                <table style="margin-left: 0px; margin-top: 30px; border: transparent">
                    <tr style="height: 100px;">
                        <td style="width: 325px; font-size: 6pt; padding-bottom: 0px">
                            <span>Es gelten die Allgemeinen Verkaufs- und Lieferbedingungen der Xinomer AG</span><br/>
                            <span>Aktuelle Version siehe www.xinomer.ch</span>
                        </td>
                        <td style="width: 50px"/>
                        <td style="width: 300px; vertical-align: top">
                            <div style="font-weight: bold; padding-bottom: 15px">
                                <span>Zahlung: </span>
                                <span t-field="doc.payment_term_id"/>
                            </div>
                            <div>
                                <t>
                                    <div t-field="doc.company_id.partner_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}"/>
                                    <span>IBAN</span>
                                    <span t-field="doc.company_id.partner_id.bank_ids[0].acc_number"/>
                                    <span>(</span>
                                    <span t-field="doc.company_id.partner_id.bank_ids[0].currency_id"/>
                                    <span>)</span>
                                </t>
                            </div>
                        </td>
                    </tr>
                </table>
            </t>
           
            
        
        </t>

    </xpath>
</data>
```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_general_information.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_general_information.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_general_information.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_general_information.xml)

### Add Header And Footer Note

ID: `mint_system.sale.report_saleorder_document.add_header_and_footer_note`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//table[@id='info']" position="after">
        <!--
        <xpath expr="//div[@id='informations']" position="after">
        -->
        <t t-if="doc.note_header != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
            <span class="note" t-field="doc.note_header"/>
        </t>
    </xpath>
    <xpath expr="//div[@name='signature']" position="before">
        <t t-if="doc.note_footer != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
            <span class="note" t-field="doc.note_footer"/>
        </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_header_and_footer_note.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_header_and_footer_note.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_header_and_footer_note.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_header_and_footer_note.xml)

### Add Header Space

ID: `mint_system.sale.report_saleorder_document.add_header_space`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//h2" position="attributes">
        <attribute name="style">padding-top: 5rem</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_header_space.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_header_space.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_header_space.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_header_space.xml)

### Add Hs Code

ID: `mint_system.sale.report_saleorder_document.add_hs_code`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//th[@name='th_quantity']" position="before">
        <th name="th_hs_code" class="text-start">HS-Code</th>
    </xpath>
    <xpath expr="//td[@name='td_quantity']" position="before">
        <td name="td_hs_code" class="text-start">
            <span t-field="line.product_id.hs_code"/>
        </td>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_hs_code.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_hs_code.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_hs_code.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_hs_code.xml)

### Add Hs Code2

ID: `mint_system.sale.report_saleorder_document.add_hs_code2`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">

    <xpath expr="//td[@name='td_name']/../.." position="after">
        <tr style="border-top: solid white !important">
            <td/>
            <td colspan="3">
                <span t-field="line.name"/>
                <t t-if="line.product_id.hs_code">
                    <br/>
                    <span>HS-Code: </span>
                    <span t-field="line.product_id.hs_code"/>
                </t>
            </td>
            <td/>
        </tr>
    </xpath>

    <xpath expr="//td[@name='td_name']" position="replace">
        <td name="td_name">
            <strong t-field="line.product_template_id"/>
        </td>
    </xpath>

</data>
```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_hs_code2.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_hs_code2.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_hs_code2.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_hs_code2.xml)

### Add Incoterm

ID: `mint_system.sale.report_saleorder_document.add_incoterm`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
  
<xpath expr="/t/t/div/div[5]" position="after">
    <div class="row">
      <div class="col">
        <span t-if="doc.incoterm.display_name">
           Incoterms: <strong t-field="doc.incoterm.display_name"/>
        </span>
      </div>
    </div>
  </xpath>
  
</data>
```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_incoterm.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_incoterm.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_incoterm.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_incoterm.xml)

### Add Incoterm Blanket Order

ID: `mint_system.sale.report_saleorder_document.add_incoterm_blanket_order`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//div[@id='incoterm']" position="replace">
        <div id="incoterm" class="col-3" t-if="doc.incoterm" groups="sale_stock.group_display_incoterm">
            <strong>Incoterm:</strong>
            <t t-if="doc.x_incoterm_blanket_order">
                <p t-field="doc.x_incoterm_blanket_order.code"/>
            </t>
            <t t-else="">
                <p t-field="doc.incoterm.code"/>
            </t>
        </div>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_incoterm_blanket_order.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_incoterm_blanket_order.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_incoterm_blanket_order.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_incoterm_blanket_order.xml)

### Add Informations Space

ID: `mint_system.sale.report_saleorder_document.add_informations_space`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//div[@id='informations']" position="before">
        <style>
            div#informations {
                padding-top: 1rem;
                padding-bottom: 1rem
            }
        </style>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_informations_space.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_informations_space.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_informations_space.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_informations_space.xml)

### Add Infotable

ID: `mint_system.sale.report_saleorder_document.add_infotable`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//h2" position="after">
        <style>
      table#info {
        width: 100%;
        margin-bottom: 25px;
        font-size: 9pt;
        font-family: arial;
        border-color: white;
      }
        table#info tr {
        line-height: 1.2;
        text-align: left;
      }
       table#info span {
       line-height: 1.2;
      }
        .note {
        font-size: 9pt;
      }
    </style>
        <table id="info">
            <tr>
                <td width="17%">Date</td>
                <td width="40%">
                    <span t-field="doc.date_order" t-options="{ &quot;widget&quot;: &quot;date&quot; }"/>
                </td>
                <td width="18%">Our Reference</td>
                <td width="25%">
                    <span t-field="doc.user_id"/>
                </td>
            </tr>
            <tr>
                <td>Customer No.</td>
                <td>
                    <span t-field="doc.partner_id.ref"/>
                </td>
                <td>Delivery Method</td>
                <td>
                    <span t-field="doc.carrier_id"/>
                </td>
            </tr>
            <tr>
                <td>Order</td>
                <td>
                    <span t-field="doc.client_order_ref"/>
                </td>
                <td>Incoterm</td>
                <td>
                    <span t-field="doc.incoterm"/>
                </td>
            </tr>
            <tr>
                <td>Reference</td>
                <td>
                    <span t-field="doc.comment"/>
                </td>
                <t t-if="doc.blanket_order_id">
                    <td>Blanket Order</td>
                    <td>
                        <span t-field="doc.blanket_order_id"/>
                        <t t-if="doc.blanket_order_id.client_order_ref"> /              <span t-field="doc.blanket_order_id.client_order_ref"/>
            </t>
                    </td>
                </t>
                <t t-else="">
                    <td/>
                    <td/>
                </t>
            </tr>
        </table>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_infotable.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_infotable.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_infotable.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_infotable.xml)

### Add Intrastat Id

ID: `mint_system.sale.report_saleorder_document.add_intrastat_id`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//th[@name='th_quantity']" position="after">
        <th name="th_hs_code" class="text-right">HS Code</th>
    </xpath>
    <xpath expr="//td[@name='td_quantity']" position="after">
        <td name="td_hs_code" class="text-right">
            <span t-field="line.product_id.intrastat_code_id.code"/>
        </td>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_intrastat_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_intrastat_id.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_intrastat_id.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_intrastat_id.xml)

### Add Note

ID: `mint_system.sale.report_saleorder_document.add_note`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//div[@name='signature']" position="before">
        <div style="margin-top: 50px">
            <div>
                <t t-if="doc.partner_id.country_id.code == 'CH'">
                    <span>The exporter of the products covered by this document declares that, except where otherwise clearly indicated, these products are of swiss preferential origin.</span>
                    <br/>
                    <span style="font-style: italic">"The total quantity of delivered products is missing from delivery note"</span>
                </t>
                <t t-elif="doc.partner_id.country_id.code == 'DE'">
                    <span style="font-weight: bold">EORI: DE379461566911068 / Incoterms: DAP</span>
                    <br/>
                    <span>The exporter of the products covered by this document declares that, except where otherwise clearly indicated, these products are of swiss preferential origin.</span>
                    <br/>
                    <span style="font-style: italic">"The total quantity of delivered products is missing from delivery note"</span>
                </t>
                <t t-elif="doc.partner_id.country_id.code in ['GR', 'AL', 'HR', 'MNE', 'MC']">
                    <span style="font-weight: bold">EORI: DE379461566911068 / Incoterms: Ex-works / Tax free intracommunity delivery acc. to UstG &#xA7;6a.</span>
                    <br/>
                    <span>The exporter of the products covered by this document declares that, except where otherwise clearly indicated, these products are of swiss preferential origin.</span>
                    <br/>
                    <span style="font-style: italic">"The total quantity of delivered products is missing from delivery note"</span>
                </t>
                <t t-elif="doc.partner_id.country_id.country_group_ids and doc.partner_id.country_id.country_group_ids[0].id == 1">
                    <span style="font-weight: bold">EORI: DE379461566911068 / Incoterms: DDP / Tax free intracommunity delivery acc. to UstG &#xA7;6a.</span>
                    <br/>
                    <span>The exporter of the products covered by this document declares that, except where otherwise clearly indicated, these products are of swiss preferential origin.</span>
                    <br/>
                    <span style="font-style: italic">"The total quantity of delivered products is missing from delivery note"</span>
                </t>
                <t t-else="">
                    <span style="font-weight: bold">Incoterms: Ex-works</span>
                    <br/>
                    <span>The exporter of the products covered by this document declares that, except where otherwise clearly indicated, these products are of swiss preferential origin.</span>
                    <br/>
                    <span style="font-style: italic">"The total quantity of delivered products is missing from delivery note"</span>
                </t>
            </div>
        </div>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_note.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_note.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_note.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_note.xml)

### Add Note Space

ID: `mint_system.sale.report_saleorder_document.add_note_space`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <p t-field="doc.note" position="replace">
        <style>
            div#note {
                padding-top: 50px;
                padding-left: 75px;
                padding-right: 75px;
            }
        </style>
        <div id="note">
            <p t-field="doc.note"/>
        </div>
    </p>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_note_space.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_note_space.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_note_space.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_note_space.xml)

### Add Notes

ID: `mint_system.sale.report_saleorder_document.add_notes`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="/t/t/div/div[2]" position="after">
        <t t-if="doc.note_header">
            <div class="row">
                <div class="col">
                    <span t-field="doc.note_header"/>
                    <br/>
                </div>
            </div>
        </t>
    </xpath>
    <xpath expr="/t/t/div/p[2]" position="before">
        <t t-if="doc.note_footer">
            <div class="row">
                <div class="col">
                    <span t-field="doc.note_footer"/>
                    <br/>
                </div>
            </div>
        </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_notes.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_notes.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_notes.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_notes.xml)

### Add Partner Contact Id

ID: `mint_system.sale.report_saleorder_document.add_partner_contact_id`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//div[@id='informations']//p[@t-field='doc.client_order_ref']/.." position="after">
        <div t-if="doc.partner_contact_id.name and doc.partner_contact_id.parent_id" class="col-auto col-3 mw-100 mb-2">
            <strong>Contact</strong>
            <p t-field="doc.partner_contact_id.name"/>
        </div>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_partner_contact_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_partner_contact_id.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_partner_contact_id.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_partner_contact_id.xml)

### Add Partner Sale Id

ID: `mint_system.sale.report_saleorder_document.add_partner_sale_id`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//div[@id='informations']//span[@t-field='doc.client_order_ref']/.." position="after">
        <div t-if="doc.partner_sale_id.name and doc.partner_sale_id.parent_id" class="col-auto col-3 mw-100 mb-2">
            <strong>Contact</strong>
            <p t-field="doc.partner_sale_id.name"/>
        </div>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_partner_sale_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_partner_sale_id.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_partner_sale_id.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_partner_sale_id.xml)

### Add Percentage Sign

ID: `mint_system.sale.report_saleorder_document.add_percentage_sign`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//span[@t-field='line.discount']" position="replace">
        <span t-field="line.discount"/>
        <span>%</span>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_percentage_sign.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_percentage_sign.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_percentage_sign.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_percentage_sign.xml)

### Add Product Uom

ID: `mint_system.sale.report_saleorder_document.add_product_uom`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//th[@name='th_quantity']" position="after">
        <th name="th_product_uom" class="text-right">ME</th>
    </xpath>
    <xpath expr="//td[@name='td_quantity']" position="after">
        <td name="td_product_uom" class="text-right">
            <span t-field="line.product_uom"/>
        </td>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_product_uom.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_product_uom.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_product_uom.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_product_uom.xml)

### Add Proforma Note

ID: `mint_system.sale.report_saleorder_document.add_proforma_note`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <!-- <xpath expr="//p[@name='order_note']" position="after"> -->
    <xpath expr="//span[@name='order_note']" position="after">
        <t t-if="is_pro_forma">
            <span>
                <p>Der Ausf&#xFC;hrer der Waren, auf die sich dieses Handelspapier bezieht, erkl&#xE4;rt, dass diese Waren, soweit nicht anders angegeben, pr&#xE4;ferenzbeg&#xFC;nstigte Schweiz Ursprungswaren sind.<br/><br/></p>
                <p>Unterschrift: _______________________&#xA0;&#xA0;&#xA0;&#xA0;Datum: _______________________<br/>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;Aersolution Interior AG<br/></p>
            </span>
        </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_proforma_note.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_proforma_note.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_proforma_note.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_proforma_note.xml)

### Add Ref External

ID: `mint_system.sale.report_saleorder_document.add_ref_external`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//t[@t-set='address']/p[1]" position="after">
        <p t-if="doc.partner_id.ref_external">Ref: <span t-field="doc.partner_id.ref_external"/></p>
    </xpath>
</data>
```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_ref_external.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_ref_external.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_ref_external.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_ref_external.xml)

### Add Section Subtotal Space

ID: `mint_system.sale.report_saleorder_document.add_section_subtotal_space`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//td[@name='td_section_subtotal']/.." position="after">
        <tr>
            <td name="td_section_subtotal_space" colspan="99" height="25px"/>
        </tr>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_section_subtotal_space.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_section_subtotal_space.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_section_subtotal_space.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_section_subtotal_space.xml)

### Add Shipping Address Space

ID: `mint_system.sale.report_saleorder_document.add_shipping_address_space`

```xml
<data inherit_id="sale.report_saleorder_document" priority="55">
    <xpath expr="//t[@t-set='information_block']/t/strong" position="attributes">
        <attribute name="class">mt-3 d-block</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_shipping_address_space.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_shipping_address_space.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_shipping_address_space.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_shipping_address_space.xml)

### Add Signature Note

ID: `mint_system.sale.report_saleorder_document.add_signature_note`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <p t-field="doc.note" position="after">
        <t t-if="doc.state != 'sale'">
            <style>
            div#signature {
                padding-top: 50px;
                padding-left: 75px;
                padding-right: 75px;
            }
            </style>
            <div id="signature">
                <p>Hiermit bestelle wir die Produkte/Dienstleistungen gem&#xE4;ss diesem Angebot.<br/>
                <br/>
                <br/>
            Ort/Datum: _________________ Unterschrift Kunde: __________________________________ </p>
            </div>
        </t>
    </p>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_signature_note.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_signature_note.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_signature_note.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_signature_note.xml)

### Add Taxes

ID: `mint_system.sale.report_saleorder_document.add_taxes`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//th[@name='th_subtotal']" position="after">
        <th id="tax_amount">
            <span/>
        </th>
    </xpath>
    <xpath expr="//td[@name='td_subtotal']" position="after">
        <td id="tax_amount">
            <span t-out="line.tax_id.amount"/>
        </td>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_taxes.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_taxes.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_taxes.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_taxes.xml)

### Add Validity Date

ID: `mint_system.sale.report_saleorder_document.add_validity_date`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//p[@name='order_note']" position="before">
        <t t-if="doc.state != 'sale'">
            <p>
    G&#xFC;ltigkeit der Offerte: <span t-field="doc.validity_date"/>
      </p>
        </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_validity_date.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_validity_date.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_validity_date.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_validity_date.xml)

### Add Weight

ID: `mint_system.sale.report_saleorder_document.add_weight`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//th[@name='th_quantity']" position="inside">
        <br/>
        <i>Weight</i>
    </xpath>
    <xpath expr="//th[@name='th_subtotal']" position="inside">
        <br/>
        <i>Weight</i>
    </xpath>
    <xpath expr="//td[@name='td_quantity']" position="inside">
        <br/>
        <i>
            <span t-field="line.x_studio_weight"/>
            <span t-field="line.product_id.weight_uom_name"/>
        </i>
    </xpath>
    <xpath expr="//td[@name='td_subtotal']" position="inside">
        <br/>
        <i>
            <span t-field="line.x_studio_float_field_fBm1P"/>
            <span t-field="line.product_id.weight_uom_name"/>
        </i>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.add_weight.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.add_weight.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.add_weight.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.add_weight.xml)

### Address Block

ID: `mint_system.sale.report_saleorder_document.address_block`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <style>
      .address {
        font-size: 10pt;
        font-family: arial;
        line-height: 1.2;
        text-align: left;
      }
      .title {
        font-size: 8pt;
        font-weight: bold;
        padding-bottom: 3px;
      }
      .margin {
        padding-bottom: 33mm;
      }
  </style>
    <xpath expr="//t[@t-set='address']/div" position="replace">
        <div class="address margin">
            <t t-if="doc.partner_sale_id">
                <div t-esc="doc.partner_sale_id.parent_id.name"/>
                <div t-esc="doc.partner_sale_id.parent_id.name2"/>
                <span t-esc="doc.partner_sale_id.title.name"/>
                <span t-esc="doc.partner_sale_id.name"/>
                <div t-esc="doc.partner_sale_id.street"/>
                <div t-esc="doc.partner_sale_id.street2"/>
                <span t-esc="doc.partner_sale_id.zip"/>
                <span t-esc="doc.partner_sale_id.city"/>
                <t t-if="doc.partner_sale_id.country_id.code != 'CH'">
                    <div t-esc="doc.partner_sale_id.country_id.name"/>
                </t>
            </t>
            <t t-else="">
                <div t-field="doc.partner_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: False}" name="partner_sale_id"/>
            </t>
        </div>
    </xpath>
    <xpath expr="//t[@t-set='information_block']/../t" position="replace">
        <t class="address" t-set="information_block">
            <t t-if="doc.partner_shipping_id == doc.partner_invoice_id">
                <div class="title">Invoicing and Shipping Address:</div>
                <div t-field="doc.partner_shipping_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: False}"/>
            </t>
            <t t-if="doc.partner_shipping_id != doc.partner_invoice_id">
                <div class="title">Shipping Address:</div>
                <div t-field="doc.partner_shipping_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: False}"/>
            </t>
        </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.address_block.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.address_block.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.address_block.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.address_block.xml)

### Append Payment Terms

ID: `mint_system.sale.report_saleorder_document.append_payment_terms`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//div/span[@t-field='doc.note']/.." position="before">
        <div class="row" style="margin-top: 1rem; margin-bottom: 1rem">
            <div class="col">
                <strong>Zahlungsbedingungen: </strong>
                <t t-if="doc.x_payment_term_blanket_order">
                    <span t-field="doc.x_payment_term_blanket_order"/>
                </t>
                <t t-if="not doc.x_payment_term_blanket_order">
                    <span t-field="doc.payment_term_id.name"/>
                </t>
            </div>
        </div>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.append_payment_terms.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.append_payment_terms.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.append_payment_terms.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.append_payment_terms.xml)

### Confirmation Filter Lines

ID: `mint_system.sale.report_saleorder_document.confirmation_filter_lines`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//t[@t-foreach='lines_to_report']" position="attributes">
        <attribute name="t-foreach">lines_to_report.filtered(lambda l: not is_confirmation or (is_confirmation and l.qty_to_deliver &gt; 0))</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.confirmation_filter_lines.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.confirmation_filter_lines.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.confirmation_filter_lines.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.confirmation_filter_lines.xml)

### Confirmation Header Quantity

ID: `mint_system.sale.report_saleorder_document.confirmation_header_quantity`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//th[@name='th_quantity']" position="replace">
        <t t-if="is_confirmation">
            <th name="th_quantity" id="product_uom_qty" class="text-right">Backlog</th>
        </t>
        <t t-else="">
            <th name="th_quantity" id="product_uom_qty" class="text-right">Quantity</th>
        </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.confirmation_header_quantity.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.confirmation_header_quantity.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.confirmation_header_quantity.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.confirmation_header_quantity.xml)

### Confirmation Qty To Deliver

ID: `mint_system.sale.report_saleorder_document.confirmation_qty_to_deliver`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//td[@name='td_quantity']/span[1]" position="replace">
        <t t-if="is_confirmation">
            <span id="product_uom_qty_confirmed" t-esc="line.qty_to_deliver"/>
        </t>
        <t t-else="">
            <span id="product_uom_qty" t-esc="line.product_uom_qty"/>
        </t>
    </xpath>
    <xpath expr="//td[@name='td_subtotal']" position="replace">
        <t t-if="is_confirmation">
            <td name="td_subtotal" class="text-right o_price_total">
                <span t-esc="'%.2f' % (line.price_unit * line.qty_to_deliver * ((line.discount or 100.0) / 100.0))" groups="account.group_show_line_subtotals_tax_excluded"/>
                <span t-esc="'%.2f' % (line.price_unit * line.qty_to_deliver * ((line.discount or 100.0) / 100.0))" groups="account.group_show_line_subtotals_tax_included"/>
            </td>
        </t>
        <t t-else="">
            <td name="td_subtotal" class="text-right o_price_total">
                <span t-field="line.price_subtotal" groups="account.group_show_line_subtotals_tax_excluded"/>
                <span t-field="line.price_total" groups="account.group_show_line_subtotals_tax_included"/>
            </td>
        </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.confirmation_qty_to_deliver.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.confirmation_qty_to_deliver.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.confirmation_qty_to_deliver.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.confirmation_qty_to_deliver.xml)

### Confirmation Title

ID: `mint_system.sale.report_saleorder_document.confirmation_title`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//h2" position="replace">
        <h2>
            <span t-if="env.context.get('proforma', False) or is_pro_forma">Pro-Forma Invoice # </span>
            <span t-elif="is_confirmation">Confirmation # </span>
            <span t-elif="doc.state not in ['draft','sent'] and not is_confirmation">Order # </span>
            <span t-elif="doc.state in ['draft','sent'] and not is_confirmation">Quotation # </span>
            <span t-field="doc.name"/>
        </h2>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.confirmation_title.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.confirmation_title.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.confirmation_title.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.confirmation_title.xml)

### Convert Html Note

ID: `mint_system.sale.report_saleorder_document.convert_html_note`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//td[@name='td_note_line']/.." position="replace">
        <t t-if="line.display_type == 'line_note' and not '&lt;!DOCTYPE html&gt;' in line.name">
            <td name="td_note_line" colspan="99">
                <span t-field="line.name"/>
            </td>
        </t>
    </xpath>
    <xpath expr="//td[@name='td_section_subtotal']/../.." position="after">
        <t t-if="line.display_type == 'line_note' and '&lt;!DOCTYPE html&gt;' in line.name">
            <td name="td_html_line" colspan="99">
                <t t-raw="line.name.replace('&lt;!DOCTYPE html&gt;', '')"/>
            </td>
        </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.convert_html_note.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.convert_html_note.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.convert_html_note.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.convert_html_note.xml)

### Display Shipping And Delivery Address

ID: `mint_system.sale.report_saleorder_document.display_shipping_and_delivery_address`

```xml
<data inherit_id="sale.report_saleorder_document" priority="55">
    <xpath expr="//t[@t-set='information_block']/.." position="attributes">
        <attribute name="t-if"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.display_shipping_and_delivery_address.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.display_shipping_and_delivery_address.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.display_shipping_and_delivery_address.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.display_shipping_and_delivery_address.xml)

### Expand Product Description

ID: `mint_system.sale.report_saleorder_document.expand_product_description`

```xml
<data inherit_id="sale.report_saleorder_document" priority="56">
    <xpath expr="/t/t/div/table[2]/tbody/t[2]/tr/t[1]/td[3]/span" position="replace">
        <t>
            <span style="font-weight:bold;" t-field="line.product_id.type_description"/>
        </t>
        <t>
            <br/>
            <span t-field="line.product_id.name"/>
        </t>
        <t><br/>
      Ursprungsland: <span t-field="line.product_id.country_of_origin_id.code"/> / Zollposition: <span t-field="line.product_id.hs_code"/>
    </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.expand_product_description.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.expand_product_description.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.expand_product_description.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.expand_product_description.xml)

### Format Address Blocks

ID: `mint_system.sale.report_saleorder_document.format_address_blocks`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//t[@t-set='address']/div" position="attributes">
        <attribute name="style">font-size:10pt; line-height: 1.2; padding-bottom:33mm</attribute>
    </xpath>
    <xpath expr="//t[@t-set='information_block']/strong[1]" position="attributes">
        <attribute name="style">font-size:10pt; line-height: 1.2;</attribute>
    </xpath>
    <xpath expr="//t[@t-set='information_block']/strong[2]" position="attributes">
        <attribute name="style">font-size:10pt; line-height: 1.2;</attribute>
    </xpath>
    <xpath expr="//t[@t-set='information_block']/div" position="attributes">
        <attribute name="style">font-size:10pt; line-height: 1.2;</attribute>
    </xpath>
    <xpath expr="//t[@t-set='information_block']/t/strong" position="attributes">
        <attribute name="style">font-size:10pt; line-height: 1.2;</attribute>
    </xpath>
    <xpath expr="//t[@t-set='information_block']/t/div" position="attributes">
        <attribute name="style">font-size:10pt; line-height: 1.2;</attribute>
    </xpath>
    <xpath expr="//t[@t-set='information_block']/div" position="attributes">
        <attribute name="t-options-fields">['address', 'name']</attribute>
    </xpath>
    <xpath expr="//t[@t-set='information_block']/t/div" position="attributes">
        <attribute name="t-options-fields">['address', 'name']</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.format_address_blocks.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.format_address_blocks.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.format_address_blocks.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.format_address_blocks.xml)

### Format As Date

ID: `mint_system.sale.report_saleorder_document.format_as_date`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//div[1]/div[2]/div[2]/p[1]" position="attributes">
        <attribute name="t-options-widget">"date"</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.format_as_date.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.format_as_date.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.format_as_date.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.format_as_date.xml)

### Format Clearfix

ID: `mint_system.sale.report_saleorder_document.format_clearfix`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//div[@name='so_total_summary']/div/div" position="attributes">
        <attribute name="t-attf-class"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.format_clearfix.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.format_clearfix.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.format_clearfix.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.format_clearfix.xml)

### Format Discount

ID: `mint_system.sale.report_saleorder_document.format_discount`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <span t-field="line.discount" position="replace">
        <span t-esc="'{0:.2f}'.format(line.discount)"/>
    </span>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.format_discount.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.format_discount.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.format_discount.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.format_discount.xml)

### Format Line Total

ID: `mint_system.sale.report_saleorder_document.format_line_total`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//span[@t-field='line.price_subtotal']" position="replace">
        <span class="text-nowrap" t-esc="('{:,.2f}'.format(line.price_subtotal)).replace(',','\'')" groups="account.group_show_line_subtotals_tax_excluded"/>
    </xpath>
    <xpath expr="//span[@t-field='line.price_total']" position="replace">
        <span class="text-nowrap" t-esc="'{:,.2f}'.format(line.price_total).replace(',','\'')" groups="account.group_show_line_subtotals_tax_included"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.format_line_total.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.format_line_total.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.format_line_total.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.format_line_total.xml)

### Format Note

ID: `mint_system.sale.report_saleorder_document.format_note`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//p[@t-field='doc.note']" position="attributes">
        <attribute name="style">font-size: 8pt</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.format_note.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.format_note.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.format_note.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.format_note.xml)

### Format Qty

ID: `mint_system.sale.report_saleorder_document.format_qty`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <span t-field="line.product_uom_qty" position="attributes">
        <attribute name="t-options-widget">"integer"</attribute>
    </span>
    <!-- <span t-field="line.product_uom_qty_confirmed" position="attributes">
        <attribute name="t-options-widget">"integer"</attribute>
    </span> -->
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.format_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.format_qty.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.format_qty.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.format_qty.xml)

### Format Qty With Decimal

ID: `mint_system.sale.report_saleorder_document.format_qty_with_decimal`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//td[@name='td_quantity']/span[1]" position="replace">
        <t t-if="line.product_uom.id == 12">
            <span id="product_uom_qty" t-field="line.product_uom_qty" t-options="{'widget': 'integer'}"/>
        </t>
        <t t-else="">
            <span id="product_uom_qty" t-field="line.product_uom_qty"/>
        </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.format_qty_with_decimal.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.format_qty_with_decimal.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.format_qty_with_decimal.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.format_qty_with_decimal.xml)

### Format Shipping And Delivery Address

ID: `mint_system.sale.report_saleorder_document.format_shipping_and_delivery_address`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <div t-field="doc.partner_invoice_id" position="replace">
        <div t-field="doc.partner_invoice_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: True}"/>
    </div>
    <div t-field="doc.partner_shipping_id" position="replace">
        <div t-field="doc.partner_shipping_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: True}"/>
    </div>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.format_shipping_and_delivery_address.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.format_shipping_and_delivery_address.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.format_shipping_and_delivery_address.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.format_shipping_and_delivery_address.xml)

### Format Table Border

ID: `mint_system.sale.report_saleorder_document.format_table_border`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//table" position="before">
        <style>
      .border-solid-black th,
      .border-solid-black td {
      border-top: 1px solid black !important;
      border-bottom: none !important;
      }
      thead th {
      color: #5c516e;
      }
    </style>
    </xpath>
    <xpath expr="//thead[1]/tr[1]" position="attributes">
        <attribute name="class" separator=" " add="border-black"/>
    </xpath>
    <xpath expr="//td[@name='td_section_subtotal']/.." position="attributes">
        <attribute name="class" separator=" " add="border-solid-black"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.format_table_border.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.format_table_border.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.format_table_border.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.format_table_border.xml)

### Format Title Trimada

ID: `mint_system.sale.report_saleorder_document.format_title_trimada`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//h2" position="attributes">
        <attribute name="style">color: black; font-size:13pt; font-weight:bold; margin-top:10mm; margin-bottom:3mm</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.format_title_trimada.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.format_title_trimada.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.format_title_trimada.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.format_title_trimada.xml)

### Get Position

ID: `mint_system.sale.report_saleorder_document.get_position`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//table/thead/tr/th[1]" position="before">
        <style>
      .o_report_layout_bold table thead tr th:first-child {
        width: auto;
      }
    </style>
        <th id="header_position">
            <span>Pos</span>
        </th>
    </xpath>
    <!-- <xpath expr="//span[@t-field='line.name']/.." position="before"> -->
    <xpath expr="//td[@name='td_name']" position="before">
        <td id="position">
            <span t-field="line.position"/>
        </td>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.get_position.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.get_position.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.get_position.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.get_position.xml)

### Get Position2

ID: `mint_system.sale.report_saleorder_document.get_position2`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//table/thead/tr/th[1]" position="before">
        <th id="header_position" style="padding-left: 0px">
            <span>Pos.</span>
        </th>
    </xpath>
    <xpath expr="//t[1]/td[1]" position="before">
        <td id="position" style="vertical-align: top;">
            <span t-field="line.position"/>
            <span/>
        </td>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.get_position2.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.get_position2.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.get_position2.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.get_position2.xml)

### Group By Product

ID: `mint_system.sale.report_saleorder_document.group_by_product`

```xml
<t t-name="sale.report_saleorder_pro_forma">
    <t t-call="web.html_container">
        <t t-set="is_pro_forma" t-value="True"/>
        <t t-set="is_pro_forma_consolidated" t-value="True"/>
        <t t-call="web.external_layout">
            <style>
           .info td {
              padding-left: 5px;
              padding-right: 5px;
              border-bottom: 1px solid #D3D3D3;
            }           
            .border-solid-black td {
              border: 1px solid black;
            }
            thead th {
              font-weight: bold;
              padding: 5px;
            }
            h2 {
              padding-left: 5px;
            }
            h3 {
              font-size: 22px;
              padding-left: 5px;
            }
            </style>
            <h2 class="mt-4">
                <span>Pro-Forma Invoice</span>
            </h2>
            <h3>Orders:</h3>
            <table class="info">
                <thead>
                    <tr>
                        <th class="text-start">Ref</th>
                        <th class="text-start">Company Name</th>
                        <th class="text-start">Street</th>
                        <th class="text-start">Zip</th>
                        <th class="text-start">City</th>
                        <th class="text-end">Currency</th>
                    </tr>
                </thead>
                <tbody>
                    <t t-foreach="docs" t-as="doc">
                        <tr>
                            <td>
                                <span t-field="doc.name"/>
                            </td>
                            <td>
                                <span t-field="doc.partner_id.name"/>
                            </td>
                            <td>
                                <span t-esc="doc.partner_id.street"/>
                            </td>
                            <td>
                                <span t-esc="doc.partner_id.zip"/>
                            </td>
                            <td>
                                <span t-esc="doc.partner_id.city"/>
                            </td>
                            <td class="text-end">
                                <span t-esc="doc.currency_id.name"/>
                            </td>
                        </tr>
                    </t>
                </tbody>
            </table>
            <table class="table table-sm o_main_table mt-4">
                <thead style="display: table-row-group">
                    <tr>
                        <th name="th_description" class="text-start">Description</th>
                        <th name="th_quantity" class="text-end">Quantity</th>
                        <th name="th_priceunit" class="text-end">Unit Price</th>
                        <th name="th_taxes" class="text-end">Taxes</th>
                        <th name="th_subtotal" class="text-end">Amount</th>
                    </tr>
                </thead>
                <tbody class="sale_tbody">
                    <t t-set="lines" t-value="docs.order_line.sorted(key=lambda l: (l.name), reverse=True)"/>
                    <t t-set="consolidated_products" t-value="{}"/>
                    <t t-foreach="lines" t-as="line">
                        <t t-set="product_name" t-value="line.name"/>
                        <t t-set="line_name" t-value="line.product_id.name"/>
                        <t t-set="line_default_code" t-value="line.product_id.default_code"/>
                        <t t-set="line_hs_code" t-value="line.product_id.hs_code"/>
                        <t t-set="line_quantity" t-value="line.product_uom_qty"/>
                        <t t-set="line_price_unit" t-value="line.price_unit"/>
                        <t t-set="line_tax_id" t-value="line.tax_id.description"/>
                        <t t-set="line_subtotal" t-value="line.price_subtotal"/>
                        <t t-set="line_price_total" t-value="line.price_total"/>
                        <t t-set="consolidated_product" t-value="consolidated_products.get(product_name, {'quantity': 0, 'price_unit': 0, 'discount': 0, 'subtotal': 0, 'price_total': 0})"/>
                        <t t-set="consolidated_products" t-value="consolidated_products | dict({product_name: {'name': line_name, 'default_code': line_default_code, 'hs_code': line_hs_code, 'quantity': consolidated_product['quantity'] + line_quantity, 'price_unit': consolidated_product['price_unit'] + line_price_unit, 'tax_id': line_tax_id, 'subtotal': consolidated_product['subtotal'] + line_subtotal, 'price_total': consolidated_product['price_total'] + line_price_total}})"/>
                    </t>
                    <tr t-att-class="'bg-200 fw-bold o_line_section' if line.display_type == 'line_section' else 'fst-italic o_line_note' if line.display_type == 'line_note' else ''">
                        <t t-if="not line.display_type">
                            <t t-foreach="consolidated_products.items()" t-as="product_data">
                                <tr>
                                    <td name="td_name"><span style="font-weight: bold" t-esc="product_data[1]['name']"/><br/>
                                        Product Code: <span t-esc="product_data[1]['default_code']"/>
                                        <br/>
                                        <t t-if="product_data[1]['hs_code']">HS-Code: <span t-esc="product_data[1]['hs_code']"/>
                                        </t>
                                    </td>
                                    <td name="td_quantity" class="text-end">
                                        <span t-esc="product_data[1]['quantity']"/>
                                        <span t-field="line.product_uom"/>
                                    </td>
                                    <td name="td_priceunit" class="text-end">
                                        <t t-set="unit_price" t-value="product_data[1]['subtotal'] / product_data[1]['quantity'] "/>
                                        <span class="text-nowrap" t-esc="unit_price" t-options="{'widget': 'float', 'precision': 3}"/>
                                    </td>
                                    <td name="td_taxes" class="text-end">
                                        <span t-esc="product_data[1]['tax_id']"/>
                                    </td>
                                    <td name="td_subtotal" class="text-end o_price_total">
                                        <span t-esc="product_data[1]['subtotal']" t-options="{'widget': 'monetary', 'display_currency': doc.currency_id}"/>
                                    </td>
                                </tr>
                            </t>
                        </t>
                    </tr>
                </tbody>
                <t t-set="consolidated_price_total" t-value="0"/>
                <t t-foreach="docs" t-as="doc">
                    <t t-foreach="doc.order_line" t-as="line">
                        <t t-set="consolidated_price_total" t-value="consolidated_price_total + line.price_total"/>
                    </t>
                </t>
            </table>
            <div class="clearfix" name="so_total_summary">
                <div id="total" class="row" name="total">
                    <div t-attf-class="#{'col-6' if report_type != 'html' else 'col-sm-7 col-md-6'} ms-auto">
                        <table class="table table-sm">
                            <!-- Tax totals -->
                            <t t-set="tax_totals" t-value="doc.tax_totals"/>
                            <t t-foreach="tax_totals['subtotals']" t-as="subtotal">
                                <tr class="border-black o_subtotal">
                                    <td>
                                        <strong t-esc="subtotal['name']"/>
                                    </td>
                                    <td class="text-end">
                                        <span t-att-class="oe_subtotal_footer_separator" t-esc="consolidated_price_total" t-options="{'widget': 'monetary', 'display_currency': doc.currency_id}"/>
                                    </td>
                                </tr>
                                <t t-set="subtotal_to_show" t-value="subtotal['name']"/>
                                <t t-foreach="tax_totals['groups_by_subtotal'][subtotal_to_show]" t-as="amount_by_group">
                                    <tr>
                                        <t t-if="tax_totals['display_tax_base']">
                                            <td>
                                                <span t-esc="amount_by_group['tax_group_name']"/>
                                                <span class="text-nowrap"> on
                                                    <t t-esc="amount_by_group['formatted_tax_group_base_amount']"/>
                                                </span>
                                            </td>
                                            <td class="text-end o_price_total">
                                                <span class="text-nowrap" t-esc="amount_by_group['formatted_tax_group_amount']"/>
                                            </td>
                                        </t>
                                        <t t-else="">
                                            <td>
                                                <span class="text-nowrap" t-esc="amount_by_group['tax_group_name']"/>
                                            </td>
                                            <td class="text-end o_price_total">
                                                <span class="text-nowrap" t-esc="amount_by_group['formatted_tax_group_amount']"/>
                                            </td>
                                        </t>
                                    </tr>
                                </t>
                            </t>
                            <t t-set="has_rounding" t-value="'formatted_amount_total_rounded' in tax_totals"/>
                            <!--Total amount with all taxes-->
                            <tr class="border-black o_total">
                                <t t-if="has_rounding">
                                    <td>Total</td>
                                </t>
                                <t t-else="">
                                    <td>
                                        <strong>Total</strong>
                                    </td>
                                </t>
                                <td class="text-end">
                                    <t t-set="consolidated_price_total" t-value="consolidated_price_total + amount_by_group['tax_group_amount']"/>
                                    <span t-esc="consolidated_price_total" t-options="{'widget': 'monetary', 'display_currency': doc.currency_id}"/>
                                </td>
                            </tr>
                            <tr t-if="has_rounding">
                                <td>
                                    <strong>Total Rounded</strong>
                                </td>
                                <td class="text-end">
                                    <span t-esc="tax_totals['formatted_amount_total_rounded']"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </t>
    </t>
</t>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.group_by_product.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.group_by_product.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.group_by_product.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.group_by_product.xml)

### Hide Address Proforma

ID: `mint_system.sale.report_saleorder_document.hide_address_proforma`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//div[@t-field='doc.partner_id']" position="replace">
        <t t-if="is_pro_forma">
        </t>
        <t t-else="">
            <div t-field="doc.partner_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}"/>
        </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.hide_address_proforma.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.hide_address_proforma.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.hide_address_proforma.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.hide_address_proforma.xml)

### Hide H2

ID: `mint_system.sale.report_saleorder_document.hide_h2`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//h2" position="replace"/>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.hide_h2.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.hide_h2.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.hide_h2.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.hide_h2.xml)

### Hide Payment Term Id

ID: `mint_system.sale.report_saleorder_document.hide_payment_term_id`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//span[@t-field='doc.payment_term_id.note']/.." position="replace"/>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.hide_payment_term_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.hide_payment_term_id.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.hide_payment_term_id.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.hide_payment_term_id.xml)

### Hide Product Packaging Id

ID: `mint_system.sale.report_saleorder_document.hide_product_packaging_id`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//span[@t-field='line.product_packaging_id']/.." position="replace"/>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.hide_product_packaging_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.hide_product_packaging_id.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.hide_product_packaging_id.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.hide_product_packaging_id.xml)

### Hide Secondary Unit

ID: `mint_system.sale.report_saleorder_document.hide_secondary_unit`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">

    <xpath expr="//th[@name='th_secondary_uom_id']" position="replace">
    </xpath>
    <xpath expr="//td[@name='td_secondary_uom_id']" position="replace">
    </xpath>

</data>
```
Edit: [snippets/mint_system.sale.report_saleorder_document.hide_secondary_unit.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.hide_secondary_unit.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.hide_secondary_unit.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.hide_secondary_unit.xml)

### Hide Title

ID: `mint_system.sale.report_saleorder_document.hide_title`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//t[@t-if='not line.display_type']" position="attributes">
        <attribute name="t-if">not line.display_type and not line.product_id.x_hide_on_sale_order</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.hide_title.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.hide_title.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.hide_title.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.hide_title.xml)

### Hide Vat

ID: `mint_system.sale.report_saleorder_document.hide_vat`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//p[@t-if='doc.partner_id.vat']" position="replace"/>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.hide_vat.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.hide_vat.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.hide_vat.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.hide_vat.xml)

### Move Order Note

ID: `mint_system.sale.report_saleorder_document.move_order_note`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//p[@name='order_note']" position="replace">
    </xpath>
    <xpath expr="/t/t/div/div[6]" position="after">
        <div class="row">
            <div class="col">
                <span>
                    <p t-field="doc.note" name="order_note"/>
                </span>
            </div>
        </div>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.move_order_note.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.move_order_note.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.move_order_note.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.move_order_note.xml)

### Move Payment Term

ID: `mint_system.sale.report_saleorder_document.move_payment_term`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//table[@name='vat_eori']" position="after">
        <xpath expr="//span[@t-field='doc.payment_term_id.note']/.." position="move"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.move_payment_term.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.move_payment_term.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.move_payment_term.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.move_payment_term.xml)

### Product Hs Code And Country Of Origin

ID: `mint_system.sale.report_saleorder_document.product_hs_code_and_country_of_origin`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//span[@t-field='line.name']" position="after">
        <t t-if="line.product_id.hs_code">
            <br/>
            <span>HS Code: </span>
            <span t-field="line.product_id.hs_code"/>
        </t>
        <t t-if="line.product_id.country_of_origin.code">
            <br/>
            <span>Country of Origin: </span>
            <span t-field="line.product_id.country_of_origin.code"/>
        </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.product_hs_code_and_country_of_origin.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.product_hs_code_and_country_of_origin.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.product_hs_code_and_country_of_origin.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.product_hs_code_and_country_of_origin.xml)

### Qty Remaining

ID: `mint_system.sale.report_saleorder_document.qty_remaining`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//td[@name='td_quantity']" position="replace">
        <t t-set="blanket_line_ids" t-value="doc.blanket_order_id.line_ids.filtered(lambda r: r.product_id.id == line.product_id.id)"/>
        <t t-set="remaining_qty" t-value="sum(blanket_line_ids.mapped('remaining_uom_qty'))"/>
        <td name="td_quantity" class="text-end">
            <span t-field="line.product_uom_qty"/>
            <span t-field="line.product_uom"/>
            <t t-if="blanket_line_ids">
        /
        <t t-if="line.product_uom.id == 1"><span t-esc="'%.0f'%(remaining_qty)"/></t>
        <t t-else=""><span t-esc="'%.3f'%(remaining_qty)"/></t>
          <span t-field="line.product_uom"/>        
      </t>
        </td>
    </xpath>
    <xpath expr="//th[@name='th_quantity']" position="replace">
        <th t-if="doc.blanket_order_id" name="th_quantity" class="text-end">Qty / Rem. Agreement Qty</th>
        <th t-if="not doc.blanket_order_id" name="th_quantity" class="text-end">Qty</th>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.qty_remaining.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.qty_remaining.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.qty_remaining.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.qty_remaining.xml)

### Remove Commitment Date

ID: `mint_system.sale.report_saleorder_document.remove_commitment_date`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">

  <xpath expr="//div/table/thead/tr/th[3]" position="replace">
  </xpath>
  <xpath expr="//div/table/tbody/t[2]/tr/t[1]/td[3]" position="replace">
  </xpath>

</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.remove_commitment_date.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.remove_commitment_date.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.remove_commitment_date.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.remove_commitment_date.xml)

### Remove Discount Percentage

ID: `mint_system.sale.report_saleorder_document.remove_discount_percentage`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//th[@name='th_discount']/span" position="replace">
        <span>Rabatt</span>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.remove_discount_percentage.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.remove_discount_percentage.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.remove_discount_percentage.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.remove_discount_percentage.xml)

### Remove Informations

ID: `mint_system.sale.report_saleorder_document.remove_informations`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//div[@id='informations']" position="replace"/>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.remove_informations.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.remove_informations.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.remove_informations.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.remove_informations.xml)

### Remove Payment Terms

ID: `mint_system.sale.report_saleorder_document.remove_payment_terms`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//div/p/span[@t-field='doc.payment_term_id.note']" position="replace">
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.remove_payment_terms.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.remove_payment_terms.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.remove_payment_terms.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.remove_payment_terms.xml)

### Remove Product Uom

ID: `mint_system.sale.report_saleorder_document.remove_product_uom`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <span t-field="line.product_uom" position="replace"/>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.remove_product_uom.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.remove_product_uom.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.remove_product_uom.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.remove_product_uom.xml)

### Remove Summary Table

ID: `mint_system.sale.report_saleorder_document.remove_summary_table`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//div[2]" position="replace">
</xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.remove_summary_table.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.remove_summary_table.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.remove_summary_table.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.remove_summary_table.xml)

### Remove Taxes Copy

ID: `mint_system.sale.report_saleorder_document.remove_taxes copy`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//th[@name='th_taxes']" position="replace"/>
    <xpath expr="//td[@name='td_taxes']" position="replace"/>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.remove_taxes copy.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.remove_taxes copy.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.remove_taxes copy.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.remove_taxes copy.xml)

### Remove Taxes

ID: `mint_system.sale.report_saleorder_document.remove_taxes`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//th[@name='th_taxes']" position="replace"/>
    <xpath expr="//td[@name='td_taxes']" position="replace"/>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.remove_taxes.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.remove_taxes.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.remove_taxes.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.remove_taxes.xml)

### Remove User Id

ID: `mint_system.sale.report_saleorder_document.remove_user_id`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//div[@id='informations']//span[@t-field='doc.user_id']/.." position="replace"/>
</data>
```
Edit: [snippets/mint_system.sale.report_saleorder_document.remove_user_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.remove_user_id.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.remove_user_id.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.remove_user_id.xml)

### Remove Vat

ID: `mint_system.sale.report_saleorder_document.remove_vat`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//p[@t-if='doc.partner_id.vat']" position="replace"/>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.remove_vat.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.remove_vat.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.remove_vat.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.remove_vat.xml)

### Rename Order

ID: `mint_system.sale.report_saleorder_document.rename_order`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//table[1]/thead[1]/tr[1]/th[5]" position="replace"/>
    <xpath expr="//table[1]/tbody[1]/t[2]/tr[1]/t[1]/td[5]" position="replace"/>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.rename_order.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.rename_order.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.rename_order.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.rename_order.xml)

### Rename Proforma Title

ID: `mint_system.sale.report_saleorder_document.rename_proforma_title`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//h2/t[2]/span" position="replace">
        <!-- <span>Auftragsbestätigung # </span> -->
        <span>Order Confirmation # </span>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.rename_proforma_title.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.rename_proforma_title.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.rename_proforma_title.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.rename_proforma_title.xml)

### Rename Table Header

ID: `mint_system.sale.report_saleorder_document.rename_table_header`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//div/table/thead/tr/th[2]" position="replace">
        <th class="text-left">Comm. Date</th>
    </xpath>
    <xpath expr="//div/table/thead/tr/th[6]" position="replace">
        <th name="th_priceunit" class="text-right">U. Price</th>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.rename_table_header.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.rename_table_header.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.rename_table_header.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.rename_table_header.xml)

### Repeat Table Header

ID: `mint_system.sale.report_saleorder_document.repeat_table_header`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//thead[@style='display: table-row-group']" position="attributes">
        <attribute name="style"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.repeat_table_header.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.repeat_table_header.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.repeat_table_header.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.repeat_table_header.xml)

### Replace Address And Information Block

ID: `mint_system.sale.report_saleorder_document.replace_address_and_information_block`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//t[@t-set='address']" position="replace"/>
    <xpath expr="//t[@t-set='information_block']/.." position="replace">
        <div class="row text-900 o_bold">
            <div class="col-7">Customer</div>
            <div class="col-5">Invoice Address</div>
        </div>
        <div class="row">
            <div class="col-7">
                <span t-field="doc.partner_id.commercial_company_name"/>
            </div>
            <div class="col-5">
                <span t-field="doc.partner_invoice_id.commercial_company_name"/>
            </div>
        </div>
        <div class="row">
            <div class="col-7">
                <span t-field="doc.partner_id" t-options-widget="&quot;contact&quot;" t-options-fields="['address']" t-options-no_marker="True"/>
            </div>
            <div class="col-5">
                <span t-field="doc.partner_invoice_id" t-options-widget="&quot;contact&quot;" t-options-fields="['address']" t-options-no_marker="True"/>
            </div>
        </div>
        <div class="row">
            <div class="col-5 text-900 o_bold offset-7" style="margin-top:25px">Delivery Address</div>
        </div>
        <div class="row">
            <div class="col-5 offset-7">
                <span t-field="doc.partner_shipping_id.commercial_company_name"/>
            </div>
        </div>
        <div class="row">
            <div class="col-5 offset-7">
                <span t-field="doc.partner_shipping_id" t-options-widget="&quot;contact&quot;" t-options-fields="['address']" t-options-no_marker="True"/>
            </div>
        </div>
        <div class="row o_bold text-900" style="margin-top:25px">
            <div class="col-7">Your Contact</div>
            <div class="col-5">Our Contact</div>
        </div>
        <div class="row">
            <div class="col-7">
                <span t-field="doc.partner_id.name"/>
            </div>
            <div class="col-5">
                <span t-field="doc.user_id.name"/>
            </div>
        </div>
        <div class="row">
            <div class="col-7" style="margin-bottom:25px">
                <span t-field="doc.partner_id" t-options-widget="&quot;contact&quot;" t-options-fields="['phone', 'email']" t-options-no_marker="True"/>
            </div>
            <div class="col-5">
                <span t-field="doc.user_id" t-options-widget="&quot;contact&quot;" t-options-fields="['phone', 'email']" t-options-no_marker="True"/>
            </div>
        </div>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.replace_address_and_information_block.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.replace_address_and_information_block.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.replace_address_and_information_block.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.replace_address_and_information_block.xml)

### Replace Address And Information Block Pro Forma

ID: `mint_system.sale.report_saleorder_document.replace_address_and_information_block_pro_forma`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//t[@t-set='address']" position="replace">
        <t t-if="is_pro_forma and doc.partner_id != doc.partner_sale_id">
            <t t-set="address">
                <div t-field="doc.partner_sale_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}"/>
                <p t-if="doc.partner_id.vat">
                    <t t-if="doc.company_id.account_fiscal_country_id.vat_label" t-out="doc.company_id.account_fiscal_country_id.vat_label"/>
                    <t t-else="">Tax ID</t>:                    <span t-field="doc.partner_id.vat"/>
                </p>
            </t>
        </t>
        <t t-else="">
            <t t-set="address">
                <div t-field="doc.partner_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}"/>
                <p t-if="doc.partner_id.vat">
                    <t t-if="doc.company_id.account_fiscal_country_id.vat_label" t-out="doc.company_id.account_fiscal_country_id.vat_label"/>
                    <t t-else="">Tax ID</t>:                    <span t-field="doc.partner_id.vat"/>
                </p>
            </t>
        </t>
    </xpath>

    <xpath expr="//t[@t-set='information_block']/.." position="replace">
        <t t-if="is_pro_forma and doc.partner_id != doc.partner_sale_id">
            <t t-if="doc.partner_shipping_id == doc.partner_invoice_id                              and doc.partner_invoice_id != doc.partner_id                              or doc.partner_shipping_id != doc.partner_invoice_id">

                <t t-set="information_block">
                    <strong>
                        <t t-if="doc.partner_shipping_id == doc.partner_invoice_id">
                        Invoicing and Shipping Address:
                        </t>
                        <t t-else="">
                        Invoicing Address:
                        </t>
                    </strong>
                    <div t-field="doc.partner_sale_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;, &quot;phone&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: True}"/>
                    <t t-if="doc.partner_shipping_id != doc.partner_invoice_id">
                        <strong>Shipping Address:</strong>
                        <div t-field="doc.partner_sale_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;, &quot;phone&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: True}"/>
                    </t>
                </t>
            </t>
        </t>
        <t t-else="">
            <t t-if="doc.partner_shipping_id == doc.partner_invoice_id                              and doc.partner_invoice_id != doc.partner_id                              or doc.partner_shipping_id != doc.partner_invoice_id">
                <t t-set="information_block">
                    <strong>
                        <t t-if="doc.partner_shipping_id == doc.partner_invoice_id">
                        Invoicing and Shipping Address:
                        </t>
                        <t t-else="">
                        Invoicing Address:
                        </t>
                    </strong>
                    <div t-field="doc.partner_invoice_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;, &quot;phone&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: True}"/>
                    <t t-if="doc.partner_shipping_id != doc.partner_invoice_id">
                        <strong>Shipping Address:</strong>
                        <div t-field="doc.partner_shipping_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;, &quot;phone&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: True}"/>
                    </t>
                </t>
            </t>
        </t>
    </xpath>
</data>
```
Edit: [snippets/mint_system.sale.report_saleorder_document.replace_address_and_information_block_pro_forma.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.replace_address_and_information_block_pro_forma.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.replace_address_and_information_block_pro_forma.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.replace_address_and_information_block_pro_forma.xml)

### Replace Informations

ID: `mint_system.sale.report_saleorder_document.replace_informations`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <div id="informations" position="replace">
        <style>
            div#informations th {}
            div#informations td {}
        </style>
        <div id="informations">
            <table class="table table-borderless table-sm">
                <tr>
                    <td>
                        <strong class="mr-4">Datum:</strong>
                        <span t-field="doc.date_order" t-options="{&quot;widget&quot;: &quot;date&quot;}"/>
                    </td>
                    <td>
                        <strong class="mr-2">Zahlungsbedingungen:</strong>
                        <span t-field="doc.payment_term_id"/>
                    </td>
                    <td>
                        <strong t-if="doc.partner_sale_id" class="mr-2">Ihr Kontakt:</strong>
                        <span t-if="doc.partner_sale_id" t-field="doc.partner_sale_id.name"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <strong t-if="doc.validity_date and doc.state in ['draft','sent']" class="mr-2">G&#xFC;ltigkeit:</strong>
                        <span t-if="doc.validity_date and doc.state in ['draft','sent']" t-field="doc.validity_date" t-options="{&quot;widget&quot;: &quot;date&quot;}"/>
                    </td>
                    <td>
                        <strong class="mr-2">Unser Kontakt:</strong>
                        <span t-field="doc.user_id"/>
                    </td>
                    <td>
                        <strong t-if="doc.client_order_ref" class="mr-2">Ihre Referenz:</strong>
                        <span t-if="doc.client_order_ref" t-field="doc.client_order_ref"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <strong class="mr-2" t-if="doc.project_id">Unsere Referenz:</strong>
                        <span t-field="doc.project_id"/>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.replace_informations.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.replace_informations.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.replace_informations.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.replace_informations.xml)

### Replace Informations2

ID: `mint_system.sale.report_saleorder_document.replace_informations2`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">

    <xpath expr="//div[@id='informations']" position="replace">

        <style>
            table#info {
            width: 100%;
            margin-bottom: 25px;
            border: transparent;            
            }
            table#info td {
            color: black;
            border: transparent;
            }
            table#info td:last-child {
            background-color: transparent;
            }
            table#info tr {
            text-align: top;
            } 
        </style>

        <table id="info" style="width: 700px; margin-bottom: 50px">
            <tr>
                <t t-if="doc.date_order">
                    <td width="200px">Date</td>
                    <td width="500px">
                        <span id="date_order" t-field="doc.date_order" t-options="{ &quot;widget&quot;: &quot;date&quot; }"/>
                    </td>
                </t>
            </tr>
            <t t-if="doc.state != 'sale'">
                <tr>
                    <t t-if="doc.validity_date">
                        <td>Validity Date</td>
                        <td>
                            <span id="validity_date" t-field="doc.validity_date" t-options="{ &quot;widget&quot;: &quot;date&quot; }"/>
                        </td>
                    </t>
                </tr>
            </t>
            <tr>
                <t t-if="doc.client_order_ref">
                    <td>Your Reference</td>
                    <td>
                        <span t-field="doc.client_order_ref"/>
                    </td>
                </t>
            </tr>
            <tr>
                <t t-if="doc.partner_id.parent_id">
                    <td>Your Contact</td>
                    <td>
                        <span t-field="doc.partner_id.name"/>
                    </td>
                </t>
            </tr>
            <tr>
                <t t-if="doc.commitment_date">
                    <td>Delivery Date</td>
                    <td>
                        <span t-field="doc.commitment_date" t-options="{ &quot;widget&quot;: &quot;date&quot; }"/>
                    </td>
                </t>
            </tr>
            <tr>
                <t t-if="doc.incoterm">
                    <td>Incoterm</td>
                    <td>
                        <span t-field="doc.incoterm.name"/>
                    </td>
                </t>
            </tr>
            <tr>
                <t t-if="doc.payment_term_id">
                    <td>Payment terms</td>
                    <td>
                        <span t-field="doc.payment_term_id"/>
                    </td>
                </t>
            </tr>
            <tr>
                <t t-if="doc.user_id">
                    <td>Our Contact</td>
                    <td>
                        <span t-field="doc.user_id"/>
                        <t t-if="doc.user_id.email">
                           ,                            <span t-field="doc.user_id.email"/>
                        </t>
                        <t t-if="doc.user_id.phone">
                           ,                            <span t-field="doc.user_id.phone"/>
                        </t>
                    </td>
                </t>
            </tr>
        </table>
    </xpath>
</data>
```
Edit: [snippets/mint_system.sale.report_saleorder_document.replace_informations2.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.replace_informations2.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.replace_informations2.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.replace_informations2.xml)

### Replace Infotable Tissa

ID: `mint_system.sale.report_saleorder_document.replace_infotable_tissa`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">

  <xpath expr="//div[@id='informations']" position="replace">
    <style>
    table#info {
      width: 100%;
      margin-bottom: 45px;
      font-size: 11pt;
    }
    table#info tr {
      line-height: 1.2;
      text-align: left;
    }
    .note {
      font-size: 9pt;
    }
    </style>
    <table id="info">

      <tr>
        <td width="16%">
          Contact Number:
        </td>
        <td width="44%">
          <span t-field="doc.partner_id.id"/>
        </td>
        <td>
          Date:
        </td>
        <td>
          <span t-field="doc.date_order" t-options="{&quot;widget&quot;: &quot;date&quot;}"/>
        </td>
      </tr>

      <tr>
        <td>
          Your Contact:
        </td>
        <td>
          <span t-field="doc.partner_sale_id.name"/>
        </td>
        <td>Our Order:</td>
        <td>
          <t t-if="doc.origin">
            <span t-field="doc.origin"/>
 / 
          </t>
          <span t-field="doc.name"/>
        </td>
      </tr>

      <tr>
        <td>
          VAT:
        </td>
        <td>
          <span t-field="doc.partner_id.vat"/>
        </td>
        <td>Call-off Order:</td>
        <td>
          <span t-field="doc.comment"/>
          <t t-if="doc.x_studio_kommission">
             /            <span t-field="doc.x_studio_kommission"/>
          </t>
        </td>
      </tr>

      <tr>
        <td>EORI-Number:</td>
        <td>
          <span t-field="doc.partner_id.x_studio_eori_nummer"/>
        </td>
        <td>Our Contact:</td>
        <td>
          <span t-field="doc.partner_id.user_id"/>
        </td>
      </tr>

      <tr>
        <td>Your Order:</td>
        <td>         
          <span t-field="doc.client_order_ref"/>       
        </td>
        <td>
          VAT-No:
        </td>
        <td>
          <span t-field="doc.company_id.vat"/>  
        </td>
      </tr>
      
      <tr>
        <td/>
        <td><span t-field="doc.blanket_order_id.date_confirmed"/>      
        </td>
        <td>
          Delivery date ETD:
        </td>
        <td>
          <span t-field="doc.commitment_date" t-options="{&quot;widget&quot;: &quot;date&quot;}"/>  
        </td>
      </tr>

    </table>
  </xpath>
</data>
```
Edit: [snippets/mint_system.sale.report_saleorder_document.replace_infotable_tissa.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.replace_infotable_tissa.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.replace_infotable_tissa.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.replace_infotable_tissa.xml)

### Replace Partner Id

ID: `mint_system.sale.report_saleorder_document.replace_partner_id`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//t[@t-set='address']/div" position="replace">
        <div style="font-size:10pt; line-height: 1.2; padding-bottom:33mm">
            <t t-if="doc.partner_contact_id.parent_name">
                <div t-field="doc.partner_contact_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: False}" name="partner_contact_id"/>
            </t>
            <t t-if="not doc.partner_contact_id.parent_name">
                <div t-field="doc.partner_contact_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: False}" name="partner_contact_id"/>
            </t>
        </div>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.replace_partner_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.replace_partner_id.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.replace_partner_id.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.replace_partner_id.xml)

### Replace Payment Term

ID: `mint_system.sale.report_saleorder_document.replace_payment_term`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//span[@t-field='doc.payment_term_id.note']/.." position="replace">
        <div class="row">
            <div class="col">
                <span t-if="doc.payment_term_id.note">
          Payment terms: <strong t-field="doc.payment_term_id.name"/>
        </span>
            </div>
        </div>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.replace_payment_term.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.replace_payment_term.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.replace_payment_term.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.replace_payment_term.xml)

### Replace Product Description

ID: `mint_system.sale.report_saleorder_document.replace_product_description`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//td[@name='td_name']" position="replace">
        <t t-if="line.product_id.type_description">
            <td>
                <span class="o_bold" t-field="line.product_id.type_description"/>
            </td>
        </t>
        <t t-if="not line.product_id.type_description">
            <td>
                <span t-field="line.name"/>
            </td>
        </t>
        <!--
      <td name="td_name">
        <span class="o_bold" t-field="line.product_id.name"/><br/>
        <span t-field="line.name"/>  
      </td>
    -->
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.replace_product_description.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.replace_product_description.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.replace_product_description.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.replace_product_description.xml)

### Replace Summary

ID: `mint_system.sale.report_saleorder_document.replace_summary`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//div[@name='so_total_summary']" position="replace">
        <style>
            table.trimada_summary tr {
                border-top: solid 1px !important;
                border-bottom: solid 1px;
            }
            table.trimada_details tr {
              border-top: 0px !important;
              border-bottom: 0px;
              line-height: 0.7;
            }
            table.trimada_summary #amount_untaxed_label {
                width: 15.5%;
                text-align: left;
            }
            table.trimada_summary #amount_untaxed {
                width: 23%;
                text-align: left;
            }
            table.trimada_summary #amount_by_group_label {
                width: 12%;
                text-align: left;
            }
            table.trimada_summary #amount_by_group {
                width: 17%;
                text-align: left;
            }
            table.trimada_summary #current_subtotal_label {
                width: 14%;
                text-align: right;
            }
            table.trimada_summary #current_subtotal {
                width: 18%;
                text-align: right;
            }
    </style>
        <table class="table table-borderless table-sm trimada trimada_summary o_main_table">
            <tr>
                <td id="amount_untaxed_label">
                    <strong>Warenwert</strong>
                </td>
                <td id="amount_untaxed">
                    <span t-field="doc.amount_untaxed"/>
                </td>
                <td>
                    <table class="trimada_details">
                        <t t-foreach="doc.amount_by_group" t-as="amount_by_group">
                            <tr style="">
                                <t t-if="amount_by_group[5] == 1 and doc.amount_untaxed == amount_by_group[2]">
                                    <td name="td_amount_by_group_label_3">
                                        <span t-esc="amount_by_group[0]"/>
                                    </td>
                                    <td name="td_amount_by_group_3" class="text-right o_price_total">
                                        <span t-esc="amount_by_group[1]" t-options="{&quot;widget&quot;: &quot;monetary&quot;, &quot;display_currency&quot;: doc.pricelist_id.currency_id}"/>
                                    </td>
                                </t>
                                <t t-else="">
                                    <td name="td_amount_by_group_label">
                                        <span t-esc="amount_by_group[0]"/>
                                    </td>
                                    <td name="td_amount_by_group" class="text-right o_price_total">
                                        <span t-esc="amount_by_group[1]" t-options="{&quot;widget&quot;: &quot;monetary&quot;, &quot;display_currency&quot;: doc.pricelist_id.currency_id}"/>
                                    </td>
                                </t>
                            </tr>
                        </t>
                    </table>
                </td>
                <td id="current_subtotal_label">
                    <strong>Rechnungsbetrag</strong>
                </td>
                <td id="current_subtotal">
                    <span t-field="doc.amount_total"/>
                </td>
            </tr>
        </table>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.replace_summary.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.replace_summary.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.replace_summary.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.replace_summary.xml)

### Replace Title

ID: `mint_system.sale.report_saleorder_document.replace_title`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//h2" position="replace">
        <h2 class="mt16">
            <t t-if="not (env.context.get('proforma', False) or is_pro_forma)">
                <span t-if="doc.state not in ['draft','sent']">Order </span>
                <span t-if="doc.state in ['draft','sent']">Quotation </span>
            </t>
            <t t-if="env.context.get('proforma', False) or is_pro_forma">
                <span>Pro-Forma Invoice </span>
            </t>
            <span t-field="doc.name"/>
        </h2>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.replace_title.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.replace_title.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.replace_title.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.replace_title.xml)

### Round Price

ID: `mint_system.sale.report_saleorder_document.round_price`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//span[@t-field='line.price_unit']" position="replace">
        <span t-esc="'%g' % line.price_unit if str(line.price_unit)[::-1].find('.') &gt;= 3 else '%.2f' % line.price_unit"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.round_price.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.round_price.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.round_price.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.round_price.xml)

### Round Price2

ID: `mint_system.sale.report_saleorder_document.round_price2`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//span[@t-field='line.price_unit']" position="replace">
        <!-- 34.00 -> 34 -->
        <!-- 34.50 -> 34.50 -->
        <!-- 34.75 -> 34.75 -->
        <span t-esc="'%g' % line.price_unit if int(line.price_unit) == line.price_unit else '%.2f' % line.price_unit"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.round_price2.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.round_price2.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.round_price2.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.round_price2.xml)

### Round Total Price

ID: `mint_system.sale.report_saleorder_document.round_total_price`

```xml
<data inherit_id="sale.report_saleorder_document" priority="60">
    <xpath expr="//span[@t-field='line.price_subtotal']" position="replace">
        <span t-esc="'{0:,.2f}'.format(float(line.price_subtotal)).replace(',','\'')"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.round_total_price.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.round_total_price.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.round_total_price.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.round_total_price.xml)

### Second Row

ID: `mint_system.sale.report_saleorder_document.second_row`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//tbody[hasclass('sale_tbody')]/t/tr[1]" position="attributes">
        <attribute name="t-att-class">"first"</attribute>
    </xpath>
    <xpath expr="//tbody[hasclass('sale_tbody')]/t/tr[1]" position="after">
        <t t-if="line.product_id.type_description">
            <tr class="second">
                <td/>
                <td/>
                <td colspan="6">
                    <span t-field="line.name"/>
                    <br/>
                    <t t-if="line.product_id.country_of_origin_id.code">
                        <span>Ursprungsland:</span>
                        <span t-field="line.product_id.country_of_origin_id.code"/>
                    </t>
                    <t t-if="line.product_id.hs_code">
                        <span>/ Zollposition:</span>
                        <span t-field="line.product_id.hs_code"/>
                    </t>
                </td>
            </tr>
        </t>
        <t t-if="not line.product_id.type_description">
            <tr class="second">
                <td/>
                <td/>
                <td colspan="6">
                    <t t-if="line.product_id.country_of_origin_id.code">
                        <span>Ursprungsland:</span>
                        <span t-field="line.product_id.country_of_origin_id.code"/>
                    </t>
                    <t t-if="line.product_id.hs_code">
                        <span>/ Zollposition:</span>
                        <span t-field="line.product_id.hs_code"/>
                    </t>
                </td>
            </tr>
        </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.second_row.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.second_row.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.second_row.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.second_row.xml)

### Second Row2

ID: `mint_system.sale.report_saleorder_document.second_row2`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">

    <xpath expr="//td[@name='td_name']/../.." position="after">
        <t t-if="line.position">
            <tr style="border-top: solid white !important">
                <td/>
                <td colspan="3">
                    <span t-field="line.name"/>
                    <t t-if="line.product_id.hs_code">
                        <br/>
                        <span>HS-Code: </span>
                        <span t-field="line.product_id.hs_code"/>
                    </t>
                </td>
                <td/>
            </tr>
        </t>
    </xpath>

    <xpath expr="//td[@name='td_name']" position="replace">
        <td name="td_name">
            <strong t-field="line.product_template_id"/>
        </td>
    </xpath>

</data>
```
Edit: [snippets/mint_system.sale.report_saleorder_document.second_row2.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.second_row2.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.second_row2.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.second_row2.xml)

### Sequence In Table

ID: `mint_system.sale.report_saleorder_document.sequence_in_table`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="/t/t/div/table/thead/tr/th[1]" position="before">
        <th>
            <span>Pos</span>
        </th>
        <xpath expr="//table/tbody/t[2][@t-foreach='doc.order_line']" position="before">
            <t t-set="index" t-value="1"/>
        </xpath>
    </xpath>
    <xpath expr="/t/t/div/table/tbody/t[2]/tr/t[1]/td[1]" position="before">
        <td>
            <span t-esc="index"/>
            <t t-set="index" t-value="index+1"/>
        </td>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.sequence_in_table.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.sequence_in_table.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.sequence_in_table.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.sequence_in_table.xml)

### Set Address Name

ID: `mint_system.sale.report_saleorder_document.set_address_name`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <div t-field="doc.partner_invoice_id" position="before">
        <div>
            <span itemprop="name" t-field="doc.partner_invoice_id.name"/>
        </div>
    </div>
    <div t-field="doc.partner_shipping_id" position="before">
        <div>
            <span itemprop="name" t-field="doc.partner_shipping_id.name"/>
        </div>
    </div>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.set_address_name.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.set_address_name.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.set_address_name.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.set_address_name.xml)

### Set Ids

ID: `mint_system.sale.report_saleorder_document.set_ids`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//div[@id='informations']//span[@t-field='doc.incoterm.code']/.." position="attributes">
        <attribute name="id">incoterm</attribute>
    </xpath>
    <xpath expr="//div[@id='informations']//span[@t-field='doc.date_order']" position="attributes">
        <attribute name="id">date_order</attribute>
    </xpath>
    <xpath expr="//th[@name='th_description']" position="attributes">
        <attribute name="id">description</attribute>
    </xpath>
    <xpath expr="//th[@name='th_quantity']" position="attributes">
        <attribute name="id">product_uom_qty</attribute>
    </xpath>
    <xpath expr="//td[@name='td_quantity']/span[1]" position="attributes">
        <attribute name="id">product_uom_qty</attribute>
    </xpath>
    <xpath expr="//td[@name='td_quantity']/span[2]" position="attributes">
        <attribute name="id">product_uom</attribute>
    </xpath>
    <xpath expr="//td[@name='td_quantity']" position="attributes">
        <attribute name="id">product_uom_qty</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.set_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.set_ids.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.set_ids.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.set_ids.xml)

### Set Page Font Size

ID: `mint_system.sale.report_saleorder_document.set_page_font_size`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//div[hasclass('page')]" position="before">
        <style>
      body {
        font-size: 0.9rem;
      }
    </style>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.set_page_font_size.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.set_page_font_size.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.set_page_font_size.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.set_page_font_size.xml)

### Set Table Font Size

ID: `mint_system.sale.report_saleorder_document.set_table_font_size`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//table[hasclass('o_main_table')]" position="before">
        <style>
      table.o_main_table th,
      table.o_main_table td {
        font-size: 0.8rem;
      }
    </style>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.set_table_font_size.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.set_table_font_size.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.set_table_font_size.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.set_table_font_size.xml)

### Set Title Font Size

ID: `mint_system.sale.report_saleorder_document.set_title_font_size`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//div[hasclass('page')]" position="inside">
        <style>
            h2 {
                font-size: 1.5rem;
            }
        </style>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.set_title_font_size.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.set_title_font_size.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.set_title_font_size.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.set_title_font_size.xml)

### Show Categ Id

ID: `mint_system.sale.report_saleorder_document.show_categ_id`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//span[@t-field='line.name']" position="after">
        <div>
            <span t-field="line.product_id.categ_id"/>
        </div>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.show_categ_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.show_categ_id.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.show_categ_id.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.show_categ_id.xml)

### Show Comment

ID: `mint_system.sale.report_saleorder_document.show_comment`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <!-- <p name="order_note" position="before">
        <p>
            <strong>Remark:</strong>
            <span t-field="doc.comment" name="order_note" />
        </p>
    </p> -->
    <div id="informations" position="inside">
        <div t-if="doc.comment" class="col-auto col-3 mw-100 mb-2">
            <strong>Remark:</strong>
            <p class="m-0" t-field="doc.comment"/>
        </div>
    </div>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.show_comment.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.show_comment.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.show_comment.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.show_comment.xml)

### Show Default Code

ID: `mint_system.sale.report_saleorder_document.show_default_code`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//table[2]/thead/tr/th[1]" position="after">
        <th id="default_code">
            <strong>Part No.</strong>
        </th>
    </xpath>
    <xpath expr="//table[2]/tbody/t/tr/t[1]/td[1]" position="after">
        <td id="default_code">
            <span t-field="line.product_id.default_code"/>
        </td>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.show_default_code.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.show_default_code.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.show_default_code.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.show_default_code.xml)

### Show Partner Contact Id

ID: `mint_system.sale.report_saleorder_document.show_partner_contact_id`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//div[@t-field='doc.partner_id']" position="replace">
        <t t-if="doc.partner_contact_id">
            <div t-field="doc.partner_contact_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: False}"/>
        </t>
        <t t-if="not doc.partner_contact_id">
            <div t-field="doc.partner_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: False}"/>
        </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.show_partner_contact_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.show_partner_contact_id.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.show_partner_contact_id.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.show_partner_contact_id.xml)

### Show Partner Sale Id

ID: `mint_system.sale.report_saleorder_document.show_partner_sale_id`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//div[@t-field='doc.partner_id']" position="replace">
        <t t-if="doc.partner_sale_id">
            <div t-field="doc.partner_sale_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: False}"/>
        </t>
        <t t-if="not doc.partner_sale_id">
            <div t-field="doc.partner_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: False}"/>
        </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.show_partner_sale_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.show_partner_sale_id.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.show_partner_sale_id.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.show_partner_sale_id.xml)

### Show Qty Remaining

ID: `mint_system.sale.report_saleorder_document.show_qty_remaining`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//td[@name='td_quantity']" position="replace">
        <t t-set="blanket_line_ids" t-value="doc.blanket_order_id.line_ids.filtered(lambda r: r.product_id.id == line.product_id.id)"/>
        <t t-set="remaining_qty" t-value="sum(blanket_line_ids.mapped('remaining_uom_qty'))"/>
        <td name="td_quantity" class="text-right">
            <span t-field="line.product_uom_qty"/>
            <span t-field="line.product_uom"/>
            <t t-if="blanket_line_ids">
        /
        <t t-if="line.product_uom.id == 1"><span t-esc="'%.0f'%(remaining_qty)"/></t>
        <t t-else=""><span t-esc="'%.3f'%(remaining_qty)"/></t>
          <span t-field="line.product_uom"/>        
      </t>
        </td>
    </xpath>
    <xpath expr="//th[@name='th_quantity']" position="replace">
        <th t-if="doc.blanket_order_id" name="th_quantity" class="text-right">Qty / Rem. Agreement Qty</th>
        <th t-if="not doc.blanket_order_id" name="th_quantity" class="text-right">Qty</th>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.show_qty_remaining.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.show_qty_remaining.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.show_qty_remaining.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.show_qty_remaining.xml)

### Show Triple Discount

ID: `mint_system.sale.report_saleorder_document.show_triple_discount`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <t t-set="display_discount" position="replace">
        <t t-set="display_discount" t-value="any(l.discount or l.discount2 or l.discount3 for l in lines_to_report)"/>
    </t>
    <span t-field="line.discount" position="replace">
        <t t-if="line.discount"><span t-field="line.discount"/><br /></t>
        <t t-if="line.discount2"><span t-field="line.discount2"/><br /></t>
        <t t-if="line.discount3"><span t-field="line.discount3"/></t>
    </span>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.show_triple_discount.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.show_triple_discount.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.show_triple_discount.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.show_triple_discount.xml)

### Style Airwork

ID: `mint_system.sale.report_saleorder_document.style_airwork`

```xml
<data inherit_id="sale.report_saleorder_document" priority="60">
    <xpath expr="//table[2]" position="attributes">
        <attribute name="class">table table-sm o_main_table  mt-4</attribute>
    </xpath>    
</data>
```
Edit: [snippets/mint_system.sale.report_saleorder_document.style_airwork.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.style_airwork.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.style_airwork.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.style_airwork.xml)

### Style Carbo Link

ID: `mint_system.sale.report_saleorder_document.style_carbo_link`

```xml
<data inherit_id="sale.report_saleorder_document" priority="60">
    <xpath expr="//div[hasclass('page')]" position="before">
        <style>
        .o_company_1_layout {
            font-family: Dobra_Book;
            font-size: 80%;
            }
        .o_company_3_layout {
        	font-family: Dobra_Book;
        	font-size: 80%;
        	}
        h2
            {
            font-size: 1.4rem;
            }
        </style>
    </xpath>


    <xpath expr="//div/div/div[2]/span" position="attributes">
        <attribute name="t-options-widget">"date"</attribute>
    </xpath>

</data>
```
Edit: [snippets/mint_system.sale.report_saleorder_document.style_carbo_link.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.style_carbo_link.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.style_carbo_link.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.style_carbo_link.xml)

### Style Gelso

ID: `mint_system.sale.report_saleorder_document.style_gelso`

```xml
<data inherit_id="sale.report_saleorder_document" priority="60">
    <xpath expr="//div[hasclass('page')]" position="before">
        <style>
        .mt-4 {
            margin-top: 0rem !important;
            }
        </style>
    </xpath>
    
    <xpath expr="//h2" position="attributes">
        <attribute name="class"/>
        <attribute name="style">margin-top: 2rem</attribute>
    </xpath>
    
    <xpath expr="//th[@id='header_position']" position="attributes">
        <attribute name="class">text-start</attribute>
    </xpath>
    
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.style_gelso.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.style_gelso.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.style_gelso.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.style_gelso.xml)

### Style Hygentile

ID: `mint_system.sale.report_saleorder_document.style_hygentile`

```xml
<data inherit_id="sale.report_saleorder_document" priority="60">
    <xpath expr="//div[hasclass('page')]" position="before">
        <style>
        .o_company_1_layout {
            font-size: 10x;
        }
        .o_report_layout_bold table tbody tr td {
            padding-top: 0px;
            padding-botoom: 0px;
        }
        </style>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.style_hygentile.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.style_hygentile.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.style_hygentile.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.style_hygentile.xml)

### Style Lapp Copy

ID: `mint_system.sale.report_saleorder_document.style_lapp copy`

```xml
<data inherit_id="sale.report_saleorder_document" priority="60">
    <xpath expr="//h2" position="attributes">
        <attribute name="style">color: black; font-size:13pt; font-weight:bold; margin-top:10mm; margin-bottom:3mm</attribute>
    </xpath>
    <xpath expr="//table[1]" position="attributes">
        <attribute name="class">table table-sm o_main_table mt-4 custom-border</attribute>
        <attribute name="style">border-top-width: 1px</attribute>
    </xpath>
    <xpath expr="//div[@name='total']" position="attributes">
        <attribute name="style">width: 280px; float: right</attribute>
    </xpath>
    <xpath expr="//div[@name='total']/div" position="attributes">
        <attribute name="t-attf-class"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.style_lapp copy.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.style_lapp copy.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.style_lapp copy.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.style_lapp copy.xml)

### Style Lapp

ID: `mint_system.sale.report_saleorder_document.style_lapp`

```xml
<data inherit_id="sale.report_saleorder_document" priority="60">
    <xpath expr="//h2" position="attributes">
        <attribute name="style">color: black; font-size:13pt; font-weight:bold; margin-top:10mm; margin-bottom:3mm</attribute>
    </xpath>
    <xpath expr="//table[1]" position="attributes">
        <attribute name="class">table table-sm o_main_table mt-4 custom-border</attribute>
        <attribute name="style">border-top-width: 1px</attribute>
    </xpath>
    <xpath expr="//div[@name='total']" position="attributes">
        <attribute name="style">width: 280px; float: right</attribute>
    </xpath>
    <xpath expr="//div[@name='total']/div" position="attributes">
        <attribute name="t-attf-class"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.style_lapp.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.style_lapp.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.style_lapp.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.style_lapp.xml)

### Style Mint System

ID: `mint_system.sale.report_saleorder_document.style_mint_system`

```xml
<?xml version="1.0"?>
<data inherit_id="sale.report_saleorder_document" priority="50">

  <xpath expr="//tbody[hasclass('sale_tbody')]/t[2]/tr/t[1]/td[1]/span" position="before">
    <span t-field="line.product_id.name"/>
  </xpath>

  <xpath expr="//tbody[hasclass('sale_tbody')]/t[2]/tr/t[1]/td[1]/span[1]" position="after">
    <span>
      <br/>
    </span>
  </xpath>

  <xpath expr="//tbody[hasclass('sale_tbody')]/t[2]/tr/t[1]/td[1]/span[3]" position="attributes">
    <attribute name="class" separator=" " add="o_italic"/>
  </xpath>

  <xpath expr="//tbody[hasclass('sale_tbody')]/tr/td[1]/span" position="attributes">
    <attribute name="class" separator=" " add="o_italic"/>
  </xpath>

  <xpath expr="//tbody[hasclass('sale_tbody')]/tr/td[1]/span" position="before">
    <span t-field="option.product_id.name"/>
  </xpath>

  <xpath expr="//tbody[hasclass('sale_tbody')]/tr/td[1]/span" position="after">
    <span>
      <br/>
    </span>
  </xpath>

  <xpath expr="/t/t/div/div[6]" position="after">
    <div class="row">
      <div class="col h2">
        <span>New Title</span>
      </div>
    </div>
  </xpath>

  <xpath expr="/t[1]/t[1]/div[1]/div[7]/div[1]" position="attributes">
    <attribute name="class">col h4</attribute>
  </xpath>

  <xpath expr="/t/t/div/div[7]/div/span" position="replace">
    <p style="page-break-before:always;"/>
    <span>Terms and conditions</span>
  </xpath>

  <xpath expr="/t/t/div/div[2]/div[5]/p" position="attributes">
    <attribute name="style" separator=";" add="width:150px"/>
  </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.style_mint_system.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.style_mint_system.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.style_mint_system.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.style_mint_system.xml)

### Style Moser

ID: `mint_system.sale.report_saleorder_document.style_moser`

```xml
<data inherit_id="sale.report_saleorder_document" priority="60">
    <xpath expr="//div[hasclass('page')]" position="before">
        <style>
        .o_company_1_layout {
            font-family: arial;
         }
        .o_company_1_layout.o_report_layout_standard h2 {
            color: black;
               font-size: 1.4rem;
                font-weight: bold;
         }
         .o_company_1_layout.o_report_layout_standard #total strong {
            color: black;
         }
         div#informations {
              margin-top: 30px;
              margin-bottom: 60px;
         }
         h2.mt-4 {
              margin-top: 70px !important;
         }
         td#tax_amount {
              text-align: right;
         }
        </style>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.style_moser.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.style_moser.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.style_moser.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.style_moser.xml)

### Style Swissfragrance

ID: `mint_system.sale.report_saleorder_document.style_swissfragrance`

```xml
<data inherit_id="sale.report_saleorder_document" priority="60">
    <style>
      .cell_left {
      text-align: left;
      }
	</style>
    <xpath expr="//div[hasclass('page')]" position="before">
        <style>
		h2 {
        margin-top: 50px;
        	}
		</style>
    </xpath>
    <xpath expr="//th[@name='th_sml_product']" position="attributes">
        <attribute name="class" separator=" " add="cell_left"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.style_swissfragrance.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.style_swissfragrance.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.style_swissfragrance.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.style_swissfragrance.xml)

### Style Tissa

ID: `mint_system.sale.report_saleorder_document.style_tissa`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//div[hasclass('page')]" position="before">
        <style>
		  .table-sm {
				padding: 0.3rem !important;
			}	
		  .table-sm td {
				border-top: 1px solid #dee2e6 !important;
				padding: 0.3rem !important;
			}
			.table-sm th {
				border-top: 1px solid #dee2e6 !important;
				padding: 0.3rem !important;
			}
			table#info {
				font-size: 9pt;
				border: white;
			}
			h2 {
			font-size: 1.2rem;
			font-weight: bold;
			margin: 50px 0 30px 0
			}
			body {
				font-size: 11pt;
			}
		</style>
    </xpath>
    
    <xpath expr="//th[@name='th_product_uom']" position="attributes">
        <attribute name="class">text-end</attribute>
    </xpath>
    <xpath expr="//td[@name='td_product_uom']" position="attributes">
        <attribute name="class">text-end</attribute>
    </xpath>
    
    <xpath expr="//div[@t-field='doc.partner_invoice_id']" position="attributes">
        <attribute name="t-options">{"widget": "contact", "fields": ["address", "name"], "no_marker": True, "phone_icons": False}</attribute>
    </xpath>
    <xpath expr="//div[@t-field='doc.partner_shipping_id']" position="attributes">
        <attribute name="t-options">{"widget": "contact", "fields": ["address", "name"], "no_marker": True, "phone_icons": False}</attribute>
    </xpath>
</data>
```
Edit: [snippets/mint_system.sale.report_saleorder_document.style_tissa.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.style_tissa.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.style_tissa.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.style_tissa.xml)

### Style Trimada

ID: `mint_system.sale.report_saleorder_document.style_trimada`

```xml
<data inherit_id="sale.report_saleorder_document" priority="60">
    <xpath expr="//div[hasclass('page')]" position="before">
        <style>
			.o_company_1_layout {
				font-family: arial;
			}
			table.trimada {
				font-size: 9pt;
				font-family: arial;
				color: black;
			}
			table.trimada tr.first td {
				padding-bottom: 0;
			}
			table.trimada tr.second td {
				padding-top: 0;
			}
			table.trimada tr.second {
				border-bottom: 1px solid rgb(220,220,220);
			}
			table.trimada thead tr {
				border-top:solid 1px;
				border-bottom: solid 1px;
			}
			table.trimada thead th#position {
				width: 5mm;
			}
			table.trimada thead th#default_code {
			  width: 27mm;
			  text-align: right;
			}
			table.trimada thead th#quantity {
			  width: 25mm;
			  text-align: right !important;
			}
			table.trimada tbody td#position {
			  text-align: right;
			}
			table.trimada tbody td#default_code {
			  text-align: right;
			}
			table.trimada tbody #commitment_date {
			  text-align: right;
			}
			table.trimada tbody td span#product_uom_qty {
			  font-weight: bold;
			}
			table.trimada tbody td span#product_uom_qty_confirmed {
			  font-weight: bold;
			}
			address {
			  line-height: 1.2;
			}
			.mb-0 span {
			  line-height: 1.2;
			}
			.subtitel {
				font-size: 11pt;
				font-family: arial;
				margin-top: 10mm;
			}
			.note {
				font-size: 9pt;
				font-family: arial;
			}
		</style>
    </xpath>
    <xpath expr="//h2" position="attributes">
        <attribute name="style">color: black; font-size:13pt; font-weight:bold; margin-top:10mm; margin-bottom:3mm</attribute>
    </xpath>
    <xpath expr="//th[@name='th_description']/../../.." position="attributes">
        <attribute name="class" separator=" " add="trimada table-borderless"/>
    </xpath>
    <xpath expr="//table/thead//tr[1]//th[3]" position="attributes">
        <attribute name="class">text-start</attribute>
    </xpath>
    <xpath expr="//table/thead//th[@name='th_commitment_date']" position="attributes">
        <attribute name="class">text-end</attribute>
    </xpath>
    <xpath expr="//table/tbody//tr[1]//td[3]" position="attributes">
        <attribute name="class">text-end</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.style_trimada.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.style_trimada.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.style_trimada.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.style_trimada.xml)

### Style Valperca

ID: `mint_system.sale.report_saleorder_document.style_valperca`

```xml
<data inherit_id="sale.report_saleorder_document" priority="60">
    <xpath expr="//div[hasclass('page')]" position="before">
        
    
    <style>
      .maintable th {
          border-bottom: solid 1px;
       }
      .maintable td {
          border-bottom: solid grey 1px;
      }
      .clearfix td {
          border-bottom: solid 1px;
      }
	</style>
    </xpath>
   
    <xpath expr="//table[@class='o_has_total_table table o_main_table table-borderless']" position="attributes">
        <attribute name="class">maintable o_has_total_table table o_main_table</attribute>
    </xpath>
    
    
</data>
```
Edit: [snippets/mint_system.sale.report_saleorder_document.style_valperca.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.style_valperca.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.style_valperca.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.style_valperca.xml)

### Style Xinomer

ID: `mint_system.sale.report_saleorder_document.style_xinomer`

```xml
<data inherit_id="sale.report_saleorder_document" priority="60">

    <xpath expr="//tbody[@class='sale_tbody']" position="after">
        <style>
		  td {
		    vertical-align: top !important;
		  }
        </style>
    </xpath>

    <xpath expr="//h2" position="attributes">
        <attribute name="style">color: black; font-size:13pt; font-weight:bold; margin-top:10mm; margin-bottom:3mm</attribute>
    </xpath>

    <xpath expr="//table[@class='table table-sm o_main_table table-borderless mt-4']" position="attributes">
        <attribute name="class">table table-sm o_main_table mt-4 custom-border</attribute>
        <attribute name="style">border-top-width: 1px</attribute>
    </xpath>

    <xpath expr="//th[@name='th_description']" position="attributes">
        <attribute name="style">width: 110px</attribute>
    </xpath>

    <xpath expr="//div[@name='total']" position="attributes">
        <attribute name="style">width: 280px; float: right</attribute>
    </xpath>

    <xpath expr="//div[@name='total']/div" position="attributes">
        <attribute name="t-attf-class"/>
    </xpath>

</data>
```
Edit: [snippets/mint_system.sale.report_saleorder_document.style_xinomer.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.style_xinomer.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.style_xinomer.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.style_xinomer.xml)

### X Hide On Sale Order

ID: `mint_system.sale.report_saleorder_document.x_hide_on_sale_order`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//t[@t-if='not line.display_type']" position="attributes">
        <attribute name="t-if">not line.display_type and not line.product_id.x_hide_on_sale_order</attribute>
    </xpath>
    <!--<xpath expr="//t[@t-foreach='doc.order_line']" position="attributes">-->
    <!-- <attribute name="t-foreach">doc.order_line.filtered(lambda l: not l.product_id.x_hide_on_sale_order)</attribute>-->
    <!--</xpath>-->
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.x_hide_on_sale_order.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.x_hide_on_sale_order.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.x_hide_on_sale_order.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.x_hide_on_sale_order.xml)

### X Payment Term Blanket Order

ID: `mint_system.sale.report_saleorder_document.x_payment_term_blanket_order`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//div/span[@t-field='doc.note']/.." position="before">
        <div class="row" style="margin-top: 1rem; margin-bottom: 1rem">
            <div class="col">
                <strong>Zahlungsbedingungen: </strong>
                <t t-if="doc.x_payment_term_blanket_order">
                    <span t-field="doc.x_payment_term_blanket_order"/>
                </t>
                <t t-if="not doc.x_payment_term_blanket_order">
                    <span t-field="doc.payment_term_id.name"/>
                </t>
            </div>
        </div>
    </xpath>
</data>
```
Edit: [snippets/mint_system.sale.report_saleorder_document.x_payment_term_blanket_order.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.x_payment_term_blanket_order.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.x_payment_term_blanket_order.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.x_payment_term_blanket_order.xml)

### X Project

ID: `mint_system.sale.report_saleorder_document.x_project`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">

  <xpath expr="//div[@id='informations']/div[4]" position="after">
    <div t-if="doc.x_project" class="col-5">
      <strong>Project:</strong><br/>
      <span t-field="doc.x_project"/>
    </div>
   
  </xpath>
</data>
```
Edit: [snippets/mint_system.sale.report_saleorder_document.x_project.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.x_project.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.x_project.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.x_project.xml)

### X Warranty

ID: `mint_system.sale.report_saleorder_document.x_warranty`

```xml
<data inherit_id="sale.report_saleorder_document" priority="50">
    <xpath expr="//td[@name='td_name']" position="inside">
        <br/>
        <span t-field="line.product_template_id.x_warranty"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_document.x_warranty.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_document.x_warranty.xml)

Source: [snippets/mint_system.sale.report_saleorder_document.x_warranty.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_document.x_warranty.xml)

## Report Saleorder Pro Forma

### Append Signature

ID: `mint_system.sale.report_saleorder_pro_forma.append_signature`

```xml
<data inherit_id="sale.report_saleorder_pro_forma" priority="50">
    <xpath expr="/t/t/div/table/tbody/t[2]/tr/t[1]/td[1]/span" position="after">
        <t t-if="is_pro_forma">
            <t t-if="line.product_id.hs_code">
                <br/>
                <span>Zolltarifnummer: </span>
                <span t-field="line.product_id.hs_code"/>
            </t>
        </t>
    </xpath>
    <xpath expr="/t/t/div/p[2]" position="after">
        <t t-if="is_pro_forma">
            <span>
                <p>Der Unterzeichner erkl&#xE4;rt, dass die in diesem Dokument aufgef&#xFC;hrten Waren und Ursprungserzeugnisse der Schweiz sind und den Ursprungsregeln im Pr&#xE4;ferenzverkehr mit der EU entsprechen.<br/><br/></p>
                <p>Unterschrift: _______________________    Datum: _______________________<br/>                        Velo Manufaktur AG<br/></p>
            </span>
        </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.report_saleorder_pro_forma.append_signature.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_pro_forma.append_signature.xml)

Source: [snippets/mint_system.sale.report_saleorder_pro_forma.append_signature.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_pro_forma.append_signature.xml)

### Consolidated

ID: `mint_system.sale.report_saleorder_pro_forma.consolidated`

```xml
<t t-name="sale.report_saleorder_pro_forma">
    <t t-call="web.html_container">
        <t t-set="is_pro_forma" t-value="True"/>
        <t t-set="is_pro_forma_consolidated" t-value="True"/>
        <t t-call="web.external_layout">
            <t t-foreach="docs" t-as="doc"><span t-field="doc.partner_id"/>, 
            <span t-esc="doc.name"/>, 
            <span t-esc="doc.client_order_ref"/><br/></t>
            <table class="table table-sm o_main_table mt-4">
                <thead style="display: table-row-group">
                    <tr>
                        <th name="th_description" class="text-start">Description</th>
                        <th name="th_quantity">Quantity</th>
                        <th name="th_priceunit" class="text-end">Unit Price</th>
                        <th name="th_discount"/>
                        <th name="th_taxes" class="text-end">Taxes</th>
                        <th name="th_subtotal" class="text-end"/>
                    </tr>
                </thead>
            </table>
            <t t-foreach="docs" t-as="doc">
                <table class="table table-sm o_main_table mt-4">
                    <!--
           <tbody class="sale_tbody">
             <t t-set="lines" t-value="doc.order_line.sorted(key=lambda l: (-l.sequence, l.name, -l.id), reverse=True)"/>
             
               <t t-foreach="lines" t-as="line">
                 <tr>
                  <td name="td_name"><span t-field="line.name"/></td>
                </tr>
               </t>
             
            </tbody>
            -->
                    <tbody class="sale_tbody">
                        <t t-set="lines" t-value="doc.order_line"/>
                        <t t-foreach="lines" t-as="line">
                            <tr>
                                <t t-if="not previous_name or line.name != previous_name">
                                    <td name="td_name">
                                        <span t-field="line.name"/>
                                    </td>
                                </t>
                                <t t-set="previous_name" t-value="line.name"/>
                            </tr>
                        </t>
                    </tbody>
                </table>
            </t>
        </t>
    </t>
</t>

```
Edit: [snippets/mint_system.sale.report_saleorder_pro_forma.consolidated.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.report_saleorder_pro_forma.consolidated.xml)

Source: [snippets/mint_system.sale.report_saleorder_pro_forma.consolidated.xml](https://odoo.build/snippets/mint_system.sale.report_saleorder_pro_forma.consolidated.xml)

## Sale Order Line View Form Readonly

### Edit Form

ID: `mint_system.sale.sale_order_line_view_form_readonly.edit_form`

```xml
<data inherit_id="sale.sale_order_line_view_form_readonly" priority="50">
    <form position="replace">
        <form string="Sales Order Item">
            <sheet>
                <div class="oe_title">
                    <h1>
                        <field name="display_name"/>
                    </h1>
                </div>
                <group>
                    <group>
                        <field name="order_id"/>
                        <field name="product_id"/>
                        <field name="name"/>
                        <field name="product_uom_qty"/>
                        <field name="qty_delivered"/>
                        <field name="qty_invoiced"/>
                        <field name="product_uom_category_id"/>
                        <field name="product_uom"/>
                        <field name="company_id" options="{'no_create': True}" groups="base.group_multi_company"/>
                        <field name="order_partner_id" invisible="1"/>
                        <field name="display_type" invisible="1"/>
                        <field name="product_updatable" invisible="1"/>
                    </group>
                    <group>
                        <field name="price_unit"/>
                        <field name="discount" groups="product.group_discount_per_so_line"/>
                        <field name="price_subtotal" widget="monetary"/>
                        <field name="tax_id" widget="many2many_tags"/>
                        <field name="price_tax" widget="monetary"/>
                        <field name="price_total" widget="monetary"/>
                        <field name="currency_id" invisible="1"/>
                    </group>
                </group>
            </sheet>
        </form>
    </form>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_line_view_form_readonly.edit_form.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_line_view_form_readonly.edit_form.xml)

Source: [snippets/mint_system.sale.sale_order_line_view_form_readonly.edit_form.xml](https://odoo.build/snippets/mint_system.sale.sale_order_line_view_form_readonly.edit_form.xml)

### Edit Price Unit

ID: `mint_system.sale.sale_order_line_view_form_readonly.edit_price_unit`

```xml
<data inherit_id="sale.sale_order_line_view_form_readonly" priority="50">
    <field name="price_unit" position="attributes">
        <attribute name="readonly">0</attribute>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_line_view_form_readonly.edit_price_unit.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_line_view_form_readonly.edit_price_unit.xml)

Source: [snippets/mint_system.sale.sale_order_line_view_form_readonly.edit_price_unit.xml](https://odoo.build/snippets/mint_system.sale.sale_order_line_view_form_readonly.edit_price_unit.xml)

### Edit Tax Id

ID: `mint_system.sale.sale_order_line_view_form_readonly.edit_tax_id`

```xml
<data inherit_id="sale.sale_order_line_view_form_readonly" priority="50">
    <field name="tax_id" position="attributes">
        <attribute name="readonly">0</attribute>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_line_view_form_readonly.edit_tax_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_line_view_form_readonly.edit_tax_id.xml)

Source: [snippets/mint_system.sale.sale_order_line_view_form_readonly.edit_tax_id.xml](https://odoo.build/snippets/mint_system.sale.sale_order_line_view_form_readonly.edit_tax_id.xml)

### Show Invoice Lines

ID: `mint_system.sale.sale_order_line_view_form_readonly.show_invoice_lines`

```xml
<data inherit_id="sale.sale_order_line_view_form_readonly" priority="50">
    <field name="price_total" position="after">
        <field name="invoice_lines" widget="many2many_tags"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_line_view_form_readonly.show_invoice_lines.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_line_view_form_readonly.show_invoice_lines.xml)

Source: [snippets/mint_system.sale.sale_order_line_view_form_readonly.show_invoice_lines.xml](https://odoo.build/snippets/mint_system.sale.sale_order_line_view_form_readonly.show_invoice_lines.xml)

### Show Is Downpayment

ID: `mint_system.sale.sale_order_line_view_form_readonly.show_is_downpayment`

```xml
<data inherit_id="sale.sale_order_line_view_form_readonly" priority="50">
    <field name="product_id" position="after">
        <field name="is_downpayment"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_line_view_form_readonly.show_is_downpayment.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_line_view_form_readonly.show_is_downpayment.xml)

Source: [snippets/mint_system.sale.sale_order_line_view_form_readonly.show_is_downpayment.xml](https://odoo.build/snippets/mint_system.sale.sale_order_line_view_form_readonly.show_is_downpayment.xml)

### Show Project Id

ID: `mint_system.sale.sale_order_line_view_form_readonly.show_project_id`

```xml
<data inherit_id="sale.sale_order_line_view_form_readonly" priority="50">
    <field name="order_id" position="after">
        <field name="project_id"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_line_view_form_readonly.show_project_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_line_view_form_readonly.show_project_id.xml)

Source: [snippets/mint_system.sale.sale_order_line_view_form_readonly.show_project_id.xml](https://odoo.build/snippets/mint_system.sale.sale_order_line_view_form_readonly.show_project_id.xml)

### Show Subscription Id

ID: `mint_system.sale.sale_order_line_view_form_readonly.show_subscription_id`

```xml
<data inherit_id="sale.sale_order_line_view_form_readonly" priority="50">
    <field name="order_id" position="after">
        <field name="subscription_id"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_line_view_form_readonly.show_subscription_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_line_view_form_readonly.show_subscription_id.xml)

Source: [snippets/mint_system.sale.sale_order_line_view_form_readonly.show_subscription_id.xml](https://odoo.build/snippets/mint_system.sale.sale_order_line_view_form_readonly.show_subscription_id.xml)

### Show Temporal Type

ID: `mint_system.sale.sale_order_line_view_form_readonly.show_temporal_type`

```xml
<data inherit_id="sale.sale_order_line_view_form_readonly" priority="50">
    <field name="order_id" position="after">
        <field name="temporal_type"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_line_view_form_readonly.show_temporal_type.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_line_view_form_readonly.show_temporal_type.xml)

Source: [snippets/mint_system.sale.sale_order_line_view_form_readonly.show_temporal_type.xml](https://odoo.build/snippets/mint_system.sale.sale_order_line_view_form_readonly.show_temporal_type.xml)

## Sale Order Portal Content

### Add Header And Footer Note

ID: `mint_system.sale.sale_order_portal_content.add_header_and_footer_note`

```xml
<data inherit_id="sale.sale_order_portal_content" priority="50">
    <xpath expr="//div[@id='informations']" position="after">
        <t t-if="sale_order.note_header != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
            <span class="note" t-field="sale_order.note_header"/>
        </t>
    </xpath>
    <xpath expr="//div[@name='signature']" position="before">
        <t t-if="sale_order.note_footer != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
            <span class="note" t-field="sale_order.note_footer"/>
        </t>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_portal_content.add_header_and_footer_note.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_portal_content.add_header_and_footer_note.xml)

Source: [snippets/mint_system.sale.sale_order_portal_content.add_header_and_footer_note.xml](https://odoo.build/snippets/mint_system.sale.sale_order_portal_content.add_header_and_footer_note.xml)

### Convert Html Note

ID: `mint_system.sale.sale_order_portal_content.convert_html_note`

```xml
<data inherit_id="sale.sale_order_portal_content" priority="50">
    <t t-if="line.display_type == 'line_note'" position="replace">
        <t t-if="line.display_type == 'line_note' and '&lt;!DOCTYPE html&gt;' in line.name">
            <td colspan="99">
                <t t-raw="line.name.replace('&lt;!DOCTYPE html&gt;', '')"/>
            </td>
        </t>
        <t t-elif="line.display_type == 'line_note' and '&lt;!DOCTYPE html&gt;' not in line.name">
            <td colspan="99">
                <span t-field="line.name"/>
            </td>
        </t>
    </t>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_portal_content.convert_html_note.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_portal_content.convert_html_note.xml)

Source: [snippets/mint_system.sale.sale_order_portal_content.convert_html_note.xml](https://odoo.build/snippets/mint_system.sale.sale_order_portal_content.convert_html_note.xml)

### Format Qty

ID: `mint_system.sale.sale_order_portal_content.format_qty`

```xml
<data inherit_id="sale.sale_order_portal_content" priority="50">
    <span t-field="line.product_uom_qty" position="attributes">
        <attribute name="t-options-widget">"integer"</attribute>
    </span>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_portal_content.format_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_portal_content.format_qty.xml)

Source: [snippets/mint_system.sale.sale_order_portal_content.format_qty.xml](https://odoo.build/snippets/mint_system.sale.sale_order_portal_content.format_qty.xml)

### Get Position

ID: `mint_system.sale.sale_order_portal_content.get_position`

```xml
<data inherit_id="sale.sale_order_portal_content" priority="50">
    <xpath expr="//table[@id='sales_order_table']//tr/th[1]" position="before">
        <th class="text-left">Pos</th>
    </xpath>
    <xpath expr="//td[@id='default_code']" position="before">
        <td id="position">
            <span t-field="line.position"/>
        </td>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_portal_content.get_position.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_portal_content.get_position.xml)

Source: [snippets/mint_system.sale.sale_order_portal_content.get_position.xml](https://odoo.build/snippets/mint_system.sale.sale_order_portal_content.get_position.xml)

### Product Name

ID: `mint_system.sale.sale_order_portal_content.product_name`

```xml
<!-- Add product name to quote -->
<data inherit_id="sale.sale_order_portal_content" priority="50">
    <xpath expr="//td[@id='product_name']" position="replace">
        <td id="product_name">
            <span t-field="line.product_id.name"/>
            <br/>
            <span class="font-italic" t-field="line.name"/>
        </td>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_portal_content.product_name.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_portal_content.product_name.xml)

Source: [snippets/mint_system.sale.sale_order_portal_content.product_name.xml](https://odoo.build/snippets/mint_system.sale.sale_order_portal_content.product_name.xml)

### Remove Calculation

ID: `mint_system.sale.sale_order_portal_content.remove_calculation`

```xml
<data inherit_id="sale.sale_order_portal_content" priority="50">
    <xpath expr="//table/thead/tr/th[6]" position="replace">
  </xpath>
    <xpath expr="//table/thead/tr/th[5]" position="replace">
  </xpath>
    <xpath expr="//table/thead/tr/th[4]" position="replace">
  </xpath>
    <xpath expr="//table/thead/tr/th[3]" position="replace">
  </xpath>
    <xpath expr="//table/tbody/t[2]/tr/t[1]/td[6]" position="replace">
  </xpath>
    <xpath expr="//table/tbody/t[2]/tr/t[1]/td[5]" position="replace">
  </xpath>
    <xpath expr="//table/tbody/t[2]/tr/t[1]/td[4]" position="replace">
  </xpath>
    <xpath expr="//table/tbody/t[2]/tr/t[1]/td[3]" position="replace">
  </xpath>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_portal_content.remove_calculation.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_portal_content.remove_calculation.xml)

Source: [snippets/mint_system.sale.sale_order_portal_content.remove_calculation.xml](https://odoo.build/snippets/mint_system.sale.sale_order_portal_content.remove_calculation.xml)

### Remove Discount Percentage

ID: `mint_system.sale.sale_order_portal_content.remove_discount_percentage`

```xml
<data inherit_id="sale.sale_order_portal_content" priority="50">
    <xpath expr="//th[@t-if='display_discount']/span" position="replace">
        <span>Rabatt</span>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_portal_content.remove_discount_percentage.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_portal_content.remove_discount_percentage.xml)

Source: [snippets/mint_system.sale.sale_order_portal_content.remove_discount_percentage.xml](https://odoo.build/snippets/mint_system.sale.sale_order_portal_content.remove_discount_percentage.xml)

### Remove Product Uom

ID: `mint_system.sale.sale_order_portal_content.remove_product_uom`

```xml
<data inherit_id="sale.sale_order_portal_content" priority="50">
    <xpath expr="//span[@t-field='line.product_uom']" position="replace"/>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_portal_content.remove_product_uom.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_portal_content.remove_product_uom.xml)

Source: [snippets/mint_system.sale.sale_order_portal_content.remove_product_uom.xml](https://odoo.build/snippets/mint_system.sale.sale_order_portal_content.remove_product_uom.xml)

### Show Default Code

ID: `mint_system.sale.sale_order_portal_content.show_default_code`

```xml
<data inherit_id="sale.sale_order_portal_content" priority="50">
    <xpath expr="//table[@id='sales_order_table']//tr/th[1]" position="before">
        <th class="text-left">Referenz</th>
    </xpath>
    <xpath expr="//td[@id='product_name']" position="before">
        <style>
      td#default_code {
        white-space: nowrap;
      }
    </style>
        <td id="default_code">
            <span t-field="line.product_id.default_code"/>
        </td>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_portal_content.show_default_code.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_portal_content.show_default_code.xml)

Source: [snippets/mint_system.sale.sale_order_portal_content.show_default_code.xml](https://odoo.build/snippets/mint_system.sale.sale_order_portal_content.show_default_code.xml)

### Show Triple Discount

ID: `mint_system.sale.sale_order_portal_content.show_triple_discount`

```xml
<data inherit_id="sale.sale_order_portal_content" priority="50">
    <t t-set="display_discount" position="replace">
        <t t-set="display_discount" t-value="any(l.discount or l.discount2 or l.discount3 for l in sale_order.order_line)"/>
    </t>
    <strong t-if="line.discount &gt; 0" position="replace">
        <t t-if="line.discount"><span t-field="line.discount"/><br /></t>
        <t t-if="line.discount2"><span t-field="line.discount2"/><br /></t>
        <t t-if="line.discount3"><span t-field="line.discount3"/></t>
    </strong>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_portal_content.show_triple_discount.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_portal_content.show_triple_discount.xml)

Source: [snippets/mint_system.sale.sale_order_portal_content.show_triple_discount.xml](https://odoo.build/snippets/mint_system.sale.sale_order_portal_content.show_triple_discount.xml)

### X Description

ID: `mint_system.sale.sale_order_portal_content.x_description`

```xml
<data inherit_id="sale.sale_order_portal_content" priority="50">
    <xpath expr="//div[@id='informations']" position="after">
        <p t-field="sale_order.x_studio_description"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_portal_content.x_description.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_portal_content.x_description.xml)

Source: [snippets/mint_system.sale.sale_order_portal_content.x_description.xml](https://odoo.build/snippets/mint_system.sale.sale_order_portal_content.x_description.xml)

### X Hide On Sale Order

ID: `mint_system.sale.sale_order_portal_content.x_hide_on_sale_order`

```xml
<data inherit_id="sale.sale_order_portal_content" priority="50">
    <xpath expr="//t[@t-if='not line.display_type']" position="attributes">
        <attribute name="t-if">not line.display_type and not line.product_id.x_hide_on_sale_order</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_portal_content.x_hide_on_sale_order.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_portal_content.x_hide_on_sale_order.xml)

Source: [snippets/mint_system.sale.sale_order_portal_content.x_hide_on_sale_order.xml](https://odoo.build/snippets/mint_system.sale.sale_order_portal_content.x_hide_on_sale_order.xml)

## Sale Order Tree

### Carrier Id

ID: `mint_system.sale.sale_order_tree.carrier_id`

```xml
<data inherit_id="sale.sale_order_tree" priority="50">
    <xpath expr="//field[@name='validity_date']" position="after">
        <field name="carrier_id" optional="hide"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_tree.carrier_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_tree.carrier_id.xml)

Source: [snippets/mint_system.sale.sale_order_tree.carrier_id.xml](https://odoo.build/snippets/mint_system.sale.sale_order_tree.carrier_id.xml)

## Sale Order View Search Inherit Quotation

### Add Filter Cancel

ID: `mint_system.sale.sale_order_view_search_inherit_quotation.add_filter_cancel`

```xml
<data inherit_id="sale.sale_order_view_search_inherit_quotation" priority="50">
    <xpath expr="//filter[@name='sales']" position="after">
        <filter string="Abgebrochen" name="cancel" domain="[('state','=','cancel')]"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_view_search_inherit_quotation.add_filter_cancel.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_view_search_inherit_quotation.add_filter_cancel.xml)

Source: [snippets/mint_system.sale.sale_order_view_search_inherit_quotation.add_filter_cancel.xml](https://odoo.build/snippets/mint_system.sale.sale_order_view_search_inherit_quotation.add_filter_cancel.xml)

### Add Filter Sent

ID: `mint_system.sale.sale_order_view_search_inherit_quotation.add_filter_sent`

```xml
<data inherit_id="sale.sale_order_view_search_inherit_quotation" priority="50">
    <xpath expr="//filter[@name='sales']" position="after">
        <filter string="Gesendet" name="sent" domain="[('state','=','sent')]"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_view_search_inherit_quotation.add_filter_sent.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_view_search_inherit_quotation.add_filter_sent.xml)

Source: [snippets/mint_system.sale.sale_order_view_search_inherit_quotation.add_filter_sent.xml](https://odoo.build/snippets/mint_system.sale.sale_order_view_search_inherit_quotation.add_filter_sent.xml)

### Add Filter State Draft Or Sent

ID: `mint_system.sale.sale_order_view_search_inherit_quotation.add_filter_state_draft_or_sent`

```xml
<data inherit_id="sale.sale_order_view_search_inherit_quotation" priority="50">
    <xpath expr="//filter[@name='my_quotation']" position="after">
        <filter string="Meine Angebote im Status Angebot oder Gesendet" name="state_draft_or_sent" domain="['&amp;',('user_id', '=', uid),('state','in',('draft', 'sent'))]"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_view_search_inherit_quotation.add_filter_state_draft_or_sent.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_view_search_inherit_quotation.add_filter_state_draft_or_sent.xml)

Source: [snippets/mint_system.sale.sale_order_view_search_inherit_quotation.add_filter_state_draft_or_sent.xml](https://odoo.build/snippets/mint_system.sale.sale_order_view_search_inherit_quotation.add_filter_state_draft_or_sent.xml)

### Remove Filter My Quotation

ID: `mint_system.sale.sale_order_view_search_inherit_quotation.remove_filter_my_quotation`

```xml
<data inherit_id="sale.sale_order_view_search_inherit_quotation" priority="50">
    <xpath expr="//filter[@name='my_quotation']" position="replace"/>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_view_search_inherit_quotation.remove_filter_my_quotation.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_view_search_inherit_quotation.remove_filter_my_quotation.xml)

Source: [snippets/mint_system.sale.sale_order_view_search_inherit_quotation.remove_filter_my_quotation.xml](https://odoo.build/snippets/mint_system.sale.sale_order_view_search_inherit_quotation.remove_filter_my_quotation.xml)

## Sale Order View Search Inherit Sale

### Add Invoice Status Invoiced

ID: `mint_system.sale.sale_order_view_search_inherit_sale.add_invoice_status_invoiced`

```xml
<data inherit_id="sale.sale_order_view_search_inherit_sale" priority="50">
    <xpath expr="//filter[@name='to_invoice']" position="after">
        <filter string="Komplett abgerechnet" name="invoice_status_no" domain="[('invoice_status','=','invoiced')]"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_view_search_inherit_sale.add_invoice_status_invoiced.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_view_search_inherit_sale.add_invoice_status_invoiced.xml)

Source: [snippets/mint_system.sale.sale_order_view_search_inherit_sale.add_invoice_status_invoiced.xml](https://odoo.build/snippets/mint_system.sale.sale_order_view_search_inherit_sale.add_invoice_status_invoiced.xml)

### Add Invoice Status No

ID: `mint_system.sale.sale_order_view_search_inherit_sale.add_invoice_status_no`

```xml
<data inherit_id="sale.sale_order_view_search_inherit_sale" priority="50">
    <xpath expr="//filter[@name='to_invoice']" position="after">
        <filter string="Nichts abzurechnen" name="invoice_status_no" domain="[('invoice_status','=','no')]"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_view_search_inherit_sale.add_invoice_status_no.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_view_search_inherit_sale.add_invoice_status_no.xml)

Source: [snippets/mint_system.sale.sale_order_view_search_inherit_sale.add_invoice_status_no.xml](https://odoo.build/snippets/mint_system.sale.sale_order_view_search_inherit_sale.add_invoice_status_no.xml)

### Add Invoice Status To Invoice Or No

ID: `mint_system.sale.sale_order_view_search_inherit_sale.add_invoice_status_to_invoice_or_no`

```xml
<data inherit_id="sale.sale_order_view_search_inherit_sale" priority="50">
    <xpath expr="//filter[@name='my_sale_orders_filter']" position="after">
        <filter string="Abzurechnen oder Nichts abzurechnen" name="invoice_status_to_invoice_or_no" domain="[('invoice_status','in',('to invoice', 'no'))]"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_view_search_inherit_sale.add_invoice_status_to_invoice_or_no.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_view_search_inherit_sale.add_invoice_status_to_invoice_or_no.xml)

Source: [snippets/mint_system.sale.sale_order_view_search_inherit_sale.add_invoice_status_to_invoice_or_no.xml](https://odoo.build/snippets/mint_system.sale.sale_order_view_search_inherit_sale.add_invoice_status_to_invoice_or_no.xml)

### Filter Commitment Date

ID: `mint_system.sale.sale_order_view_search_inherit_sale.filter_commitment_date`

```xml
<data inherit_id="sale.sale_order_view_search_inherit_sale" priority="50">
    <filter name="order_date" position="after">
        <filter string="Liefertermin" name="date_commitment" date="commitment_date"/>
    </filter>
</data>

```
Edit: [snippets/mint_system.sale.sale_order_view_search_inherit_sale.filter_commitment_date.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.sale_order_view_search_inherit_sale.filter_commitment_date.xml)

Source: [snippets/mint_system.sale.sale_order_view_search_inherit_sale.filter_commitment_date.xml](https://odoo.build/snippets/mint_system.sale.sale_order_view_search_inherit_sale.filter_commitment_date.xml)

## Variants

### Remove Variant Extra Price

ID: `mint_system.sale.variants.remove_variant_extra_price`

```xml
<data inherit_id="sale.variants" priority="50">
    <xpath expr="//span[hasclass('variant_price_extra')]" position="before">
        <style>
            li.variant_attribute .badge {
                display: none;
            }
        </style>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.variants.remove_variant_extra_price.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.variants.remove_variant_extra_price.xml)

Source: [snippets/mint_system.sale.variants.remove_variant_extra_price.xml](https://odoo.build/snippets/mint_system.sale.variants.remove_variant_extra_price.xml)

## View Order Form

### Add Blanket Order Id

ID: `mint_system.sale.view_order_form.add_blanket_order_id`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='tag_ids']" position="after">
        <field name="blanket_order_id"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.add_blanket_order_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.add_blanket_order_id.xml)

Source: [snippets/mint_system.sale.view_order_form.add_blanket_order_id.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.add_blanket_order_id.xml)

### Add Picking Policy

ID: `mint_system.sale.view_order_form.add_picking_policy`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//page[@name='other_information']//field[@name='user_id']" position="before">
        <field name="picking_policy"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.add_picking_policy.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.add_picking_policy.xml)

Source: [snippets/mint_system.sale.view_order_form.add_picking_policy.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.add_picking_policy.xml)

### Add Warehouse Id

ID: `mint_system.sale.view_order_form.add_warehouse_id`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='warehouse_id']" position="replace"/>
    <xpath expr="//field[@name='partner_shipping_id']" position="after">
        <field name="warehouse_id"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.add_warehouse_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.add_warehouse_id.xml)

Source: [snippets/mint_system.sale.view_order_form.add_warehouse_id.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.add_warehouse_id.xml)

### Button Recompute Add Shipping

ID: `mint_system.sale.view_order_form.button_recompute_add_shipping`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <button name="action_open_delivery_wizard" position="attributes">
        <attribute name="context">{'carrier_recompute':True}</attribute>
    </button>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.button_recompute_add_shipping.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.button_recompute_add_shipping.xml)

Source: [snippets/mint_system.sale.view_order_form.button_recompute_add_shipping.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.button_recompute_add_shipping.xml)

### Domain Partner Type

ID: `mint_system.sale.view_order_form.domain_partner_type`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//group[@name='sale_header']/group/field[@name='partner_id']" position="attributes">
        <attribute name="domain">[('type', 'not in', ['invoice', 'delivery'])]</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.domain_partner_type.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.domain_partner_type.xml)

Source: [snippets/mint_system.sale.view_order_form.domain_partner_type.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.domain_partner_type.xml)

### Edit Name

ID: `mint_system.sale.view_order_form.edit_name`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='name']" position="attributes">
        <attribute name="readonly">0</attribute>
        <attribute name="attrs">{'readonly': [('project_id', '=', False)]}</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.edit_name.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.edit_name.xml)

Source: [snippets/mint_system.sale.view_order_form.edit_name.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.edit_name.xml)

### Edit Project

ID: `mint_system.sale.view_order_form.edit_project`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <field name="project_id" position="attributes">
        <attribute name="attrs">{}</attribute>
    </field>
</data>
```
Edit: [snippets/mint_system.sale.view_order_form.edit_project.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.edit_project.xml)

Source: [snippets/mint_system.sale.view_order_form.edit_project.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.edit_project.xml)

### Edit Tax Id

ID: `mint_system.sale.view_order_form.edit_tax_id`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='tax_id']" position="attributes">
        <attribute name="attrs">{}</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.edit_tax_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.edit_tax_id.xml)

Source: [snippets/mint_system.sale.view_order_form.edit_tax_id.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.edit_tax_id.xml)

### Filter Customer Is Company

ID: `mint_system.sale.view_order_form.filter_customer_is_company`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//group[@name='partner_details']//field[@name='partner_id']" position="replace">
        <field name="partner_id" widget="res_partner_many2one" domain="[('is_company', '=', True)]" context="{'res_partner_search_mode': 'customer', 'show_address': 1, 'show_vat': True, 'default_is_company': 'True'}" options="{&quot;always_reload&quot;: True}"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.filter_customer_is_company.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.filter_customer_is_company.xml)

Source: [snippets/mint_system.sale.view_order_form.filter_customer_is_company.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.filter_customer_is_company.xml)

### Format Dates

ID: `mint_system.sale.view_order_form.format_dates`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[3][@name='date_order']" position="attributes">
        <attribute name="widget">date</attribute>
    </xpath>
    <xpath expr="//div/field[@name='commitment_date']" position="attributes">
        <attribute name="options">{"show_time":false}</attribute>
        <attribute name="widget">datetime</attribute>
    </xpath>
    <xpath expr="//field[@name='order_line']/tree/field[@name='commitment_date']" position="attributes">
        <attribute name="options">{"show_time":false}</attribute>
        <attribute name="widget">datetime</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.format_dates.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.format_dates.xml)

Source: [snippets/mint_system.sale.view_order_form.format_dates.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.format_dates.xml)

### Format Delivery Dates

ID: `mint_system.sale.view_order_form.format_delivery_dates`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='order_line']/tree/field[@name='delivery_dates']" position="attributes">
        <attribute name="string">Delivery Date</attribute>
        <attribute name="widget">date</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.format_delivery_dates.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.format_delivery_dates.xml)

Source: [snippets/mint_system.sale.view_order_form.format_delivery_dates.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.format_delivery_dates.xml)

### Header Delivery Date

ID: `mint_system.sale.view_order_form.header_delivery_date`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <field name="date_order" position="after">
        <field name="commitment_date"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.header_delivery_date.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.header_delivery_date.xml)

Source: [snippets/mint_system.sale.view_order_form.header_delivery_date.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.header_delivery_date.xml)

### Hide Validity Date

ID: `mint_system.sale.view_order_form.hide_validity_date`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <field name="validity_date" position="replace">
  </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.hide_validity_date.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.hide_validity_date.xml)

Source: [snippets/mint_system.sale.view_order_form.hide_validity_date.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.hide_validity_date.xml)

### Location In Name

ID: `mint_system.sale.view_order_form.location_in_name`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//group[@name='sale_header']/group/field[@name='partner_shipping_id']" position="attributes">
        <attribute name="context">
      {'res_partner_search_mode': 'customer', 'show_address': 1, 'show_vat': True, 'show_zip_and_city': True}
    </attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.location_in_name.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.location_in_name.xml)

Source: [snippets/mint_system.sale.view_order_form.location_in_name.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.location_in_name.xml)

### Modify Readonly Analytic Account Id

ID: `mint_system.sale.view_order_form.modify_readonly_analytic_account_id`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='analytic_account_id']" position="attributes">
        <attribute name="readonly">False</attribute>
    </xpath>
</data>
```
Edit: [snippets/mint_system.sale.view_order_form.modify_readonly_analytic_account_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.modify_readonly_analytic_account_id.xml)

Source: [snippets/mint_system.sale.view_order_form.modify_readonly_analytic_account_id.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.modify_readonly_analytic_account_id.xml)

### Modify Readonly Date Order

ID: `mint_system.sale.view_order_form.modify_readonly_date_order`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='date_order'][2]" position="attributes">
        <attribute name="attrs">{"invisible": [["state","in",["draft","sent"]]], "readonly": [["state","not in",["draft","sent","sale"]]], "required": [["state","in",["sale","done"]]]}</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.modify_readonly_date_order.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.modify_readonly_date_order.xml)

Source: [snippets/mint_system.sale.view_order_form.modify_readonly_date_order.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.modify_readonly_date_order.xml)

### Move Client Order Ref

ID: `mint_system.sale.view_order_form.move_client_order_ref`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='partner_shipping_id']" position="after">
        <field name="client_order_ref"/>
    </xpath>
    <xpath expr="//group[@name='sales_person']/field[@name='client_order_ref']" position="replace"/>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.move_client_order_ref.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.move_client_order_ref.xml)

Source: [snippets/mint_system.sale.view_order_form.move_client_order_ref.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.move_client_order_ref.xml)

### Move Comment

ID: `mint_system.sale.view_order_form.move_comment`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='payment_term_id']" position="after">
        <field name="comment" position="move"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.move_comment.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.move_comment.xml)

Source: [snippets/mint_system.sale.view_order_form.move_comment.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.move_comment.xml)

### Move Commitment Date

ID: `mint_system.sale.view_order_form.move_commitment_date`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='date_order']" position="after">
        <label for="commitment_date" string="Delivery Date"/>
        <div name="commitment_date_div" class="o_row">
            <field name="commitment_date"/>
            <span name="expected_date_span" class="text-muted">Expected: <field name="expected_date" class="oe_inline" widget="date"/>
      </span>
        </div>
    </xpath>
    <xpath expr="//group/group[@name='sale_shipping']" position="replace"/>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.move_commitment_date.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.move_commitment_date.xml)

Source: [snippets/mint_system.sale.view_order_form.move_commitment_date.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.move_commitment_date.xml)

### Move Note

ID: `mint_system.sale.view_order_form.move_note`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='picking_note']" position="replace"/>
    <xpath expr="//field[@name='picking_customer_note']" position="replace"/>
    <xpath expr="//group[@name='note_group']" position="after">
        <group name="sale_shipping" position="inside">
            <field name="picking_note" string="Notiz R&#xFC;stschein" placeholder="Notiz ..." readonly="state not in ('draft','sent')"/>
            <field name="picking_customer_note" string="Notiz Lieferschein" placeholder="Notiz ..." readonly="state not in ('draft','sent')"/>
        </group>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.move_note.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.move_note.xml)

Source: [snippets/mint_system.sale.view_order_form.move_note.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.move_note.xml)

### Move Picking Notes

ID: `mint_system.sale.view_order_form.move_picking_notes`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='picking_note']" position="replace"/>
    <xpath expr="//field[@name='picking_customer_note']" position="replace"/>
    <xpath expr="//group[@name='note_group']" position="before">
        <group name="sale_shipping" position="inside">
            <field name="picking_note" string="Notiz R&#xFC;stschein" readonly="state not in ('draft','sent')"/>
            <field name="picking_customer_note" string="Notiz Lieferschein" readonly="state not in ('draft','sent')"/>
        </group>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.move_picking_notes.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.move_picking_notes.xml)

Source: [snippets/mint_system.sale.view_order_form.move_picking_notes.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.move_picking_notes.xml)

### Move Warehouse Id

ID: `mint_system.sale.view_order_form.move_warehouse_id`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='warehouse_id']" position="replace"/>
    <xpath expr="//field[@name='partner_shipping_id']" position="after">
        <field name="warehouse_id"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.move_warehouse_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.move_warehouse_id.xml)

Source: [snippets/mint_system.sale.view_order_form.move_warehouse_id.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.move_warehouse_id.xml)

### No Create Edit

ID: `mint_system.sale.view_order_form.no_create_edit`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='partner_id']" position="attributes">
        <attribute name="options">{'always_reload': True, 'no_quick_create': True, 'no_create_edit': True}</attribute>
    </xpath>
    <xpath expr="//field[@name='product_id']" position="attributes">
        <attribute name="widget">selection</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.no_create_edit.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.no_create_edit.xml)

Source: [snippets/mint_system.sale.view_order_form.no_create_edit.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.no_create_edit.xml)

### Product Id No Create

ID: `mint_system.sale.view_order_form.product_id_no_create`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='order_line']/tree/field[@name='product_id']" position="attributes">
        <attribute name="options">{'no_open': True, 'no_create': True}</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.product_id_no_create.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.product_id_no_create.xml)

Source: [snippets/mint_system.sale.view_order_form.product_id_no_create.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.product_id_no_create.xml)

### Project Domain

ID: `mint_system.sale.view_order_form.project_domain`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <field name="project_id" position="attributes">
        <attribute name="domain">[('partner_id', '=', partner_id)]</attribute>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.project_domain.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.project_domain.xml)

Source: [snippets/mint_system.sale.view_order_form.project_domain.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.project_domain.xml)

### Remove Margin Percent

ID: `mint_system.sale.view_order_form.remove_margin_percent`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='margin_percent']" position="replace"/>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.remove_margin_percent.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.remove_margin_percent.xml)

Source: [snippets/mint_system.sale.view_order_form.remove_margin_percent.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.remove_margin_percent.xml)

### Set Groups Date Order

ID: `mint_system.sale.view_order_form.set_groups_date_order`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <field name="date_order" position="attributes">
        <attribute name="groups"/>
    </field>
    <xpath expr="//label[@for='date_order']/.." position="attributes">
        <attribute name="groups"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.set_groups_date_order.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.set_groups_date_order.xml)

Source: [snippets/mint_system.sale.view_order_form.set_groups_date_order.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.set_groups_date_order.xml)

### Set Limit Order Line

ID: `mint_system.sale.view_order_form.set_limit_order_line`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='order_line']/tree" position="attributes">
        <attribute name="limit">100</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.set_limit_order_line.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.set_limit_order_line.xml)

Source: [snippets/mint_system.sale.view_order_form.set_limit_order_line.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.set_limit_order_line.xml)

### Show Carrier Method

ID: `mint_system.sale.view_order_form.show_carrier_method`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <field name="payment_term_id" position="after">
        <field name="carrier_id"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.show_carrier_method.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.show_carrier_method.xml)

Source: [snippets/mint_system.sale.view_order_form.show_carrier_method.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.show_carrier_method.xml)

### Show Commitment Date

ID: `mint_system.sale.view_order_form.show_commitment_date`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='date_order']" position="after">
        <field name="commitment_date" readonly="1"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.show_commitment_date.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.show_commitment_date.xml)

Source: [snippets/mint_system.sale.view_order_form.show_commitment_date.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.show_commitment_date.xml)

### Show Invoice Lines

ID: `mint_system.sale.view_order_form.show_invoice_lines`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='order_line']/tree/field[@name='qty_invoiced']" position="after">
        <field name="invoice_lines" widget="many2many_tags" optional="hide"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.show_invoice_lines.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.show_invoice_lines.xml)

Source: [snippets/mint_system.sale.view_order_form.show_invoice_lines.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.show_invoice_lines.xml)

### Show Order Line Project Id

ID: `mint_system.sale.view_order_form.show_order_line_project_id`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='order_line']/tree/field[@name='product_id']" position="after">
        <field name="project_id" optional="hide"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.show_order_line_project_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.show_order_line_project_id.xml)

Source: [snippets/mint_system.sale.view_order_form.show_order_line_project_id.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.show_order_line_project_id.xml)

### Show Order Line State

ID: `mint_system.sale.view_order_form.show_order_line_state`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='order_line']/tree/field[@name='product_id']" position="after">
        <field name="state" optional="hide"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.show_order_line_state.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.show_order_line_state.xml)

Source: [snippets/mint_system.sale.view_order_form.show_order_line_state.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.show_order_line_state.xml)

### Show Order Line Subscription Id

ID: `mint_system.sale.view_order_form.show_order_line_subscription_id`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='order_line']/tree/field[@name='product_id']" position="after">
        <field name="subscription_id" optional="hide"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.show_order_line_subscription_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.show_order_line_subscription_id.xml)

Source: [snippets/mint_system.sale.view_order_form.show_order_line_subscription_id.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.show_order_line_subscription_id.xml)

### Show Partner Invoice Id

ID: `mint_system.sale.view_order_form.show_partner_invoice_id`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <field name="partner_id" position="after">
        <field name="partner_invoice_id"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.show_partner_invoice_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.show_partner_invoice_id.xml)

Source: [snippets/mint_system.sale.view_order_form.show_partner_invoice_id.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.show_partner_invoice_id.xml)

### Show Product Template Id

ID: `mint_system.sale.view_order_form.show_product_template_id`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <field name="order_id" position="before">
        <field name="product_template_id"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.show_product_template_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.show_product_template_id.xml)

Source: [snippets/mint_system.sale.view_order_form.show_product_template_id.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.show_product_template_id.xml)

### Show Project

ID: `mint_system.sale.view_order_form.show_project`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <field name="partner_id" position="after">
        <field name="project_id"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.show_project.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.show_project.xml)

Source: [snippets/mint_system.sale.view_order_form.show_project.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.show_project.xml)

### Show Purchase Line Count

ID: `mint_system.sale.view_order_form.show_purchase_line_count`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='order_line']/tree//field[@name='price_unit']" position="after">
        <field name="purchase_line_count" optional="hide"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.show_purchase_line_count.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.show_purchase_line_count.xml)

Source: [snippets/mint_system.sale.view_order_form.show_purchase_line_count.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.show_purchase_line_count.xml)

### Show Purchase Line Ids

ID: `mint_system.sale.view_order_form.show_purchase_line_ids`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='order_line']/tree//field[@name='price_unit']" position="after">
        <field name="purchase_line_ids" optional="hide" widget="many2many_tags"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.show_purchase_line_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.show_purchase_line_ids.xml)

Source: [snippets/mint_system.sale.view_order_form.show_purchase_line_ids.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.show_purchase_line_ids.xml)

### Show Start Date

ID: `mint_system.sale.view_order_form.show_start_date`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='date_order']" position="after">
        <field name="start_date" attrs="{'invisible': [('recurrence_id', '=', False)]}"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.show_start_date.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.show_start_date.xml)

Source: [snippets/mint_system.sale.view_order_form.show_start_date.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.show_start_date.xml)

### Show Stock Purchase Line Ids

ID: `mint_system.sale.view_order_form.show_stock_purchase_line_ids`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='order_line']/tree/field[@name='price_unit']" position="after">
        <field name="stock_purchase_line_ids" widget="many2many_tags" optional="hide"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.show_stock_purchase_line_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.show_stock_purchase_line_ids.xml)

Source: [snippets/mint_system.sale.view_order_form.show_stock_purchase_line_ids.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.show_stock_purchase_line_ids.xml)

### X As4import

ID: `mint_system.sale.view_order_form.x_as4import`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='tag_ids']" position="after">
        <field name="x_as4import"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.x_as4import.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.x_as4import.xml)

Source: [snippets/mint_system.sale.view_order_form.x_as4import.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.x_as4import.xml)

### X Client Project Ref

ID: `mint_system.sale.view_order_form.x_client_project_ref`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='client_order_ref']" position="after">
        <field name="x_client_project_ref"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.x_client_project_ref.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.x_client_project_ref.xml)

Source: [snippets/mint_system.sale.view_order_form.x_client_project_ref.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.x_client_project_ref.xml)

### X Drawing File

ID: `mint_system.sale.view_order_form.x_drawing_file`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='order_line']/tree[1]/field[@name='name']" position="after">
        <field name="x_drawing_file"/>
    </xpath>
    <xpath expr="//field[@name='order_line']/form[1]//field[@name='name']" position="after">
        <label for="x_drawing_file" string="Zeichnung"/>
        <field name="x_drawing_file"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.x_drawing_file.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.x_drawing_file.xml)

Source: [snippets/mint_system.sale.view_order_form.x_drawing_file.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.x_drawing_file.xml)

### X Incoterm Blanket Order

ID: `mint_system.sale.view_order_form.x_incoterm_blanket_order`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='tag_ids']" position="after">
        <field name="x_incoterm_blanket_order"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.x_incoterm_blanket_order.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.x_incoterm_blanket_order.xml)

Source: [snippets/mint_system.sale.view_order_form.x_incoterm_blanket_order.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.x_incoterm_blanket_order.xml)

### X Margin Percent

ID: `mint_system.sale.view_order_form.x_margin_percent`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//field[@name='product_id']" position="after">
        <field name="x_margin_percent" attrs="{'invisible': [('price_subtotal', '=', 0)]}" optional="hide" widget="percentage"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.x_margin_percent.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.x_margin_percent.xml)

Source: [snippets/mint_system.sale.view_order_form.x_margin_percent.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.x_margin_percent.xml)

### X Order Number

ID: `mint_system.sale.view_order_form.x_order_number`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//group[@name='order_details']//field[@name='payment_term_id']" position="after">
        <field name="x_order_number"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.x_order_number.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.x_order_number.xml)

Source: [snippets/mint_system.sale.view_order_form.x_order_number.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.x_order_number.xml)

### X Partner Ref

ID: `mint_system.sale.view_order_form.x_partner_ref`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//group[@name='sale_header']//field[@name='partner_id']" position="after">
        <field name="x_partner_ref"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.x_partner_ref.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.x_partner_ref.xml)

Source: [snippets/mint_system.sale.view_order_form.x_partner_ref.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.x_partner_ref.xml)

### X Payment State

ID: `mint_system.sale.view_order_form.x_payment_state`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//group[@name='order_details']//field[@name='payment_term_id']" position="after">
        <field name="x_payment_state"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.x_payment_state.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.x_payment_state.xml)

Source: [snippets/mint_system.sale.view_order_form.x_payment_state.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.x_payment_state.xml)

### X Payment Term Blanket Order

ID: `mint_system.sale.view_order_form.x_payment_term_blanket_order`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//group[@name='order_details']/field[@name='payment_term_id']" position="after">
        <field name="x_payment_term_blanket_order"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.x_payment_term_blanket_order.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.x_payment_term_blanket_order.xml)

Source: [snippets/mint_system.sale.view_order_form.x_payment_term_blanket_order.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.x_payment_term_blanket_order.xml)

### X Sudio Description

ID: `mint_system.sale.view_order_form.x_sudio_description`

```xml
<data inherit_id="sale.view_order_form" priority="50">
    <xpath expr="//form[1]/sheet[1]/div[not(@name)][1]/h1[1]/field[@name='name']" position="attributes">
        <attribute name="attrs">{}</attribute>
        <attribute name="readonly"/>
    </xpath>
    <xpath expr="//form[1]/sheet[1]/group[1]" position="after">
        <group name="studio_group_epv6l">
            <group name="studio_group_epv6l_left">
                <field name="x_studio_description" string="Beschreibung"/>
            </group>
        </group>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_form.x_sudio_description.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_form.x_sudio_description.xml)

Source: [snippets/mint_system.sale.view_order_form.x_sudio_description.xml](https://odoo.build/snippets/mint_system.sale.view_order_form.x_sudio_description.xml)

## View Order Line Tree

### Add Is Downpayment

ID: `mint_system.sale.view_order_line_tree.add_is_downpayment`

```xml
<data inherit_id="sale.view_order_line_tree" priority="50">
    <xpath expr="//field[@name='qty_delivered']" position="before">
        <field name="is_downpayment" optional="hide"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_line_tree.add_is_downpayment.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_line_tree.add_is_downpayment.xml)

Source: [snippets/mint_system.sale.view_order_line_tree.add_is_downpayment.xml](https://odoo.build/snippets/mint_system.sale.view_order_line_tree.add_is_downpayment.xml)

### Editable

ID: `mint_system.sale.view_order_line_tree.editable`

```xml
<data inherit_id="sale.view_order_line_tree" priority="50">
    <tree position="attributes">
        <attribute name="editable"/>
    </tree>
</data>

```
Edit: [snippets/mint_system.sale.view_order_line_tree.editable.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_line_tree.editable.xml)

Source: [snippets/mint_system.sale.view_order_line_tree.editable.xml](https://odoo.build/snippets/mint_system.sale.view_order_line_tree.editable.xml)

### Enable Create

ID: `mint_system.sale.view_order_line_tree.enable_create`

```xml
<data inherit_id="sale.view_order_line_tree" priority="50">
    <tree position="attributes">
        <attribute name="create">true</attribute>
    </tree>
</data>

```
Edit: [snippets/mint_system.sale.view_order_line_tree.enable_create.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_line_tree.enable_create.xml)

Source: [snippets/mint_system.sale.view_order_line_tree.enable_create.xml](https://odoo.build/snippets/mint_system.sale.view_order_line_tree.enable_create.xml)

### Fields Optional Hide

ID: `mint_system.sale.view_order_line_tree.fields_optional_hide`

```xml
<data inherit_id="sale.view_order_line_tree" priority="50">
    <field name="order_id" position="attributes">
        <attribute name="optional">show</attribute>
    </field>
    <field name="order_partner_id" position="attributes">
        <attribute name="optional">show</attribute>
    </field>
    <field name="name" position="attributes">
        <attribute name="optional">show</attribute>
    </field>
    <field name="state" position="attributes">
        <attribute name="optional">hide</attribute>
    </field>
    <field name="salesman_id" position="attributes">
        <attribute name="optional">hide</attribute>
    </field>
    <field name="product_uom_qty" position="attributes">
        <attribute name="optional">hide</attribute>
    </field>
    <field name="qty_delivered" position="attributes">
        <attribute name="optional">hide</attribute>
    </field>
    <field name="qty_invoiced" position="attributes">
        <attribute name="optional">hide</attribute>
    </field>
    <field name="qty_to_invoice" position="attributes">
        <attribute name="optional">hide</attribute>
    </field>
    <field name="product_uom" position="attributes">
        <attribute name="optional">hide</attribute>
    </field>
    <field name="price_subtotal" position="attributes">
        <attribute name="optional">hide</attribute>
    </field>
    <field name="route_id" position="attributes">
        <attribute name="optional">hide</attribute>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_line_tree.fields_optional_hide.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_line_tree.fields_optional_hide.xml)

Source: [snippets/mint_system.sale.view_order_line_tree.fields_optional_hide.xml](https://odoo.build/snippets/mint_system.sale.view_order_line_tree.fields_optional_hide.xml)

### Qty With Sum

ID: `mint_system.sale.view_order_line_tree.qty_with_sum`

```xml
<data inherit_id="sale.view_order_line_tree" priority="50">
    <field name="product_uom_qty" position="attributes">
        <attribute name="sum">Menge</attribute>
    </field>
    <field name="qty_delivered" position="attributes">
        <attribute name="sum">Gelieferte Menge</attribute>
    </field>
    <field name="qty_invoiced" position="attributes">
        <attribute name="sum">Abgerechnete Menge</attribute>
    </field>
    <field name="qty_to_invoice" position="attributes">
        <attribute name="sum">Abzurechnende Menge</attribute>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_line_tree.qty_with_sum.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_line_tree.qty_with_sum.xml)

Source: [snippets/mint_system.sale.view_order_line_tree.qty_with_sum.xml](https://odoo.build/snippets/mint_system.sale.view_order_line_tree.qty_with_sum.xml)

### Reset View

ID: `mint_system.sale.view_order_line_tree.reset_view`

```xml
<data inherit_id="sale.view_order_line_tree" priority="50">
    <field name="order_id" position="after">
        <field name="x_state"/>
    </field>
    <field name="name" position="after">
        <field name="product_id"/>
    </field>
    <field name="name" position="replace">
    </field>
    <field name="product_id" position="after">
        <field name="blanket_order_line"/>
    </field>
    <field name="order_partner_id" position="after">
        <field name="x_client_order_ref"/>
    </field>
    <field name="commitment_date" position="after">
        <field name="x_date_order"/>
    </field>
    <field name="route_id" position="replace">
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_line_tree.reset_view.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_line_tree.reset_view.xml)

Source: [snippets/mint_system.sale.view_order_line_tree.reset_view.xml](https://odoo.build/snippets/mint_system.sale.view_order_line_tree.reset_view.xml)

### Show Price Tax

ID: `mint_system.sale.view_order_line_tree.show_price_tax`

```xml
<data inherit_id="sale.view_order_line_tree" priority="50">
    <field name="price_subtotal" position="before">
        <field name="price_tax" sum="Gesamtsteuer" optional="show"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_line_tree.show_price_tax.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_line_tree.show_price_tax.xml)

Source: [snippets/mint_system.sale.view_order_line_tree.show_price_tax.xml](https://odoo.build/snippets/mint_system.sale.view_order_line_tree.show_price_tax.xml)

### Show Price Total

ID: `mint_system.sale.view_order_line_tree.show_price_total`

```xml
<data inherit_id="sale.view_order_line_tree" priority="50">
    <field name="price_subtotal" position="after">
        <field name="price_total" sum="Total" optional="show"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_line_tree.show_price_total.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_line_tree.show_price_total.xml)

Source: [snippets/mint_system.sale.view_order_line_tree.show_price_total.xml](https://odoo.build/snippets/mint_system.sale.view_order_line_tree.show_price_total.xml)

### Show Price Unit

ID: `mint_system.sale.view_order_line_tree.show_price_unit`

```xml
<data inherit_id="sale.view_order_line_tree" priority="50">
    <field name="product_uom_qty" position="after">
        <field name="price_unit" optional="hide"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_line_tree.show_price_unit.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_line_tree.show_price_unit.xml)

Source: [snippets/mint_system.sale.view_order_line_tree.show_price_unit.xml](https://odoo.build/snippets/mint_system.sale.view_order_line_tree.show_price_unit.xml)

### Show Untaxed Amount Invoiced

ID: `mint_system.sale.view_order_line_tree.show_untaxed_amount_invoiced`

```xml
<data inherit_id="sale.view_order_line_tree" priority="50">
    <field name="price_subtotal" position="after">
        <field name="untaxed_amount_invoiced" sum="Unversteuerter Rechnungsbetrag" optional="show"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_line_tree.show_untaxed_amount_invoiced.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_line_tree.show_untaxed_amount_invoiced.xml)

Source: [snippets/mint_system.sale.view_order_line_tree.show_untaxed_amount_invoiced.xml](https://odoo.build/snippets/mint_system.sale.view_order_line_tree.show_untaxed_amount_invoiced.xml)

### X Categ Id

ID: `mint_system.sale.view_order_line_tree.x_categ_id`

```xml
<data inherit_id="sale.view_order_line_tree" priority="50">
    <field name="name" position="after">
        <field name="x_categ_id" optional="show"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_line_tree.x_categ_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_line_tree.x_categ_id.xml)

Source: [snippets/mint_system.sale.view_order_line_tree.x_categ_id.xml](https://odoo.build/snippets/mint_system.sale.view_order_line_tree.x_categ_id.xml)

### X Pricelist Id

ID: `mint_system.sale.view_order_line_tree.x_pricelist_id`

```xml
<data inherit_id="sale.view_order_line_tree" priority="50">
    <field name="order_partner_id" position="after">
        <field name="x_pricelist_id" optional="show"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_line_tree.x_pricelist_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_line_tree.x_pricelist_id.xml)

Source: [snippets/mint_system.sale.view_order_line_tree.x_pricelist_id.xml](https://odoo.build/snippets/mint_system.sale.view_order_line_tree.x_pricelist_id.xml)

### X Service Policy

ID: `mint_system.sale.view_order_line_tree.x_service_policy`

```xml
<data inherit_id="sale.view_order_line_tree" priority="50">
    <field name="qty_invoiced" position="after">
        <field name="x_service_policy" optional="show"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_line_tree.x_service_policy.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_line_tree.x_service_policy.xml)

Source: [snippets/mint_system.sale.view_order_line_tree.x_service_policy.xml](https://odoo.build/snippets/mint_system.sale.view_order_line_tree.x_service_policy.xml)

### X Taxed Amount

ID: `mint_system.sale.view_order_line_tree.x_taxed_amount`

```xml
<data inherit_id="sale.view_order_line_tree" priority="50">
    <field name="price_total" position="after">
        <field name="x_taxed_amount" sum="Total inkl. MWST" optional="show"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_line_tree.x_taxed_amount.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_line_tree.x_taxed_amount.xml)

Source: [snippets/mint_system.sale.view_order_line_tree.x_taxed_amount.xml](https://odoo.build/snippets/mint_system.sale.view_order_line_tree.x_taxed_amount.xml)

### X Taxed Amount Invoiced

ID: `mint_system.sale.view_order_line_tree.x_taxed_amount_invoiced`

```xml
<data inherit_id="sale.view_order_line_tree" priority="50">
    <field name="price_subtotal" position="after">
        <field name="x_taxed_amount_invoiced" sum="Rechnungsbetrag inkl. MWST" optional="show"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_line_tree.x_taxed_amount_invoiced.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_line_tree.x_taxed_amount_invoiced.xml)

Source: [snippets/mint_system.sale.view_order_line_tree.x_taxed_amount_invoiced.xml](https://odoo.build/snippets/mint_system.sale.view_order_line_tree.x_taxed_amount_invoiced.xml)

### X Untaxed Amount

ID: `mint_system.sale.view_order_line_tree.x_untaxed_amount`

```xml
<data inherit_id="sale.view_order_line_tree" priority="51">
    <field name="price_total" position="after">
        <field name="x_untaxed_amount" sum="Total exkl. MWST" optional="show"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_line_tree.x_untaxed_amount.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_line_tree.x_untaxed_amount.xml)

Source: [snippets/mint_system.sale.view_order_line_tree.x_untaxed_amount.xml](https://odoo.build/snippets/mint_system.sale.view_order_line_tree.x_untaxed_amount.xml)

### X Weight Delivered

ID: `mint_system.sale.view_order_line_tree.x_weight_delivered`

```xml
<data inherit_id="sale.view_order_line_tree" priority="50">
    <field name="qty_to_invoice" position="after">
        <field name="x_weight_delivered" sum="Geliefertes Gewicht" optional="show"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_line_tree.x_weight_delivered.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_line_tree.x_weight_delivered.xml)

Source: [snippets/mint_system.sale.view_order_line_tree.x_weight_delivered.xml](https://odoo.build/snippets/mint_system.sale.view_order_line_tree.x_weight_delivered.xml)

## View Order Tree

### Add Carrier

ID: `mint_system.sale.view_order_tree.add_carrier`

```xml
<data inherit_id="sale.view_order_tree" priority="50">
    <field name="partner_id" position="after">
        <field name="carrier_id" optional="hide"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_tree.add_carrier.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_tree.add_carrier.xml)

Source: [snippets/mint_system.sale.view_order_tree.add_carrier.xml](https://odoo.build/snippets/mint_system.sale.view_order_tree.add_carrier.xml)

### Add Client Order Ref

ID: `mint_system.sale.view_order_tree.add_client_order_ref`

```xml
<data inherit_id="sale.view_order_tree" priority="50">
    <xpath expr="//field[@name='user_id']" position="before">
        <field name="client_order_ref" optional="show"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_tree.add_client_order_ref.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_tree.add_client_order_ref.xml)

Source: [snippets/mint_system.sale.view_order_tree.add_client_order_ref.xml](https://odoo.build/snippets/mint_system.sale.view_order_tree.add_client_order_ref.xml)

### Add Comment

ID: `mint_system.sale.view_order_tree.add_comment`

```xml
<data inherit_id="sale.view_order_tree" priority="50">
    <xpath expr="//field[@name='user_id']" position="before">
        <field name="comment" optional="show"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_tree.add_comment.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_tree.add_comment.xml)

Source: [snippets/mint_system.sale.view_order_tree.add_comment.xml](https://odoo.build/snippets/mint_system.sale.view_order_tree.add_comment.xml)

### Format Delivery Status

ID: `mint_system.sale.view_order_tree.format_delivery_status`

```xml
<data inherit_id="sale.view_order_tree" priority="50">
    <xpath expr="//field[@name='delivery_status']" position="attributes">
        <attribute name="widget">badge</attribute>
        <attribute name="decoration-success">delivery_status=='full'</attribute>
        <attribute name="decoration-danger">delivery_status=='pending'</attribute>
        <attribute name="decoration-warning">delivery_status=='partial'</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_tree.format_delivery_status.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_tree.format_delivery_status.xml)

Source: [snippets/mint_system.sale.view_order_tree.format_delivery_status.xml](https://odoo.build/snippets/mint_system.sale.view_order_tree.format_delivery_status.xml)

### Show Client Order Ref

ID: `mint_system.sale.view_order_tree.show_client_order_ref`

```xml
<data inherit_id="sale.view_order_tree" priority="50">
    <field name="partner_id" position="after">
        <field name="client_order_ref"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_tree.show_client_order_ref.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_tree.show_client_order_ref.xml)

Source: [snippets/mint_system.sale.view_order_tree.show_client_order_ref.xml](https://odoo.build/snippets/mint_system.sale.view_order_tree.show_client_order_ref.xml)

### Show Partner Shipping

ID: `mint_system.sale.view_order_tree.show_partner_shipping`

```xml
<data inherit_id="sale.view_order_tree" priority="50">
    <field name="partner_id" position="after">
        <field name="partner_shipping_id" optional="hide"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_tree.show_partner_shipping.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_tree.show_partner_shipping.xml)

Source: [snippets/mint_system.sale.view_order_tree.show_partner_shipping.xml](https://odoo.build/snippets/mint_system.sale.view_order_tree.show_partner_shipping.xml)

### Show Payment Term Id

ID: `mint_system.sale.view_order_tree.show_payment_term_id`

```xml
<data inherit_id="sale.view_order_tree" priority="50">
    <field name="state" position="after">
        <field name="payment_term_id" optional="hide"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_tree.show_payment_term_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_tree.show_payment_term_id.xml)

Source: [snippets/mint_system.sale.view_order_tree.show_payment_term_id.xml](https://odoo.build/snippets/mint_system.sale.view_order_tree.show_payment_term_id.xml)

### Show Project

ID: `mint_system.sale.view_order_tree.show_project`

```xml
<data inherit_id="sale.view_order_tree" priority="50">
    <field name="partner_id" position="after">
        <field name="project_id" optional="hide"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_tree.show_project.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_tree.show_project.xml)

Source: [snippets/mint_system.sale.view_order_tree.show_project.xml](https://odoo.build/snippets/mint_system.sale.view_order_tree.show_project.xml)

### Show State

ID: `mint_system.sale.view_order_tree.show_state`

```xml
<data inherit_id="sale.view_order_tree" priority="50">
    <field name="invoice_status" position="after">
        <field name="state" decoration-success="state == 'sale' or state == 'done'" decoration-info="state == 'draft' or state == 'sent'" widget="badge" optional="show"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_tree.show_state.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_tree.show_state.xml)

Source: [snippets/mint_system.sale.view_order_tree.show_state.xml](https://odoo.build/snippets/mint_system.sale.view_order_tree.show_state.xml)

### X Country Id Name

ID: `mint_system.sale.view_order_tree.x_country_id_name`

```xml
<data inherit_id="sale.view_order_tree" priority="50">
    <xpath expr="//field[@name='name']" position="after">
        <field name="x_country_id_name"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_tree.x_country_id_name.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_tree.x_country_id_name.xml)

Source: [snippets/mint_system.sale.view_order_tree.x_country_id_name.xml](https://odoo.build/snippets/mint_system.sale.view_order_tree.x_country_id_name.xml)

### X Payment State

ID: `mint_system.sale.view_order_tree.x_payment_state`

```xml
<data inherit_id="sale.view_order_tree" priority="50">
    <xpath expr="//field[@name='invoice_status']" position="before">
        <field name="x_payment_state" decoration-success="x_payment_state=='paid'" decoration-danger="x_payment_state=='not_paid'" decoration-warning="x_payment_state=='in_payment'" widget="badge"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_order_tree.x_payment_state.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_tree.x_payment_state.xml)

Source: [snippets/mint_system.sale.view_order_tree.x_payment_state.xml](https://odoo.build/snippets/mint_system.sale.view_order_tree.x_payment_state.xml)

### X Product Uom Qty

ID: `mint_system.sale.view_order_tree.x_product_uom_qty`

```xml
<data inherit_id="sale.view_order_tree" priority="50">
    <field name="amount_untaxed" position="before">
        <field name="x_product_uom_qty" sum="Gesamtmenge" optional="hide"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_tree.x_product_uom_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_tree.x_product_uom_qty.xml)

Source: [snippets/mint_system.sale.view_order_tree.x_product_uom_qty.xml](https://odoo.build/snippets/mint_system.sale.view_order_tree.x_product_uom_qty.xml)

### X Vst

ID: `mint_system.sale.view_order_tree.x_vst`

```xml
<data inherit_id="sale.view_order_tree" priority="50">
    <field name="partner_id" position="after">
        <field name="x_vst"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_order_tree.x_vst.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_order_tree.x_vst.xml)

Source: [snippets/mint_system.sale.view_order_tree.x_vst.xml](https://odoo.build/snippets/mint_system.sale.view_order_tree.x_vst.xml)

## View Quotation Tree

### Add Client Order Ref

ID: `mint_system.sale.view_quotation_tree.add_client_order_ref`

```xml
<data inherit_id="sale.view_quotation_tree" priority="50">
    <xpath expr="//field[@name='user_id']" position="before">
        <field name="client_order_ref" optional="show"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_quotation_tree.add_client_order_ref.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_quotation_tree.add_client_order_ref.xml)

Source: [snippets/mint_system.sale.view_quotation_tree.add_client_order_ref.xml](https://odoo.build/snippets/mint_system.sale.view_quotation_tree.add_client_order_ref.xml)

### Add Comment

ID: `mint_system.sale.view_quotation_tree.add_comment`

```xml
<data inherit_id="sale.view_quotation_tree" priority="50">
    <xpath expr="//field[@name='user_id']" position="before">
        <field name="comment" optional="show"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_quotation_tree.add_comment.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_quotation_tree.add_comment.xml)

Source: [snippets/mint_system.sale.view_quotation_tree.add_comment.xml](https://odoo.build/snippets/mint_system.sale.view_quotation_tree.add_comment.xml)

### Replace Create Date

ID: `mint_system.sale.view_quotation_tree.replace_create_date`

```xml
<data inherit_id="sale.view_quotation_tree" priority="50">
    <xpath expr="//field[@name='create_date']" position="replace">
        <field name="date_order" widget="date" optional="show"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_quotation_tree.replace_create_date.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_quotation_tree.replace_create_date.xml)

Source: [snippets/mint_system.sale.view_quotation_tree.replace_create_date.xml](https://odoo.build/snippets/mint_system.sale.view_quotation_tree.replace_create_date.xml)

### Show Delivery Status

ID: `mint_system.sale.view_quotation_tree.show_delivery_status`

```xml
<data inherit_id="sale.view_quotation_tree" priority="50">
    <xpath expr="//field[@name='state']" position="before">
        <field name="delivery_status" decoration-danger="delivery_status == 'pending'" decoration-warning="delivery_status == 'partial'" decoration-success="delivery_status == 'full'" widget="badge" optional="show"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_quotation_tree.show_delivery_status.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_quotation_tree.show_delivery_status.xml)

Source: [snippets/mint_system.sale.view_quotation_tree.show_delivery_status.xml](https://odoo.build/snippets/mint_system.sale.view_quotation_tree.show_delivery_status.xml)

### Show Order Date

ID: `mint_system.sale.view_quotation_tree.show_order_date`

```xml
<data inherit_id="sale.view_quotation_tree" priority="50">
    <xpath expr="//field[@name='create_date']" position="after">
        <field name="date_order" widget="date" optional="show"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_quotation_tree.show_order_date.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_quotation_tree.show_order_date.xml)

Source: [snippets/mint_system.sale.view_quotation_tree.show_order_date.xml](https://odoo.build/snippets/mint_system.sale.view_quotation_tree.show_order_date.xml)

### Show Stage Category

ID: `mint_system.sale.view_quotation_tree.show_stage_category`

```xml
<data inherit_id="sale.view_quotation_tree" priority="50">
    <field name="state" position="after">
        <field name="stage_category" optional="show"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_quotation_tree.show_stage_category.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_quotation_tree.show_stage_category.xml)

Source: [snippets/mint_system.sale.view_quotation_tree.show_stage_category.xml](https://odoo.build/snippets/mint_system.sale.view_quotation_tree.show_stage_category.xml)

### Show ​Payment Term Id

ID: `mint_system.sale.view_quotation_tree.show_​payment_term_id`

```xml
<data inherit_id="sale.view_quotation_tree" priority="50">
    <xpath expr="//field[@name='state']" position="before">
        <field name="payment_term_id" optional="show"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_quotation_tree.show_​payment_term_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_quotation_tree.show_​payment_term_id.xml)

Source: [snippets/mint_system.sale.view_quotation_tree.show_​payment_term_id.xml](https://odoo.build/snippets/mint_system.sale.view_quotation_tree.show_​payment_term_id.xml)

### X Order Number

ID: `mint_system.sale.view_quotation_tree.x_order_number`

```xml
<data inherit_id="sale.view_quotation_tree" priority="50">
    <xpath expr="//field[@name='name']" position="after">
        <field name="x_order_number"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_quotation_tree.x_order_number.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_quotation_tree.x_order_number.xml)

Source: [snippets/mint_system.sale.view_quotation_tree.x_order_number.xml](https://odoo.build/snippets/mint_system.sale.view_quotation_tree.x_order_number.xml)

### X Payment State

ID: `mint_system.sale.view_quotation_tree.x_payment_state`

```xml
<data inherit_id="sale.view_quotation_tree" priority="50">
    <xpath expr="//field[@name='invoice_status']" position="after">
        <field name="x_payment_state" optional="hide"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_quotation_tree.x_payment_state.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_quotation_tree.x_payment_state.xml)

Source: [snippets/mint_system.sale.view_quotation_tree.x_payment_state.xml](https://odoo.build/snippets/mint_system.sale.view_quotation_tree.x_payment_state.xml)

## View Sales Order Filter

### Add Filter Collective Invoice

ID: `mint_system.sale.view_sales_order_filter.add_filter_collective_invoice`

```xml
<data inherit_id="sale.view_sales_order_filter" priority="50">
    <xpath expr="//filter[@name='my_sale_orders_filter']" position="after">
        <filter string="Kunden mit Sammelrechnung" name="customer_collective_invoice" domain="[('partner_id.category_id.name', 'in', ['Sammelrechnung'])]"/>
        <filter string="Kunden ohne Sammelrechnung" name="customer_collective_invoice" domain="[('partner_id.category_id.name', 'not in', ['Sammelrechnung'])]"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_sales_order_filter.add_filter_collective_invoice.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_sales_order_filter.add_filter_collective_invoice.xml)

Source: [snippets/mint_system.sale.view_sales_order_filter.add_filter_collective_invoice.xml](https://odoo.build/snippets/mint_system.sale.view_sales_order_filter.add_filter_collective_invoice.xml)

### Add Invoice Status

ID: `mint_system.sale.view_sales_order_filter.add_invoice_status`

```xml
<data inherit_id="sale.view_sales_order_filter" priority="50">
    <xpath expr="//filter[@name='order_month']" position="after">
        <filter string="Status Rechnung" name="state_invoice" domain="[]" context="{'group_by': 'invoice_status'}"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_sales_order_filter.add_invoice_status.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_sales_order_filter.add_invoice_status.xml)

Source: [snippets/mint_system.sale.view_sales_order_filter.add_invoice_status.xml](https://odoo.build/snippets/mint_system.sale.view_sales_order_filter.add_invoice_status.xml)

### Add State

ID: `mint_system.sale.view_sales_order_filter.add_state`

```xml
<data inherit_id="sale.view_sales_order_filter" priority="50">
    <xpath expr="//filter[@name='order_month']" position="after">
        <filter string="Status" name="state" domain="[]" context="{'group_by': 'state'}"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_sales_order_filter.add_state.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_sales_order_filter.add_state.xml)

Source: [snippets/mint_system.sale.view_sales_order_filter.add_state.xml](https://odoo.build/snippets/mint_system.sale.view_sales_order_filter.add_state.xml)

### Domain Name Analytic Account

ID: `mint_system.sale.view_sales_order_filter.domain_name_analytic_account`

```xml
<data inherit_id="sale.view_sales_order_filter" priority="50">
    <field name="name" position="replace">
        <field name="name" string="Order" filter_domain="['|', '|', '|', ('name', 'ilike', self), ('client_order_ref', 'ilike', self), ('partner_id', 'child_of', self), ('analytic_account_id', 'ilike', self)]"/>
    </field>
</data>

```
Edit: [snippets/mint_system.sale.view_sales_order_filter.domain_name_analytic_account.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_sales_order_filter.domain_name_analytic_account.xml)

Source: [snippets/mint_system.sale.view_sales_order_filter.domain_name_analytic_account.xml](https://odoo.build/snippets/mint_system.sale.view_sales_order_filter.domain_name_analytic_account.xml)

### Modify Order Line

ID: `mint_system.sale.view_sales_order_filter.modify_order_line`

```xml
<data inherit_id="sale.view_sales_order_filter" priority="50">
    <xpath expr="//field[@name='order_line']" position="replace">
        <field name="order_line" string="Product" filter_domain="['|','|',('order_line.product_id', 'ilike', self),('order_line.product_id.type_description', 'ilike', self),('order_line.product_id.type_description2', 'ilike', self)]"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.sale.view_sales_order_filter.modify_order_line.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_sales_order_filter.modify_order_line.xml)

Source: [snippets/mint_system.sale.view_sales_order_filter.modify_order_line.xml](https://odoo.build/snippets/mint_system.sale.view_sales_order_filter.modify_order_line.xml)

## View Sales Order Line Filter

### X Commitment Date

ID: `mint_system.sale.view_sales_order_line_filter.x_commitment_date`

```xml
<data inherit_id="sale.view_sales_order_line_filter" priority="50">
    <filter name="to_invoice" position="after">
        <filter string="Liefertermin" name="date_commitment" date="x_commitment_date"/>
    </filter>
</data>

```
Edit: [snippets/mint_system.sale.view_sales_order_line_filter.x_commitment_date.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_sales_order_line_filter.x_commitment_date.xml)

Source: [snippets/mint_system.sale.view_sales_order_line_filter.x_commitment_date.xml](https://odoo.build/snippets/mint_system.sale.view_sales_order_line_filter.x_commitment_date.xml)

### X Date Order

ID: `mint_system.sale.view_sales_order_line_filter.x_date_order`

```xml
<data inherit_id="sale.view_sales_order_line_filter" priority="50">
    <filter name="to_invoice" position="after">
        <separator/>
        <filter string="Auftragsdatum" name="date_order" date="x_date_order"/>
    </filter>
</data>

```
Edit: [snippets/mint_system.sale.view_sales_order_line_filter.x_date_order.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale.view_sales_order_line_filter.x_date_order.xml)

Source: [snippets/mint_system.sale.view_sales_order_line_filter.x_date_order.xml](https://odoo.build/snippets/mint_system.sale.view_sales_order_line_filter.x_date_order.xml)

