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
          <span t-field='doc.date_confirmed' t-options='{ "widget": "date" }'/>
        </td>
        <td width="14%"></td>
        <td width="25%"></td>
      </tr>
      <tr>
        <td>Customer No.</td>
        <td>
          <span t-field='doc.partner_id.ref'/>
        </td>
        <td>Our Reference</td>
        <td>
          <span t-field='doc.user_id'/>
        </td>
      </tr>
      <tr>
        <td>Order</td>
        <td>
          <span t-field='doc.client_order_ref'/>
        </td>
        <td>Delivery Method</td>
        <td>
          <span t-field='doc.carrier_id'/>
        </td>
      </tr>
      <tr>
        <td>Reference</td>
        <td>
          <span t-field='doc.comment'/>
        </td>
        <td>Incoterm</td>
        <td>
          <span t-field='doc.incoterm'/>
        </td>
      </tr>
    </table>

  </xpath>

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.add_infotable.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.add_infotable.xml)

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

<xpath expr="//div/t[2]" position="replace">  
</xpath>
  
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

### Hide Title H3  
ID: `mint_system.purchase_requisition.report_purchaserequisitions.hide_title_h3`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase_requisition.report_purchaserequisitions" priority="50">

<xpath expr="//h3" position="replace">  
</xpath>
  
</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.hide_title_h3.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.hide_title_h3.xml)

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

</data>
```
Source: [snippets/purchase_requisition.report_purchaserequisitions.set_ids.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/purchase_requisition.report_purchaserequisitions.set_ids.xml)

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
				color: #000000;
			}
			h2 {
       			margin-top:10mm;
       			margin-bottom:3mm;
			}
	
		</style>
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

