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

  <xpath expr="//t/div/div[1]" position="before">
    <t t-set="o" t-value="o.with_context(lang=o.vendor_id.lang)"/>
    <t t-set="address">
      <t t-if="o.partner_order_id">
        <div id="address" t-field="o.partner_order_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}"/>
      </t>
      <t t-else="">
        <div id="address" t-field="o.vendor_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}"/>
      </t>
    </t>
  </xpath>

</data>

<!--
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

  <xpath expr="//t/div/div[1]" position="before">
    <div class="container">
      <div class="row">
        <div id="address" class="col-5 offset-7" t-field="o.vendor_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}"/>
      </div>
    </div>
  </xpath>

</data>
-->
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.add_address_block.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.add_address_block.xml)

### Add Description  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.add_description`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

  <xpath expr="//div/t[2]" position="after">
    <div id="description">
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
        <td width="40%">
          <span t-field='o.ordering_date' t-options='{ "widget": "date" }'/>
        </td>
        <td width="18%">Our Reference</td>
        <td width="25%">
          <span t-field='o.user_id'/>
        </td>
      </tr>
      <tr>
        <td>Customer No.</td>
        <td>
          <span t-field='o.vendor_id.ref'/>
        </td>
        <td>Incoterm</td>
        <td>
          <span t-field='o.incoterm_id'/>
        </td>
      </tr>
      <tr>
        <td></td>
        <td>
          <span t-field='o.partner_ref'/>
        </td>
        <td>Agreement Deadline</td>
        <td>
          <span t-field='o.date_end' t-options='{ "widget": "date" }'/>
        </td>
      </tr>
      <tr>
        <td>Reference</td>
        <td>
          <span t-field='o.comment'/>
        </td>
        <td></td>
        <td></td>
      </tr>
    </table>

  </xpath>

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.add_infotable.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.add_infotable.xml)

### Add Price Subtotal  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.add_price_subtotal`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

  <xpath expr="//th[@id='price_unit']" position="after">
    <th id="price_subtotal" class="text-right">
      <strong>Price Subtotal</strong>
    </th>
  </xpath>
  
  <xpath expr="//td[@id='price_unit']" position="after">
    <td id="price_subtotal" class="text-right">
       <span t-field="line_ids.price_subtotal"/>
    </td>
  </xpath>
  
</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.add_price_subtotal.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.add_price_subtotal.xml)

### Add Price Unit  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.add_price_unit`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

  <xpath expr="//th[@id='product_qty']" position="after">
    <t t-if="o.state_blanket_order != 'draft'">
      <th id="price_unit" class="text-right">     
        <strong>Unit Price</strong>
      </th>
    </t>
  </xpath>

  <xpath expr="//td[@id='product_qty']" position="after">
    <t t-if="o.state_blanket_order != 'draft'">
      <td id="price_unit" class="text-right">
        <span t-field="line_ids.price_unit"/>
      </td>
    </t>
  </xpath>

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.add_price_unit.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.add_price_unit.xml)

### Add Product Description Variants  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.add_product_description_variants`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

  <xpath expr="//tbody//span[@t-field='line_ids.product_id.name']" position="after">
    <t t-if="line_ids.product_description_variants">
    <br/>
    <span t-field="line_ids.product_description_variants"/>
    </t>
  </xpath>

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.add_product_description_variants.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.add_product_description_variants.xml)

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

### Add Summary  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.add_summary`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

  <xpath expr="//table[@id='main_table']" position="after">

    <table id="summary" class="table table-condensed trimada table-borderless" style="margin-top:20px; width:100%; color:black; font-family: arial; font-size:9pt; border-top-style:solid; border-bottom-style:solid; border-width:1px; border-color:black">
      <tr>
        <td style="width:15.5%; text-align:left">
          <strong>Subtotal</strong>
        </td>
        <td style="width:23%; text-align:left">
          <t t-if="o.state_blanket_order != 'draft'">
            <span t-field="o.amount_untaxed" t-options="{&quot;widget&quot;: &quot;monetary&quot;, &quot;display_currency&quot;: o.currency_id}"/>
          </t>
          <t t-else="">
            <span>CHF</span>
          </t>
        </td>
        <td style="width:12%; text-align:left">
          <t t-if="o.state_blanket_order != 'draft'">
            <span>VAT</span>
          </t>
        </td>
        <td style="width:17%; text-align:left">
          <t t-if="o.state_blanket_order != 'draft'">
            <span t-field="o.amount_tax" t-options="{&quot;widget&quot;: &quot;monetary&quot;, &quot;display_currency&quot;: o.currency_id}"/>
          </t>
        </td>
        <td style="width:14%; text-align:right">
          <strong>Total</strong>
        </td>
        <td style="width:18%; text-align:right">
          <t t-if="o.state_blanket_order != 'draft'">
            <span t-field="o.amount_total" t-options="{&quot;widget&quot;: &quot;monetary&quot;, &quot;display_currency&quot;: o.currency_id}"/>
          </t>
          <t t-else="">
            <span>CHF</span>
          </t>
        </td>
      </tr>
    </table>

  </xpath>

</data> 
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.add_summary.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.add_summary.xml)

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

    <xpath expr="//span[@id='product_qty']" position="replace">
        <t t-if="line_ids.product_uom_id.id == 1">
            <span id="product_qty" t-field="line_ids.product_qty" t-options="{'widget': 'integer'}"/>
        </t>
        <t t-else="">
            <span id="product_qty" t-field="line_ids.product_qty"/>
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

### Hide Schedule Date  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.hide_schedule_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

  <xpath expr="//th[@id='schedule_date']" position="replace"/>
  <xpath expr="//td[@id='schedule_date']" position="replace"/>
  
</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.hide_schedule_date.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.hide_schedule_date.xml)

### Hide Title Details  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.hide_title_details`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

 <xpath expr="//h3[@id='title_details']" position="replace"/> 

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.hide_title_details.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.hide_title_details.xml)

### Hide Title Product  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.hide_title_product`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

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
    <t t-if="o.state_blanket_order == 'draft'">
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

  <xpath expr="//table[@id='main_table']/tbody[1]/tr[1]" position="attributes">
    <attribute name="t-att-class">"first"</attribute>
  </xpath>

  <xpath expr="//table[@id='main_table']/tbody[1]/tr[1]/td[3]" position="after">
    <t t-if="line_ids.product_id.type_description">
      <tr class="second">
        <td></td>
        <td colspan="5">
          <span t-field="line_ids.product_description_variants"/>
          <br/>
          <t t-if="line_ids.product_id.country_of_origin_id.code">
          Ursprungsland:
            <span t-field="line_ids.product_id.country_of_origin_id.code" />
          </t>
          <t t-if="line_ids.product_id.hs_code">
          / Zollposition:
            <span t-field="line_ids.product_id.hs_code" />
          </t>
        </td>
      </tr>
    </t>
    <t t-if="not line_ids.product_id.type_description">
      <tr class="second">
        <td></td>
        <td colspan="5">
          <t t-if="line_ids.product_id.country_of_origin_id.code">
          Ursprungsland:
            <span t-field="line_ids.product_id.country_of_origin_id.code" />
          </t>
          <t t-if="line_ids.product_id.hs_code">
          / Zollposition:
            <span t-field="line_ids.product_id.hs_code" />
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

<!--
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

	<xpath expr="//t[1]/h3" position="attributes">
		<attribute name="id">title_product</attribute>
	</xpath>

	<xpath expr="//t[2]/h3" position="attributes">
		<attribute name="id">title_details</attribute>
	</xpath>
	
	<xpath expr="//span[@t-field='line_ids.product_qty']" position="attributes">
		<attribute name="id">product_qty</attribute>
	</xpath>
	
	<xpath expr="//t[2]/table" position="attributes">
		<attribute name="id">details</attribute>
	</xpath>

</data>
-->
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
				font-family: Roboto;
				color: #000000;
			}
			.o_report_layout_boxed {
        		color: #495057;
			}
			.o_report_layout_boxed h2 {
       			color: #000000;
			}
			.o_report_layout_boxed strong {
       			color: #000000;
			}
			.col-3 {
			  	margin-bottom: 1rem !important;
			}
			div#address {
				font-size: 16px;
				margin-bottom: 2rem;
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
			table#summary td {
			  padding: 0.3rem;
			}
	
		</style>
	</xpath>
	
	<xpath expr="//table[@id='main_table']" position="attributes">
		<attribute name="class" separator=" " add="trimada table-borderless"/>
	</xpath>

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.style_trimada.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.style_trimada.xml)

## View Purchase Requisition Filter  
### Replace Filter  
ID: `mint_system.purchase_requisition.view_purchase_requisition_filter.replace_filter`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.view_purchase_requisition_filter" priority="50">

  <xpath expr="/search" position="replace">
    <search>

      <!-- Filter -->
      <filter name="my_orders" string="Meine Aufträge" domain="[('user_id', '=', uid)]"/>
      <filter string="Meine Aufträge in Arbeit" name="in_progress" domain="['&amp;',('user_id', '=', uid),('state', 'in', ('draft','sent', 'open', 'expired'))]"/>
      <separator/>
      <filter string="Entwurf" name="filter_state_draft" domain="[('state', '=', 'draft')]"/>
      <filter string="Gesendet" name="filter_state_sent" domain="[('state', '=', 'sent')]"/>
      <filter string="Offen" name="filter_state_open" domain="[('state', '=', 'open')]"/>
      <filter string="Erledigt" name="filter_state_erledigt" domain="[('state', '=', 'done')]"/>
      <filter string="Abgelaufen" name="filter_state_expired" domain="[('state', '=', 'expired')]"/>
      <filter string="Abgebrochen" name="filter_state_cancel" domain="[('state', '=', 'cancel')]"/>
      <separator/>
      <filter string="Auftragsdatum" name="filter_ordering_date" date="ordering_date"/>

      <!-- Gruppierung -->
      <filter string="Einkaufsbeauftragter" name="user_id" domain="[]" context="{'group_by': 'user_id'}"/>
      <filter string="Lieferant" name="vendor_id" domain="[]" context="{'group_by': 'vendor_id'}"/>
      <filter string="Datum" name="ordering_date" domain="[]" context="{'group_by': 'ordering_date'}"/>
      <filter string="Status" name="state" domain="[]" context="{'group_by': 'state'}"/>

      <!-- Suche -->
      <group>
        <field name="name" string="Order" filter_domain="['|', '|', ('name', 'ilike', self), ('partner_ref', 'ilike', self), ('vendor_id', 'child_of', self)]"/>
        <field name="vendor_id"/>
        <field name="user_id"/>
        <field name="product_id" filter_domain="['|','|',('line_ids.product_id', 'ilike', self),('line_ids.product_id.type_description', 'ilike', self),('line_ids.product_id.type_description2', 'ilike', self)]"/>
      </group>

    </search>
  </xpath>

</data>
```
Source: [snippets/purchase_requisition.view_purchase_requisition_filter.replace_filter.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.view_purchase_requisition_filter.replace_filter.xml)

## View Purchase Requisition Form  
### Date End Attributes Readonly  
ID: `mint_system.purchase_requisition.view_purchase_requisition_form.date_end_attributes_readonly`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.view_purchase_requisition_form" priority="50">

  <xpath expr="//field[@name='date_end']" position="attributes">
    <attribute name="attrs">{'readonly': [('state','not in',('draft','sent','in_progress','open','ongoing'))]}</attribute>
  </xpath>

</data>
```
Source: [snippets/purchase_requisition.view_purchase_requisition_form.date_end_attributes_readonly.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.view_purchase_requisition_form.date_end_attributes_readonly.xml)

### Date End Attributes Required  
ID: `mint_system.purchase_requisition.view_purchase_requisition_form.date_end_attributes_required`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.view_purchase_requisition_form" priority="50">

  <xpath expr="//field[@name='date_end']" position="attributes">
    <attribute name="required">1</attribute>
  </xpath>

</data>
```
Source: [snippets/purchase_requisition.view_purchase_requisition_form.date_end_attributes_required.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.view_purchase_requisition_form.date_end_attributes_required.xml)

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

### Modify Readonly  
ID: `mint_system.purchase_requisition.view_purchase_requisition_form.modify_readonly`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.view_purchase_requisition_form" priority="50">

  <xpath expr="//h1/field[@name='name']" position="attributes">
      <attribute name="attrs">{'readonly': [('state', 'in', ('done','cancel'))]}</attribute>
  </xpath>

</data>
```
Source: [snippets/purchase_requisition.view_purchase_requisition_form.modify_readonly.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.view_purchase_requisition_form.modify_readonly.xml)

### Modify States  
ID: `mint_system.purchase_requisition.view_purchase_requisition_form.modify_states`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.view_purchase_requisition_form" priority="50">

    <xpath expr="//button[@name='action_cancel']" position="attributes">
        <attribute name="states">ongoing,open</attribute>
    </xpath>
    
</data>
```
Source: [snippets/purchase_requisition.view_purchase_requisition_form.modify_states.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.view_purchase_requisition_form.modify_states.xml)

### Modify Status Workflow  
ID: `mint_system.purchase_requisition.view_purchase_requisition_form.modify_status_workflow`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.view_purchase_requisition_form" priority="50">

    <xpath expr="//button[@name='493']" position="after">
        <button name="action_order_send" states="draft,sent,open" string="Send by Email" type="object" class="btn-primary"/>
        <button name="action_open" states="sent" string="Validate" type="object" class="btn-primary"/>
    </xpath>

    <xpath expr="//button[@name='action_cancel']" position="attributes">
        <attribute name="states">open</attribute>
    </xpath>

    <field name="state_blanket_order" position="attributes">
        <attribute name="statusbar_visible">draft,sent,open,cancel,done</attribute>
    </field>

    <xpath expr="//button[@name='493']" position="replace">
        <button name="493" type="action" string="New Quotation" class="btn-primary" attrs="{'invisible': [('state', 'in', ('draft','sent','done','cancel'))]}"/>
    </xpath>

    <xpath expr="//button[@name='action_draft']" position="attributes">
        <attribute name="states">done,cancel,done</attribute>
    </xpath>

    <xpath expr="//button[@name='action_in_progress']" position="replace">
        <button name="action_open" states="draft" string="Validate" type="object" class="btn-primary"/>
    </xpath>

</data>
```
Source: [snippets/purchase_requisition.view_purchase_requisition_form.modify_status_workflow.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.view_purchase_requisition_form.modify_status_workflow.xml)

### Ordering Date Attributes Required  
ID: `mint_system.purchase_requisition.view_purchase_requisition_form.ordering_date_attributes_required`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.view_purchase_requisition_form" priority="50">

  <xpath expr="//field[@name='ordering_date']" position="attributes">
    <attribute name="required">1</attribute>
  </xpath>

</data>
```
Source: [snippets/purchase_requisition.view_purchase_requisition_form.ordering_date_attributes_required.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.view_purchase_requisition_form.ordering_date_attributes_required.xml)

### Relocate Price Unit  
ID: `mint_system.purchase_requisition.view_purchase_requisition_form.relocate_price_unit`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.view_purchase_requisition_form" priority="50">

  <xpath expr="//page[@name='products']//field[@name='price_unit']" position="replace"/>
  <xpath expr="//page[@name='products']//field[@name='product_uom_id']" position="after">
    <field name="price_unit"/>
  </xpath>

</data>
```
Source: [snippets/purchase_requisition.view_purchase_requisition_form.relocate_price_unit.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.view_purchase_requisition_form.relocate_price_unit.xml)

### Relocate Qty Ordered  
ID: `mint_system.purchase_requisition.view_purchase_requisition_form.relocate_qty_ordered`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.view_purchase_requisition_form" priority="50">

  <xpath expr="//page[@name='products']//field[@name='qty_ordered']" position="replace"/>
  <xpath expr="//page[@name='products']//field[@name='schedule_date']" position="after">
    <field name="qty_ordered" optional="show"/>
  </xpath>

</data>
```
Source: [snippets/purchase_requisition.view_purchase_requisition_form.relocate_qty_ordered.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.view_purchase_requisition_form.relocate_qty_ordered.xml)

### Replace Title  
ID: `mint_system.purchase_requisition.view_purchase_requisition_form.replace_title`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.view_purchase_requisition_form" priority="50">

  <xpath expr="//h1/../label" position="replace">
    <span class="o_form_label" attrs="{'invisible': [('state','not in',('draft','sent'))]}">Request for Quotation </span>
    <span class="o_form_label" attrs="{'invisible': [('state','in',('draft','sent'))]}">Purchase Order </span>
  </xpath>

</data>

```
Source: [snippets/purchase_requisition.view_purchase_requisition_form.replace_title.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.view_purchase_requisition_form.replace_title.xml)

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

## View Purchase Requisition Tree  
### Add Comment  
ID: `mint_system.purchase_requisition.view_purchase_requisition_tree.add_comment`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.view_purchase_requisition_tree" priority="50">

  <xpath expr="//field[@name='partner_ref']" position="after">
    <field name="comment"/>
  </xpath>

</data>

```
Source: [snippets/purchase_requisition.view_purchase_requisition_tree.add_comment.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.view_purchase_requisition_tree.add_comment.xml)

### Add Partner Ref  
ID: `mint_system.purchase_requisition.view_purchase_requisition_tree.add_partner_ref`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.view_purchase_requisition_tree" priority="50">

  <xpath expr="//field[@name='name']" position="after">
    <field name="partner_ref"/>
  </xpath>

</data>

```
Source: [snippets/purchase_requisition.view_purchase_requisition_tree.add_partner_ref.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.view_purchase_requisition_tree.add_partner_ref.xml)

### Add Vendor Id  
ID: `mint_system.purchase_requisition.view_purchase_requisition_tree.add_vendor_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.view_purchase_requisition_tree" priority="50">

  <xpath expr="//field[@name='ordering_date']" position="after">
    <field name="vendor_id"/>
  </xpath>

</data>
```
Source: [snippets/purchase_requisition.view_purchase_requisition_tree.add_vendor_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.view_purchase_requisition_tree.add_vendor_id.xml)

### Relocate User Id  
ID: `mint_system.purchase_requisition.view_purchase_requisition_tree.relocate_user_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.view_purchase_requisition_tree" priority="50">

  <xpath expr="//field[@name='user_id']" position="replace">
  </xpath>

  <xpath expr="//field[@name='partner_ref']" position="after">
    <field name="user_id"/>
  </xpath>

</data>

```
Source: [snippets/purchase_requisition.view_purchase_requisition_tree.relocate_user_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.view_purchase_requisition_tree.relocate_user_id.xml)

