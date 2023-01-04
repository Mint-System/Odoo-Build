---
prev: ./snippets.md
---
# Account
## Report Invoice Document  
### Add Header And Footer Note  
ID: `mint_system.account.report_invoice_document.add_header_and_footer_note`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//table[@id='info']" position="after">
    <t t-if="o.note_header != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
      <span class="note" t-field="o.note_header"/>
    </t>
  </xpath>

  <xpath expr="//table[2]" position="after">
    <t t-if="o.note_footer != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
      <span class="note" t-field="o.note_footer"/>
    </t>
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.add_header_and_footer_note.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.add_header_and_footer_note.xml)

### Add Header Padding  
ID: `mint_system.account.report_invoice_document.add_header_padding`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//h2" position="attributes">
    <attribute name="style">padding-top: 2rem</attribute>
	</xpath>

</data>

```
Source: [snippets/account.report_invoice_document.add_header_padding.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.add_header_padding.xml)

### Add Header Space  
ID: `mint_system.account.report_invoice_document.add_header_space`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

	<xpath expr="//h2" position="attributes">
		 <attribute name="style">padding-top: 5rem</attribute>
	</xpath>

</data>

```
Source: [snippets/account.report_invoice_document.add_header_space.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.add_header_space.xml)

### Add Iban  
ID: `mint_system.account.report_invoice_document.add_iban`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

    <!-- Odoo 14.0 -->
    <xpath expr="/t/t/div/p[2]" position="before">
        <t t-if="not o.partner_bank_id._eligible_for_qr_code('ch_qr', o.partner_id, o.currency_id)">
            <p>
                <span>IBAN: </span>
                <b>
                    <span t-field="o.partner_bank_id.acc_number" />
                </b>
                <br />
                <span>Bank/BIC: </span>
                <b>
                    <span t-field="o.partner_bank_id.bank_id.display_name" />
                </b>
            </p>
        </t>
    </xpath>

    <!-- Odoo 13.0 -->
    <!-- <xpath expr="/t/t/div/p[2]" position="after">
      <div class="row">
      <div class="col">
          <span>IBAN: </span>
          <span t-field="o.invoice_partner_bank_id.acc_number"/>
      </div>
      </div>
  </xpath>
  <xpath expr="/t/t/div/div[3]" position="after">
      <div class="row">
      <div class="col">
          <span>Bank/BIC: </span>
          <span t-field="o.invoice_partner_bank_id.bank_id.display_name"/>
          <br/>
          <br/>
      </div>
      </div>
  </xpath> -->

</data>
```
Source: [snippets/account.report_invoice_document.add_iban.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.add_iban.xml)

### Add Percentage Sign  
ID: `mint_system.account.report_invoice_document.add_percentage_sign`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

<xpath expr="//span[@t-field='line.discount']" position="replace">
    <span t-field="line.discount"/>%
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.add_percentage_sign.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.add_percentage_sign.xml)

### Add Sale Person  
ID: `mint_system.account.report_invoice_document.add_sale_person`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

    <!-- Remove reference -->
    <xpath expr="/t/t/div/div[1]/div[5]" position="replace">
    </xpath>

    <!-- Add sales person -->
    <xpath expr="/t/t/div/div[1]/div[1]" position="after">
        <div class="col-auto mw-100 mb-2" t-if="o.invoice_user_id" name="invoice_user_id">
            <strong>Salesperson:</strong>
            <p class="m-0" t-field="o.invoice_user_id.name" />
        </div>
    </xpath>

    <!-- Add referencce to new line -->
    <xpath expr="//div[@id='informations']" position="after">
        <div id="informations2" class="row mt32 mb32" t-if="o.ref">
            <div class="col-auto mw-100 mb-2" name="reference">
                <strong>Reference:</strong>
                <p class="m-0" t-field="o.ref" />
            </div>
        </div>
    </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.add_sale_person.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.add_sale_person.xml)

### Add Salesperson  
ID: `mint_system.account.report_invoice_document.add_salesperson`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="/t/t/div/div[1]/div[1]" position="after">
    <div class="col-3 bm-2" t-if="o.invoice_user_id" name="invoice_user_id">
      <strong>Contact:</strong>
      <p class="m-0" t-field="o.invoice_user_id.email"/>
      <p class="m-0" t-field="o.invoice_user_id.phone"/>
    </div>
  </xpath>

  <!-- <xpath expr="/t/t/div/div[1]/div[1]" position="after">
    <div class="col-auto mw-100 mb-2" t-if="o.invoice_user_id" name="invoice_user_id">
      <strong>Contact:</strong>
      <p class="m-0" t-field="o.invoice_user_id.email"/>
      <p class="m-0" t-field="o.invoice_user_id.phone"/>
    </div>
  </xpath> -->

  <!-- <xpath expr="/t/t/div/div[1]/div[1]" position="after">
    <div class="col-auto mw-100 mb-2" t-if="o.invoice_user_id" name="invoice_user_id">
      <strong>Salesperson:</strong>
      <p class="m-0" t-field="o.invoice_user_id.name"/>
    </div>
  </xpath> -->

</data>

```
Source: [snippets/account.report_invoice_document.add_salesperson.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.add_salesperson.xml)

### Align Taxes  
ID: `mint_system.account.report_invoice_document.align_taxes`  
```xml
<?xml version="1.0"?>
<!-- Align invoice tax row right -->
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//th[@name='th_taxes']" position="attributes">
    <attribute name="t-attf-class" separator=" " remove="text-right" add="text-right" />
  </xpath>

  <xpath expr="//span[@id='line_tax_ids']/.." position="attributes">
    <attribute name="t-attf-class" separator=" " remove="text-right" add="text-right" />
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.align_taxes.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.align_taxes.xml)

### Bank Account  
ID: `mint_system.account.report_invoice_document.bank_account`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="/t/t/div/p[2]" position="after">
    <t t-if="o.currency_id.name=='CHF'">
        <t t-set="account" t-value="o.company_id.bank_ids.browse(13)"/>
    </t>
    <t t-if="o.currency_id.name=='EUR'">
        <t t-set="account" t-value="o.company_id.bank_ids.browse(14)"/>
    </t>
    <t t-if="o.currency_id.name=='USD'">
        <t t-set="account" t-value="o.company_id.bank_ids.browse(15)"/>
    </t>
    <div class="row">
      <div class="col">
        <span>IBAN: </span>
        <span t-field="account.acc_number"/>
        <br/>
        <span>Bank/BIC: </span>
        <span t-field="account.bank_id.display_name"/>
        <br/>
        <br/>
      </div>
    </div>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.bank_account.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.bank_account.xml)

### Custom Address  
ID: `mint_system.account.report_invoice_document.custom_address`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//t[@t-set='address']/address" position="replace">
    <address>
      <t t-if="o.partner_id.invoice_name">
        <div><span t-esc="o.partner_id.invoice_name" /></div>
      </t>
      <t t-if="o.partner_id.address_addition">
        <div><span t-esc="o.partner_id.address_addition" /></div>
      </t>
      <t t-if="o.partner_id.street">
        <div><span t-esc="o.partner_id.street" /></div>
      </t>
      <t t-if="o.partner_id.city and o.partner_id.city">
        <div><span t-esc="o.partner_id.zip" /> <span t-esc="o.partner_id.city" /></div>
      </t>
      <t t-if="o.partner_id.country_id">
        <div><span t-esc="o.partner_id.country_id.name" /></div>
      </t>
    </address>
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.custom_address.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.custom_address.xml)

### Custom Taxes  
ID: `mint_system.account.report_invoice_document.custom_taxes`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//th[@name='th_taxes']" position="replace">
  	<th name="th_taxes" t-attf-class="text-right {{ 'd-none d-md-table-cell' if report_type == 'html' else '' }}"><span>Steuern</span></th>
  </xpath>
  <xpath expr="//t[@name='account_invoice_line_accountable']/td[5]" position="replace">
  	<td t-attf-class="text-right {{ 'd-none d-md-table-cell' if report_type == 'html' else '' }}">
  		<span t-esc="', '.join(map(lambda x: (x.description or x.name), line.tax_ids))" id="line_tax_ids"/>
  	</td>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.custom_taxes.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.custom_taxes.xml)

### Display Shipping Address  
ID: `mint_system.account.report_invoice_document.display_shipping_address`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="/t/t/t" position="after">
    <t t-if="o.partner_shipping_id">
      <t t-set="information_block">
        <strong>Shipping address:</strong>
        <div t-if="o.partner_shipping_id" style="margin-bottom: 1rem;">
          <div t-field="o.partner_shipping_id" t-options="{'widget': 'contact', 'fields': ['address', 'name'], 'no_marker': True, 'phone_icons': True}" name="invoice_shipping_address"/>
        </div>
      </t>
    </t>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.display_shipping_address.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.display_shipping_address.xml)

### Font Size  
ID: `mint_system.account.report_invoice_document.font_size`  
```xml
<?xml version="1.0"?>
<!-- Change default font size -->
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//div[hasclass('page')]" position="inside">
		<style>
			body {
				font-size: 0.9rem;
			}
		</style>
	</xpath>

</data>

```
Source: [snippets/account.report_invoice_document.font_size.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.font_size.xml)

### Format Address Blocks  
ID: `mint_system.account.report_invoice_document.format_address_blocks`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//t[@t-set='address']/div" position="attributes">
    <attribute name="style">font-size:10pt; line-height: 1.2; padding-bottom:33mm</attribute>
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.format_address_blocks.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.format_address_blocks.xml)

### Format Pos  
ID: `mint_system.account.report_invoice_document.format_pos`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//t[@t-if='o.sale_order_id']/td" position="attributes">
    <attribute name="style">text-align: right; width: 5mm</attribute>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.format_pos.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.format_pos.xml)

### Format Qty With Decimal  
ID: `mint_system.account.report_invoice_document.format_qty_with_decimal`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

	<xpath expr="//span[@id='qty']" position="replace">
		<t t-if="line.product_uom_id.id == 1">
			<span id="qty" t-field="line.quantity" t-options="{'widget': 'integer'}"/>
		</t>
		<t t-else="">
			<span id="qty" t-field="line.quantity"/>
		</t>
	</xpath>

</data>
```
Source: [snippets/account.report_invoice_document.format_qty_with_decimal.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.format_qty_with_decimal.xml)

### Format Title  
ID: `mint_system.account.report_invoice_document.format_title`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//h2" position="attributes">
    <attribute name="style">color: black; font-size:13pt; font-weight:bold; margin-top:10mm; margin-bottom:3mm</attribute>
  </xpath>
  
</data>
```
Source: [snippets/account.report_invoice_document.format_title.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.format_title.xml)

### Get Position  
ID: `mint_system.account.report_invoice_document.get_position`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">
  
  <xpath expr="//table/thead/tr/th[1]" position="before">
    <t t-if="o.sale_order_id">
      <th id="position">
        <span>Pos</span>
      </th>
    </t>
    <t t-if="o.invoice_line_ids.purchase_line_id">
      <th id="position">
        <span>Pos</span>
      </th>
    </t>
  </xpath>
  
  <!--
  <xpath expr="//table/tbody/t[3]/tr/t[1]/td[1]" position="before">
    <t t-if="o.sale_order_id">
      <td id="position">
        <span t-esc="line.position"/>
      </td>
    </t>
    <t t-if="line.purchase_order_id">
      <td id="position">
        <span t-esc="line.position"/>
      </td>
    </t>
  </xpath>
  -->

    <xpath expr="//span[@t-field='line.name']/.." position="before">
    <t t-if="o.sale_order_id">
      <td id="position">
        <span t-esc="line.position"/>
      </td>
    </t>
    <t t-if="line.purchase_order_id">
      <td id="position">
        <span t-esc="line.position"/>
      </td>
    </t>
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.get_position.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.get_position.xml)

### Group By Pickings  
ID: `mint_system.account.report_invoice_document.group_by_pickings`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//h2" position="before">
    <!-- Get all pickings without duplicates -->
    <t t-set="pickings" t-value="list(set(o.invoice_line_ids.picking_ids.filtered(lambda p: p.state != 'cancel')))"/>
    <!-- Store if has pickings -->
    <t t-set="has_pickings" t-value="len(pickings) > 0"/>
    <!-- Store if has multiple pickings -->
    <t t-set="has_multiple_pickings" t-value="len(pickings) > 1"/>
    <!-- Store if has lines without pickings -->
    <t t-set="has_lines_without_pickings" t-value="len(o.invoice_line_ids.filtered(lambda l: not l.picking_ids)) > 0"/>
  </xpath>
  
  <xpath expr="//h2/span[1]" position="replace">
    <span t-if="o.move_type == 'out_invoice' and o.state == 'posted' and not has_multiple_pickings">Rechnung</span>
    <span t-if="o.move_type == 'out_invoice' and o.state == 'posted' and has_multiple_pickings">Sammelrechnung</span>
  </xpath>

  <xpath expr="//t[@t-foreach='lines']" position="replace">

    <!-- Add empty picking if there are lines without pickings -->
    <t t-if="not has_pickings or has_lines_without_pickings">
      <t t-set="null" t-value="pickings.append(False)"/>
    </t>

    <!--<p t-esc="pickings"/> -->
    <!-- <p t-esc="has_pickings"/> -->
    <!-- <p t-esc="has_multiple_pickings"/> -->
    <!-- <p t-esc="has_lines_without_pickings"/> -->

    <t t-foreach="pickings" t-as="picking">
      <tr t-if="has_pickings and picking" class="o_line_note">
        <td colspan="99" style="padding-top: 1rem;" >
          <strong><span>Lieferung </span><span t-esc="picking.name.replace('WH/OUT/','')"/></strong>
          <!--<strong><span>Lieferung </span><span t-esc="picking.name.replace('WH/OUT/','')"/><span> / Bestellung </span><span t-esc="picking.group_id.name"/></strong>-->
          <span> vom </span>
          <span t-esc="picking.scheduled_date" t-options="{'widget': 'date'}"/><span>:</span>
        </td>
      </tr>
      <tr t-if="not picking" class="o_line_note">
        <td colspan="99" style="padding-top: 1rem;">
          <strong>
            <span>Weitere Positionen: </span>
          </strong>
        </td>
      </tr>
      <t t-foreach="lines" t-as="line">

        <!-- Show line if picking is set and linked or not picking is set and line is unlinked  -->
        <t t-if="(picking and picking in line.picking_ids) or (not line.picking_ids and not picking)">

          <t t-set="current_subtotal" t-value="current_subtotal + line.price_subtotal" groups="account.group_show_line_subtotals_tax_excluded"/>
          <t t-set="current_subtotal" t-value="current_subtotal + line.price_total" groups="account.group_show_line_subtotals_tax_included"/>

          <tr t-att-class="'bg-200 font-weight-bold o_line_section' if line.display_type == 'line_section' else 'font-italic o_line_note' if line.display_type == 'line_note' else ''">
            <t t-if="not line.display_type" name="account_invoice_line_accountable">
              <td name="account_invoice_line_name">
                <span t-field="line.name" t-options="{'widget': 'text'}"/>
              </td>
              <td class="text-right">
                <span t-field="line.quantity"/>
                <span t-field="line.product_uom_id" groups="uom.group_uom"/>
              </td>
              <td t-attf-class="text-right {{ 'd-none d-md-table-cell' if report_type == 'html' else '' }}">
                <span class="text-nowrap" t-field="line.price_unit"/>
              </td>
              <td t-if="display_discount" t-attf-class="text-right {{ 'd-none d-md-table-cell' if report_type == 'html' else '' }}">
                <span class="text-nowrap" t-field="line.discount"/>
              </td>
              <td t-attf-class="text-left {{ 'd-none d-md-table-cell' if report_type == 'html' else '' }}">
                <span t-esc="', '.join(map(lambda x: (x.description or x.name), line.tax_ids))" id="line_tax_ids"/>
              </td>
              <td class="text-right o_price_total">
                <span class="text-nowrap" t-field="line.price_subtotal" groups="account.group_show_line_subtotals_tax_excluded"/>
                <span class="text-nowrap" t-field="line.price_total" groups="account.group_show_line_subtotals_tax_included"/>
              </td>
            </t>
            <t t-if="line.display_type == 'line_section'">
              <td colspan="99">
                <span t-field="line.name" t-options="{'widget': 'text'}"/>
              </td>
              <t t-set="current_section" t-value="line"/>
              <t t-set="current_subtotal" t-value="0"/>
            </t>
            <t t-if="line.display_type == 'line_note'">
              <td colspan="99">
                <span t-field="line.name" t-options="{'widget': 'text'}"/>
              </td>
            </t>
          </tr>

          <t t-if="current_section and (line_last or lines[line_index+1].display_type == 'line_section')">
            <tr class="is-subtotal text-right">
              <td colspan="99">
                <strong class="mr16">Subtotal</strong>
                <span t-esc="current_subtotal" t-options="{&quot;widget&quot;: &quot;monetary&quot;, &quot;display_currency&quot;: o.currency_id}"/>
              </td>
            </tr>
          </t>

        </t>
      </t>
      <tr t-if="picking and picking.sale_id.note" class="o_line_note">
        <td colspan="99" style="padding-bottom: 1rem;" >
          <span t-esc="picking.sale_id.note"/>
        </td>
      </tr>
    </t>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.group_by_pickings.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.group_by_pickings.xml)

### Group By Sale Order  
ID: `mint_system.account.report_invoice_document.group_by_sale_order`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//h2" position="before">
    <!-- Get all sale orders without duplicates -->
    <t t-set="sale_orders" t-value="list(set([line.order_id for line in o.invoice_line_ids.sale_line_ids]))"/>
    <!-- Store if has sale orders -->
    <t t-set="has_sale_orders" t-value="len(sale_orders) > 0"/>
    <!-- Store if has multiple sale orders -->
    <t t-set="has_multiple_sale_orders" t-value="len(sale_orders) > 1"/>
    <!-- Store if has lines without sale orders -->
    <t t-set="has_lines_without_sale_orders" t-value="len(o.invoice_line_ids.filtered(lambda l: not l.sale_line_ids)) > 0"/>
  </xpath>

  <xpath expr="//h2/span[1]" position="replace">
    <span t-if="o.move_type == 'out_invoice' and o.state == 'posted' and not has_multiple_sale_orders">Rechnung</span>
    <span t-if="o.move_type == 'out_invoice' and o.state == 'posted' and has_multiple_sale_orders">Sammelrechnung</span>
  </xpath>

  <xpath expr="//t[@t-foreach='lines']" position="replace">

    <!-- Add empty sale order if there are lines without sale orders -->
    <t t-if="not has_sale_orders or has_lines_without_sale_orders">
      <t t-set="null" t-value="sale_orders.append(False)"/>
    </t>

    <!-- <p t-esc="sale_orders"/> -->
    <!-- <p t-esc="has_sale_orders"/> -->
    <!-- <p t-esc="has_multiple_sale_orders"/> -->
    <!-- <p t-esc="has_lines_without_sale_orders"/> -->
    
    <t t-foreach="sale_orders" t-as="sale_order">
      <tr t-if="has_sale_orders and sale_order" class="o_line_note">
        <td colspan="99" style="padding-top: 1rem;">
          <strong>
            <span>Verkaufsauftrag </span>
            <span t-esc="sale_order.name"/>
            <span t-if="sale_order.client_order_ref">/</span>
            <span t-if="sale_order.client_order_ref" t-esc="sale_order.client_order_ref"/>
            <span> vom </span>
            <span t-esc="sale_order.date_order" t-options="{'widget': 'date'}"/><span>:</span>
          </strong>
        </td>
      </tr>
      <tr t-if="not sale_order" class="o_line_note">
        <td colspan="99" style="padding-top: 1rem;">
          <strong>
            <span>Weitere Positionen: </span>
          </strong>
        </td>
      </tr>
      <t t-foreach="lines" t-as="line">

        <!-- Show line if sale order is set and linked or not sale order is set and line is unlinked  -->
        <t t-if="(sale_order and sale_order in line.sale_line_ids.order_id) or (not line.sale_line_ids and not sale_order)">

          <t t-set="current_subtotal" t-value="current_subtotal + line.price_subtotal" groups="account.group_show_line_subtotals_tax_excluded"/>
          <t t-set="current_subtotal" t-value="current_subtotal + line.price_total" groups="account.group_show_line_subtotals_tax_included"/>

          <tr t-att-class="'bg-200 font-weight-bold o_line_section' if line.display_type == 'line_section' else 'font-italic o_line_note' if line.display_type == 'line_note' else ''">
            <t t-if="not line.display_type" name="account_invoice_line_accountable">
              <td name="account_invoice_line_name">
                <span t-field="line.name" t-options="{'widget': 'text'}"/>
              </td>
              <td class="text-right">
                <span t-field="line.quantity"/>
                <span t-field="line.product_uom_id" groups="uom.group_uom"/>
              </td>
              <td t-attf-class="text-right {{ 'd-none d-md-table-cell' if report_type == 'html' else '' }}">
                <span class="text-nowrap" t-field="line.price_unit"/>
              </td>
              <td t-if="display_discount" t-attf-class="text-right {{ 'd-none d-md-table-cell' if report_type == 'html' else '' }}">
                <span class="text-nowrap" t-field="line.discount"/>
              </td>
              <td t-attf-class="text-left {{ 'd-none d-md-table-cell' if report_type == 'html' else '' }}">
                <span t-esc="', '.join(map(lambda x: (x.description or x.name), line.tax_ids))" id="line_tax_ids"/>
              </td>
              <td class="text-right o_price_total">
                <span class="text-nowrap" t-field="line.price_subtotal" groups="account.group_show_line_subtotals_tax_excluded"/>
                <span class="text-nowrap" t-field="line.price_total" groups="account.group_show_line_subtotals_tax_included"/>
              </td>
            </t>
            <t t-if="line.display_type == 'line_section'">
              <td colspan="99">
                <span t-field="line.name" t-options="{'widget': 'text'}"/>
              </td>
              <t t-set="current_section" t-value="line"/>
              <t t-set="current_subtotal" t-value="0"/>
            </t>
            <t t-if="line.display_type == 'line_note'">
              <td colspan="99">
                <span t-field="line.name" t-options="{'widget': 'text'}"/>
              </td>
            </t>
          </tr>

          <t t-if="current_section and (line_last or lines[line_index+1].display_type == 'line_section')">
            <tr class="is-subtotal text-right">
              <td colspan="99">
                <strong class="mr16">Subtotal</strong>
                <span t-esc="current_subtotal" t-options="{&quot;widget&quot;: &quot;monetary&quot;, &quot;display_currency&quot;: o.currency_id}"/>
              </td>
            </tr>
          </t>

        </t>
      </t>
    </t>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.group_by_sale_order.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.group_by_sale_order.xml)

### Margin After Title  
ID: `mint_system.account.report_invoice_document.margin_after_title`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//h2" position="attributes">
    <attribute name="style" separator=";" add="margin-bottom: 1rem"/>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.margin_after_title.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.margin_after_title.xml)

### Margin Before Invoice Table  
ID: `mint_system.account.report_invoice_document.margin_before_invoice_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <table name="invoice_line_table" position="attributes">
    <attribute name="style" separator=";" add="margin-top: 1rem"/>
  </table>

</data>

```
Source: [snippets/account.report_invoice_document.margin_before_invoice_table.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.margin_before_invoice_table.xml)

### Margin Before Title  
ID: `mint_system.account.report_invoice_document.margin_before_title`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//h2" position="attributes">
    <attribute name="style" separator=";" add="margin-top: 1rem"/>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.margin_before_title.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.margin_before_title.xml)

### Modify Main Table  
ID: `mint_system.account.report_invoice_document.modify_main_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <!-- add default_code   -->
  <xpath expr="//table[@class='table table-sm o_main_table']/thead/tr/th[1]" position="before">
    <th style="text-align: right; width: 27mm; padding-right: 10px">
      <span>Part No.</span>
    </th>
  </xpath>
  <xpath expr="//table[@class='table table-sm o_main_table']/tbody/t/tr/t[1]/td[1]" position="before">
    <td style="text-align: right; padding-right: 10px">
      <span t-field="line.product_id.default_code" />
    </td>
  </xpath>

  <!-- Header desriptin -->
  <xpath expr="//table[@class='table table-sm o_main_table']/thead/tr/th[2]" position="attributes">
    <attribute name="style">width: 70mm</attribute>
  </xpath>

  <!-- add delivery date -->
  <xpath expr="//table[@class='table table-sm o_main_table']/thead/tr/th[3]" position="before">
    <th style="text-align: right; width: 27mm; padding-right: 10px">
      <span></span>
    </th>
  </xpath>
  <xpath expr="//table[@class='table table-sm o_main_table']/tbody/t/tr/t[1]/td[3]" position="before">
    <td style="text-align: right; padding-right: 10px"></td>
  </xpath>

  <xpath expr="//td[@name='account_invoice_line_name']" position="replace">
    <td>
      <span style="font-weight: bold" t-field="line.product_id.type_description" />
    </td>
  </xpath>

  <!-- add second row -->
  <xpath expr="//table[@class='table table-sm o_main_table']/tbody//tr[1]" position="after">
    <tr>
      <td style="padding-bottom :10px; padding-left:3px; line-height: 1.2"></td>
      <td style="padding:0; padding-left:3px; line-height: 1.2"></td>
      <td style="padding:0; padding-left:3px; line-height: 1.2" colspan="4">
        <span t-field="line.sale_line_ids.name" />
        <br />
        <t t-if="line.product_id.country_of_origin_id.code and line.product_id.hs_code">
          Country of origin:
          <span t-esc="line.product_id.country_of_origin_id.code" />
          / HS Code:
          <span t-esc="line.product_id.hs_code" />
          <br />
        </t>

        <t t-if="line.product_id.hs_code and not line.product_id.country_of_origin_id.code">
          HS Code:
          <span t-esc="line.product_id.hs_code" />
        </t>

        <t t-if="line.product_id.country_of_origin_id.code and not line.product_id.hs_code">
          Country of origin:
          <span t-esc="line.product_id.country_of_origin_id.code" />
        </t>
      </td>

      <td></td>
    </tr>
    <tr style="border-bottom: 1px solid rgb(220,220,220)">
      <td colspan="8"></td>
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

  <xpath expr="//table[@name='invoice_line_table']" position="after">

    <table class="table table-borderless table-sm" style="margin-top:20px; width:100%; color:black; font-family: arial; font-size:9pt; border-top-style:solid; border-bottom-style:solid; border-width:1px; border-color:black">
      <t t-if="o.note_footer != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
        <span class="note" t-field="o.note_footer" />
      </t>
      <t t-foreach="o.amount_by_group" t-as="amount_by_group">
        <tr>
          <td style="width:15.5%; text-align:left">
            <Strong>Warenwert</Strong>
          </td>
          <td style="width:23%; text-align:left">
            <span t-field="o.amount_untaxed" />
          </td>
          <td style="width:12%; text-align:left">
            <span t-esc="amount_by_group[0]" />
          </td>
          <td style="width:17%; text-align:left">
            <span t-esc="amount_by_group[3]" />
          </td>
          <td style="width:14%; text-align:right">
            <Strong>Rechnungsbetrag</Strong>
          </td>
          <td style="width:18%; text-align:right">
            <span t-field="o.amount_total" />
          </td>
        </tr>
      </t>
    </table>
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.modify_main_table.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.modify_main_table.xml)

### Net Value Summary  
ID: `mint_system.account.report_invoice_document.net_value_summary`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//div[@id='total']//table/tr[1]" position="before">

    <t t-set="net_value_of_goods" t-value="sum(o.invoice_line_ids.filtered(lambda l: l.product_id.type == 'product').mapped('price_subtotal'))" />
    <t t-set="additional_expenses" t-value="sum(o.invoice_line_ids.filtered(lambda l: l.product_id.type != 'product').mapped('price_subtotal'))" />

    <tr>
      <!-- de_CH: Nettowarenwert -->
      <td>Net Value of Goods</td>
      <td class="text-right">
        <span t-esc="net_value_of_goods" t-options="{'widget': 'monetary', 'display_currency': o.currency_id}" />
      </td>
    </tr>
    <tr>
      <!-- de_CH: Zusatzaufwendungen -->
      <td>Additional Expenses</td>
      <td class="text-right">
        <span t-esc="additional_expenses" t-options="{'widget': 'monetary', 'display_currency': o.currency_id}" />
      </td>
    </tr>
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.net_value_summary.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.net_value_summary.xml)

### Product Hs Code And Origin  
ID: `mint_system.account.report_invoice_document.product_hs_code_and_origin`  
```xml
<?xml version="1.0"?>
<!-- Show custom field country of origin and hs code -->
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//table/tbody/t[3]/tr/t[1]/td[1]/span" position="after">
    <t t-if="line.product_id.country_of_origin_id.code">
      <br/>
      Country of Origin: <span t-field="line.product_id.country_of_origin_id.code"/>
    </t>
    <t t-if="line.product_id.hs_code">
      <br/>
      HS Code: <span t-field="line.product_id.hs_code"/>
    </t>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.product_hs_code_and_origin.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.product_hs_code_and_origin.xml)

### Product Weight  
ID: `mint_system.account.report_invoice_document.product_weight`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//table/tbody/t[3]/tr/t[1]/td[1]/span" position="after">
  <t t-if="line.product_id.weight">
    <br/>
		Weight: <span t-field="line.product_id.weight"/>
		<span t-field="line.product_id.weight_uom_id.display_name"/>
  </t>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.product_weight.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.product_weight.xml)

### Remove Incoterms  
ID: `mint_system.account.report_invoice_document.remove_incoterms`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

	<xpath expr="//p[@name='payment_communication']" position="replace">
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.remove_incoterms.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.remove_incoterms.xml)

### Remove Payment Ref  
ID: `mint_system.account.report_invoice_document.remove_payment_ref`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

	<xpath expr="//p[@name='payment_communication']" position="replace">
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.remove_payment_ref.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.remove_payment_ref.xml)

### Remove Payment Term  
ID: `mint_system.account.report_invoice_document.remove_payment_term`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

	<p name="payment_term" position="replace">
  </p>

</data>

```
Source: [snippets/account.report_invoice_document.remove_payment_term.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.remove_payment_term.xml)

### Remove Summary Table  
ID: `mint_system.account.report_invoice_document.remove_summary_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

<xpath expr="//div[@class='clearfix']" position="replace">
</xpath>

</data>
```
Source: [snippets/account.report_invoice_document.remove_summary_table.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.remove_summary_table.xml)

### Remove Taxes  
ID: `mint_system.account.report_invoice_document.remove_taxes`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="60">

  <xpath expr="//th[@name='th_taxes']" position="replace"/>
  <xpath expr="//span[@id='line_tax_ids']/.." position="replace"/>

</data>

```
Source: [snippets/account.report_invoice_document.remove_taxes.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.remove_taxes.xml)

### Replace Address  
ID: `mint_system.account.report_invoice_document.replace_address`  
```xml
<?xml version="1.0"?>
<!-- Align invoice tax row right -->
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//div[@t-field='o.partner_id']" position="replace">
    <t t-if="o.partner_invoice_id.is_company == true">
      <div t-esc="o.partner_invoice_id.name"/>
      <div t-esc="o.partner_invoice_id.street"/>
      <div t-esc="o.partner_invoice_id.street2"/>
      <span t-esc="o.partner_invoice_id.zip"/>
      <span t-esc="o.partner_invoice_id.city"/>
      <t t-if="o.partner_invoice_id.country_id.code != 'CH'">
        <div t-esc="oo.partner_invoice_id.country_id.name"/>
      </t>
    </t>
    <t t-else="">
      <div t-field="o.partner_invoice_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}"/>
    </t>
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.replace_address.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.replace_address.xml)

### Replace Footer  
ID: `mint_system.account.report_invoice_document.replace_footer`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//p[@name='payment_communication']" position="replace">
  </xpath>
  
  <p t-if="o.invoice_payment_term_id" name="payment_term">
                        <span t-field="o.invoice_payment_term_id.note"/>
                    </p>

  <xpath expr="//p[@t-if='o.invoice_incoterm_id']" position="replace">
    <style>
      table#footer {
        width: 100%;
        font-size: 8pt;
      }
      table#footer tr, td {
        vertical-align: top;
      }
    </style>
    <table id='footer'>
      <tr>
        <td t-if="o.invoice_payment_term_id" name="payment_term">
          Zahlungsbedingungen: <span t-field="o.invoice_payment_term_id.note"/>
        </td>
        <td width="50%">
          Lieferung gemäss unseren allgemeinen Lieferbedingungen
        </td>
      </tr>
      <tr>
        <td >MWST-Nr: 
          <span t-field="o.company_id.vat"/>
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

  <xpath expr="//p[@name='payment_term']" position="replace">
  </xpath>


</data>
```
Source: [snippets/account.report_invoice_document.replace_footer.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.replace_footer.xml)

### Replace Information Table2  
ID: `mint_system.account.report_invoice_document.replace_information_table2`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">
  <xpath expr="//*[@id='informations']" position="replace">
    <style>
      table#informations {
        white-space: nowrap;
      }
      table#informations td:nth-child(odd) {
        text-align: left;
      }
      table#informations td:nth-child(even) {
        text-align: left;
        padding-right: 3rem;
      }
    </style>
    <table id='informations' class="table table-borderless table-sm">
      <tr>
        <td>
          <strong>Rechnungsdatum: </strong>
        </td>
        <td>
          <span t-field="o.invoice_date"/>
        </td>
        <td>
          <strong>Kontakt Rechnung: </strong>
        </td>
        <td>
          <t t-foreach="res_company.partner_id.child_ids.filtered(lambda c: c.type == 'invoice' and c.name)" t-as="delivery_partner">
            <span t-esc="delivery_partner.name" />
          </t>
        </td>
        <td>
          <strong>Zahlbar innert: </strong>
        </td>
        <td>
          <span t-field="o.invoice_payment_term_id"/>
        </td>
      </tr>
      <tr>
        <td>
          <strong>Kontakt Verkauf: </strong>
        </td>
        <td>
          <span t-field="o.invoice_user_id" />
        </td>
        <td>
          <strong>Tel. Direkt: </strong>
        </td>
        <td>
          <t t-foreach="res_company.partner_id.child_ids.filtered(lambda c: c.type == 'invoice' and c.phone)" t-as="delivery_partner">
            <span t-esc="delivery_partner.phone" />
          </t>
        </td>
        <td>
        </td>
      </tr>
      <tr>
        <td>
          <strong>Kunden-Nr.: </strong>
        </td>
        <td>
          <span t-field="o.partner_id.ref" />
        </td>
        <td>
          <strong>E-Mail:</strong>
        </td>
        <td>
          <t t-foreach="res_company.partner_id.child_ids.filtered(lambda c: c.type == 'invoice' and c.email)" t-as="delivery_partner">
            <span t-esc="delivery_partner.email" />
          </t>
        </td>
        <td>
          <!-- <strong>MWST: </strong> -->
        </td>
        <td>
          <!-- <span t-field="res_company.vat" /> -->
        </td>
      </tr>
    </table>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.replace_information_table2.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.replace_information_table2.xml)

### Replace Information Table  
ID: `mint_system.account.report_invoice_document.replace_information_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">
  <xpath expr="//*[@id='informations']" position="replace">
    <style>
      table#informations{
        white-space: nowrap;
      }
    </style>
    <table id='informations' class="table table-borderless table-sm">
      <tr>
        <td>
          <strong>Rechnungsdatum: </strong>
          <span t-field="o.invoice_date"/>
        </td>
        <td>
          <strong>Kontakt Rechnung: </strong>
          <t t-foreach="res_company.partner_id.child_ids.filtered(lambda c: c.type == 'invoice' and c.name)" t-as="delivery_partner">
            <span t-esc="delivery_partner.name" />
          </t>
        </td>
        <td>
          <strong>Zahlbar innert: </strong>
          <span t-field="o.invoice_payment_term_id"/>
        </td>
      </tr>
      <tr>
        <td>
          <strong>Kontakt Verkauf: </strong>
          <span t-field="o.invoice_user_id" />
        </td>
        <td>
          <strong>Tel. Direkt: </strong>
          <t t-foreach="res_company.partner_id.child_ids.filtered(lambda c: c.type == 'invoice' and c.phone)" t-as="delivery_partner">
            <span t-esc="delivery_partner.phone" />
          </t>
        </td>
        <td>
        </td>
      </tr>
      <tr>
        <td>
          <strong>Kunden-Nr.: </strong>
          <span t-field="o.partner_id.ref" />
        </td>
        <td>
          <strong>E-Mail:</strong>
          <t t-foreach="res_company.partner_id.child_ids.filtered(lambda c: c.type == 'invoice' and c.email)" t-as="delivery_partner">
            <span t-esc="delivery_partner.email" />
          </t>
        </td>
        <td>
          <!-- <strong>MWST: </strong>
          <span t-field="res_company.vat" /> -->
        </td>
      </tr>
    </table>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.replace_information_table.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.replace_information_table.xml)

### Replace Infotable  
ID: `mint_system.account.report_invoice_document.replace_infotable`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//div[@id='informations']" position="replace">
    <style>
    table#info {
      width: 100%;
      margin-bottom: 25px;
      font-size: 9pt;
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
        <td></td>
        <td></td>
        <td>Order No.</td>
        <td>
          <span t-field='o.invoice_origin'/>
        </td>
      </tr>
      <tr>
        <td width="17%">Invoice date</td>
        <td width="44%">
          <span t-field='o.invoice_date' t-options='{ "widget": "date" }'/>
        </td>
        <td width="14%">Our Reference</td>
        <td width="25%">
          <span t-field='o.user_id'/>
        </td>
      </tr>
      <tr>
        <td>Customer No.</td>
        <td>
          <span t-field='o.partner_id.ref'/>
        </td>
        <td>Delivery Method</td>
        <td>
          <span t-field='o.carrier_id'/>
        </td>
      </tr>
      <tr>
        <td>Order</td>
        <td>
          <span t-field='o.ref'/>
        </td>
        <td>Incoterm</td>
        <td>
          <span t-field='o.invoice_incoterm_id'/>
        </td>
      </tr>
      <tr>
        <td>Reference</td>
        <td>
           <span t-field='o.comment'/>
        </td>
        
        <td>Delivery Date</td>
        <td>
          <span t-field='o.x_date_done' t-options='{ "widget": "date" }'/>
        </td>
    
      </tr>
    </table>
  </xpath>
</data>



```
Source: [snippets/account.report_invoice_document.replace_infotable.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.replace_infotable.xml)

### Replace Product Description  
ID: `mint_system.account.report_invoice_document.replace_product_description`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

<xpath expr="//td[@name='account_invoice_line_name']" position="replace">
  <t t-if="line.product_id.type_description">
	<td>
		<span style="font-weight: bold" t-field="line.product_id.type_description"/>
	</td>
  </t>
  <t t-if="not line.product_id.type_description">
	<td>
    <span t-field="line.external_name"/>
	</td>
  </t>

</xpath>

</data>
```
Source: [snippets/account.report_invoice_document.replace_product_description.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.replace_product_description.xml)

### Replace Summary  
ID: `mint_system.account.report_invoice_document.replace_summary`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//table[@name='invoice_line_table']" position="after">

    <style>
			table.trimada_summary tr {
				border-top: solid 1px !important;
				border-bottom: solid 1px;
				page-break-inside: avoid;
			}
			table.trimada_details tr {
			  border-top: 0px !important;
			  border-bottom: 0px;
			  line-height: 0.7;
			}
			table.trimada_summary #amount_untaxed_label {
				width: 11.5%;
				text-align: left;
			}
			table.trimada_details td#amount_by_group0 {
				width: 8%;
				text-align: left;
			}
			table.trimada_details td#amount_by_group3 {
				width: 21%;
				text-align: right;
				padding-right: 10%;
			}
			table.trimada_details td#amount_by_group4 {
				width: 27%;
				text-align: right;
				padding-right: 15%;
			}
			table.trimada_summary td#amount_by_group_label {
				width: 12%;
				text-align: left;
			}
			table.trimada_summary td#amount_by_group {
				width: 17%;
				text-align: left;
			}
			table.trimada_summary #amount_total_label {
				width: 14%;
				text-align: right;
			}
			table.trimada_summary #amount_total {
				width: 18%;
				text-align: right;
			}
    </style>

    <table class="table table-borderless table-sm trimada trimada_summary">
      <td id="amount_untaxed_label">
        <Strong>Warenwert</Strong>
      </td>

      <td>
        <table class="trimada_details">
          <t t-foreach="o.amount_by_group" t-as="amount_by_group">
            <tr style="">

              <td id="amount_by_group4">
                <span>
                  <t t-esc="amount_by_group[4]"/>
                </span>
              </td>

              <t t-if="len(o.line_ids.filtered(lambda line: line.tax_line_id)) in [0, 1] and o.amount_untaxed == amount_by_group[2]">
                <td id="amount_by_group0">
                  <span class="text-nowrap" t-esc="amount_by_group[0]"/>
                </td>
                <td id="amount_by_group3" class="text-right o_price_total">
                  <span class="text-nowrap" t-esc="amount_by_group[3]"/>
                </td>
              </t>
              <t t-else="">
                <td id="amount_by_group0">
                  <span t-esc="amount_by_group[0]"/>
                </td>
                <td id="amount_by_group3" class="text-right o_price_total">
                  <span class="text-nowrap" t-esc="amount_by_group[3]"/>
                </td>
              </t>
            </tr>
          </t>

          <t t-if="print_with_payments">
            <t t-if="o.payment_state != 'invoicing_legacy'">
              <t t-set="payments_vals" t-value="o.sudo()._get_reconciled_info_JSON_values()"/>
              <t t-foreach="payments_vals" t-as="payment_vals">
                <tr>
                  <td>
                    <i class="oe_form_field text-right oe_payment_label">Paid on <t t-esc="payment_vals['date']" t-options="{&quot;widget&quot;: &quot;date&quot;}"/>
                    </i>
                  </td>
                  <td class="text-right">
                    <span t-esc="payment_vals['amount']" t-options="{&quot;widget&quot;: &quot;monetary&quot;, &quot;display_currency&quot;: o.currency_id}"/>
                  </td>
                </tr>
              </t>
              <t t-if="len(payments_vals) &gt; 0">
                <tr class="border-black">
                  <td>
                    <strong>Amount Due</strong>
                  </td>
                  <td class="text-right">
                    <span t-field="o.amount_residual"/>
                  </td>
                </tr>
              </t>
            </t>
          </t>
        </table>
      </td>

      <td id="amount_total_label">
        <strong>Total</strong>
      </td>
      <td id="amount_total">
        <span class="text-nowrap" t-field="o.amount_total"/>
      </td>

    </table>

  </xpath>

</data>


```
Source: [snippets/account.report_invoice_document.replace_summary.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.replace_summary.xml)

### Reset Address  
ID: `mint_system.account.report_invoice_document.reset_address`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//t[@t-set='address']" position="replace">
    <t t-set="address">
      <div>
        <address t-field="o.partner_invoice_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}" />
      </div>
    </t>
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.reset_address.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.reset_address.xml)

### Round Price  
ID: `mint_system.account.report_invoice_document.round_price`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//span[@t-field='line.price_unit']" position="replace">
		 <span t-esc="'%g' % line.price_unit if str(line.price_unit)[::-1].find('.') >= 3 else '{0:,.2f}'.format(float(line.price_unit)).replace(',','\'')"/>
  </xpath>
   
</data>
```
Source: [snippets/account.report_invoice_document.round_price.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.round_price.xml)

### Round Quantity  
ID: `mint_system.account.report_invoice_document.round_quantity`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//span[@t-field='line.quantity']" position="replace">
    <span t-esc="'%.2f' % line.quantity"/>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.round_quantity.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.round_quantity.xml)

### Round Total Price  
ID: `mint_system.account.report_invoice_document.round_total_price`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//span[@t-field='line.price_subtotal']" position="replace">
    <span t-esc="'{0:,.2f}'.format(float(line.price_subtotal)).replace(',','\'')"/>
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.round_total_price.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.round_total_price.xml)

### Second Row  
ID: `mint_system.account.report_invoice_document.second_row`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">
  
  <xpath expr="//tbody[hasclass('invoice_tbody')]//tr" position="attributes">
    <attribute name="class" separator=" " add="first"/>
  </xpath>

  <xpath expr="//tbody[hasclass('invoice_tbody')]//tr" position="after">
    <t t-if="line.product_id.type_description">
    <tr class="second">
      <td></td>
      <td></td>
      <td colspan="5">
        <span t-field="line.external_name"/><br/>
        <t t-if="line.product_id.country_of_origin_id.code">
          Ursprungsland:
          <span t-field="line.product_id.country_of_origin_id.code" />
        </t>
        <t t-if="line.product_id.hs_code">
          / Zollposition:
          <span t-field="line.product_id.hs_code" />
        </t>
      </td>
    </tr>
    </t>
    <t t-if="not line.product_id.type_description">
    <tr class="second">
      <td></td>
      <td></td>
      <td colspan="5">
        <t t-if="line.product_id.country_of_origin_id.code">
          Ursprungsland:
          <span t-field="line.product_id.country_of_origin_id.code" />
        </t>
        <t t-if="line.product_id.hs_code">
          / Zollposition:
          <span t-field="line.product_id.hs_code" />
        </t>
      </td>
    </tr>
    </t>
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.second_row.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.second_row.xml)

### Sequence In Table  
ID: `mint_system.account.report_invoice_document.sequence_in_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="60">

  <xpath expr="//table/thead/tr/th[1]" position="before">
    <th>
      <span>Pos</span>
    </th>
  </xpath>

  <xpath expr="//t[@t-foreach='lines']" position="before">
    <t t-set="index" t-value="1"/>
  </xpath>
  
  <xpath expr="//table/tbody//tr/t[1]/td[1]" position="before">
    <td>
      <span t-esc="index"/><t t-set="index" t-value="index+1"/>
    </td>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.sequence_in_table.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.sequence_in_table.xml)

### Set Ids  
ID: `mint_system.account.report_invoice_document.set_ids`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">
  
	<xpath expr="//th[@name='th_quantity']" position="attributes">
		<attribute name="id">th_quantity</attribute>
	</xpath>

	<xpath expr="//th[@name='th_description']" position="attributes">
		<attribute name="id">description</attribute>
	</xpath>
	<xpath expr="//table[@name='invoice_line_table']//td[2]" position="attributes">
		<attribute name="id">quantity</attribute>
	</xpath>
	<xpath expr="//table[@name='invoice_line_table']//td[2]/span[1]" position="attributes">
		<attribute name="id">qty</attribute>
	</xpath>
	
	<xpath expr="//table[@name='invoice_line_table']//td[3]/span[1]" position="attributes">
		<attribute name="id">price</attribute>
	</xpath>

</data>
```
Source: [snippets/account.report_invoice_document.set_ids.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.set_ids.xml)

### Show Default Code  
ID: `mint_system.account.report_invoice_document.show_default_code`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//table[@name='invoice_line_table']/thead/tr/th[1]" position="before">
    <th id="default_code">
      <strong >Part No.</strong>
    </th>
  </xpath>

  <xpath expr="//table[@name='invoice_line_table']/tbody/t/tr/t[1]/td[1]" position="before">
    <td id="default_code">
      <span t-field="line.product_id.default_code"/>
    </td>
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.show_default_code.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.show_default_code.xml)

### Show Product Name  
ID: `mint_system.account.report_invoice_document.show_product_name`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="60">

  <xpath expr="//td[@name='account_invoice_line_name']" position="replace">
    <td name="account_invoice_line_name">
      <t t-if="line.product_id">
        <span t-field="line.product_id.name"/>
        <br/>
      </t>
      <span class="o_italic" t-field="line.name" t-options="{'widget': 'text'}"/>
    </td>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.show_product_name.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.show_product_name.xml)

### Style Trimada  
ID: `mint_system.account.report_invoice_document.style_trimada`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="60">

	<xpath expr="//div[hasclass('page')]" position="before">
		<style>
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
			table.trimada thead th#open_quantity {
			  width: 30mm;
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
			table.trimada tbody td#open_quantity {
			  text-align: right !important;
			}
			table.trimada tbody td#quantity {
			  text-align: right;
			}			
			table.trimada tbody span#qty {
			  font-weight: bold;
			}
			table.trimada tbody span#open_qty {
			  font-weight: bold;
			}
			.address {
			  font-size: 10pt;
			  line-height: 1.2;
			  padding-bottom:33mm;
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

	<table name="invoice_line_table" position="attributes">
		<attribute name="class" separator=" " add="trimada table-borderless"/>
	</table>

	<table name="invoice_line_table" position="attributes">
		<attribute name="class" separator=" " add="trimada table-borderless"/>
	</table>

  <span id="qty" position="attributes">
		<attribute name="t-options-widget">"integer"</attribute>
	</span>
	
</data>

```
Source: [snippets/account.report_invoice_document.style_trimada.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.style_trimada.xml)

### Switch Address Block  
ID: `mint_system.account.report_invoice_document.switch_address_block`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//t[@t-set='address']" position="after">
    <t t-set="information_block">
      <address t-field="o.partner_id" t-options="{'widget': 'contact', 'fields': ['address', 'name'], 'no_marker': True}"/>
      <div t-if="o.partner_id.vat" class="mt16">
          <t t-if="o.company_id.country_id.vat_label" t-esc="o.company_id.country_id.vat_label" id="inv_tax_id_label"/>
          <t t-else="">Tax ID</t>: <span t-field="o.partner_id.vat"/></div>
    </t>
  </xpath>

  <xpath expr="//t[@t-set='address']" position="replace">
    <t t-set="address">
    </t>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.switch_address_block.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.switch_address_block.xml)

### Unit Precision  
ID: `mint_system.account.report_invoice_document.unit_precision`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//tbody[1]/t[3]/tr[1]/t[1]/td[2]/span[1]" position="attributes">
		<attribute name="t-options-widget">"integer"</attribute>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.unit_precision.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.unit_precision.xml)

### X Picking List  
ID: `mint_system.account.report_invoice_document.x_picking_list`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//p[@t-field='o.invoice_origin']" position="attributes">
    <attribute name="t-field">o.x_picking_list</attribute>
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.x_picking_list.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.x_picking_list.xml)

## Report Invoice Document With Payments  
### Add Iban And Bank  
ID: `mint_system.account.report_invoice_document_with_payments.add_iban_and_bank`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document_with_payments" priority="50">

  <xpath expr="/t/t/div/p[2]" position="after">
    <div class="row">
      <div class="col">
        <span>IBAN: </span>
        <span t-field="o.invoice_partner_bank_id.acc_number"/>
      </div>
    </div>
  </xpath>

  <xpath expr="/t/t/div/div[3]" position="after">
    <div class="row">
      <div class="col">
        <span>Bank/BIC: </span>
        <span t-field="o.invoice_partner_bank_id.bank_id.display_name"/>
        <br/>
        <br/>
      </div>
    </div>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document_with_payments.add_iban_and_bank.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document_with_payments.add_iban_and_bank.xml)

## Report Invoice Document  
### Add Header And Footer Note  
ID: `mint_system.account.report_invoice_document.add_header_and_footer_note`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//table[@id='info']" position="after">
    <t t-if="o.note_header != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
      <span class="note" t-field="o.note_header"/>
    </t>
  </xpath>

  <xpath expr="//table[2]" position="after">
    <t t-if="o.note_footer != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
      <span class="note" t-field="o.note_footer"/>
    </t>
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.add_header_and_footer_note.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.add_header_and_footer_note.xml)

### Add Header Padding  
ID: `mint_system.account.report_invoice_document.add_header_padding`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//h2" position="attributes">
    <attribute name="style">padding-top: 2rem</attribute>
	</xpath>

</data>

```
Source: [snippets/account.report_invoice_document.add_header_padding.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.add_header_padding.xml)

### Add Header Space  
ID: `mint_system.account.report_invoice_document.add_header_space`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

	<xpath expr="//h2" position="attributes">
		 <attribute name="style">padding-top: 5rem</attribute>
	</xpath>

</data>

```
Source: [snippets/account.report_invoice_document.add_header_space.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.add_header_space.xml)

### Add Iban  
ID: `mint_system.account.report_invoice_document.add_iban`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

    <!-- Odoo 14.0 -->
    <xpath expr="/t/t/div/p[2]" position="before">
        <t t-if="not o.partner_bank_id._eligible_for_qr_code('ch_qr', o.partner_id, o.currency_id)">
            <p>
                <span>IBAN: </span>
                <b>
                    <span t-field="o.partner_bank_id.acc_number" />
                </b>
                <br />
                <span>Bank/BIC: </span>
                <b>
                    <span t-field="o.partner_bank_id.bank_id.display_name" />
                </b>
            </p>
        </t>
    </xpath>

    <!-- Odoo 13.0 -->
    <!-- <xpath expr="/t/t/div/p[2]" position="after">
      <div class="row">
      <div class="col">
          <span>IBAN: </span>
          <span t-field="o.invoice_partner_bank_id.acc_number"/>
      </div>
      </div>
  </xpath>
  <xpath expr="/t/t/div/div[3]" position="after">
      <div class="row">
      <div class="col">
          <span>Bank/BIC: </span>
          <span t-field="o.invoice_partner_bank_id.bank_id.display_name"/>
          <br/>
          <br/>
      </div>
      </div>
  </xpath> -->

</data>
```
Source: [snippets/account.report_invoice_document.add_iban.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.add_iban.xml)

### Add Percentage Sign  
ID: `mint_system.account.report_invoice_document.add_percentage_sign`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

<xpath expr="//span[@t-field='line.discount']" position="replace">
    <span t-field="line.discount"/>%
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.add_percentage_sign.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.add_percentage_sign.xml)

### Add Sale Person  
ID: `mint_system.account.report_invoice_document.add_sale_person`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

    <!-- Remove reference -->
    <xpath expr="/t/t/div/div[1]/div[5]" position="replace">
    </xpath>

    <!-- Add sales person -->
    <xpath expr="/t/t/div/div[1]/div[1]" position="after">
        <div class="col-auto mw-100 mb-2" t-if="o.invoice_user_id" name="invoice_user_id">
            <strong>Salesperson:</strong>
            <p class="m-0" t-field="o.invoice_user_id.name" />
        </div>
    </xpath>

    <!-- Add referencce to new line -->
    <xpath expr="//div[@id='informations']" position="after">
        <div id="informations2" class="row mt32 mb32" t-if="o.ref">
            <div class="col-auto mw-100 mb-2" name="reference">
                <strong>Reference:</strong>
                <p class="m-0" t-field="o.ref" />
            </div>
        </div>
    </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.add_sale_person.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.add_sale_person.xml)

### Add Salesperson  
ID: `mint_system.account.report_invoice_document.add_salesperson`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="/t/t/div/div[1]/div[1]" position="after">
    <div class="col-3 bm-2" t-if="o.invoice_user_id" name="invoice_user_id">
      <strong>Contact:</strong>
      <p class="m-0" t-field="o.invoice_user_id.email"/>
      <p class="m-0" t-field="o.invoice_user_id.phone"/>
    </div>
  </xpath>

  <!-- <xpath expr="/t/t/div/div[1]/div[1]" position="after">
    <div class="col-auto mw-100 mb-2" t-if="o.invoice_user_id" name="invoice_user_id">
      <strong>Contact:</strong>
      <p class="m-0" t-field="o.invoice_user_id.email"/>
      <p class="m-0" t-field="o.invoice_user_id.phone"/>
    </div>
  </xpath> -->

  <!-- <xpath expr="/t/t/div/div[1]/div[1]" position="after">
    <div class="col-auto mw-100 mb-2" t-if="o.invoice_user_id" name="invoice_user_id">
      <strong>Salesperson:</strong>
      <p class="m-0" t-field="o.invoice_user_id.name"/>
    </div>
  </xpath> -->

</data>

```
Source: [snippets/account.report_invoice_document.add_salesperson.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.add_salesperson.xml)

### Align Taxes  
ID: `mint_system.account.report_invoice_document.align_taxes`  
```xml
<?xml version="1.0"?>
<!-- Align invoice tax row right -->
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//th[@name='th_taxes']" position="attributes">
    <attribute name="t-attf-class" separator=" " remove="text-right" add="text-right" />
  </xpath>

  <xpath expr="//span[@id='line_tax_ids']/.." position="attributes">
    <attribute name="t-attf-class" separator=" " remove="text-right" add="text-right" />
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.align_taxes.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.align_taxes.xml)

### Bank Account  
ID: `mint_system.account.report_invoice_document.bank_account`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="/t/t/div/p[2]" position="after">
    <t t-if="o.currency_id.name=='CHF'">
        <t t-set="account" t-value="o.company_id.bank_ids.browse(13)"/>
    </t>
    <t t-if="o.currency_id.name=='EUR'">
        <t t-set="account" t-value="o.company_id.bank_ids.browse(14)"/>
    </t>
    <t t-if="o.currency_id.name=='USD'">
        <t t-set="account" t-value="o.company_id.bank_ids.browse(15)"/>
    </t>
    <div class="row">
      <div class="col">
        <span>IBAN: </span>
        <span t-field="account.acc_number"/>
        <br/>
        <span>Bank/BIC: </span>
        <span t-field="account.bank_id.display_name"/>
        <br/>
        <br/>
      </div>
    </div>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.bank_account.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.bank_account.xml)

### Custom Address  
ID: `mint_system.account.report_invoice_document.custom_address`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//t[@t-set='address']/address" position="replace">
    <address>
      <t t-if="o.partner_id.invoice_name">
        <div><span t-esc="o.partner_id.invoice_name" /></div>
      </t>
      <t t-if="o.partner_id.address_addition">
        <div><span t-esc="o.partner_id.address_addition" /></div>
      </t>
      <t t-if="o.partner_id.street">
        <div><span t-esc="o.partner_id.street" /></div>
      </t>
      <t t-if="o.partner_id.city and o.partner_id.city">
        <div><span t-esc="o.partner_id.zip" /> <span t-esc="o.partner_id.city" /></div>
      </t>
      <t t-if="o.partner_id.country_id">
        <div><span t-esc="o.partner_id.country_id.name" /></div>
      </t>
    </address>
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.custom_address.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.custom_address.xml)

### Custom Taxes  
ID: `mint_system.account.report_invoice_document.custom_taxes`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//th[@name='th_taxes']" position="replace">
  	<th name="th_taxes" t-attf-class="text-right {{ 'd-none d-md-table-cell' if report_type == 'html' else '' }}"><span>Steuern</span></th>
  </xpath>
  <xpath expr="//t[@name='account_invoice_line_accountable']/td[5]" position="replace">
  	<td t-attf-class="text-right {{ 'd-none d-md-table-cell' if report_type == 'html' else '' }}">
  		<span t-esc="', '.join(map(lambda x: (x.description or x.name), line.tax_ids))" id="line_tax_ids"/>
  	</td>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.custom_taxes.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.custom_taxes.xml)

### Display Shipping Address  
ID: `mint_system.account.report_invoice_document.display_shipping_address`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="/t/t/t" position="after">
    <t t-if="o.partner_shipping_id">
      <t t-set="information_block">
        <strong>Shipping address:</strong>
        <div t-if="o.partner_shipping_id" style="margin-bottom: 1rem;">
          <div t-field="o.partner_shipping_id" t-options="{'widget': 'contact', 'fields': ['address', 'name'], 'no_marker': True, 'phone_icons': True}" name="invoice_shipping_address"/>
        </div>
      </t>
    </t>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.display_shipping_address.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.display_shipping_address.xml)

### Font Size  
ID: `mint_system.account.report_invoice_document.font_size`  
```xml
<?xml version="1.0"?>
<!-- Change default font size -->
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//div[hasclass('page')]" position="inside">
		<style>
			body {
				font-size: 0.9rem;
			}
		</style>
	</xpath>

</data>

```
Source: [snippets/account.report_invoice_document.font_size.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.font_size.xml)

### Format Address Blocks  
ID: `mint_system.account.report_invoice_document.format_address_blocks`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//t[@t-set='address']/div" position="attributes">
    <attribute name="style">font-size:10pt; line-height: 1.2; padding-bottom:33mm</attribute>
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.format_address_blocks.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.format_address_blocks.xml)

### Format Pos  
ID: `mint_system.account.report_invoice_document.format_pos`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//t[@t-if='o.sale_order_id']/td" position="attributes">
    <attribute name="style">text-align: right; width: 5mm</attribute>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.format_pos.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.format_pos.xml)

### Format Qty With Decimal  
ID: `mint_system.account.report_invoice_document.format_qty_with_decimal`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

	<xpath expr="//span[@id='qty']" position="replace">
		<t t-if="line.product_uom_id.id == 1">
			<span id="qty" t-field="line.quantity" t-options="{'widget': 'integer'}"/>
		</t>
		<t t-else="">
			<span id="qty" t-field="line.quantity"/>
		</t>
	</xpath>

</data>
```
Source: [snippets/account.report_invoice_document.format_qty_with_decimal.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.format_qty_with_decimal.xml)

### Format Title  
ID: `mint_system.account.report_invoice_document.format_title`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//h2" position="attributes">
    <attribute name="style">color: black; font-size:13pt; font-weight:bold; margin-top:10mm; margin-bottom:3mm</attribute>
  </xpath>
  
</data>
```
Source: [snippets/account.report_invoice_document.format_title.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.format_title.xml)

### Get Position  
ID: `mint_system.account.report_invoice_document.get_position`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">
  
  <xpath expr="//table/thead/tr/th[1]" position="before">
    <t t-if="o.sale_order_id">
      <th id="position">
        <span>Pos</span>
      </th>
    </t>
    <t t-if="o.invoice_line_ids.purchase_line_id">
      <th id="position">
        <span>Pos</span>
      </th>
    </t>
  </xpath>
  
  <!--
  <xpath expr="//table/tbody/t[3]/tr/t[1]/td[1]" position="before">
    <t t-if="o.sale_order_id">
      <td id="position">
        <span t-esc="line.position"/>
      </td>
    </t>
    <t t-if="line.purchase_order_id">
      <td id="position">
        <span t-esc="line.position"/>
      </td>
    </t>
  </xpath>
  -->

    <xpath expr="//span[@t-field='line.name']/.." position="before">
    <t t-if="o.sale_order_id">
      <td id="position">
        <span t-esc="line.position"/>
      </td>
    </t>
    <t t-if="line.purchase_order_id">
      <td id="position">
        <span t-esc="line.position"/>
      </td>
    </t>
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.get_position.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.get_position.xml)

### Group By Pickings  
ID: `mint_system.account.report_invoice_document.group_by_pickings`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//h2" position="before">
    <!-- Get all pickings without duplicates -->
    <t t-set="pickings" t-value="list(set(o.invoice_line_ids.picking_ids.filtered(lambda p: p.state != 'cancel')))"/>
    <!-- Store if has pickings -->
    <t t-set="has_pickings" t-value="len(pickings) > 0"/>
    <!-- Store if has multiple pickings -->
    <t t-set="has_multiple_pickings" t-value="len(pickings) > 1"/>
    <!-- Store if has lines without pickings -->
    <t t-set="has_lines_without_pickings" t-value="len(o.invoice_line_ids.filtered(lambda l: not l.picking_ids)) > 0"/>
  </xpath>
  
  <xpath expr="//h2/span[1]" position="replace">
    <span t-if="o.move_type == 'out_invoice' and o.state == 'posted' and not has_multiple_pickings">Rechnung</span>
    <span t-if="o.move_type == 'out_invoice' and o.state == 'posted' and has_multiple_pickings">Sammelrechnung</span>
  </xpath>

  <xpath expr="//t[@t-foreach='lines']" position="replace">

    <!-- Add empty picking if there are lines without pickings -->
    <t t-if="not has_pickings or has_lines_without_pickings">
      <t t-set="null" t-value="pickings.append(False)"/>
    </t>

    <!--<p t-esc="pickings"/> -->
    <!-- <p t-esc="has_pickings"/> -->
    <!-- <p t-esc="has_multiple_pickings"/> -->
    <!-- <p t-esc="has_lines_without_pickings"/> -->

    <t t-foreach="pickings" t-as="picking">
      <tr t-if="has_pickings and picking" class="o_line_note">
        <td colspan="99" style="padding-top: 1rem;" >
          <strong><span>Lieferung </span><span t-esc="picking.name.replace('WH/OUT/','')"/></strong>
          <!--<strong><span>Lieferung </span><span t-esc="picking.name.replace('WH/OUT/','')"/><span> / Bestellung </span><span t-esc="picking.group_id.name"/></strong>-->
          <span> vom </span>
          <span t-esc="picking.scheduled_date" t-options="{'widget': 'date'}"/><span>:</span>
        </td>
      </tr>
      <tr t-if="not picking" class="o_line_note">
        <td colspan="99" style="padding-top: 1rem;">
          <strong>
            <span>Weitere Positionen: </span>
          </strong>
        </td>
      </tr>
      <t t-foreach="lines" t-as="line">

        <!-- Show line if picking is set and linked or not picking is set and line is unlinked  -->
        <t t-if="(picking and picking in line.picking_ids) or (not line.picking_ids and not picking)">

          <t t-set="current_subtotal" t-value="current_subtotal + line.price_subtotal" groups="account.group_show_line_subtotals_tax_excluded"/>
          <t t-set="current_subtotal" t-value="current_subtotal + line.price_total" groups="account.group_show_line_subtotals_tax_included"/>

          <tr t-att-class="'bg-200 font-weight-bold o_line_section' if line.display_type == 'line_section' else 'font-italic o_line_note' if line.display_type == 'line_note' else ''">
            <t t-if="not line.display_type" name="account_invoice_line_accountable">
              <td name="account_invoice_line_name">
                <span t-field="line.name" t-options="{'widget': 'text'}"/>
              </td>
              <td class="text-right">
                <span t-field="line.quantity"/>
                <span t-field="line.product_uom_id" groups="uom.group_uom"/>
              </td>
              <td t-attf-class="text-right {{ 'd-none d-md-table-cell' if report_type == 'html' else '' }}">
                <span class="text-nowrap" t-field="line.price_unit"/>
              </td>
              <td t-if="display_discount" t-attf-class="text-right {{ 'd-none d-md-table-cell' if report_type == 'html' else '' }}">
                <span class="text-nowrap" t-field="line.discount"/>
              </td>
              <td t-attf-class="text-left {{ 'd-none d-md-table-cell' if report_type == 'html' else '' }}">
                <span t-esc="', '.join(map(lambda x: (x.description or x.name), line.tax_ids))" id="line_tax_ids"/>
              </td>
              <td class="text-right o_price_total">
                <span class="text-nowrap" t-field="line.price_subtotal" groups="account.group_show_line_subtotals_tax_excluded"/>
                <span class="text-nowrap" t-field="line.price_total" groups="account.group_show_line_subtotals_tax_included"/>
              </td>
            </t>
            <t t-if="line.display_type == 'line_section'">
              <td colspan="99">
                <span t-field="line.name" t-options="{'widget': 'text'}"/>
              </td>
              <t t-set="current_section" t-value="line"/>
              <t t-set="current_subtotal" t-value="0"/>
            </t>
            <t t-if="line.display_type == 'line_note'">
              <td colspan="99">
                <span t-field="line.name" t-options="{'widget': 'text'}"/>
              </td>
            </t>
          </tr>

          <t t-if="current_section and (line_last or lines[line_index+1].display_type == 'line_section')">
            <tr class="is-subtotal text-right">
              <td colspan="99">
                <strong class="mr16">Subtotal</strong>
                <span t-esc="current_subtotal" t-options="{&quot;widget&quot;: &quot;monetary&quot;, &quot;display_currency&quot;: o.currency_id}"/>
              </td>
            </tr>
          </t>

        </t>
      </t>
      <tr t-if="picking and picking.sale_id.note" class="o_line_note">
        <td colspan="99" style="padding-bottom: 1rem;" >
          <span t-esc="picking.sale_id.note"/>
        </td>
      </tr>
    </t>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.group_by_pickings.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.group_by_pickings.xml)

### Group By Sale Order  
ID: `mint_system.account.report_invoice_document.group_by_sale_order`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//h2" position="before">
    <!-- Get all sale orders without duplicates -->
    <t t-set="sale_orders" t-value="list(set([line.order_id for line in o.invoice_line_ids.sale_line_ids]))"/>
    <!-- Store if has sale orders -->
    <t t-set="has_sale_orders" t-value="len(sale_orders) > 0"/>
    <!-- Store if has multiple sale orders -->
    <t t-set="has_multiple_sale_orders" t-value="len(sale_orders) > 1"/>
    <!-- Store if has lines without sale orders -->
    <t t-set="has_lines_without_sale_orders" t-value="len(o.invoice_line_ids.filtered(lambda l: not l.sale_line_ids)) > 0"/>
  </xpath>

  <xpath expr="//h2/span[1]" position="replace">
    <span t-if="o.move_type == 'out_invoice' and o.state == 'posted' and not has_multiple_sale_orders">Rechnung</span>
    <span t-if="o.move_type == 'out_invoice' and o.state == 'posted' and has_multiple_sale_orders">Sammelrechnung</span>
  </xpath>

  <xpath expr="//t[@t-foreach='lines']" position="replace">

    <!-- Add empty sale order if there are lines without sale orders -->
    <t t-if="not has_sale_orders or has_lines_without_sale_orders">
      <t t-set="null" t-value="sale_orders.append(False)"/>
    </t>

    <!-- <p t-esc="sale_orders"/> -->
    <!-- <p t-esc="has_sale_orders"/> -->
    <!-- <p t-esc="has_multiple_sale_orders"/> -->
    <!-- <p t-esc="has_lines_without_sale_orders"/> -->
    
    <t t-foreach="sale_orders" t-as="sale_order">
      <tr t-if="has_sale_orders and sale_order" class="o_line_note">
        <td colspan="99" style="padding-top: 1rem;">
          <strong>
            <span>Verkaufsauftrag </span>
            <span t-esc="sale_order.name"/>
            <span t-if="sale_order.client_order_ref">/</span>
            <span t-if="sale_order.client_order_ref" t-esc="sale_order.client_order_ref"/>
            <span> vom </span>
            <span t-esc="sale_order.date_order" t-options="{'widget': 'date'}"/><span>:</span>
          </strong>
        </td>
      </tr>
      <tr t-if="not sale_order" class="o_line_note">
        <td colspan="99" style="padding-top: 1rem;">
          <strong>
            <span>Weitere Positionen: </span>
          </strong>
        </td>
      </tr>
      <t t-foreach="lines" t-as="line">

        <!-- Show line if sale order is set and linked or not sale order is set and line is unlinked  -->
        <t t-if="(sale_order and sale_order in line.sale_line_ids.order_id) or (not line.sale_line_ids and not sale_order)">

          <t t-set="current_subtotal" t-value="current_subtotal + line.price_subtotal" groups="account.group_show_line_subtotals_tax_excluded"/>
          <t t-set="current_subtotal" t-value="current_subtotal + line.price_total" groups="account.group_show_line_subtotals_tax_included"/>

          <tr t-att-class="'bg-200 font-weight-bold o_line_section' if line.display_type == 'line_section' else 'font-italic o_line_note' if line.display_type == 'line_note' else ''">
            <t t-if="not line.display_type" name="account_invoice_line_accountable">
              <td name="account_invoice_line_name">
                <span t-field="line.name" t-options="{'widget': 'text'}"/>
              </td>
              <td class="text-right">
                <span t-field="line.quantity"/>
                <span t-field="line.product_uom_id" groups="uom.group_uom"/>
              </td>
              <td t-attf-class="text-right {{ 'd-none d-md-table-cell' if report_type == 'html' else '' }}">
                <span class="text-nowrap" t-field="line.price_unit"/>
              </td>
              <td t-if="display_discount" t-attf-class="text-right {{ 'd-none d-md-table-cell' if report_type == 'html' else '' }}">
                <span class="text-nowrap" t-field="line.discount"/>
              </td>
              <td t-attf-class="text-left {{ 'd-none d-md-table-cell' if report_type == 'html' else '' }}">
                <span t-esc="', '.join(map(lambda x: (x.description or x.name), line.tax_ids))" id="line_tax_ids"/>
              </td>
              <td class="text-right o_price_total">
                <span class="text-nowrap" t-field="line.price_subtotal" groups="account.group_show_line_subtotals_tax_excluded"/>
                <span class="text-nowrap" t-field="line.price_total" groups="account.group_show_line_subtotals_tax_included"/>
              </td>
            </t>
            <t t-if="line.display_type == 'line_section'">
              <td colspan="99">
                <span t-field="line.name" t-options="{'widget': 'text'}"/>
              </td>
              <t t-set="current_section" t-value="line"/>
              <t t-set="current_subtotal" t-value="0"/>
            </t>
            <t t-if="line.display_type == 'line_note'">
              <td colspan="99">
                <span t-field="line.name" t-options="{'widget': 'text'}"/>
              </td>
            </t>
          </tr>

          <t t-if="current_section and (line_last or lines[line_index+1].display_type == 'line_section')">
            <tr class="is-subtotal text-right">
              <td colspan="99">
                <strong class="mr16">Subtotal</strong>
                <span t-esc="current_subtotal" t-options="{&quot;widget&quot;: &quot;monetary&quot;, &quot;display_currency&quot;: o.currency_id}"/>
              </td>
            </tr>
          </t>

        </t>
      </t>
    </t>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.group_by_sale_order.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.group_by_sale_order.xml)

### Margin After Title  
ID: `mint_system.account.report_invoice_document.margin_after_title`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//h2" position="attributes">
    <attribute name="style" separator=";" add="margin-bottom: 1rem"/>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.margin_after_title.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.margin_after_title.xml)

### Margin Before Invoice Table  
ID: `mint_system.account.report_invoice_document.margin_before_invoice_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <table name="invoice_line_table" position="attributes">
    <attribute name="style" separator=";" add="margin-top: 1rem"/>
  </table>

</data>

```
Source: [snippets/account.report_invoice_document.margin_before_invoice_table.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.margin_before_invoice_table.xml)

### Margin Before Title  
ID: `mint_system.account.report_invoice_document.margin_before_title`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//h2" position="attributes">
    <attribute name="style" separator=";" add="margin-top: 1rem"/>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.margin_before_title.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.margin_before_title.xml)

### Modify Main Table  
ID: `mint_system.account.report_invoice_document.modify_main_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <!-- add default_code   -->
  <xpath expr="//table[@class='table table-sm o_main_table']/thead/tr/th[1]" position="before">
    <th style="text-align: right; width: 27mm; padding-right: 10px">
      <span>Part No.</span>
    </th>
  </xpath>
  <xpath expr="//table[@class='table table-sm o_main_table']/tbody/t/tr/t[1]/td[1]" position="before">
    <td style="text-align: right; padding-right: 10px">
      <span t-field="line.product_id.default_code" />
    </td>
  </xpath>

  <!-- Header desriptin -->
  <xpath expr="//table[@class='table table-sm o_main_table']/thead/tr/th[2]" position="attributes">
    <attribute name="style">width: 70mm</attribute>
  </xpath>

  <!-- add delivery date -->
  <xpath expr="//table[@class='table table-sm o_main_table']/thead/tr/th[3]" position="before">
    <th style="text-align: right; width: 27mm; padding-right: 10px">
      <span></span>
    </th>
  </xpath>
  <xpath expr="//table[@class='table table-sm o_main_table']/tbody/t/tr/t[1]/td[3]" position="before">
    <td style="text-align: right; padding-right: 10px"></td>
  </xpath>

  <xpath expr="//td[@name='account_invoice_line_name']" position="replace">
    <td>
      <span style="font-weight: bold" t-field="line.product_id.type_description" />
    </td>
  </xpath>

  <!-- add second row -->
  <xpath expr="//table[@class='table table-sm o_main_table']/tbody//tr[1]" position="after">
    <tr>
      <td style="padding-bottom :10px; padding-left:3px; line-height: 1.2"></td>
      <td style="padding:0; padding-left:3px; line-height: 1.2"></td>
      <td style="padding:0; padding-left:3px; line-height: 1.2" colspan="4">
        <span t-field="line.sale_line_ids.name" />
        <br />
        <t t-if="line.product_id.country_of_origin_id.code and line.product_id.hs_code">
          Country of origin:
          <span t-esc="line.product_id.country_of_origin_id.code" />
          / HS Code:
          <span t-esc="line.product_id.hs_code" />
          <br />
        </t>

        <t t-if="line.product_id.hs_code and not line.product_id.country_of_origin_id.code">
          HS Code:
          <span t-esc="line.product_id.hs_code" />
        </t>

        <t t-if="line.product_id.country_of_origin_id.code and not line.product_id.hs_code">
          Country of origin:
          <span t-esc="line.product_id.country_of_origin_id.code" />
        </t>
      </td>

      <td></td>
    </tr>
    <tr style="border-bottom: 1px solid rgb(220,220,220)">
      <td colspan="8"></td>
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

  <xpath expr="//table[@name='invoice_line_table']" position="after">

    <table class="table table-borderless table-sm" style="margin-top:20px; width:100%; color:black; font-family: arial; font-size:9pt; border-top-style:solid; border-bottom-style:solid; border-width:1px; border-color:black">
      <t t-if="o.note_footer != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
        <span class="note" t-field="o.note_footer" />
      </t>
      <t t-foreach="o.amount_by_group" t-as="amount_by_group">
        <tr>
          <td style="width:15.5%; text-align:left">
            <Strong>Warenwert</Strong>
          </td>
          <td style="width:23%; text-align:left">
            <span t-field="o.amount_untaxed" />
          </td>
          <td style="width:12%; text-align:left">
            <span t-esc="amount_by_group[0]" />
          </td>
          <td style="width:17%; text-align:left">
            <span t-esc="amount_by_group[3]" />
          </td>
          <td style="width:14%; text-align:right">
            <Strong>Rechnungsbetrag</Strong>
          </td>
          <td style="width:18%; text-align:right">
            <span t-field="o.amount_total" />
          </td>
        </tr>
      </t>
    </table>
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.modify_main_table.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.modify_main_table.xml)

### Net Value Summary  
ID: `mint_system.account.report_invoice_document.net_value_summary`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//div[@id='total']//table/tr[1]" position="before">

    <t t-set="net_value_of_goods" t-value="sum(o.invoice_line_ids.filtered(lambda l: l.product_id.type == 'product').mapped('price_subtotal'))" />
    <t t-set="additional_expenses" t-value="sum(o.invoice_line_ids.filtered(lambda l: l.product_id.type != 'product').mapped('price_subtotal'))" />

    <tr>
      <!-- de_CH: Nettowarenwert -->
      <td>Net Value of Goods</td>
      <td class="text-right">
        <span t-esc="net_value_of_goods" t-options="{'widget': 'monetary', 'display_currency': o.currency_id}" />
      </td>
    </tr>
    <tr>
      <!-- de_CH: Zusatzaufwendungen -->
      <td>Additional Expenses</td>
      <td class="text-right">
        <span t-esc="additional_expenses" t-options="{'widget': 'monetary', 'display_currency': o.currency_id}" />
      </td>
    </tr>
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.net_value_summary.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.net_value_summary.xml)

### Product Hs Code And Origin  
ID: `mint_system.account.report_invoice_document.product_hs_code_and_origin`  
```xml
<?xml version="1.0"?>
<!-- Show custom field country of origin and hs code -->
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//table/tbody/t[3]/tr/t[1]/td[1]/span" position="after">
    <t t-if="line.product_id.country_of_origin_id.code">
      <br/>
      Country of Origin: <span t-field="line.product_id.country_of_origin_id.code"/>
    </t>
    <t t-if="line.product_id.hs_code">
      <br/>
      HS Code: <span t-field="line.product_id.hs_code"/>
    </t>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.product_hs_code_and_origin.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.product_hs_code_and_origin.xml)

### Product Weight  
ID: `mint_system.account.report_invoice_document.product_weight`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//table/tbody/t[3]/tr/t[1]/td[1]/span" position="after">
  <t t-if="line.product_id.weight">
    <br/>
		Weight: <span t-field="line.product_id.weight"/>
		<span t-field="line.product_id.weight_uom_id.display_name"/>
  </t>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.product_weight.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.product_weight.xml)

### Remove Incoterms  
ID: `mint_system.account.report_invoice_document.remove_incoterms`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

	<xpath expr="//p[@name='payment_communication']" position="replace">
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.remove_incoterms.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.remove_incoterms.xml)

### Remove Payment Ref  
ID: `mint_system.account.report_invoice_document.remove_payment_ref`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

	<xpath expr="//p[@name='payment_communication']" position="replace">
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.remove_payment_ref.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.remove_payment_ref.xml)

### Remove Payment Term  
ID: `mint_system.account.report_invoice_document.remove_payment_term`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

	<p name="payment_term" position="replace">
  </p>

</data>

```
Source: [snippets/account.report_invoice_document.remove_payment_term.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.remove_payment_term.xml)

### Remove Summary Table  
ID: `mint_system.account.report_invoice_document.remove_summary_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

<xpath expr="//div[@class='clearfix']" position="replace">
</xpath>

</data>
```
Source: [snippets/account.report_invoice_document.remove_summary_table.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.remove_summary_table.xml)

### Remove Taxes  
ID: `mint_system.account.report_invoice_document.remove_taxes`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="60">

  <xpath expr="//th[@name='th_taxes']" position="replace"/>
  <xpath expr="//span[@id='line_tax_ids']/.." position="replace"/>

</data>

```
Source: [snippets/account.report_invoice_document.remove_taxes.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.remove_taxes.xml)

### Replace Address  
ID: `mint_system.account.report_invoice_document.replace_address`  
```xml
<?xml version="1.0"?>
<!-- Align invoice tax row right -->
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//div[@t-field='o.partner_id']" position="replace">
    <t t-if="o.partner_invoice_id.is_company == true">
      <div t-esc="o.partner_invoice_id.name"/>
      <div t-esc="o.partner_invoice_id.street"/>
      <div t-esc="o.partner_invoice_id.street2"/>
      <span t-esc="o.partner_invoice_id.zip"/>
      <span t-esc="o.partner_invoice_id.city"/>
      <t t-if="o.partner_invoice_id.country_id.code != 'CH'">
        <div t-esc="oo.partner_invoice_id.country_id.name"/>
      </t>
    </t>
    <t t-else="">
      <div t-field="o.partner_invoice_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}"/>
    </t>
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.replace_address.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.replace_address.xml)

### Replace Footer  
ID: `mint_system.account.report_invoice_document.replace_footer`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//p[@name='payment_communication']" position="replace">
  </xpath>
  
  <p t-if="o.invoice_payment_term_id" name="payment_term">
                        <span t-field="o.invoice_payment_term_id.note"/>
                    </p>

  <xpath expr="//p[@t-if='o.invoice_incoterm_id']" position="replace">
    <style>
      table#footer {
        width: 100%;
        font-size: 8pt;
      }
      table#footer tr, td {
        vertical-align: top;
      }
    </style>
    <table id='footer'>
      <tr>
        <td t-if="o.invoice_payment_term_id" name="payment_term">
          Zahlungsbedingungen: <span t-field="o.invoice_payment_term_id.note"/>
        </td>
        <td width="50%">
          Lieferung gemäss unseren allgemeinen Lieferbedingungen
        </td>
      </tr>
      <tr>
        <td >MWST-Nr: 
          <span t-field="o.company_id.vat"/>
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

  <xpath expr="//p[@name='payment_term']" position="replace">
  </xpath>


</data>
```
Source: [snippets/account.report_invoice_document.replace_footer.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.replace_footer.xml)

### Replace Information Table2  
ID: `mint_system.account.report_invoice_document.replace_information_table2`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">
  <xpath expr="//*[@id='informations']" position="replace">
    <style>
      table#informations {
        white-space: nowrap;
      }
      table#informations td:nth-child(odd) {
        text-align: left;
      }
      table#informations td:nth-child(even) {
        text-align: left;
        padding-right: 3rem;
      }
    </style>
    <table id='informations' class="table table-borderless table-sm">
      <tr>
        <td>
          <strong>Rechnungsdatum: </strong>
        </td>
        <td>
          <span t-field="o.invoice_date"/>
        </td>
        <td>
          <strong>Kontakt Rechnung: </strong>
        </td>
        <td>
          <t t-foreach="res_company.partner_id.child_ids.filtered(lambda c: c.type == 'invoice' and c.name)" t-as="delivery_partner">
            <span t-esc="delivery_partner.name" />
          </t>
        </td>
        <td>
          <strong>Zahlbar innert: </strong>
        </td>
        <td>
          <span t-field="o.invoice_payment_term_id"/>
        </td>
      </tr>
      <tr>
        <td>
          <strong>Kontakt Verkauf: </strong>
        </td>
        <td>
          <span t-field="o.invoice_user_id" />
        </td>
        <td>
          <strong>Tel. Direkt: </strong>
        </td>
        <td>
          <t t-foreach="res_company.partner_id.child_ids.filtered(lambda c: c.type == 'invoice' and c.phone)" t-as="delivery_partner">
            <span t-esc="delivery_partner.phone" />
          </t>
        </td>
        <td>
        </td>
      </tr>
      <tr>
        <td>
          <strong>Kunden-Nr.: </strong>
        </td>
        <td>
          <span t-field="o.partner_id.ref" />
        </td>
        <td>
          <strong>E-Mail:</strong>
        </td>
        <td>
          <t t-foreach="res_company.partner_id.child_ids.filtered(lambda c: c.type == 'invoice' and c.email)" t-as="delivery_partner">
            <span t-esc="delivery_partner.email" />
          </t>
        </td>
        <td>
          <!-- <strong>MWST: </strong> -->
        </td>
        <td>
          <!-- <span t-field="res_company.vat" /> -->
        </td>
      </tr>
    </table>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.replace_information_table2.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.replace_information_table2.xml)

### Replace Information Table  
ID: `mint_system.account.report_invoice_document.replace_information_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">
  <xpath expr="//*[@id='informations']" position="replace">
    <style>
      table#informations{
        white-space: nowrap;
      }
    </style>
    <table id='informations' class="table table-borderless table-sm">
      <tr>
        <td>
          <strong>Rechnungsdatum: </strong>
          <span t-field="o.invoice_date"/>
        </td>
        <td>
          <strong>Kontakt Rechnung: </strong>
          <t t-foreach="res_company.partner_id.child_ids.filtered(lambda c: c.type == 'invoice' and c.name)" t-as="delivery_partner">
            <span t-esc="delivery_partner.name" />
          </t>
        </td>
        <td>
          <strong>Zahlbar innert: </strong>
          <span t-field="o.invoice_payment_term_id"/>
        </td>
      </tr>
      <tr>
        <td>
          <strong>Kontakt Verkauf: </strong>
          <span t-field="o.invoice_user_id" />
        </td>
        <td>
          <strong>Tel. Direkt: </strong>
          <t t-foreach="res_company.partner_id.child_ids.filtered(lambda c: c.type == 'invoice' and c.phone)" t-as="delivery_partner">
            <span t-esc="delivery_partner.phone" />
          </t>
        </td>
        <td>
        </td>
      </tr>
      <tr>
        <td>
          <strong>Kunden-Nr.: </strong>
          <span t-field="o.partner_id.ref" />
        </td>
        <td>
          <strong>E-Mail:</strong>
          <t t-foreach="res_company.partner_id.child_ids.filtered(lambda c: c.type == 'invoice' and c.email)" t-as="delivery_partner">
            <span t-esc="delivery_partner.email" />
          </t>
        </td>
        <td>
          <!-- <strong>MWST: </strong>
          <span t-field="res_company.vat" /> -->
        </td>
      </tr>
    </table>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.replace_information_table.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.replace_information_table.xml)

### Replace Infotable  
ID: `mint_system.account.report_invoice_document.replace_infotable`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//div[@id='informations']" position="replace">
    <style>
    table#info {
      width: 100%;
      margin-bottom: 25px;
      font-size: 9pt;
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
        <td></td>
        <td></td>
        <td>Order No.</td>
        <td>
          <span t-field='o.invoice_origin'/>
        </td>
      </tr>
      <tr>
        <td width="17%">Invoice date</td>
        <td width="44%">
          <span t-field='o.invoice_date' t-options='{ "widget": "date" }'/>
        </td>
        <td width="14%">Our Reference</td>
        <td width="25%">
          <span t-field='o.user_id'/>
        </td>
      </tr>
      <tr>
        <td>Customer No.</td>
        <td>
          <span t-field='o.partner_id.ref'/>
        </td>
        <td>Delivery Method</td>
        <td>
          <span t-field='o.carrier_id'/>
        </td>
      </tr>
      <tr>
        <td>Order</td>
        <td>
          <span t-field='o.ref'/>
        </td>
        <td>Incoterm</td>
        <td>
          <span t-field='o.invoice_incoterm_id'/>
        </td>
      </tr>
      <tr>
        <td>Reference</td>
        <td>
           <span t-field='o.comment'/>
        </td>
        
        <td>Delivery Date</td>
        <td>
          <span t-field='o.x_date_done' t-options='{ "widget": "date" }'/>
        </td>
    
      </tr>
    </table>
  </xpath>
</data>



```
Source: [snippets/account.report_invoice_document.replace_infotable.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.replace_infotable.xml)

### Replace Product Description  
ID: `mint_system.account.report_invoice_document.replace_product_description`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

<xpath expr="//td[@name='account_invoice_line_name']" position="replace">
  <t t-if="line.product_id.type_description">
	<td>
		<span style="font-weight: bold" t-field="line.product_id.type_description"/>
	</td>
  </t>
  <t t-if="not line.product_id.type_description">
	<td>
    <span t-field="line.external_name"/>
	</td>
  </t>

</xpath>

</data>
```
Source: [snippets/account.report_invoice_document.replace_product_description.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.replace_product_description.xml)

### Replace Summary  
ID: `mint_system.account.report_invoice_document.replace_summary`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//table[@name='invoice_line_table']" position="after">

    <style>
			table.trimada_summary tr {
				border-top: solid 1px !important;
				border-bottom: solid 1px;
				page-break-inside: avoid;
			}
			table.trimada_details tr {
			  border-top: 0px !important;
			  border-bottom: 0px;
			  line-height: 0.7;
			}
			table.trimada_summary #amount_untaxed_label {
				width: 11.5%;
				text-align: left;
			}
			table.trimada_details td#amount_by_group0 {
				width: 8%;
				text-align: left;
			}
			table.trimada_details td#amount_by_group3 {
				width: 21%;
				text-align: right;
				padding-right: 10%;
			}
			table.trimada_details td#amount_by_group4 {
				width: 27%;
				text-align: right;
				padding-right: 15%;
			}
			table.trimada_summary td#amount_by_group_label {
				width: 12%;
				text-align: left;
			}
			table.trimada_summary td#amount_by_group {
				width: 17%;
				text-align: left;
			}
			table.trimada_summary #amount_total_label {
				width: 14%;
				text-align: right;
			}
			table.trimada_summary #amount_total {
				width: 18%;
				text-align: right;
			}
    </style>

    <table class="table table-borderless table-sm trimada trimada_summary">
      <td id="amount_untaxed_label">
        <Strong>Warenwert</Strong>
      </td>

      <td>
        <table class="trimada_details">
          <t t-foreach="o.amount_by_group" t-as="amount_by_group">
            <tr style="">

              <td id="amount_by_group4">
                <span>
                  <t t-esc="amount_by_group[4]"/>
                </span>
              </td>

              <t t-if="len(o.line_ids.filtered(lambda line: line.tax_line_id)) in [0, 1] and o.amount_untaxed == amount_by_group[2]">
                <td id="amount_by_group0">
                  <span class="text-nowrap" t-esc="amount_by_group[0]"/>
                </td>
                <td id="amount_by_group3" class="text-right o_price_total">
                  <span class="text-nowrap" t-esc="amount_by_group[3]"/>
                </td>
              </t>
              <t t-else="">
                <td id="amount_by_group0">
                  <span t-esc="amount_by_group[0]"/>
                </td>
                <td id="amount_by_group3" class="text-right o_price_total">
                  <span class="text-nowrap" t-esc="amount_by_group[3]"/>
                </td>
              </t>
            </tr>
          </t>

          <t t-if="print_with_payments">
            <t t-if="o.payment_state != 'invoicing_legacy'">
              <t t-set="payments_vals" t-value="o.sudo()._get_reconciled_info_JSON_values()"/>
              <t t-foreach="payments_vals" t-as="payment_vals">
                <tr>
                  <td>
                    <i class="oe_form_field text-right oe_payment_label">Paid on <t t-esc="payment_vals['date']" t-options="{&quot;widget&quot;: &quot;date&quot;}"/>
                    </i>
                  </td>
                  <td class="text-right">
                    <span t-esc="payment_vals['amount']" t-options="{&quot;widget&quot;: &quot;monetary&quot;, &quot;display_currency&quot;: o.currency_id}"/>
                  </td>
                </tr>
              </t>
              <t t-if="len(payments_vals) &gt; 0">
                <tr class="border-black">
                  <td>
                    <strong>Amount Due</strong>
                  </td>
                  <td class="text-right">
                    <span t-field="o.amount_residual"/>
                  </td>
                </tr>
              </t>
            </t>
          </t>
        </table>
      </td>

      <td id="amount_total_label">
        <strong>Total</strong>
      </td>
      <td id="amount_total">
        <span class="text-nowrap" t-field="o.amount_total"/>
      </td>

    </table>

  </xpath>

</data>


```
Source: [snippets/account.report_invoice_document.replace_summary.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.replace_summary.xml)

### Reset Address  
ID: `mint_system.account.report_invoice_document.reset_address`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//t[@t-set='address']" position="replace">
    <t t-set="address">
      <div>
        <address t-field="o.partner_invoice_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}" />
      </div>
    </t>
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.reset_address.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.reset_address.xml)

### Round Price  
ID: `mint_system.account.report_invoice_document.round_price`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//span[@t-field='line.price_unit']" position="replace">
		 <span t-esc="'%g' % line.price_unit if str(line.price_unit)[::-1].find('.') >= 3 else '{0:,.2f}'.format(float(line.price_unit)).replace(',','\'')"/>
  </xpath>
   
</data>
```
Source: [snippets/account.report_invoice_document.round_price.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.round_price.xml)

### Round Quantity  
ID: `mint_system.account.report_invoice_document.round_quantity`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//span[@t-field='line.quantity']" position="replace">
    <span t-esc="'%.2f' % line.quantity"/>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.round_quantity.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.round_quantity.xml)

### Round Total Price  
ID: `mint_system.account.report_invoice_document.round_total_price`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//span[@t-field='line.price_subtotal']" position="replace">
    <span t-esc="'{0:,.2f}'.format(float(line.price_subtotal)).replace(',','\'')"/>
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.round_total_price.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.round_total_price.xml)

### Second Row  
ID: `mint_system.account.report_invoice_document.second_row`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">
  
  <xpath expr="//tbody[hasclass('invoice_tbody')]//tr" position="attributes">
    <attribute name="class" separator=" " add="first"/>
  </xpath>

  <xpath expr="//tbody[hasclass('invoice_tbody')]//tr" position="after">
    <t t-if="line.product_id.type_description">
    <tr class="second">
      <td></td>
      <td></td>
      <td colspan="5">
        <span t-field="line.external_name"/><br/>
        <t t-if="line.product_id.country_of_origin_id.code">
          Ursprungsland:
          <span t-field="line.product_id.country_of_origin_id.code" />
        </t>
        <t t-if="line.product_id.hs_code">
          / Zollposition:
          <span t-field="line.product_id.hs_code" />
        </t>
      </td>
    </tr>
    </t>
    <t t-if="not line.product_id.type_description">
    <tr class="second">
      <td></td>
      <td></td>
      <td colspan="5">
        <t t-if="line.product_id.country_of_origin_id.code">
          Ursprungsland:
          <span t-field="line.product_id.country_of_origin_id.code" />
        </t>
        <t t-if="line.product_id.hs_code">
          / Zollposition:
          <span t-field="line.product_id.hs_code" />
        </t>
      </td>
    </tr>
    </t>
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.second_row.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.second_row.xml)

### Sequence In Table  
ID: `mint_system.account.report_invoice_document.sequence_in_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="60">

  <xpath expr="//table/thead/tr/th[1]" position="before">
    <th>
      <span>Pos</span>
    </th>
  </xpath>

  <xpath expr="//t[@t-foreach='lines']" position="before">
    <t t-set="index" t-value="1"/>
  </xpath>
  
  <xpath expr="//table/tbody//tr/t[1]/td[1]" position="before">
    <td>
      <span t-esc="index"/><t t-set="index" t-value="index+1"/>
    </td>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.sequence_in_table.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.sequence_in_table.xml)

### Set Ids  
ID: `mint_system.account.report_invoice_document.set_ids`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">
  
	<xpath expr="//th[@name='th_quantity']" position="attributes">
		<attribute name="id">th_quantity</attribute>
	</xpath>

	<xpath expr="//th[@name='th_description']" position="attributes">
		<attribute name="id">description</attribute>
	</xpath>
	<xpath expr="//table[@name='invoice_line_table']//td[2]" position="attributes">
		<attribute name="id">quantity</attribute>
	</xpath>
	<xpath expr="//table[@name='invoice_line_table']//td[2]/span[1]" position="attributes">
		<attribute name="id">qty</attribute>
	</xpath>
	
	<xpath expr="//table[@name='invoice_line_table']//td[3]/span[1]" position="attributes">
		<attribute name="id">price</attribute>
	</xpath>

</data>
```
Source: [snippets/account.report_invoice_document.set_ids.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.set_ids.xml)

### Show Default Code  
ID: `mint_system.account.report_invoice_document.show_default_code`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//table[@name='invoice_line_table']/thead/tr/th[1]" position="before">
    <th id="default_code">
      <strong >Part No.</strong>
    </th>
  </xpath>

  <xpath expr="//table[@name='invoice_line_table']/tbody/t/tr/t[1]/td[1]" position="before">
    <td id="default_code">
      <span t-field="line.product_id.default_code"/>
    </td>
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.show_default_code.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.show_default_code.xml)

### Show Product Name  
ID: `mint_system.account.report_invoice_document.show_product_name`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="60">

  <xpath expr="//td[@name='account_invoice_line_name']" position="replace">
    <td name="account_invoice_line_name">
      <t t-if="line.product_id">
        <span t-field="line.product_id.name"/>
        <br/>
      </t>
      <span class="o_italic" t-field="line.name" t-options="{'widget': 'text'}"/>
    </td>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.show_product_name.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.show_product_name.xml)

### Style Trimada  
ID: `mint_system.account.report_invoice_document.style_trimada`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="60">

	<xpath expr="//div[hasclass('page')]" position="before">
		<style>
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
			table.trimada thead th#open_quantity {
			  width: 30mm;
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
			table.trimada tbody td#open_quantity {
			  text-align: right !important;
			}
			table.trimada tbody td#quantity {
			  text-align: right;
			}			
			table.trimada tbody span#qty {
			  font-weight: bold;
			}
			table.trimada tbody span#open_qty {
			  font-weight: bold;
			}
			.address {
			  font-size: 10pt;
			  line-height: 1.2;
			  padding-bottom:33mm;
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

	<table name="invoice_line_table" position="attributes">
		<attribute name="class" separator=" " add="trimada table-borderless"/>
	</table>

	<table name="invoice_line_table" position="attributes">
		<attribute name="class" separator=" " add="trimada table-borderless"/>
	</table>

  <span id="qty" position="attributes">
		<attribute name="t-options-widget">"integer"</attribute>
	</span>
	
</data>

```
Source: [snippets/account.report_invoice_document.style_trimada.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.style_trimada.xml)

### Switch Address Block  
ID: `mint_system.account.report_invoice_document.switch_address_block`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//t[@t-set='address']" position="after">
    <t t-set="information_block">
      <address t-field="o.partner_id" t-options="{'widget': 'contact', 'fields': ['address', 'name'], 'no_marker': True}"/>
      <div t-if="o.partner_id.vat" class="mt16">
          <t t-if="o.company_id.country_id.vat_label" t-esc="o.company_id.country_id.vat_label" id="inv_tax_id_label"/>
          <t t-else="">Tax ID</t>: <span t-field="o.partner_id.vat"/></div>
    </t>
  </xpath>

  <xpath expr="//t[@t-set='address']" position="replace">
    <t t-set="address">
    </t>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.switch_address_block.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.switch_address_block.xml)

### Unit Precision  
ID: `mint_system.account.report_invoice_document.unit_precision`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//tbody[1]/t[3]/tr[1]/t[1]/td[2]/span[1]" position="attributes">
		<attribute name="t-options-widget">"integer"</attribute>
  </xpath>

</data>

```
Source: [snippets/account.report_invoice_document.unit_precision.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.unit_precision.xml)

### X Picking List  
ID: `mint_system.account.report_invoice_document.x_picking_list`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.report_invoice_document" priority="50">

  <xpath expr="//p[@t-field='o.invoice_origin']" position="attributes">
    <attribute name="t-field">o.x_picking_list</attribute>
  </xpath>

</data>
```
Source: [snippets/account.report_invoice_document.x_picking_list.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.report_invoice_document.x_picking_list.xml)

## Res Config Settings View Form  
### Domain Expense Currency Exchange Account Id  
ID: `mint_system.account.res_config_settings_view_form.domain_expense_currency_exchange_account_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.res_config_settings_view_form" priority="50">

  <field name="expense_currency_exchange_account_id" position="attributes">
    <attribute name="domain">[('internal_type', '=', 'other'), ('deprecated', '=', False)]</attribute>
  </field>

</data>

```
Source: [snippets/account.res_config_settings_view_form.domain_expense_currency_exchange_account_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.res_config_settings_view_form.domain_expense_currency_exchange_account_id.xml)

## View Account Payment Register Form  
### Show Partner Id  
ID: `mint_system.account.view_account_payment_register_form.show_partner_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_account_payment_register_form" priority="50" >

    <field name="partner_bank_id" position="before">
        <field name="partner_id"/>
    </field>

</data>
```
Source: [snippets/account.view_account_payment_register_form.show_partner_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_account_payment_register_form.show_partner_id.xml)

## View Bank Statement Form  
### Edit Balance  
ID: `mint_system.account.view_bank_statement_form.edit_balance`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_bank_statement_form" priority="50">

    <field name="balance_start" position="attributes">
        <attribute name="attrs">{'readonly': False}</attribute>
    </field>

    <field name="balance_end_real" position="attributes">
        <attribute name="attrs">{'readonly': False}</attribute>
    </field>

</data>

```
Source: [snippets/account.view_bank_statement_form.edit_balance.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_bank_statement_form.edit_balance.xml)

### Edit Transactions  
ID: `mint_system.account.view_bank_statement_form.edit_transactions`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_bank_statement_form" priority="50">

    <field name="line_ids" position="attributes">
        <attribute name="attrs">{'readonly': [('state', '=', 'confirm')]}</attribute>
    </field>

</data>

```
Source: [snippets/account.view_bank_statement_form.edit_transactions.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_bank_statement_form.edit_transactions.xml)

### Show Cashbox  
ID: `mint_system.account.view_bank_statement_form.show_cashbox`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_bank_statement_form" priority="50">

    <field name="balance_start" position="after">
        <button name="open_cashbox_id" attrs="{'invisible': [('journal_type','!=','cash')]}" string="→ Count" type="object" class="oe_link oe_inline" context="{'balance':'start'}"/>
    </field>

</data>

```
Source: [snippets/account.view_bank_statement_form.show_cashbox.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_bank_statement_form.show_cashbox.xml)

### Show Move Id  
ID: `mint_system.account.view_bank_statement_form.show_move_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_bank_statement_form" priority="50">

    <xpath expr="//page[@name='statement_line_ids']//field[@name='ref']" position="after">
        <field name="move_id" optional="hidden"/>
    </xpath>

</data>

```
Source: [snippets/account.view_bank_statement_form.show_move_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_bank_statement_form.show_move_id.xml)

### X Cashbox Start Ids  
ID: `mint_system.account.view_bank_statement_form.x_cashbox_start_ids`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_bank_statement_form" priority="50">

  <page name="statement_line_ids" position="after">
    <page string="Kassenpositionen" name="cashbox_ids" attrs="{'invisible': [('journal_type','!=','cash')]}">
      <group>
        <field name="x_cashbox_start_ids">
          <tree>
            <field name="number"/>
            <field name="coin_value"/>
            <field name="subtotal"/>
          </tree>
        </field>
      </group>
      <group>
        <field name="x_cashbox_end_ids">
          <tree>
            <field name="number"/>
            <field name="coin_value"/>
            <field name="subtotal"/>
          </tree>
        </field>
      </group>
    </page>
  </page>

</data>

```
Source: [snippets/account.view_bank_statement_form.x_cashbox_start_ids.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_bank_statement_form.x_cashbox_start_ids.xml)

## View Bank Statement Line Search  
### Filter Move Id  
ID: `mint_system.account.view_bank_statement_line_search.filter_move_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_bank_statement_line_search" priority="50">

    <xpath expr="//field[@name='payment_ref']" position="before">
        <field name="move_id"/>
    </xpath>

</data>
```
Source: [snippets/account.view_bank_statement_line_search.filter_move_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_bank_statement_line_search.filter_move_id.xml)

## View Bank Statement Line Tree  
### Enable Create  
ID: `mint_system.account.view_bank_statement_line_tree.enable_create`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_bank_statement_line_tree" priority="50">

    <tree position="attributes">
        <attribute name="create">1</attribute>
    </tree>

</data>

```
Source: [snippets/account.view_bank_statement_line_tree.enable_create.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_bank_statement_line_tree.enable_create.xml)

## View In Invoice Tree  
### Add Discount Date  
ID: `mint_system.account.view_in_invoice_tree.add_discount_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_in_invoice_tree" priority="50">

    <field name="invoice_date_due" position="after">
    <field name="discount_date" optional="hide" />
    </field>

</data>
```
Source: [snippets/account.view_in_invoice_tree.add_discount_date.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_in_invoice_tree.add_discount_date.xml)

## View Invoice Tree  
### Add Currency Id  
ID: `mint_system.account.view_invoice_tree.add_currency_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_invoice_tree" priority="50">

    <field name="ref" position="after">
        <field name="currency_id" optional="hide"/>
    </field>

</data>
```
Source: [snippets/account.view_invoice_tree.add_currency_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_invoice_tree.add_currency_id.xml)

### Show Date  
ID: `mint_system.account.view_invoice_tree.show_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_invoice_tree" priority="50">

    <xpath expr="//field[@name='invoice_date']" position="after">
        <field name="date" optional="show"/>
    </xpath>

</data>
```
Source: [snippets/account.view_invoice_tree.show_date.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_invoice_tree.show_date.xml)

### X Account Codes  
ID: `mint_system.account.view_invoice_tree.x_account_codes`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_invoice_tree" priority="50">

    <field name="ref" position="after">
        <field name="x_account_codes" optional="hide"/>
    </field>

</data>
```
Source: [snippets/account.view_invoice_tree.x_account_codes.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_invoice_tree.x_account_codes.xml)

### X Recurring Inverval  
ID: `mint_system.account.view_invoice_tree.x_recurring_inverval`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_invoice_tree" priority="50">

    <field name="invoice_date" position="after">
        <field name="x_recurring_inverval" optional="show"/>
    </field>

</data>
```
Source: [snippets/account.view_invoice_tree.x_recurring_inverval.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_invoice_tree.x_recurring_inverval.xml)

## View Move Form  
### Domain Partner Bank Ids  
ID: `mint_system.account.view_move_form.domain_partner_bank_ids`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_move_form" priority="50" >

    <xpath expr="//group[@id='header_left_group']//field[@name='partner_bank_id']" position="attributes">
        <attribute name="domain"></attribute>
    </xpath>

</data>
```
Source: [snippets/account.view_move_form.domain_partner_bank_ids.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_move_form.domain_partner_bank_ids.xml)

### Edit Invoice Date  
ID: `mint_system.account.view_move_form.edit_invoice_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_move_form" priority="50" >

    <field name="invoice_date" position="attributes">
        <attribute name="attrs">{}</attribute>
    </field>

</data>
```
Source: [snippets/account.view_move_form.edit_invoice_date.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_move_form.edit_invoice_date.xml)

### Hide Payment Reference  
ID: `mint_system.account.view_move_form.hide_payment_reference`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_move_form" priority="50">

    <xpath expr="//field[@name='payment_reference']" position="replace">
    </xpath>

</data>

```
Source: [snippets/account.view_move_form.hide_payment_reference.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_move_form.hide_payment_reference.xml)

### Hide Send Button On Refund  
ID: `mint_system.account.view_move_form.hide_send_button_on_refund`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_move_form" priority="50" >

    <xpath expr="//button[@name='action_invoice_sent'][1]" position="attributes">
        <attribute name="attrs"> {'invisible':['|', '|', ('state', '!=', 'posted'), ('is_move_sent', '=', True), ('move_type', 'not in', ('out_invoice'))]}</attribute>
    </xpath>

    <xpath expr="//button[@name='action_invoice_sent'][2]" position="attributes">
        <attribute name="attrs">{'invisible':['|', '|', ('state', '!=', 'posted'), ('is_move_sent', '=', False), ('move_type', 'not in', ('out_invoice', 'in_invoice', 'in_refund'))]}</attribute>
    </xpath>

</data>
```
Source: [snippets/account.view_move_form.hide_send_button_on_refund.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_move_form.hide_send_button_on_refund.xml)

### Payment Reference Readonly  
ID: `mint_system.account.view_move_form.payment_reference_readonly`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_move_form" priority="50">

    <xpath expr="//field[@name='payment_reference']" position="attributes">
        <attribute name="attrs">{'readonly': True}</attribute>
    </xpath>

</data>

```
Source: [snippets/account.view_move_form.payment_reference_readonly.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_move_form.payment_reference_readonly.xml)

### Remove Isr Button  
ID: `mint_system.account.view_move_form.remove_isr_button`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_move_form" priority="50" >

    <button id="l10n_ch_btn_isr_print_highlight" position="replace"/>
    <button id="btn_isr_print_normal" position="replace"/>

</data>
```
Source: [snippets/account.view_move_form.remove_isr_button.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_move_form.remove_isr_button.xml)

### Show Bank Partner Id  
ID: `mint_system.account.view_move_form.show_bank_partner_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_move_form" priority="50" >

    <field name="partner_id" position="after">
        <field name="bank_partner_id"/>
    </field>

</data>

```
Source: [snippets/account.view_move_form.show_bank_partner_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_move_form.show_bank_partner_id.xml)

### Show Commercial Partner Id  
ID: `mint_system.account.view_move_form.show_commercial_partner_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_move_form" priority="50" >

    <field name="partner_id" position="after">
        <field name="commercial_partner_id"/>
    </field>

</data>

```
Source: [snippets/account.view_move_form.show_commercial_partner_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_move_form.show_commercial_partner_id.xml)

### Show Invoice Origin  
ID: `mint_system.account.view_move_form.show_invoice_origin`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_move_form" priority="50" >

    <xpath expr="//group[@id='other_tab_group']//field[@name='ref']" position="after">
        <field name="invoice_origin" readonly="0" />
    </xpath>

</data>
```
Source: [snippets/account.view_move_form.show_invoice_origin.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_move_form.show_invoice_origin.xml)

### Show Line Partner Id  
ID: `mint_system.account.view_move_form.show_line_partner_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_move_form" priority="50" >

    <xpath expr="//field[@name='invoice_line_ids']/tree/field[@name='partner_id']" position="replace">
        <field name="partner_id" optional="hide" />
    </xpath>

    <xpath expr="//field[@name='line_ids']/tree/field[@name='partner_id']" position="replace">
        <field name="partner_id" domain="['|', ('parent_id', '=', False), ('is_company', '=', True)]"/>
    </xpath>

</data>
```
Source: [snippets/account.view_move_form.show_line_partner_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_move_form.show_line_partner_id.xml)

### Show Posted Before  
ID: `mint_system.account.view_move_form.show_posted_before`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_move_form" priority="50" >

    <field name="to_check" position="after">
        <field name="posted_before" />
    </field>

</data>
```
Source: [snippets/account.view_move_form.show_posted_before.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_move_form.show_posted_before.xml)

### Show Sale Order Lines  
ID: `mint_system.account.view_move_form.show_sale_order_lines`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_move_form" priority="50" >

    <field name="product_id" position="before">
        <field name="sale_line_ids" widget="many2many_tags" optional="hide"/>
    </field>

</data>
```
Source: [snippets/account.view_move_form.show_sale_order_lines.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_move_form.show_sale_order_lines.xml)

### Show User Id  
ID: `mint_system.account.view_move_form.show_user_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_move_form" priority="50" >

    <field name="invoice_user_id" position="after">
        <field name="user_id"/>
    </field>

</data>
```
Source: [snippets/account.view_move_form.show_user_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_move_form.show_user_id.xml)

### X Duplicate Found  
ID: `mint_system.account.view_move_form.x_duplicate_found`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_move_form" priority="50" >

    <header position="after">
        <field name="x_duplicate_found" invisible="1"/>
        <div groups="account.group_account_invoice" class="alert alert-warning" role="alert" style="margin-bottom:0px;" attrs="{'invisible': [('x_duplicate_found', '=', False)]}">
            Es existiert eine bestehende Rechnung mit dem gleichen Partner und Total. Stellen sicher, dass diese Rechnung kein Duplikat ist. 
            <!-- A duplicate invoice with the same partner and total exists. Make sure this invoice is not a duplicate before posting. -->
        </div>
    </header>

</data>
```
Source: [snippets/account.view_move_form.x_duplicate_found.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_move_form.x_duplicate_found.xml)

### X Recurring Inverval  
ID: `mint_system.account.view_move_form.x_recurring_inverval`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_move_form" priority="50" >

    <field name="invoice_date" position="after">
        <field name="x_recurring_inverval" />
    </field>

</data>
```
Source: [snippets/account.view_move_form.x_recurring_inverval.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_move_form.x_recurring_inverval.xml)

### X Sale Order Id  
ID: `mint_system.account.view_move_form.x_sale_order_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_move_form" priority="50" >

    <field name="product_id" position="before">
        <field name="x_sale_order_id" widget="many2one" optional="hide"/>
    </field>

</data>
```
Source: [snippets/account.view_move_form.x_sale_order_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_move_form.x_sale_order_id.xml)

## View Move Line Tax Audit Tree  
### Show Balance  
ID: `mint_system.account.view_move_line_tax_audit_tree.show_balance`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_move_line_tax_audit_tree" priority="50">

    <field name="amount_currency" position="after">
        <field name="balance" optional="hide" sum="Saldo" />
    </field>
    
</data>
```
Source: [snippets/account.view_move_line_tax_audit_tree.show_balance.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_move_line_tax_audit_tree.show_balance.xml)

### Sum Currency  
ID: `mint_system.account.view_move_line_tax_audit_tree.sum_currency`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_move_line_tax_audit_tree" priority="50" >

    <field name="amount_currency" position="attributes">
        <attribute name="sum">Amount Currency</attribute>
    </field>

</data>
```
Source: [snippets/account.view_move_line_tax_audit_tree.sum_currency.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_move_line_tax_audit_tree.sum_currency.xml)

## View Move Line Tree Grouped General  
### Amount Currency Optional  
ID: `mint_system.account.view_move_line_tree_grouped_general.amount_currency_optional`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_move_line_tree_grouped_general" priority="50">

  <field name="amount_currency" position="attributes">
    <attribute name="optional">hide</attribute>
  </field>

</data>

```
Source: [snippets/account.view_move_line_tree_grouped_general.amount_currency_optional.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_move_line_tree_grouped_general.amount_currency_optional.xml)

## View Move Tree  
### X Account Codes  
ID: `mint_system.account.view_move_tree.x_account_codes`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_move_tree" priority="50">

    <field name="ref" position="after">
        <field name="x_account_codes" optional="hide"/>
    </field>

</data>
```
Source: [snippets/account.view_move_tree.x_account_codes.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_move_tree.x_account_codes.xml)

## View Out Invoice Tree  
### Show Partner Shipping  
ID: `mint_system.account.view_out_invoice_tree.show_partner_shipping`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_out_invoice_tree" priority="50">

  <field name="invoice_date" position="before">
    <field name="partner_shipping_id" optional="hide"/>
  </field>

</data>

```
Source: [snippets/account.view_out_invoice_tree.show_partner_shipping.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_out_invoice_tree.show_partner_shipping.xml)

## View Partner Property Form  
### Show Commercial Partner Id  
ID: `mint_system.account.view_partner_property_form.show_commercial_partner_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="account.view_partner_property_form" priority="50" >

    <xpath expr="//page[@name='accounting']/group[1]" position="before">
        <field name="commercial_partner_id"/>
    </xpath>

</data>
```
Source: [snippets/account.view_partner_property_form.show_commercial_partner_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account.view_partner_property_form.show_commercial_partner_id.xml)

