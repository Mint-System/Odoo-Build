# Sale Blanket Order
## Report Blanketorder Document  
### Add Discount  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.add_discount`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//th[@id='price_subtotal']" position="after">
        <!-- Is there a discount on at least one line? -->
        <t t-set="display_discount" t-value="any(l.discount for l in doc.line_ids)"/>
        <th name="th_discount" t-if="display_discount" class="text-right" groups="product.group_discount_per_so_line">
            <span>Disc.%</span>
        </th>
    </xpath>
    <xpath expr="//td[@id='price_subtotal']" position="after">
        <td t-if="display_discount" class="text-right" groups="product.group_discount_per_so_line"><span t-field="l.discount"/>%
    </td>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.add_discount.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.add_discount.xml)

### Add Footer  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.add_footer`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//table[@id='summary']" position="after">
        <style>
      table#footer {
        width: 100%;
        font-size: 8pt;
        line-height: 1.5;
        border-color: white;
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
Source: [snippets/sale_blanket_order.report_blanketorder_document.add_footer.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.add_footer.xml)

### Add Header And Footer Note  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.add_header_and_footer_note`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//table[@id='info']" position="after">
        <t t-if="doc.note_header != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
            <span class="note" t-field="doc.note_header"/>
        </t>
    </xpath>
    <xpath expr="//table[2]" position="after">
        <t t-if="doc.note_footer != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
            <span class="note" t-field="doc.note_footer"/>
        </t>
    </xpath>
    <!--
   <xpath expr="//div[@id='informations']" position="after">
    <t t-if="doc.note_header != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
      <span class="note" t-field="doc.note_header"/>
    </t>
  </xpath>

  <xpath expr="//div[@id='summary']" position="after">
    <t t-if="doc.note_footer != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
      <span class="note" t-field="doc.note_footer"/>
    </t>
  </xpath>
  -->
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.add_header_and_footer_note.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.add_header_and_footer_note.xml)

### Add Header Space  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.add_header_space`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//h2" position="attributes">
        <attribute name="style">padding-top: 5rem</attribute>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.add_header_space.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.add_header_space.xml)

### Add Infotable  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.add_infotable`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//h2" position="after">
        <style>
      table#info {
        width: 100%;
        margin-bottom: 25px;
        font-size: 9pt;
        font-family: arial;
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
                <td width="44%">
                    <span t-field="doc.date_confirmed" t-options="{ &quot;widget&quot;: &quot;date&quot; }"/>
                </td>
                <td width="14%">Our Reference</td>
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
Source: [snippets/sale_blanket_order.report_blanketorder_document.add_infotable.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.add_infotable.xml)

### Add Payment Term  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.add_payment_term`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//p[@t-field='doc.note']" position="before">
        <div class="row">
            <div class="col">
                <span t-if="doc.payment_term_id.name">
          Payment Terms: <strong t-field="doc.payment_term_id.name"/>
                </span>
            </div>
        </div>
    </xpath>
</data>
```
Source: [snippets/sale_blanket_order.report_blanketorder_document.add_payment_term.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.add_payment_term.xml)

### Add Product Uom  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.add_product_uom`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//table/thead//th[3]" position="after">
        <th name="th_product_uom" class="text-right">ME</th>
    </xpath>
    <xpath expr="//table/tbody//span[@t-field='l.original_uom_qty']/.." position="after">
        <td name="td_product_uom" class="text-right">
            <span t-field="l.product_uom"/>
        </td>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.add_product_uom.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.add_product_uom.xml)

### Add Vat  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.add_vat`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//div[@name='comment']" position="before">
        <p>MwSt.-Nr.: 
      <span t-field="o.company_id.vat"/>
    </p>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.add_vat.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.add_vat.xml)

### Address Block  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.address_block`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">&gt;

    <xpath expr="/t/t/div/div[2]" position="replace"><t t-set="address"><t t-if="doc.partner_contact_id"><div t-esc="doc.partner_contact_id.parent_id.name"/><div t-esc="doc.partner_contact_id.parent_id.name2"/><span t-esc="doc.partner_contact_id.title.name"/><span t-esc="doc.partner_contact_id.name"/><div t-esc="doc.partner_contact_id.street"/><div t-esc="doc.partner_contact_id.street2"/><span t-esc="doc.partner_contact_id.zip"/><span t-esc="doc.partner_contact_id.city"/><t t-if="doc.partner_contact_id.country_id.code != 'CH'"><div t-esc="doc.partner_contact_id.country_id.name"/></t></t><t t-else=""><div t-field="doc.partner_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}"/><p t-if="doc.partner_id.vat"><t t-esc="doc.company_id.country_id.vat_label or 'Tax ID'"/>
:                    <span t-field="doc.partner_id.vat"/>
                </p></t></t><t t-if="doc.partner_shipping_id == doc.partner_invoice_id                              and doc.partner_invoice_id != doc.partner_id                              or doc.partner_shipping_id != doc.partner_invoice_id"><t t-set="information_block"><!--
                <strong t-if="doc.partner_shipping_id == doc.partner_invoice_id">Invoicing and Shipping Address:</strong>
                <strong t-if="doc.partner_shipping_id != doc.partner_invoice_id">Invoicing Address:</strong>
                <div t-field="doc.partner_invoice_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;, &quot;phone&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: True}"/>
                --><t t-if="doc.partner_shipping_id != doc.partner_invoice_id"><strong>Shipping Address:</strong><div t-field="doc.partner_shipping_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: True}"/></t></t></t></xpath>

</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.address_block.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.address_block.xml)

### Change Column Order  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.change_column_order`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">

    <xpath expr="//table[@class='table table-condensed table-borderless']/thead/tr" position="replace">
        <tr>
            <th class="text-start">Product</th>
            <th class="text-end">Original Qty</th>
            <th class="text-center">Scheduled Date</th>
            <th class="text-end">Unit Price</th>
            <th class="text-end">Amount</th>
        </tr>
    </xpath>

    <xpath expr="//tbody[@class='sale_tbody']/t[2]" position="replace">
        <t t-foreach="doc.line_ids" t-as="l">
            <tr>
                <td>
                    <span t-field="l.name"/>
                </td>
                <td class="text-end">
                    <span t-field="l.original_uom_qty"/>
                    <span t-field="l.product_uom" groups="uom.group_uom"/>
                </td>
                <td class="text-center">
                    <span t-field="l.date_schedule"/>
                </td>
                <td class="text-end">
                    <span t-field="l.price_unit"/>
                </td>
                <td class="text-end">
                    <span t-field="l.price_subtotal" t-options="{&quot;widget&quot;: &quot;monetary&quot;, &quot;display_currency&quot;: l.currency_id}"/>
                </td>
            </tr>
        </t>
    </xpath>

</data>
```
Source: [snippets/sale_blanket_order.report_blanketorder_document.change_column_order.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.change_column_order.xml)

### Extend Title  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.extend_title`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//h2" position="replace">
        <h2>
            <span t-if="doc.state not in ['draft','sent']">Blanket Order # </span>
            <span t-if="doc.state in ['draft','sent']">Quotation # </span>
            <span t-field="doc.name"/>
        </h2>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.extend_title.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.extend_title.xml)

### Format Qty  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.format_qty`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">  
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
Source: [snippets/sale_blanket_order.report_blanketorder_document.format_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.format_qty.xml)

### Format Qty With Decimal  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.format_qty_with_decimal`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="60">
    <xpath expr="//span[@id='original_uom_qty']" position="replace">
        <t t-if="l.product_uom.id == 1">
            <span id="original_uom_qty" t-field="l.original_uom_qty" t-options="{'widget': 'integer'}"/>
        </t>
        <t t-else="">
            <span id="original_uom_qty" t-field="l.original_uom_qty"/>
        </t>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.format_qty_with_decimal.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.format_qty_with_decimal.xml)

### Get Position  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.get_position`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//table/thead/tr/th[1]" position="before">
        <th id="position">
            <span>Pos</span>
        </th>
    </xpath>
    <xpath expr="//table/tbody//tr/td[1]" position="before">
        <td id="position">
            <span>0</span>
        </td>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.get_position.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.get_position.xml)

### Hide Date Schedule  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.hide_date_schedule`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//th[@id='date_schedule']" position="replace"/>
    <xpath expr="//td[@id='date_schedule']" position="replace"/>
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.hide_date_schedule.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.hide_date_schedule.xml)

### Modify Information Block  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.modify_information_block`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//table[2]/thead//th[3]" position="replace">
   </xpath>
    <xpath expr="//table[2]/thead//th[4]" position="after">
        <th class="text-center">Unit Price</th>
    </xpath>
    <xpath expr="//table[2]/tbody//td[3]" position="replace">
   </xpath>
    <xpath expr="//table[2]/tbody//td[4]" position="after">
        <td class="text-right">
            <span t-field="l.price_unit"/>
        </td>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.modify_information_block.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.modify_information_block.xml)

### Relocate Price Unit  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.relocate_price_unit`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//table[2]/thead//th[3]" position="replace">
   </xpath>
    <xpath expr="//table[2]/thead//th[4]" position="after">
        <th class="text-center">Unit Price</th>
    </xpath>
    <xpath expr="//table[2]/tbody//td[3]" position="replace">
   </xpath>
    <xpath expr="//table[2]/tbody//td[4]" position="after">
        <td class="text-right">
            <span t-field="l.price_unit"/>
        </td>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.relocate_price_unit.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.relocate_price_unit.xml)

### Remove Date Schedule  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.remove_date_schedule`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//table/thead/tr/th[3]" position="replace"/>
    <xpath expr="//span[@t-field='l.date_schedule']/.." position="replace"/>
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.remove_date_schedule.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.remove_date_schedule.xml)

### Remove Informations  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.remove_informations`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//div[@id='informations']" position="replace">
  </xpath>
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.remove_informations.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.remove_informations.xml)

### Remove Vat  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.remove_vat`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//p[@t-if='doc.partner_id.vat']" position="replace"/>
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.remove_vat.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.remove_vat.xml)

### Replace Address Block  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.replace_address_block`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//t/t/div/div[2]" position="replace">
        <t t-set="address">
            <div t-field="doc.partner_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}"/>
            <p t-if="doc.partner_id.vat"><t t-esc="doc.company_id.country_id.vat_label or 'Tax ID'"/>: <span t-field="doc.partner_id.vat"/></p>
        </t>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.replace_address_block.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.replace_address_block.xml)

### Replace Infoblock  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.replace_infoblock`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
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
Source: [snippets/sale_blanket_order.report_blanketorder_document.replace_infoblock.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.replace_infoblock.xml)

### Replace Infotable Tissa  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.replace_infotable_tissa`  
```xml
<?xml version="1.0"?>
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">

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
    <table id='info'>

      <tr>
        <td width="16%">
          Kontaktnummer:
        </td>
        <td width="44%">
          <span t-field='doc.partner_id.id'/>
        </td>
        <td>
          Datum:
        </td>
        <td>
          <span t-field='doc.date_confirmed'/>
        </td>
      </tr>

      <tr>
        <td>
          Kontaktperson:
        </td>
        <td>
          <span t-field='doc.partner_sale_id.name'/>
        </td>
        <td>Kundenbetreuer/in:</td>
        <td>
          <span t-field='doc.partner_id.user_id'/>
        </td>
      </tr>

      <tr>
        <td>EORI-Nummer:</td>
        <td>
          <span t-field="doc.partner_id.x_studio_eori_nummer"/>
        </td>
        <td>
          MwSt-Nr:
        </td>
        <td>
          <span t-field="doc.company_id.vat"/>
        </td>
      </tr>

      <tr>
        <td>Ihre Bestellung:</td>
        <td>
          <span t-field='doc.client_order_ref'/>
        </td>
      </tr>

      <tr>
        <td>Gültigkeitsdatum:</td>
        <td>
          <span t-field="doc.validity_date"/>
        </td>
      </tr>

    </table>
  </xpath>
</data>
```
Source: [snippets/sale_blanket_order.report_blanketorder_document.replace_infotable_tissa.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.replace_infotable_tissa.xml)

### Replace Partner Id  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.replace_partner_id`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">&gt;

 <xpath expr="//div[@t-field='doc.partner_id']" position="replace"><t t-if="doc.partner_contact_id"><div t-field="doc.partner_contact_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: False}"/></t><t t-if="not doc.partner_contact_id"><div t-field="doc.partner_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: False}"/></t></xpath>

</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.replace_partner_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.replace_partner_id.xml)

### Replace Product Description  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.replace_product_description`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">&gt;

<xpath expr="//span[@t-field='l.product_id']" position="replace"><t t-if="l.product_id.type_description"><span style="font-weight: bold" t-field="l.product_id.type_description"/></t><t t-if="not l.product_id.type_description"><span t-field="l.name"/></t></xpath>

</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.replace_product_description.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.replace_product_description.xml)

### Replace Product Id  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.replace_product_id`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">&gt;

 <xpath expr="//span[@t-field='l.product_id']" position="replace"><span t-field="l.name"/></xpath>

</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.replace_product_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.replace_product_id.xml)

### Replace Summary  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.replace_summary`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//span[@t-field='doc.amount_untaxed']/../../../../.." position="replace">
        <table id="summary" class="table table-condensed trimada table-borderless" style="margin-top:20px; width:100%; color:black; font-family: arial; font-size:9pt; border-top-style:solid; border-bottom-style:solid; border-width:1px; border-color:black">
            <tr>
                <td style="width:15.5%; text-align:left">
                    <strong>Subtotal</strong>
                </td>
                <td style="width:23%; text-align:left">
                    <span t-field="doc.amount_untaxed" t-options="{&quot;widget&quot;: &quot;monetary&quot;, &quot;display_currency&quot;: doc.currency_id}"/>
                </td>
                <td style="width:12%; text-align:left">
                    <span>VAT</span>
                </td>
                <td style="width:17%; text-align:left">
                    <span t-field="doc.amount_tax" t-options="{&quot;widget&quot;: &quot;monetary&quot;, &quot;display_currency&quot;: doc.currency_id}"/>
                </td>
                <td style="width:14%; text-align:right">
                    <strong>Total</strong>
                </td>
                <td style="width:18%; text-align:right">
                    <span t-field="doc.amount_total" t-options="{&quot;widget&quot;: &quot;monetary&quot;, &quot;display_currency&quot;: doc.currency_id}"/>
                </td>
            </tr>
        </table>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.replace_summary.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.replace_summary.xml)

### Replace Title  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.replace_title`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//h2" position="replace">
        <h2>
            <span>Blanket Order # </span>
            <span t-field="doc.name"/>
        </h2>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.replace_title.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.replace_title.xml)

### Round Price  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.round_price`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//span[@t-field='l.price_unit']" position="replace">
        <span t-esc="'%g' % l.price_unit if str(l.price_unit)[::-1].find('.') &gt;= 3 else '%.2f' % l.price_unit"/>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.round_price.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.round_price.xml)

### Round Total Price  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.round_total_price`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//span[@t-field='l.price_subtotal']" position="replace">
        <span t-esc="'{0:,.2f}'.format(float(l.price_subtotal)).replace(',','\'')"/>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.round_total_price.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.round_total_price.xml)

### Second Row  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.second_row`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//tbody[hasclass('sale_tbody')]/t/tr[1]" position="attributes">
        <attribute name="t-att-class">"first"</attribute>
    </xpath>
    <xpath expr="//tbody[hasclass('sale_tbody')]/t/tr[1]" position="after">
        <t t-if="l.product_id.type_description">
            <tr class="second">
                <td/>
                <td colspan="6">
                    <span t-field="l.name"/>
                    <br/>
                    <t t-if="l.product_id.country_of_origin_id.code">
          Ursprungsland:
          <span t-field="l.product_id.country_of_origin_id.code"/>
        </t>
                    <t t-if="l.product_id.hs_code">
          / Zollposition:
          <span t-field="l.product_id.hs_code"/>
        </t>
                </td>
            </tr>
        </t>
        <t t-if="not l.product_id.type_description">
            <tr class="second">
                <td/>
                <td colspan="6">
                    <t t-if="l.product_id.country_of_origin_id.code">
          Ursprungsland:
          <span t-field="l.product_id.country_of_origin_id.code"/>
        </t>
                    <t t-if="l.product_id.hs_code">
          / Zollposition:
          <span t-field="l.product_id.hs_code"/>
        </t>
                </td>
            </tr>
        </t>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.second_row.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.second_row.xml)

### Sequence In Table  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.sequence_in_table`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">

    <xpath expr="//table/thead/tr/th[1]" position="before">
        <th>
            <span>Pos</span>
        </th>
    </xpath>

    <xpath expr="//table/tbody/t[2][@t-foreach='doc.line_ids']" position="before">
        <t t-set="index" t-value="1"/>
    </xpath>

    <xpath expr="//span[@t-field='l.name']/.." position="before">
        <td>
            <span t-esc="index"/>
            <t t-set="index" t-value="index+1"/>
        </td>
    </xpath>

</data>
```
Source: [snippets/sale_blanket_order.report_blanketorder_document.sequence_in_table.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.sequence_in_table.xml)

### Set Ids  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.set_ids`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//table//th[4]" position="attributes">
        <attribute name="id">original_uom_qty</attribute>
    </xpath>
    <xpath expr="//span[@t-field='l.original_uom_qty']" position="attributes">
        <attribute name="id">original_uom_qty</attribute>
    </xpath>
    <!--
    <xpath expr="//table[2]//th[1]" position="attributes">
        <attribute name="id">default_code</attribute>
    </xpath>

      <xpath expr="//table[2]//th[2]" position="attributes">
        <attribute name="id">description</attribute>
    </xpath>    

    <xpath expr="//table[2]//th[3]" position="attributes">
        <attribute name="id">date_schedule</attribute>
    </xpath>
    <xpath expr="//table[2]//td[3]" position="attributes">
        <attribute name="id">date_schedule</attribute>
    </xpath>

    <xpath expr="//table//th[3]" position="attributes">
        <attribute name="id">date_schedule</attribute>
    </xpath>
    <xpath expr="//table//td[3]" position="attributes">
        <attribute name="id">date_schedule</attribute>
    </xpath>

    <xpath expr="//table[2]//th[4]" position="attributes">
        <attribute name="id">original_uom_qty</attribute>
    </xpath>
    <xpath expr="//table[2]//td[4]/span" position="attributes">
        <attribute name="id">qty</attribute>
    </xpath>

    <xpath expr="//table[2]//th[5]" position="attributes">
        <attribute name="id">price_subtotal</attribute>
    </xpath>
    
    xpath expr="//table[2]//td[5]" position="attributes">
        <attribute name="id">price_subtotal</attribute>
    </xpath>
    
    <xpath expr="//table[2]//th[6]" position="attributes">
        <attribute name="id">price_total</attribute>
    </xpath>
    -->
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.set_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.set_ids.xml)

### Set Ids Tissa  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.set_ids_tissa`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//div[@class='page']/div[2]" position="attributes">
        <attribute name="id">address</attribute>
        <attribute name="class" separator=" " add="trimada"/>
    </xpath>
    <xpath expr="//span[@t-field='doc.amount_untaxed']/../../../../.." position="attributes">
        <attribute name="id">summary</attribute>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.set_ids_tissa.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.set_ids_tissa.xml)

### Show Default Code  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.show_default_code`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//table[2]/thead/tr/th[1]" position="before">
        <th id="default_code">
            <strong>Part No.</strong>
        </th>
    </xpath>
    <xpath expr="//table[2]/tbody/t/tr/td[1]" position="before">
        <td id="default_code">
            <span t-field="l.product_id.default_code"/>
        </td>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.show_default_code.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.show_default_code.xml)

### Show Description  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.show_description`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">
    <xpath expr="//table/thead/tr/th[1]" position="after">
        <th id="name">
            <span>Description</span>
        </th>
    </xpath>
    <xpath expr="//table/tbody//tr/td[1]" position="after">
        <td>
            <span t-field="l.name"/>
        </td>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.show_description.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.show_description.xml)

### Style Gelso  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.style_gelso`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="60">
    <xpath expr="//div[hasclass('page')]" position="before">
        <style>
            div#informations {            
                font-size: 16px;
                margin-bottom: 0rem;
            }            
        </style>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.style_gelso.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.style_gelso.xml)

### Style Tissa  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.style_tissa`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="60">
    <xpath expr="//div[hasclass('page')]" position="before">
        <style>
			table#info {
				font-size: 9pt;
				border: white;
			}
			table#summary{
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
			.table th {
			  border-top: 1px solid #dee2e6 !important;
			  padding: 0.3rem !important;
			  padding-left: 0.5rem;
			}
			.table td {
			  border-top: 1px solid #dee2e6 !important;
			}
			.note p {
				margin-bottom: 0px;
			}
		  .note p:last-child {
        margin-bottom: 30px;
      }
		</style>
    </xpath>
    <xpath expr="//table/thead//th[1]" position="attributes">
        <attribute name="style">text-align: left</attribute>
    </xpath>
    <xpath expr="//div[@id='summary']/div" position="attributes">
        <attribute name="t-attf-class">#{'col-4 offset-8' if report_type != 'html' else 'col-sm-7 col-md-5'} ml-auto</attribute>
    </xpath>
    <xpath expr="//div[@id='summary']/div/table" position="attributes">
        <attribute name="style">border: white</attribute>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.style_tissa.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.style_tissa.xml)

### Style Trimada  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.style_trimada`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="60">
    <xpath expr="//div[hasclass('page')]" position="before">
        <style>
            .o_company_1_layout {
                font-family: Arial;
                font-size: 9pt;
            }
            .table th {
                padding: 0.3rem;
            }
            .table td {
                padding: 0.3rem;
            }
            h2 {
                font-size: 13pt;
                font-weight: bold;
            }
            table.trimada thead tr {
                border-top:solid 1px;
                border-bottom: solid 1px;
                color: black;
            }
            table.trimada thead th#description {
                width: 70mm;
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
            table.trimada thead th#default_code {
              width: 27mm;
              text-align: left;
            }
            table.trimada thead th#date_schedule {
                text-align: right !important;
            }
            table.trimada tbody td#date_schedule {
                text-align: right !important;
            }
            table.trimada thead th#price_subtotal {
              text-align: right !important;
            }
            table.trimada tbody td span#qty {
              font-weight: bold;
            }
        </style>
    </xpath>
    <xpath expr="//table[2]" position="attributes">
        <attribute name="class" separator=" " add="trimada table-borderless"/>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.style_trimada.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.style_trimada.xml)

### Title Margin  
ID: `mint_system.sale_blanket_order.report_blanketorder_document.title_margin`  
```xml
<data inherit_id="sale_blanket_order.report_blanketorder_document" priority="50">&gt;

  <xpath expr="//h2" position="attributes"><attribute name="style" separator=";" add="margin-top:10mm; margin-bottom:3mm;"/></xpath>

</data>

```
Source: [snippets/sale_blanket_order.report_blanketorder_document.title_margin.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.report_blanketorder_document.title_margin.xml)

## View Blanket Order Form  
### Fiscal Position Id  
ID: `mint_system.sale_blanket_order.view_blanket_order_form.fiscal_position_id`  
```xml
<data inherit_id="sale_blanket_order.view_blanket_order_form" priority="50">
    <xpath expr="//field[@name='payment_term_id']" position="after">
        <field name="fiscal_position_id" invisible="1"/>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.view_blanket_order_form.fiscal_position_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.view_blanket_order_form.fiscal_position_id.xml)

### Modify Attributes Date Confirmed  
ID: `mint_system.sale_blanket_order.view_blanket_order_form.modify_attributes_date_confirmed`  
```xml
<data inherit_id="sale_blanket_order.view_blanket_order_form" priority="50">
    <xpath expr="//field[@name='date_confirmed']" position="attributes">
        <attribute name="attrs">{"invisible": [["state","in",["cancel"]]], "readonly": [["state","in",["cancel"]]], "required": [["state","in",["sent", "open","done", "expired"]]]}</attribute>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.view_blanket_order_form.modify_attributes_date_confirmed.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.view_blanket_order_form.modify_attributes_date_confirmed.xml)

### Move Client Order Ref  
ID: `mint_system.sale_blanket_order.view_blanket_order_form.move_client_order_ref`  
```xml
<data inherit_id="sale_blanket_order.view_blanket_order_form" priority="50">
    <xpath expr="//field[@name='validity_date']" position="after">
        <xpath expr="//field[@name='client_order_ref']" position="move"/>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.view_blanket_order_form.move_client_order_ref.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.view_blanket_order_form.move_client_order_ref.xml)

### X Product Uom Category Id  
ID: `mint_system.sale_blanket_order.view_blanket_order_form.x_product_uom_category_id`  
```xml
<data inherit_id="sale_blanket_order.view_blanket_order_form" priority="50">
    <xpath expr="//page[@name='order_lines']//field[@name='product_uom']" position="before">
        <field name="x_product_uom_category_id" invisible="1"/>
    </xpath>
    <xpath expr="//page[@name='order_lines']//field[@name='product_uom']" position="attributes">
        <attribute name="domain">[["category_id","=",x_product_uom_category_id]]</attribute>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.view_blanket_order_form.x_product_uom_category_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.view_blanket_order_form.x_product_uom_category_id.xml)

### X State  
ID: `mint_system.sale_blanket_order.view_blanket_order_form.x_state`  
```xml
<data inherit_id="sale_blanket_order.view_blanket_order_form" priority="50">
    <xpath expr="//field[@name='user_id']" position="after">
        <field name="state" readonly="0"/>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.view_blanket_order_form.x_state.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.view_blanket_order_form.x_state.xml)

## View Blanket Order Search  
### Replace Filter  
ID: `mint_system.sale_blanket_order.view_blanket_order_search.replace_filter`  
```xml
<data inherit_id="sale_blanket_order.view_blanket_order_search" priority="50">
    <xpath expr="/search" position="replace">
        <search>
            <!-- Filter -->
            <filter name="my_orders" string="Meine Auftr&#xE4;ge" domain="[('user_id', '=', uid)]"/>
            <filter string="Meine Auftr&#xE4;ge in Arbeit" name="in_progress" domain="['&amp;',('user_id', '=', uid),('state', 'in', ('draft','sent', 'open', 'expired'))]"/>
            <separator/>
            <filter string="Entwurf" name="filter_state_draft" domain="[('state', '=', 'draft')]"/>
            <filter string="Gesendet" name="filter_state_sent" domain="[('state', '=', 'sent')]"/>
            <filter string="Offen" name="filter_state_open" domain="[('state', '=', 'open')]"/>
            <filter string="Erledigt" name="filter_state_erledigt" domain="[('state', '=', 'done')]"/>
            <filter string="Abgelaufen" name="filter_state_expired" domain="[('state', '=', 'expired')]"/>
            <filter string="Abgebrochen" name="filter_state_cancel" domain="[('state', '=', 'cancel')]"/>
            <separator/>
            <filter string="Auftragsdatum" name="filter_date_confirmed" date="date_confirmed"/>
            <!-- Gruppierung -->
            <filter string="Verk&#xE4;ufer" name="user_id" domain="[]" context="{'group_by': 'user_id'}"/>
            <filter string="Kunde" name="partner_id" domain="[]" context="{'group_by': 'partner_id'}"/>
            <filter string="Auftragsdatum" name="date_confirmed" domain="[]" context="{'group_by': 'date_confirmed'}"/>
            <filter string="Status" name="state" domain="[]" context="{'group_by': 'state'}"/>
            <!-- Suche -->
            <group>
                <field name="name" string="Order" filter_domain="['|', '|', ('name', 'ilike', self), ('client_order_ref', 'ilike', self), ('partner_id', 'child_of', self)]"/>
                <field name="partner_id"/>
                <field name="user_id"/>
                <field name="team_id"/>
                <field name="product_id" filter_domain="['|','|',('line_ids.product_id', 'ilike', self),('line_ids.product_id.type_description', 'ilike', self),('line_ids.product_id.type_description2', 'ilike', self)]"/>
                <field name="analytic_account_id" string="Kostenstelle"/>
            </group>
        </search>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.view_blanket_order_search.replace_filter.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.view_blanket_order_search.replace_filter.xml)

## View Blanket Order Tree  
### Activities  
ID: `mint_system.sale_blanket_order.view_blanket_order_tree.activities`  
```xml
<data inherit_id="sale_blanket_order.view_blanket_order_tree" priority="50">
    <field name="state" position="after">
        <field name="activity_date_deadline"/>
        <field name="activity_ids"/>
        <field name="activity_state"/>
        <field name="my_activity_date_deadline"/>
    </field>
</data>

```
Source: [snippets/sale_blanket_order.view_blanket_order_tree.activities.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.view_blanket_order_tree.activities.xml)

### Reset View  
ID: `mint_system.sale_blanket_order.view_blanket_order_tree.reset_view`  
```xml
<data inherit_id="sale_blanket_order.view_blanket_order_tree" priority="50">
    <xpath expr="//tree" position="attributes">
        <attribute name="default_order">id desc</attribute>
    </xpath>
    <xpath expr="//field[@name='partner_id']" position="replace">
  </xpath>
    <xpath expr="//field[@name='validity_date']" position="replace">
  </xpath>
    <xpath expr="//field[@name='user_id']" position="replace">
  </xpath>
    <field name="name" position="after">
        <field name="date_confirmed"/>
        <field name="partner_id"/>
        <field name="client_order_ref"/>
        <field name="comment"/>
        <field name="user_id" widget="many2one_avatar_user"/>
        <field name="validity_date"/>
        <field name="amount_total" widget="monetary" decoration-bf="1"/>
    </field>
</data>

```
Source: [snippets/sale_blanket_order.view_blanket_order_tree.reset_view.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.view_blanket_order_tree.reset_view.xml)

### State  
ID: `mint_system.sale_blanket_order.view_blanket_order_tree.state`  
```xml
<data inherit_id="sale_blanket_order.view_blanket_order_tree" priority="50">
    <xpath expr="//field[@name='state']" position="replace">
        <field name="state" string="state"/>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.view_blanket_order_tree.state.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.view_blanket_order_tree.state.xml)

## View Order Form  
### Modify Attributes Blanket Order Line  
ID: `mint_system.sale_blanket_order.view_order_form.modify_attributes_blanket_order_line`  
```xml
<data inherit_id="sale_blanket_order.view_order_form" priority="50">
    <xpath expr="//field[@name='blanket_order_line']" position="before">
        <field name="order_partner_id" invisible="1"/>
    </xpath>
    <xpath expr="//field[@name='blanket_order_line']" position="attributes">
        <attribute name="domain">[["partner_id","=",order_partner_id]]</attribute>
    </xpath>
</data>

```
Source: [snippets/sale_blanket_order.view_order_form.modify_attributes_blanket_order_line.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_blanket_order.view_order_form.modify_attributes_blanket_order_line.xml)

