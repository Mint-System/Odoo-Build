---
prev: ./snippets.md
---
# Purchase Requisition
## Product Supplierinfo Tree View Inherit  
### Purchase Requisition Id Readonly False  
ID: `mint_system.purchase_requisition.product_supplierinfo_tree_view_inherit.purchase_requisition_id_readonly_false`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.product_supplierinfo_tree_view_inherit" priority="50">

  <xpath expr="//field[@name='purchase_requisition_id']" position="attributes">
    <attribute name="readonly">0</attribute>
  </xpath>

</data>
```
Source: [snippets/purchase_requisition.product_supplierinfo_tree_view_inherit.purchase_requisition_id_readonly_false.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.product_supplierinfo_tree_view_inherit.purchase_requisition_id_readonly_false.xml)

## Report Purchaserequisitions  
### Add Address Block  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.add_address_block`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

  <xpath expr="//t/div/div[1]" position="after">
    <div class="row address">
      <div class="col-5"/>
      <div class="col-5 offset-2" id="address_right">
        <div t-field="o.vendor_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}"/>
      </div>
    </div>
  </xpath>

</data>

```
Source: [snippets/purchase_requisition.report_purchaserequisitions.add_address_block.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.add_address_block.xml)

### Add Description  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.add_description`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

<xpath expr="//div/t[2]" position="after">
  <div style="font-size:16px; margin-top: 4rem">
    <p t-field="o.description"/>
  </div>
</xpath>
  
</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.add_description.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.add_description.xml)

### Add Drawing  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.add_drawing`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">
  
<xpath expr="//span[@t-field='line_ids.product_id.name']" position="after">
  <br/>
  <span>Drawing: </span>
    <a t-attf-href="{{line_ids.product_id.drawing_file.url}}">
    <span t-field="line_ids.product_id.drawing_file.display_name"/>
    </a>
</xpath>
</data>

```
Source: [snippets/purchase_requisition.report_purchaserequisitions.add_drawing.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.add_drawing.xml)

### Add Footer  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.add_footer`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

  <xpath expr="//table[@id='main_table']" position="after">

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
        <td width="50%" t-if="o.payment_term_id.note">Zahlungsbedingungen 
          <span t-field="o.payment_term_id.note"/>
        </td>
        <td width="50%">
          Lieferung gemäss unseren allgemeinen Einkaufsbedingungen
        </td>
      </tr>
      <tr>
        <td >MWST-Nr: 
          <span t-field="o.company_id.vat"/>
        </td>
      </tr>
    </table>
  </xpath>

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.add_footer.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.add_footer.xml)

### Add Header And Footer Note  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.add_header_and_footer_note`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">
 
  <xpath expr="//table[@id='info']" position="after">
    <t t-if="o.note_header != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
      <span class="note" t-field="o.note_header"/>
    </t>
  </xpath>

  <xpath expr="//table[@id='main_table']" position="after">
    <t t-if="o.note_footer != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
      <span class="note" t-field="o.note_footer"/>
    </t>
  </xpath>

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.add_header_and_footer_note.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.add_header_and_footer_note.xml)

### Add Incoterm Id  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.add_incoterm_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

    <xpath expr="//div/span[@t-field='o.ordering_date']/.." position="after">
        <div class="col-3">
            <strong>Incoterm:</strong>
            <br/>
            <span t-field="o.incoterm_id"/>
        </div>
    </xpath>

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.add_incoterm_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.add_incoterm_id.xml)

### Add Infotable  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.add_infotable`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

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
    <table id='info'>
      <tr>
        <td width="17%">Date</td>
        <td width="44%">
          <span t-field='o.ordering_date' t-options='{ "widget": "date" }'/>
        </td>
        <td width="14%"></td>
        <td width="25%"></td>
      </tr>
      <tr>
        <td>Customer No.</td>
        <td>
          <span t-field='o.vendor_id.ref'/>
        </td>
        <td>Our Reference</td>
        <td>
          <span t-field='o.user_id'/>
        </td>
      </tr>
      <tr>
        <td>Order</td>
        <td>
          <span t-field='o.partner_ref'/>
        </td>
        <td>Delivery Method</td>
        <td>
         
        </td>
      </tr>
      <tr>
        <td>Reference</td>
        <td>
          <span t-field='o.comment'/>
        </td>
        <td>Incoterm</td>
        <td>
          <span t-field='o.incoterm_id'/>
        </td>
      </tr>
    </table>

  </xpath>

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.add_infotable.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.add_infotable.xml)

### Add Price Unit  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.add_price_unit`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

  <xpath expr="//th[@id='product_qty']" position="after">
    <th id="price_unit" class="text-right">
      <strong>Unit Price</strong>
    </th>
  </xpath>
  
  <xpath expr="//td[@id='product_qty']" position="after">
    <td id="price_unit" class="text-right">
       <span t-field="line_ids.price_unit"/>
    </td>
  </xpath>
  
</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.add_price_unit.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.add_price_unit.xml)

### Add Product Uom Id  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.add_product_uom_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

  <xpath expr="//span[@id='product_qty']" position="after">
    <span id="product_uom_id" t-field="line_ids.product_uom_id"/>
  </xpath>

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.add_product_uom_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.add_product_uom_id.xml)

### Address Block  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.address_block`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

  <xpath expr="//t/div/div[1]" position="before">
    <t t-set="o" t-value="o.with_context(lang=o.vendor_id.lang)"/>
        <t t-set="address">
            <div t-field="o.vendor_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}"/>
        </t>
  </xpath>
  
</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.address_block.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.address_block.xml)

### Add User Id  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.add_user_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

  <xpath expr="//div/span[@t-field='o.incoterm_id']/.." position="after">
    <div class="col-3">
      <strong>Responsible:</strong>
      <br/>
      <span t-field="o.user_id"/>
    </div>
  </xpath>

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.add_user_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.add_user_id.xml)

### Format Product Qty  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.format_product_qty`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

  <xpath expr="//td[@id='product_qty']" position="replace">
    <td id="product_qty" class="text-right">
      <span id="qty" t-field="line_ids.product_qty"/>
      <span t-field="line_ids.product_uom_id"/>
   </td>
  </xpath>

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.format_product_qty.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.format_product_qty.xml)

### Format Qty With Decimal  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.format_qty_with_decimal`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

    <xpath expr="//span[@id='qty']" position="replace">
        <t t-if="line_ids.product_uom_id.id == 1">
            <span id="qty" t-field="line_ids.product_qty" t-options="{'widget': 'integer'}"/>
        </t>
        <t t-else="">
            <span id="qty" t-field="line_ids.product_qty"/>
        </t>
    </xpath>

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.format_qty_with_decimal.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.format_qty_with_decimal.xml)

### Hide Details  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.hide_details`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

<!--
<xpath expr="//div/t[2]" position="replace">  
</xpath>
-->

  <xpath expr="//table[@id='details']" position="replace"/>
  
</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.hide_details.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.hide_details.xml)

### Hide Origin  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.hide_origin`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

<xpath expr="//div/span[@t-field='o.origin']/.." position="replace">  
</xpath>
  
</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.hide_origin.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.hide_origin.xml)

### Hide Product Uom  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.hide_product_uom`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

  <xpath expr="//th[@id='product_uom']" position="replace"/>
  <xpath expr="//td[@id='product_uom']" position="replace"/>

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.hide_product_uom.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.hide_product_uom.xml)

### Hide Title Product  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.hide_title_product`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

<!--
<xpath expr="//h3" position="replace">  
</xpath>
-->

 <xpath expr="//h3[@id='title_product']" position="replace"/> 

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.hide_title_product.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.hide_title_product.xml)

### Hide Type Id  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.hide_type_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

<xpath expr="//div/span[@t-esc='o.type_id.name']/.." position="replace">  
</xpath>
  
</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.hide_type_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.hide_type_id.xml)

### Relocate Schedule Date  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.relocate_schedule_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

  <xpath expr="//th[@id='schedule_date']" position="replace"/>
  <xpath expr="//td[@id='schedule_date']" position="replace"/>
  
  <xpath expr="//th[@id='name']" position="after">
    <th class="text-right"><strong>Scheduled Date</strong></th>
  </xpath>
  <xpath expr="//td[@id='name']" position="after">
    <td class="text-right">
      <span t-field="line_ids.schedule_date"/>
    </td>
  </xpath>

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.relocate_schedule_date.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.relocate_schedule_date.xml)

### Remove Informations  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.remove_informations`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

 <xpath expr="//div[@id='informations']" position="replace"/>
    
</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.remove_informations.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.remove_informations.xml)

### Replace Name With Partner Ref  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.replace_name_with_partner_ref`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

<xpath expr="//div/span[@t-field='o.name']/.." position="replace">
  <div class="col-3">
      <strong>Your reference:</strong><br/>
      <span t-field="o.partner_ref"/>
  </div>
</xpath>
  
</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.replace_name_with_partner_ref.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.replace_name_with_partner_ref.xml)

### Replace Product Description  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.replace_product_description`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

  <xpath expr="//td[@id='name']" position="replace">
    <td id="name" >
      <t t-if="o.product_id.type_description">
        <span style="font-weight: bold" t-field="o.product_id.type_description"/>
      </t>
      <t t-if="not o.product_id.type_description">
        <span t-field="o.product_id.name"/>
      </t>
    </td>
  </xpath>

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.replace_product_description.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.replace_product_description.xml)

### Replace Product Uom Id With Schedule Date  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.replace_product_uom_id_with_schedule_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

<xpath expr="//thead/tr/th[4]" position="replace">
  <th class="text-right"><strong>Scheduled Date</strong></th>
</xpath>

<xpath expr="//span[@t-field='line_ids.product_uom_id.category_id.name']/.." position="replace">
  <td class="text-right">
      <span t-field="line_ids.schedule_date"/>
  </td>
</xpath>
  
</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.replace_product_uom_id_with_schedule_date.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.replace_product_uom_id_with_schedule_date.xml)

### Replace Schedule Date With Price Unit  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.replace_schedule_date_with_price_unit`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

<xpath expr="//thead/tr/th[5]" position="replace">
  <th class="text-right"><strong>Unit Price</strong></th>
</xpath>

<xpath expr="//span[@t-field='line_ids.schedule_date']/.." position="replace">
  <td class="text-right">
      <span t-field="line_ids.price_unit"/> <span t-field="o.currency_id"/>      
  </td>
</xpath>
  
</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.replace_schedule_date_with_price_unit.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.replace_schedule_date_with_price_unit.xml)

### Replace Title  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.replace_title`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

  <xpath expr="//h2" position="replace">
    <t t-if="state_blanket_order == draft">
      <h2>Request for Quotation purchase contract <span t-field="o.name"/></h2>
    </t>
    <t t-else="">
			<h2>Purchase contract <span t-field="o.name"/></h2>
		</t>
  </xpath>  

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.replace_title.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.replace_title.xml)

### Round Price  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.round_price`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

<xpath expr="//td[@id='price_unit']" position="replace">
		 <td id="price_unit" class="text-right">
		 <span t-esc="'%g' % line_ids.price_unit if str(line_ids.price_unit)[::-1].find('.') >= 3 else '%.2f' % line_ids.price_unit"/>
		 </td>
  </xpath>

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.round_price.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.round_price.xml)

### Second Row  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.second_row`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

  <xpath expr="//tr[@id='first']" position="attributes">
    <attribute name="t-att-class">"first"</attribute>
  </xpath>

  <xpath expr="//tr[@id='first']" position="after">
    <t t-if="o.product_id.type_description">
    <tr class="second">
      <td></td>
      <td colspan="5">
        <span t-field="o.product_id.name"/><br/>
        <t t-if="o.product_id.country_of_origin_id.code">
          Ursprungsland:
          <span t-field="o.product_id.country_of_origin_id.code" />
        </t>
        <t t-if="o.product_id.hs_code">
          / Zollposition:
          <span t-field="o.product_id.hs_code" />
        </t>
      </td>
    </tr>
    </t>
    <t t-if="not o.product_id.type_description">
    <tr class="second">
      <td></td>
      <td colspan="5">
        <t t-if="o.product_id.country_of_origin_id.code">
          Ursprungsland:
          <span t-field="o.product_id.country_of_origin_id.code" />
        </t>
        <t t-if="o.product_id.hs_code">
          / Zollposition:
          <span t-field="o.product_id.hs_code" />
        </t>
      </td>
    </tr>
    </t>
  </xpath>

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.second_row.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.second_row.xml)

### Sequence In Table  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.sequence_in_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

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
      <span t-esc="index"/><t t-set="index" t-value="index+1"/>
    </td>
  </xpath>

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.sequence_in_table.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.sequence_in_table.xml)

### Set Ids  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.set_ids`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

	<xpath expr="//span[@t-field='line_ids.product_qty']" position="attributes">
		<attribute name="id">product_qty</attribute>
	</xpath>

	<xpath expr="//span[@t-field='o.ordering_date']/../.." position="attributes">
		<attribute name="id">informations</attribute>
	</xpath>
	
	<xpath expr="//t[1]/table" position="attributes">
		<attribute name="id">main_table</attribute>
	</xpath>
	
	<xpath expr="//t[2]" position="attributes">
		<attribute name="id">details</attribute>
	</xpath>
	
	<xpath expr="//t[1]/h3" position="attributes">
		<attribute name="id">title_product</attribute>
	</xpath>
	
	<xpath expr="//t[1]/table/tbody/tr/td[1]" position="attributes">
		<attribute name="id">name</attribute>
	</xpath>
	
	<xpath expr="//t[1]/table/tbody/tr" position="attributes">
		<attribute name="id">first</attribute>
	</xpath>
	
	<xpath expr="//t[1]/table/thead/tr/th[1]" position="attributes">
		<attribute name="id">name</attribute>
	</xpath>
	
	<xpath expr="//t[1]/table/thead/tr/th[2]" position="attributes">
		<attribute name="id">product_qty</attribute>
	</xpath>
	
	<xpath expr="//t[1]/table/tbody/tr/td[2]" position="attributes">
		<attribute name="id">product_qty</attribute>
	</xpath>
		
	<xpath expr="//t[1]/table/thead/tr/th[3]" position="attributes">
		<attribute name="id">product_uom</attribute>
	</xpath>

	<xpath expr="//t[1]/table/tbody/tr/t/td" position="attributes">
		<attribute name="id">product_uom</attribute>
	</xpath>
	
	<xpath expr="//t[1]/table/thead/tr/th[4]" position="attributes">
		<attribute name="id">schedule_date</attribute>
	</xpath>
	
	<xpath expr="//t[1]/table/tbody/tr/td[3]" position="attributes">
		<attribute name="id">schedule_date</attribute>
	</xpath>

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.set_ids.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.set_ids.xml)

### Show Default Code  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.show_default_code`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

  <xpath expr="//table[@id='main_table']/thead/tr/th[1]" position="before">
    <th id="default_code">
      <strong >Part No.</strong>
    </th>
  </xpath>

  <xpath expr="//table[@id='main_table']/tbody/tr/td[1]" position="before">
    <td id="default_code">
      <span t-field="line_ids.product_id.default_code"/>
    </td>
  </xpath>

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.show_default_code.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.show_default_code.xml)

### Style Gelso  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.style_gelso`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="60">

	<xpath expr="//div[hasclass('page')]" position="before">
		<style>
			.o_company_1_layout {
				font-family: Arial;
				color: #000000;
			}
			h2 {
       			margin-top:10mm;
       			margin-bottom:3mm;
			}
			div#address_right {
				font-size: 9pt;
      }
	
		</style>
	</xpath>

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.style_gelso.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.style_gelso.xml)

### Style Trimada  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.style_trimada`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="60">

	<xpath expr="//div[hasclass('page')]" position="before">
		<style>
			.o_company_1_layout {
				font-family: Arial;
				font-size: 9pt;
			}
			.address {
       		padding-bottom:33mm;
			}
			h2 {
       			margin-top:10mm;
       			margin-bottom:3mm;
       			font-size: 13pt;
				font-weight: bold;
			}
			.first td {
				padding-bottom: 0;
			}
			.second td {
				padding-top: 0;
			}
			.second {
				border-bottom: 1px solid rgb(220,220,220);
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
			span#qty {
			  font-weight: bold;
			}
	
		</style>
	</xpath>
	
	<xpath expr="//table[@id='main_table']" position="attributes">
		<attribute name="class" separator=" " add="trimada table-borderless"/>
	</xpath>

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.style_trimada.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.style_trimada.xml)

## View Purchase Requisition Form  
### Filter Customer Is Company  
ID: `mint_system.purchase_requisition.view_purchase_requisition_form.filter_customer_is_company`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.view_purchase_requisition_form" priority="50">

  <xpath expr="//field[@name='vendor_id']" position="replace">
    <field name="vendor_id" domain="[('is_company', '=', True)]" context="{'res_partner_search_mode': 'supplier', 'default_is_company': 'True'}" attrs="{'required': [('is_quantity_copy', '=', 'none')], 'readonly': [('state', 'in', ['ongoing','done'])]}"/>
  </xpath>

</data>

```
Source: [snippets/purchase_requisition.view_purchase_requisition_form.filter_customer_is_company.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.view_purchase_requisition_form.filter_customer_is_company.xml)

### Hide Schedule Date  
ID: `mint_system.purchase_requisition.view_purchase_requisition_form.hide_schedule_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.view_purchase_requisition_form" priority="50">

  <xpath expr="//group/group//field[@name='schedule_date']" position="attributes">
    <attribute name="invisible">1</attribute>
  </xpath>

</data>
```
Source: [snippets/purchase_requisition.view_purchase_requisition_form.hide_schedule_date.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.view_purchase_requisition_form.hide_schedule_date.xml)

### Modify Attributes Origin  
ID: `mint_system.purchase_requisition.view_purchase_requisition_form.modify_attributes_origin`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.view_purchase_requisition_form" priority="50">

  <xpath expr="//field[@name='origin']" position="attributes">
      <attribute name="attrs">{'readonly': [('state', '=', 'cancel')]}</attribute>
  </xpath>

</data>
```
Source: [snippets/purchase_requisition.view_purchase_requisition_form.modify_attributes_origin.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.view_purchase_requisition_form.modify_attributes_origin.xml)

### Modify Attributes Type Id  
ID: `mint_system.purchase_requisition.view_purchase_requisition_form.modify_attributes_type_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.view_purchase_requisition_form" priority="50">

  <xpath expr="//field[@name='type_id']" position="attributes">
      <attribute name="attrs">{'readonly': 1}</attribute>
  </xpath>

</data>
```
Source: [snippets/purchase_requisition.view_purchase_requisition_form.modify_attributes_type_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.view_purchase_requisition_form.modify_attributes_type_id.xml)

### Show Schedule Date In Notebook  
ID: `mint_system.purchase_requisition.view_purchase_requisition_form.show_schedule_date_in_notebook`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.view_purchase_requisition_form" priority="50">

  <xpath expr="//notebook//tree/field[@name='schedule_date']"  position="attributes">
    <attribute name="groups"></attribute>
  </xpath>

</data>

```
Source: [snippets/purchase_requisition.view_purchase_requisition_form.show_schedule_date_in_notebook.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.view_purchase_requisition_form.show_schedule_date_in_notebook.xml)

