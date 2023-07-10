# Purchase
## Mail Notification Confirm  
### Modify Buttons  
ID: `mint_system.purchase.mail_notification_confirm.modify_buttons`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.mail_notification_confirm" priority="50">

    <xpath expr="//t[1]/a/.." position="replace">
        <t t-if="record._name == 'purchase.order' and record.env.context.get('is_reminder')">
            <a t-att-href="record.get_confirm_url(confirm_type='reminder')" style="margin-right: 10px; background-color: #875A7B; padding: 8px 16px 8px 16px; text-decoration: none; color: #fff; border-radius: 5px; font-size:13px;">
                    We have no update
            </a>
            <div>&amp;nbsp;</div>
            <br></br>
            <a t-att-href="record.get_update_url()" style="margin-left: 10px; background-color: #875A7B; padding: 8px 16px 8px 16px; text-decoration: none; color: #fff; border-radius: 5px; font-size:13px;">
                    We have to set a new delivery date
            </a>
            <div>&amp;nbsp;</div>
            <div style="margin: 0px; padding: 0px; font-size:13px; text-align: left;">
                    If you have any questions, please do not hesitate to contact us.
                <div>&amp;nbsp;</div>
                    Best regards,
            </div>
        </t>
    </xpath>

</data>
```
Source: [snippets/purchase.mail_notification_confirm.modify_buttons.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.mail_notification_confirm.modify_buttons.xml)

## Purchase Order Form  
### Add Qty To Invoice  
ID: `mint_system.purchase.purchase_order_form.add_qty_to_invoice`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.purchase_order_form" priority="50">

  <xpath expr="//page[@name='products']//tree/field[@name='date_planned']" position="after">
    <field name="qty_to_invoice" optional="hide"/>
  </xpath>

</data>

```
Source: [snippets/purchase.purchase_order_form.add_qty_to_invoice.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.purchase_order_form.add_qty_to_invoice.xml)

### Add X Comment  
ID: `mint_system.purchase.purchase_order_form.add_x_comment`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.purchase_order_form" priority="50">

  <xpath expr="//field[@name='user_id']" position="after">
    <field name="x_comment"/>
  </xpath>

</data>
```
Source: [snippets/purchase.purchase_order_form.add_x_comment.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.purchase_order_form.add_x_comment.xml)

### Date Planned Readonly  
ID: `mint_system.purchase.purchase_order_form.date_planned_readonly`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.purchase_order_form" priority="50">

  <xpath expr="//div[@name='date_planned_div']/field[@name='date_planned']" position="attributes">
    <attribute name="attrs">{'readonly': True}</attribute>
  </xpath>

</data>

```
Source: [snippets/purchase.purchase_order_form.date_planned_readonly.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.purchase_order_form.date_planned_readonly.xml)

### Filter Customer Is Company  
ID: `mint_system.purchase.purchase_order_form.filter_customer_is_company`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.purchase_order_form" priority="50">

  <xpath expr="//group[1]/group[1]/field[2]" position="replace">
    <field name="partner_id" widget="res_partner_many2one" domain="[('is_company', '=', True)]" context="{'res_partner_search_mode': 'supplier', 'show_vat': True, 'default_is_company': 'True'}" placeholder="Name, TIN, Email, or Reference"/>
  </xpath>

</data>

```
Source: [snippets/purchase.purchase_order_form.filter_customer_is_company.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.purchase_order_form.filter_customer_is_company.xml)

### Format Dates  
ID: `mint_system.purchase.purchase_order_form.format_dates`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.purchase_order_form" priority="50">

  <xpath expr="//field[@name='date_order']" position="attributes">
    <attribute name="widget">date</attribute>
  </xpath>
  <xpath expr="//field[@name='date_approve']" position="attributes">
    <attribute name="widget">date</attribute>
  </xpath>
  <xpath expr="//tree/field[@name='date_planned']" position="attributes">
    <attribute name="widget">date</attribute>
  </xpath>
  <xpath expr="//div/field[@name='date_planned']" position="attributes">
    <attribute name="widget">date</attribute>
  </xpath>

</data>
```
Source: [snippets/purchase.purchase_order_form.format_dates.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.purchase_order_form.format_dates.xml)

### Modify Readonly Date Approve  
ID: `mint_system.purchase.purchase_order_form.modify_readonly_date_approve`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.purchase_order_form" priority="50">

  <xpath expr="//field[@name='date_approve']" position="attributes">
    <attribute name="readonly">0</attribute>
  </xpath>

</data>
```
Source: [snippets/purchase.purchase_order_form.modify_readonly_date_approve.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.purchase_order_form.modify_readonly_date_approve.xml)

### Modify Readonly Invoice Status  
ID: `mint_system.purchase.purchase_order_form.modify_readonly_invoice_status`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.purchase_order_form" priority="50">

  <xpath expr="//field[@name='invoice_status']" position="attributes">
    <attribute name="attrs">{"readonly": False}</attribute>
  </xpath>

</data>
```
Source: [snippets/purchase.purchase_order_form.modify_readonly_invoice_status.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.purchase_order_form.modify_readonly_invoice_status.xml)

### Modify Visibility Button Confirm Reminder Mail  
ID: `mint_system.purchase.purchase_order_form.modify_visibility_button_confirm_reminder_mail`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.purchase_order_form" priority="50">

  <xpath expr="//button[@name='confirm_reminder_mail']" position="attributes">
    <attribute name="groups">base.group_user</attribute>
  </xpath>

</data>
```
Source: [snippets/purchase.purchase_order_form.modify_visibility_button_confirm_reminder_mail.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.purchase_order_form.modify_visibility_button_confirm_reminder_mail.xml)

### Relocate Product Qty And Uom  
ID: `mint_system.purchase.purchase_order_form.relocate_product_qty_and_uom`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.purchase_order_form" priority="50">

  <xpath expr="//page[@name='products']//tree/field[@name='product_qty']" position="replace">
  </xpath>

  <xpath expr="//page[@name='products']//tree/field[@name='product_uom']" position="replace">
  </xpath>

  <xpath expr="//page[@name='products']//tree/field[@name='name']" position="after">
    <field name="product_qty"/>
    <field name="product_uom" string="UoM" groups="uom.group_uom" attrs="{'readonly': [('state', 'in', ('purchase', 'done', 'cancel'))],'required': [('display_type', '=', False)]}" force_save="1" optional="show"/>
  </xpath>

</data>
```
Source: [snippets/purchase.purchase_order_form.relocate_product_qty_and_uom.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.purchase_order_form.relocate_product_qty_and_uom.xml)

### Show Dest Address Id  
ID: `mint_system.purchase.purchase_order_form.show_dest_address_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.purchase_order_form" priority="50">

  <xpath expr="//page[@name='purchase_delivery_invoice']//field[@name='company_id']" position="after">
    <field name="dest_address_id"/>
  </xpath>

</data>

```
Source: [snippets/purchase.purchase_order_form.show_dest_address_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.purchase_order_form.show_dest_address_id.xml)

### Show Move Dest  
ID: `mint_system.purchase.purchase_order_form.show_move_dest`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.purchase_order_form" priority="50">

  <xpath expr="//field[@name='order_line']/tree//field[@name='price_unit']" position="after">
    <field name="move_ids" widget="many2many" optional="hide"/>
  </xpath>
  
</data>

```
Source: [snippets/purchase.purchase_order_form.show_move_dest.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.purchase_order_form.show_move_dest.xml)

### Show Procurement Group  
ID: `mint_system.purchase.purchase_order_form.show_procurement_group`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.purchase_order_form" priority="50">

  <xpath expr="//field[@name='origin']" position="after">
    <field name="group_id"/>
  </xpath>

  <xpath expr="//field[@name='order_line']/tree//field[@name='price_unit']" position="after">
    <field name="group_id" optional="hide"/>
  </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_form.show_procurement_group.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.purchase_order_form.show_procurement_group.xml)

### X Drawing File  
ID: `mint_system.purchase.purchase_order_form.x_drawing_file`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.purchase_order_form" priority="50">

  <xpath expr="//field[@name='order_line']/tree[1]/field[@name='name']" position="after">
    <field name="x_drawing_file"/>
  </xpath>

  <xpath expr="//field[@name='order_line']/form[1]//field[@name='name']" position="after">
    <br/>
    <label for="x_drawing_file" string="Zeichnung"/>
    <field name="x_drawing_file"/>
  </xpath>

</data>

```
Source: [snippets/purchase.purchase_order_form.x_drawing_file.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.purchase_order_form.x_drawing_file.xml)

## Purchase Order Kpis Tree  
### Add Comment  
ID: `mint_system.purchase.purchase_order_kpis_tree.add_comment`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.purchase_order_kpis_tree" priority="50">
 
 <xpath expr="//field[@name='date_order']" position="after">
    <field name="comment" optional="show"/>
</xpath>

</data>

```
Source: [snippets/purchase.purchase_order_kpis_tree.add_comment.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.purchase_order_kpis_tree.add_comment.xml)

### Add Mail Reception Confirmed  
ID: `mint_system.purchase.purchase_order_kpis_tree.add_mail_reception_confirmed`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.purchase_order_kpis_tree" priority="50">
 
 <xpath expr="//field[@name='invoice_status']" position="after">
    <field name="mail_reception_confirmed" optional="show"/>
</xpath>

</data>

```
Source: [snippets/purchase.purchase_order_kpis_tree.add_mail_reception_confirmed.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.purchase_order_kpis_tree.add_mail_reception_confirmed.xml)

## Purchase Order Line Tree  
### Reset View  
ID: `mint_system.purchase.purchase_order_line_tree.reset_view`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.purchase_order_line_tree" priority="50">

    <field name="name" position="replace">
    </field>

    <field name="price_unit" position="replace">
    </field>

    <field name="discount" position="replace">
    </field>

    <field name="order_id" position="after">
        <field name="x_origin" />
    </field>

    <field name="order_id" position="after">
        <field name="x_state" />
    </field>

    <field name="product_id" position="after">
        <field name="x_user_id" />
    </field>

    <field name="partner_id" position="after">
        <field name="x_partner_ref" />
    </field>


    <field name="date_planned" position="after">
        <field name="x_date_approve" />
    </field>

    <field name="product_qty" position="after">
        <field name="qty_invoiced" />
    </field>

    <field name="product_qty" position="after">
        <field name="qty_received" />
    </field>

</data>

```
Source: [snippets/purchase.purchase_order_line_tree.reset_view.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.purchase_order_line_tree.reset_view.xml)

## Purchase Order View Search  
### Add Invoice Status  
ID: `mint_system.purchase.purchase_order_view_search.add_invoice_status`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.purchase_order_view_search" priority="50">

  <xpath expr="//filter[@name='order_date']" position="after">
    <filter string="Invoice Status" name="invoice_state" domain="[]" context="{'group_by': 'invoice_status'}"/>
  </xpath>

</data>
```
Source: [snippets/purchase.purchase_order_view_search.add_invoice_status.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.purchase_order_view_search.add_invoice_status.xml)

### Modify Product Id  
ID: `mint_system.purchase.purchase_order_view_search.modify_product_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.purchase_order_view_search" priority="50">

  <xpath expr="//field[@name='product_id']" position="replace">
     <field name="product_id" filter_domain="['|','|',('order_line.product_id', 'ilike', self),('order_line.product_id.type_description', 'ilike', self),('order_line.product_id.type_description2', 'ilike', self)]"/>
  </xpath>

</data>
```
Source: [snippets/purchase.purchase_order_view_search.modify_product_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.purchase_order_view_search.modify_product_id.xml)

## Purchase Order View Tree  
### Add Mail Reception Confirmed  
ID: `mint_system.purchase.purchase_order_view_tree.add_mail_reception_confirmed`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.purchase_order_view_tree" priority="50">

 <xpath expr="//field[@name='invoice_status']" position="after">
    <field name="mail_reception_confirmed" optional="show"/>
</xpath>

</data>
```
Source: [snippets/purchase.purchase_order_view_tree.add_mail_reception_confirmed.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.purchase_order_view_tree.add_mail_reception_confirmed.xml)

## Report Purchaseorder Document  
### Add Agreement  
ID: `mint_system.purchase.report_purchaseorder_document.add_agreement`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="/t/t/div/div[2]/div[4]" position="after">
    <div t-if="o.requisition_id" class="col-3 bm-2">
      <strong>Purchase Agreement:</strong>
      <p t-field="o.requisition_id.display_name"  class="m-0"/>
    </div>
  </xpath>

</data>

```
Source: [snippets/purchase.report_purchaseorder_document.add_agreement.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.add_agreement.xml)

### Add Date Approve  
ID: `mint_system.purchase.report_purchaseorder_document.add_date_approve`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="/t/t/div/div/div[3]" position="replace">
    <div t-if="o.user_id" class="col-3 bm-2">
                    <strong>Order Date:</strong>
                     <p t-field="o.date_approve" class="m-0" t-options='{ "widget": "date" }'/>
                </div>

  </xpath>

</data>

```
Source: [snippets/purchase.report_purchaseorder_document.add_date_approve.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.add_date_approve.xml)

### Add Email  
ID: `mint_system.purchase.report_purchaseorder_document.add_email`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="/t[1]/t[1]/div[1]/div[2]/div[1]/p[1]" position="after">
    <span t-field="o.user_id.email"/>
  </xpath>

</data>

```
Source: [snippets/purchase.report_purchaseorder_document.add_email.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.add_email.xml)

### Add Footer  
ID: `mint_system.purchase.report_purchaseorder_document.add_footer`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="//div[@class='oe_structure']/.." position="after">
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
        <td width="40%" t-if="o.payment_term_id.note">Zahlungsbedingungen 
          <span t-field="o.payment_term_id.note"/>
        </td>
        <td width="60%">
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
Source: [snippets/purchase.report_purchaseorder_document.add_footer.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.add_footer.xml)

### Add Taxes  
ID: `mint_system.purchase.report_purchaseorder_document.add_taxes`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="//th[@name='th_amount']" position="after">
    <th name="th_amount">
      <span/>
    </th>
  </xpath>

  <xpath expr="//td/span[@t-field='line.price_subtotal']/.." position="after">
    <td id="taxes_amount">
        <span t-out="line.taxes_id.amount"/>
    </td>
  </xpath>

</data>
```
Source: [snippets/purchase.report_purchaseorder_document.add_taxes.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.add_taxes.xml)

### Append Payment Terms  
ID: `mint_system.purchase.report_purchaseorder_document.append_payment_terms`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

<xpath expr="/t/t/div/div[4]" position="after">
    <div class="row">
      <div class="col">
        <t t-if="o.payment_term_id" name="payment_term">
            <strong>Payment Terms: </strong><span t-field="o.payment_term_id.name"/>
        </t>
      </div>
    </div>
  </xpath>

</data>

```
Source: [snippets/purchase.report_purchaseorder_document.append_payment_terms.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.append_payment_terms.xml)

### Date Created  
ID: `mint_system.purchase.report_purchaseorder_document.date_created`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="/t/t/div/div[2]/div[2]" position="after">
    <div t-if="o.create_date" class="col-3 bm-2">
      <strong>Date Created:</strong>
      <p t-field="o.create_date" t-options='{"widget": "date"}' class="m-0"/>
    </div>
  </xpath>

</data>

```
Source: [snippets/purchase.report_purchaseorder_document.date_created.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.date_created.xml)

### Format Address Blocks  
ID: `mint_system.purchase.report_purchaseorder_document.format_address_blocks`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="//t[@t-set='address']/div" position="attributes">
    <attribute name="style">font-size:10pt; line-height: 1.2; padding-bottom:33mm;</attribute>
    <attribute name="t-options-fields">['address', 'name']</attribute>
  </xpath>

  <xpath expr="/t/t/t[4]/t/strong" position="replace">
    <div style="font-size:8pt; font-weight:bold">Shipping address:</div>
  </xpath>

  <xpath expr="/t/t/t[4]/t/div/span" position="replace">
  </xpath>

  <xpath expr="/t/t/t[4]/t/div/div" position="attributes">
    <attribute name="style">font-size:10pt; line-height: 1.2;</attribute>
    <attribute name="t-options-fields">['address', 'name']</attribute>
  </xpath>

</data>
```
Source: [snippets/purchase.report_purchaseorder_document.format_address_blocks.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.format_address_blocks.xml)

### Format As Date  
ID: `mint_system.purchase.report_purchaseorder_document.format_as_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="/t[1]/t[1]/div[1]/div[2]/div[3]/p[1]" position="attributes">
    <attribute name="t-options-widget">"date"</attribute>
  </xpath>

  <xpath expr="//table[1]/tbody[1]/t[2]/tr[1]/t[1]/td[3]/span[1]" position="attributes">
    <attribute name="t-options-widget">"date"</attribute>
  </xpath>

</data>

```
Source: [snippets/purchase.report_purchaseorder_document.format_as_date.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.format_as_date.xml)

### Format Qty With Decimal  
ID: `mint_system.purchase.report_purchaseorder_document.format_qty_with_decimal`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="//span[@id='product_qty']" position="replace">
    <t t-if="line.product_uom.id == 1">
      <span id="product_qty" t-field="line.product_qty" t-options="{'widget': 'integer'}"/>
    </t>
    <t t-else="">
      <span id="product_qty" t-field="line.product_qty"/>
    </t>
  </xpath>

</data>
```
Source: [snippets/purchase.report_purchaseorder_document.format_qty_with_decimal.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.format_qty_with_decimal.xml)

### Format Qty  
ID: `mint_system.purchase.report_purchaseorder_document.format_qty`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="//span[@t-field='order_line.product_qty']" position="replace">
    <t t-if="order_line.product_uom.id == 1">
      <span t-field="order_line.product_qty" t-options="{'widget': 'integer'}"/>
    </t>
  </xpath>
  
</data>
```
Source: [snippets/purchase.report_purchaseorder_document.format_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.format_qty.xml)

### Format Title  
ID: `mint_system.purchase.report_purchaseorder_document.format_title`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">>

  <xpath expr="//h2[1]" position="attributes">
    <attribute name="style">color: black; font-size:13pt; font-weight:bold; margin-top:10mm; margin-bottom:3mm</attribute>
  </xpath>
  <xpath expr="//h2[2]" position="attributes">
    <attribute name="style">color: black; font-size:13pt; font-weight:bold; margin-top:10mm; margin-bottom:3mm</attribute>
  </xpath>
  <xpath expr="//h2[3]" position="attributes">
    <attribute name="style">color: black; font-size:13pt; font-weight:bold; margin-top:10mm; margin-bottom:3mm</attribute>
  </xpath>
  <xpath expr="//h2[4]" position="attributes">
    <attribute name="style">color: black; font-size:13pt; font-weight:bold; margin-top:10mm; margin-bottom:3mm</attribute>
  </xpath>

</data>
```
Source: [snippets/purchase.report_purchaseorder_document.format_title.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.format_title.xml)

### Get Position  
ID: `mint_system.purchase.report_purchaseorder_document.get_position`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="//table/thead/tr/th[1]" position="before">
    <th>
      <span>Pos</span>
    </th>
  </xpath>
  <xpath expr="//table/tbody/t/tr/t[1]/td[1]" position="before">
    <td>
      <span t-esc="line.position"/>
    </td>
  </xpath>

</data>

```
Source: [snippets/purchase.report_purchaseorder_document.get_position.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.get_position.xml)

### Header Margin  
ID: `mint_system.purchase.report_purchaseorder_document.header_margin`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="/t/t/div/table" position="attributes">
    <attribute name="style" separator=";" add="margin-top: 2rem"/>
  </xpath>

</data>

```
Source: [snippets/purchase.report_purchaseorder_document.header_margin.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.header_margin.xml)

### Modify Main Table  
ID: `mint_system.purchase.report_purchaseorder_document.modify_main_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

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
      <td style="padding-bottom :10px; padding-left:3px; line-height: 1.2"></td>
      <td style="padding:0; padding-left:3px; line-height: 1.2"></td>
      <td style="padding:0; padding-left:3px; line-height: 1.2" colspan="4">
        <span t-field="line.name"/>
        <br/>
        <t t-if="line.product_id.country_of_origin_id.code">Ursprungsland: <span t-field="line.product_id.country_of_origin_id.code"/>
        </t>
        <t t-if="line.product_id.hs_code"> / Zollposition: <span t-field="line.product_id.hs_code"/>
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

  <!-- header: position -->
  <xpath expr="//table[@class='table table-borderless table-sm']/thead/tr/th[1]" position="attributes">
    <attribute name="style">width: 5mm</attribute>/>
  </xpath>

  <!-- header: default code -->
  <xpath expr="//table[@class='table table-borderless table-sm']/thead/tr/th[2]" position="attributes">
    <attribute name="style">width: 27mm; text-align: right; padding-right: 10px</attribute>"/>
  </xpath>

  <!-- header: description -->
  <xpath expr="//table[@class='table table-borderless table-sm']/thead/tr/th[3]" position="attributes">
    <attribute name="style">width: 73mm</attribute>/>
  </xpath>

  <!-- header: commitment date -->
  <xpath expr="//table[@class='table table-borderless table-sm']/thead/tr/th[5]" position="attributes">
    <attribute name="class" separator=" " add="text-left" remove="text-center"/>
  </xpath>

  <!-- header: qty -->
  <xpath expr="//table[@class='table table-borderless table-sm']/thead/tr/th[5]" position="attributes">
    <attribute name="style">text-align: right; padding-right: 5px</attribute>"/>
  </xpath>

  <!-- position -->
  <xpath expr="//table[@class='table table-borderless table-sm']/tbody/t[2]/tr/t[1]/td[1]" position="attributes">
    <attribute name="style">text-align: right</attribute>/>
  </xpath>

  <!-- default code -->
  <xpath expr="//table[@class='table table-borderless table-sm']/tbody/t[2]/tr/t[1]/td[2]" position="attributes">
    <attribute name="style">text-align: right; padding-right: 10px;</attribute>/>
  </xpath>

  <!-- remove taxes -->
  <xpath expr="//thead/tr[1]/th[4]" position="replace"/>
  <xpath expr="//tbody/t[2]/tr[1]/t[1]/td[4]" position="replace"/>

  <!-- commitment date -->
  <xpath expr="//table[@class='table table-borderless table-sm']/tbody/t[2]/tr/t[1]/td[4]/span" position="attributes">
    <attribute name="t-options-widget">"date"</attribute>
  </xpath>
  <xpath expr="//table[@class='table table-borderless table-sm']/tbody/t[2]/tr[1]/t[1]/td[4]" position="attributes">
    <attribute name="class" separator=" " add="text-left" remove="text-center"/>
  </xpath>

  <!-- qty-->
  <xpath expr="/t[1]/t[1]/div[1]/table[2]/tbody[1]/t[2]/tr[1]/t[1]/td[5]/span[1]" position="attributes">
    <attribute name="t-options-widget">"integer"</attribute>
  </xpath>
  <xpath expr="/t/t/div/table[2]/tbody/t[2]/tr[1]/t[1]/td[5]/span[1]" position="attributes">
    <attribute name="class" separator=" " add="o_bold"/>
  </xpath>

  <!-- price -->
  <xpath expr="//table[@class='table table-borderless table-sm']/tbody/t[2]/tr/t[1]/td[6]/span" position="replace">
    <span t-esc="'%g' % line.price_unit if str(line.price_unit)[::-1].find('.') >= 3 else '%.2f' % line.price_unit"/>
  </xpath>



  <xpath expr="//table[@class='table table-borderless table-sm']" position="after">
    <t t-if="o.note_footer != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
      <span class="note" t-field="o.note_footer"/>
    </t>
    <table class="table table-borderless table-sm" style="margin-top:20px; width:100%; color:black; font-family: arial; font-size:9pt; border-top-style:solid; border-bottom-style:solid; border-width:1px; border-color:black">

      <tr >
        <td style="width:15.5%; text-align:left">
          <Strong>Warenwert</Strong>
        </td>
        <td style="width:23%; text-align:left">
          <span t-field="o.amount_untaxed"/>
        </td>

        <t t-if="o.amount_tax > 0">
          <td style="width:12%; text-align:left">MWST</td>
          <td style="width:17%; text-align:left">
            <span t-field="o.amount_tax" t-options="{&quot;widget&quot;: &quot;monetary&quot;, &quot;display_currency&quot;: o.currency_id}"/>
          </td>
        </t>
        <t t-elif="o.amount_tax == 0">
          <td></td>
          <td></td>
        </t>

        <td style="width:14%; text-align:right">
          <Strong>Bestellbetrag</Strong>
        </td>
        <td style="width:18%; text-align:right" class="text-right">
          <span t-field="o.amount_total" t-options="{&quot;widget&quot;: &quot;monetary&quot;, &quot;display_currency&quot;: o.currency_id}"/>
        </td>
      </tr>

    </table>
  </xpath>

</data>
```
Source: [snippets/purchase.report_purchaseorder_document.modify_main_table.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.modify_main_table.xml)

### Product Description Replace  
ID: `mint_system.purchase.report_purchaseorder_document.product_description_replace`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="//table/thead/tr/th[1]" position="before">
    <th>
      <span>Pos</span>
    </th>
  </xpath>
  <xpath expr="//table/tbody/t/tr/t[1]/td[1]" position="before">
    <td>
      <span t-esc="line.position"/>
    </td>
  </xpath>

</data>

```
Source: [snippets/purchase.report_purchaseorder_document.product_description_replace.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.product_description_replace.xml)

### Qty Remaining  
ID: `mint_system.purchase.report_purchaseorder_document.qty_remaining`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="//span[@id='product_uom']" position="after">
    <t t-set="product" t-value="o.requisition_id.line_ids.filtered(lambda r: r.product_id.id == line.product_id.id)"/>
    <t t-if="product"> / <span t-esc="product.product_qty - product.qty_ordered"/> <span t-field="line.product_uom.name"/></t>
  </xpath>
  
  <xpath expr="//table/thead/tr/th[4]/strong" position="replace">
    <strong>Qty / Rem. Agreement Qty<br/></strong>
  </xpath>

</data>

```
Source: [snippets/purchase.report_purchaseorder_document.qty_remaining.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.qty_remaining.xml)

### Remove Informations  
ID: `mint_system.purchase.report_purchaseorder_document.remove_informations`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

<xpath expr="//div[@id='informations']" position="replace">
</xpath>

</data>

```
Source: [snippets/purchase.report_purchaseorder_document.remove_informations.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.remove_informations.xml)

### Remove Summary Table  
ID: `mint_system.purchase.report_purchaseorder_document.remove_summary_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

<xpath expr="//div[@id='total']" position="replace">
</xpath>

</data>

```
Source: [snippets/purchase.report_purchaseorder_document.remove_summary_table.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.remove_summary_table.xml)

### Remove Taxes  
ID: `mint_system.purchase.report_purchaseorder_document.remove_taxes`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="//table[1]/thead[1]/tr[1]/th[2]" position="replace"/>
  <xpath expr="//table[1]/tbody[1]/t[2]/tr[1]/t[1]/td[2]" position="replace"/>

</data>

```
Source: [snippets/purchase.report_purchaseorder_document.remove_taxes.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.remove_taxes.xml)

### Remove User Id  
ID: `mint_system.purchase.report_purchaseorder_document.remove_user_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

    <xpath expr="//p[@t-field='o.user_id']/.." position="replace">
    </xpath>

</data>
```
Source: [snippets/purchase.report_purchaseorder_document.remove_user_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.remove_user_id.xml)

### Remove Vat  
ID: `mint_system.purchase.report_purchaseorder_document.remove_vat`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

<xpath expr="//p[@t-if='o.partner_id.vat']" position="replace">
</xpath>

</data>
```
Source: [snippets/purchase.report_purchaseorder_document.remove_vat.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.remove_vat.xml)

### Rename Deadline  
ID: `mint_system.purchase.report_purchaseorder_document.rename_deadline`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="/t/t/div/div[2]/div[3]/strong" position="replace">
    <strong>Deadline:</strong>
  </xpath>

  <!-- <xpath expr="/t/t/div/div[2]/div[4]" position="after">
    <div t-if="o.date_order" class="col-3 bm-2">
      <strong>Order Deadline:</strong>
      <p t-field="o.date_order" t-options='{ "widget": "date" }' class="m-0"/>
    </div>
  </xpath> -->

</data>

```
Source: [snippets/purchase.report_purchaseorder_document.rename_deadline.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.rename_deadline.xml)

### Replace Address And Information Block  
ID: `mint_system.purchase.report_purchaseorder_document.replace_address_and_information_block`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="//t[@t-set='address']" position="replace"/>

  <xpath expr="//div[@class='page'][1]" position="before">

    <div class="row text-900 o_bold">
      <div class="col-7">Vendor</div>
      <div class="col-5">Invoice Address</div>
    </div>

    <div class="row">
      <div class="col-7">
        <span t-field="o.partner_id.commercial_company_name"/>
        <span t-field="o.partner_id" t-options-widget="&quot;contact&quot;" t-options-no_marker="True" t-options-fields="['address']"/>
      </div>
      <div class="col-5">
        <span t-field="o.company_id.name"/>
        <span t-field="o.picking_type_id.warehouse_id.partner_id" t-options-widget="&quot;contact&quot;" t-options-no_marker="True" t-options-fields="['address']"/>
      </div>
    </div>

    <div class="row">
      <div class="col-5 text-900 o_bold offset-7" style="margin-top:25px">Delivery Address</div>
    </div>

    <div class="row">
      <div class="col-5 offset-7">
        <div>
          <span t-field="o.picking_type_id.company_id.name"/>
        </div>
        <span t-field="o.picking_type_id.name"/>
        <span t-field="o.picking_type_id.warehouse_id.partner_id" t-options-widget="&quot;contact&quot;" t-options-fields="['address']" t-options-no_marker="True"/>
      </div>
    </div>

    <div class="row o_bold text-900" style="margin-top:25px">
      <div class="col-7">Your Contact</div>
      <div class="col-5">Our Contact</div>
    </div>

    <div class="row">
      <div class="col-7">
        <span t-field="o.partner_id.name"/>
      </div>
      <div class="col-5">
        <span t-field="o.user_id.name"/>
      </div>
    </div>

    <div class="row">
      <div class="col-7" style="margin-bottom:25px">
        <span t-field="o.partner_id" t-options-widget="&quot;contact&quot;" t-options-fields="['phone', 'email']" t-options-no_marker="True"/>
      </div>
      <div class="col-5">
        <span t-field="o.user_id" t-options-widget="&quot;contact&quot;" t-options-fields="['phone', 'email']" t-options-no_marker="True"/>
      </div>
    </div>

  </xpath>

</data>
```
Source: [snippets/purchase.report_purchaseorder_document.replace_address_and_information_block.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.replace_address_and_information_block.xml)

### Replace Informations  
ID: `mint_system.purchase.report_purchaseorder_document.replace_informations`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="//div[@id='informations']" position="replace">
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
        <td width="17%">Oder Date</td>
        <td width="40%">
          <t t-if="o.date_approve">
            <span id='date_approve' t-field='o.date_approve' t-options='{ "widget": "date" }'/>
          </t>
          <t t-else="">
            <span t-field='o.date_order' t-options='{ "widget": "date" }'/>
          </t>
        </td>
        <td width="18%">Our Reference</td>
        <td width="25%">
          <span t-field='o.user_id'/>
        </td>
      </tr>
      <tr>
        <td>Customer No.</td>
        <td>
          <span t-field='o.partner_id.ref'/>
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

        <t t-if="o.requisition_id">
          <td>Purchase Contract</td>
          <td>
            <span t-field='o.requisition_id'/>
            <t t-if="o.requisition_id.partner_ref"> /              <span t-field='o.requisition_id.partner_ref'/>
            </t>
          </td>
        </t>
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

    <t t-if="o.note_header != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
      <span class="note" t-field="o.note_header"/>
    </t>

  </xpath>

  <!--
  <xpath expr="//div[@id='informations']" position="replace">
    
    <div id="informations">
    <table width="100%">
      <tr>
        <td width="17%">Kunden-Nr.</td>
        <td width="41%">
          <span t-field="o.partner_id.ref"/>
        </td>
        <td width="17%">Datum</td>
        <td width="25%">
          <span t-field="o.date_order" t-options="{ &quot;widget&quot;: &quot;date&quot; }"/>
        </td>
      </tr>
      <tr>
        <td>Ihre Referenz</td>
        <td>
          <span t-field="o.partner_ref"/>
        </td>
        <td>Kontaktperson</td>
        <td>
          <span t-field="o.user_id"/>
        </td>
      </tr>
      <tr>
        <td/>
        <td/>
        <td>Mwst-Nr:</td>
        <td>
          <span t-field="res_company.vat"/> MWST
        </td>
      </tr>
    </table>
    </div>
 
 </xpath>
 -->

</data>
```
Source: [snippets/purchase.report_purchaseorder_document.replace_informations.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.replace_informations.xml)

### Replace Partner Id  
ID: `mint_system.purchase.report_purchaseorder_document.replace_partner_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="//t[@t-set='address']/div" position="replace">
    <div style="font-size:10pt; line-height: 1.2; padding-bottom:33mm">
      <t t-if="o.partner_order_id.parent_name">
        <div t-field="o.partner_order_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: False}" name="purchase_order_id"/>
      </t>
      <t t-if="not o.partner_order_id.parent_name">
        <div t-field="o.partner_order_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: False}" name="purchase_order_id"/>
      </t>
    </div>
  </xpath>

</data>

```
Source: [snippets/purchase.report_purchaseorder_document.replace_partner_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.replace_partner_id.xml)

### Replace Product Description  
ID: `mint_system.purchase.report_purchaseorder_document.replace_product_description`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="//td[@id='product']" position="replace">
      <td id="product">
        <span class="o_bold" t-field="line.product_id.name"/><br/>
        <span t-field="line.name"/>  
      </td>
  </xpath>

</data>
```
Source: [snippets/purchase.report_purchaseorder_document.replace_product_description.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.replace_product_description.xml)

### Replace Representative  
ID: `mint_system.purchase.report_purchaseorder_document.replace_representative`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="/t[1]/t[1]/div[1]/div[2]/div[1]/p[1]" position="replace">
    <span t-field="o.user_id.email"/>
  </xpath>

</data>

```
Source: [snippets/purchase.report_purchaseorder_document.replace_representative.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.replace_representative.xml)

### Round Price  
ID: `mint_system.purchase.report_purchaseorder_document.round_price`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="//table[2]/tbody[1]/t[2]/tr[1]/t[1]/td[6]/span[1]" position="replace">
    <span t-esc="'%g' % line.price_unit if str(line.price_unit)[::-1].find('.') >= 3 else '%.2f' % line.price_unit"/>
  </xpath>

</data>

```
Source: [snippets/purchase.report_purchaseorder_document.round_price.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.round_price.xml)

### Row Date Align Left  
ID: `mint_system.purchase.report_purchaseorder_document.row_date_align_left`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="49">

  <xpath expr="/t/t/div/table/thead/tr/th[3]" position="attributes">
    <attribute name="class" separator=" " add="text-left" remove="text-center"/>
  </xpath>
  <xpath expr="/t/t/div/table/tbody/t[2]/tr/t[1]/td[3]" position="attributes">
    <attribute name="class" separator=" " add="text-left" remove="text-center"/>
  </xpath>
  <xpath expr="/t[1]/t[1]/div[1]/table[1]/tbody[1]/t[2]/tr[1]/t[1]/td[3]/span[1]" position="attributes">
    <attribute name="t-options-widget">"date"</attribute>
  </xpath>

</data>
```
Source: [snippets/purchase.report_purchaseorder_document.row_date_align_left.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.row_date_align_left.xml)

### Sequence In Table  
ID: `mint_system.purchase.report_purchaseorder_document.sequence_in_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="//table/thead/tr/th[1]" position="before">
    <th>
      <span>Pos</span>
    </th>
  </xpath>
  <xpath expr="//t[@t-foreach='o.order_line']" position="before">
    <span t-set="index" t-value="1"/>
  </xpath>
  <xpath expr="//table/tbody/t/tr/t[1]/td[1]" position="before">
    <td>
      <!-- <span t-esc="line.sequence - 9"/> -->
      <span t-esc="index"/><t t-set="index" t-value="index+1"/>
    </td>
  </xpath>

</data>

```
Source: [snippets/purchase.report_purchaseorder_document.sequence_in_table.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.sequence_in_table.xml)

### Set Ids  
ID: `mint_system.purchase.report_purchaseorder_document.set_ids`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

	<xpath expr="//span[@t-field='line.product_qty']" position="attributes">
		<attribute name="id">product_qty</attribute>
	</xpath>

  <xpath expr="//span[@t-field='line.product_uom.name']" position="attributes">
		<attribute name="id">product_uom</attribute>
	</xpath>

</data>

```
Source: [snippets/purchase.report_purchaseorder_document.set_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.set_ids.xml)

### Show Seller Product  
ID: `mint_system.purchase.report_purchaseorder_document.show_seller_product`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <!-- <t t-foreach="line.product_id.seller_ids" t-as="seller">
      <span t-field="seller.name"/>
  </t> -->

  <xpath expr="//tbody/t[2]/tr/t[1]/td[1]/span" position="after">
    <t t-set="seller" t-value="line.product_id.seller_ids.browse(o.partner_id.id)"/>
    Product Code: <span t-field="seller.product_code"/>
    Product Name: <span t-field="seller.product_name"/>
  </xpath>

</data>

```
Source: [snippets/purchase.report_purchaseorder_document.show_seller_product.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.show_seller_product.xml)

### Style Carbo Link  
ID: `mint_system.purchase.report_purchaseorder_document.style_carbo_link`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="60">

	<xpath expr="//div[hasclass('page')]" position="before">
		<style>
		.o_company_1_layout {
        	font-family: Dobra-Book;
        	font-size: 80%;
        	}
		</style>
	</xpath>

	<xpath expr="//span[@t-field='line.date_planned']" position="attributes">
		<attribute name="t-options-widget">"date"</attribute>
	</xpath>

</data>
```
Source: [snippets/purchase.report_purchaseorder_document.style_carbo_link.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.style_carbo_link.xml)

### Style Moser  
ID: `mint_system.purchase.report_purchaseorder_document.style_moser`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

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
     	td#taxes_amount {
     	 	text-align: right;
     	}
		</style>
	</xpath>

	<xpath expr="//th[@name='th_description']" position="attributes">
		<attribute name="style" separator=" " add="text-align: left"/>
	</xpath>

	<xpath expr="//span[@t-field='line.date_planned']" position="attributes">
		<attribute name="t-options-widget">"date"</attribute>
	</xpath>

	<xpath expr="/t[1]/t[1]/t[4]/t[1]/div[1]/div[1]" position="attributes">
		<attribute name="t-options-fields">['address']</attribute>
	</xpath>

	<xpath expr="//div[@t-field='o.partner_id']" position="attributes">
		<attribute name="t-options-fields">['address', 'name']</attribute>
	</xpath>

</data>
```
Source: [snippets/purchase.report_purchaseorder_document.style_moser.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.style_moser.xml)

### Terms And Conditions  
ID: `mint_system.purchase.report_purchaseorder_document.terms_and_conditions`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="/t/t/div/div[5]" position="after">
    <div class="row">
      <div class="col">
        <b>Terms and Conditions:</b>
        <ul>
          <li>An order confirmation is required within 5 working days</li>
          <li>The delivery date is the day of arrival at <span t-field="res_company.name"/></li>
          <li>Partial deliveries only after prior release</li>
          <li>If the confirmed delivery date is not respected, <span t-field="res_company.name"/> is applying a penalty of 2% of the order value, until max. 10%</li>
        </ul>
      </div>
    </div>
  </xpath>

</data>

```
Source: [snippets/purchase.report_purchaseorder_document.terms_and_conditions.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.terms_and_conditions.xml)

### Title Margin  
ID: `mint_system.purchase.report_purchaseorder_document.title_margin`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="/t/t/div/div[1]" position="attributes">
    <attribute name="style" separator=";" add="margin-top: 2rem"/>
  </xpath>

</data>
```
Source: [snippets/purchase.report_purchaseorder_document.title_margin.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.title_margin.xml)

### X Warranty  
ID: `mint_system.purchase.report_purchaseorder_document.x_warranty`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

  <xpath expr="//td[@id='product']" position="inside">
    <br/>
    <span t-field="line.product_id.x_warranty"/>
  </xpath>

</data>

```
Source: [snippets/purchase.report_purchaseorder_document.x_warranty.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchaseorder_document.x_warranty.xml)

## Report Purchasequotation Document  
### Add Default Code  
ID: `mint_system.purchase.report_purchasequotation_document.add_default_code`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="50">

    <xpath expr="//thead/tr/th[1]" position="after">
        <th>
            <span>Artikel Nr.</span>
        </th>
    </xpath>
    <xpath expr="//tbody/t/tr/t[1]/td[1]" position="after">
        <td>
            <span t-field="order_line.product_id.default_code"/>
        </td>
    </xpath>

</data>
```
Source: [snippets/purchase.report_purchasequotation_document.add_default_code.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.add_default_code.xml)

### Add Footer  
ID: `mint_system.purchase.report_purchasequotation_document.add_footer`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="50">

  <xpath expr="//div[@class='oe_structure']/.." position="after">
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
        <td width="40%" t-if="o.payment_term_id.note">Zahlungsbedingungen 
          <span t-field="o.payment_term_id.note"/>
        </td>
        <td width="60%">
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
Source: [snippets/purchase.report_purchasequotation_document.add_footer.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.add_footer.xml)

### Add Infotable  
ID: `mint_system.purchase.report_purchasequotation_document.add_infotable`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="50">

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
        <td width="17%">Order Deadline</td>
        <td width="40%">
          <span t-field='o.date_order' t-options='{ "widget": "date" }'/>
        </td>
        <td width="18%">Our Reference</td>
        <td width="25%">
          <span t-field='o.user_id'/>
        </td>
      </tr>
      <tr>
        <td>Customer No.</td>
        <td>
          <span t-field='o.partner_id.ref'/>
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

        <t t-if="o.requisition_id">
          <td>Purchase Contract</td>
          <td>
            <span t-field='o.requisition_id'/>
            <t t-if="o.requisition_id.partner_ref"> /              <span t-field='o.requisition_id.partner_ref'/>
            </t>
          </td>
        </t>

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

    <t t-if="o.note_header != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
      <span class="note" t-field="o.note_header"/>
    </t>

  </xpath>

  <!--
    <xpath expr="//h2" position="after">
    <div id="informations">
    <table width="100%">
      <tr>
        <td width="17%">Kunden-Nr.</td>
        <td width="41%">
          <span t-field="o.partner_id.ref"/>
        </td>
        <td width="17%">Datum</td>
        <td width="25%">
          <span t-field="o.date_order" t-options="{ &quot;widget&quot;: &quot;date&quot; }"/>
        </td>
      </tr>
      <tr>
        <td>Ihre Referenz</td>
        <td>
          <span t-field="o.partner_ref"/>
        </td>
        <td>Kontaktperson</td>
        <td>
          <span t-field="o.user_id"/>
        </td>
      </tr>
      <tr>
        <td/>
        <td/>
        <td>Mwst-Nr:</td>
        <td>
          <span t-field="res_company.vat"/> MWST
        </td>
      </tr>
    </table>
    </div> 
 </xpath>
  -->

</data>  
```
Source: [snippets/purchase.report_purchasequotation_document.add_infotable.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.add_infotable.xml)

### Append Payment Terms  
ID: `mint_system.purchase.report_purchasequotation_document.append_payment_terms`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="50">

<xpath expr="/t/t/div/div[4]" position="after">
    <div class="row">
      <div class="col">
        <t t-if="o.payment_term_id" name="payment_term">
            <strong>Payment Terms: </strong><span t-field="o.payment_term_id.name"/>
        </t>
      </div>
    </div>
  </xpath>

</data>

```
Source: [snippets/purchase.report_purchasequotation_document.append_payment_terms.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.append_payment_terms.xml)

### Format Address Blocks  
ID: `mint_system.purchase.report_purchasequotation_document.format_address_blocks`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="50">

  <xpath expr="//t[@t-set='address']/div" position="attributes">
    <attribute name="style">font-size:10pt; line-height: 1.2; padding-bottom:33mm;</attribute>
    <attribute name="t-options-fields">['address', 'name']</attribute>
  </xpath>

  <xpath expr="/t/t/t[4]/t/strong" position="replace">
    <div style="font-size:8pt; font-weight:bold">Shipping address:</div>
  </xpath>

  <xpath expr="/t/t/t[4]/t/div/span" position="replace">
  </xpath>

  <xpath expr="/t/t/t[4]/t/div/div" position="attributes">
    <attribute name="style">font-size:10pt; line-height: 1.2;</attribute>
    <attribute name="t-options-fields">['address', 'name']</attribute>
  </xpath>

</data>
```
Source: [snippets/purchase.report_purchasequotation_document.format_address_blocks.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.format_address_blocks.xml)

### Format As Date  
ID: `mint_system.purchase.report_purchasequotation_document.format_as_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="50">

  <xpath expr="//span[@t-field='order_line.date_planned']" position="attributes">
    <attribute name="t-options-widget">"date"</attribute>
  </xpath>

</data>

```
Source: [snippets/purchase.report_purchasequotation_document.format_as_date.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.format_as_date.xml)

### Format Date  
ID: `mint_system.purchase.report_purchasequotation_document.format_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="50">

  <xpath expr="//tbody[1]/t[1]/tr[1]/t[1]/td[2]/span[1]" position="attributes">
    <attribute name="t-options-widget">"date"</attribute>
  </xpath>

</data>

```
Source: [snippets/purchase.report_purchasequotation_document.format_date.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.format_date.xml)

### Format Qty With Decimal  
ID: `mint_system.purchase.report_purchasequotation_document.format_qty_with_decimal`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="50">

  <xpath expr="//span[@id='product_qty']" position="replace">
    <t t-if="line.product_uom.id == 1">
      <span id="product_qty" t-field="line.product_qty" t-options="{'widget': 'integer'}"/>
    </t>
    <t t-else="">
      <span id="product_qty" t-field="line.product_qty"/>
    </t>
  </xpath>

</data>
```
Source: [snippets/purchase.report_purchasequotation_document.format_qty_with_decimal.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.format_qty_with_decimal.xml)

### Format Qty  
ID: `mint_system.purchase.report_purchasequotation_document.format_qty`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="50">

  <xpath expr="//span[@t-field='order_line.product_qty']" position="replace">
    <t t-if="order_line.product_uom.id == 1">
      <span t-field="order_line.product_qty" t-options="{'widget': 'integer'}"/>
    </t>
  </xpath>
  
</data>
```
Source: [snippets/purchase.report_purchasequotation_document.format_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.format_qty.xml)

### Get Position  
ID: `mint_system.purchase.report_purchasequotation_document.get_position`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="50">

  <xpath expr="//table/thead/tr/th[1]" position="before">
    <th>
      <span>Pos</span>
    </th>
  </xpath>
  <xpath expr="//table/tbody/t/tr/t[1]/td[1]" position="before">
    <td>
      <span t-esc="order_line.position"/>
    </td>
  </xpath>

</data>

```
Source: [snippets/purchase.report_purchasequotation_document.get_position.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.get_position.xml)

### Header Margin  
ID: `mint_system.purchase.report_purchasequotation_document.header_margin`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="50">

  <xpath expr="/t/t/div/table" position="attributes">
    <attribute name="style" separator=";" add="margin-top: 2rem"/>
  </xpath>

</data>

```
Source: [snippets/purchase.report_purchasequotation_document.header_margin.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.header_margin.xml)

### Modify Main Table  
ID: `mint_system.purchase.report_purchasequotation_document.modify_main_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="50">

  <!-- replace product description -->
  <xpath expr="//table/tbody/t/tr/t[1]/td[3]/span" position="replace">
    <t>
      <span style="font-weight:bold;" t-field="order_line.product_id.type_description"/>
    </t>
  </xpath>

  <!-- add second row -->
  <xpath expr="//tbody//tr[1]" position="after">
    <tr>
      <td style="padding-bottom :10px; padding-left:3px; line-height: 1.2"></td>
      <td style="padding:0; padding-left:3px; line-height: 1.2"></td>
      <td style="padding:0; padding-left:3px; line-height: 1.2" colspan="4">
        <span t-field="order_line.name"/>
        <br/>
        <t t-if="order_line.product_id.country_of_origin_id.code">Ursprungsland: <span t-field="order_line.product_id.country_of_origin_id.code"/>
        </t>
        <t t-if="order_line.product_id.hs_code"> / Zollposition: <span t-field="order_line.product_id.hs_code"/>
        </t>
      </td>

    </tr>
    <tr style="border-bottom: 1px solid rgb(220,220,220)">
      <td colspan="8"></td>
    </tr>
  </xpath>

  <xpath expr="//table[2]" position="attributes">
    <attribute name="style">color: black; font-size:9pt</attribute>
    <attribute name="class">table table-borderless table-sm </attribute>
  </xpath>

  <!-- header -->
  <xpath expr="//table[2]/thead" position="attributes">
    <attribute name="style">color: black; font-size:9pt; border-top-style:solid; border-bottom-style:solid; border-width:1px; border-color:black</attribute>
  </xpath>

  <!-- Header: position -->
  <xpath expr="//table[2]/thead/tr/th[1]" position="attributes">
    <attribute name="style">width: 20px</attribute>/>
  </xpath>

  <!-- header: default code -->
  <xpath expr="//table/thead/tr/th[2]" position="attributes">
    <attribute name="style">width: 100px; text-align: right; padding-right: 10px</attribute>
  </xpath>

  <!-- header: description -->
  <xpath expr="//table/thead/tr/th[3]" position="attributes">
    <attribute name="style">width: 400px;</attribute>
  </xpath>

  <!-- header: date_planned -->
  <xpath expr="//table/thead/tr/th[4]" position="attributes">
    <attribute name="class" separator=" " add="text-left" remove="text-center"/>
  </xpath>

  <!-- position -->
  <xpath expr="//table/tbody/t/tr/t[1]/td[1]" position="attributes">
    <attribute name="style">text-align: right;</attribute>/>
  </xpath>

  <!-- default code -->
  <xpath expr="//table/tbody/t/tr/t[1]/td[2]" position="attributes">
    <attribute name="style">text-align: right; padding-right: 10px</attribute>
  </xpath>

  <!-- date_planned -->
  <xpath expr="//table/tbody/t/tr/t[1]/td[4]" position="attributes">
    <attribute name="class" separator=" " add="text-left" remove="text-center"/>
  </xpath>
  <xpath expr="//table/tbody/t/tr/t[1]/td[4]/span[1]" position="attributes">
    <attribute name="t-options-widget">"date"</attribute>
  </xpath>

  <!-- qty -->
  <xpath expr="//table/tbody/t/tr/t[1]/td[5]/span" position="replace">
    <span style="font-weight: bold" t-esc="'%g' % order_line.product_qty"/>
  </xpath>


  <xpath expr="//table[2]" position="after">
    <t t-if="o.note_footer != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
      <span class="note" t-field="o.note_footer"/>
    </t>
    <table class="table table-borderless table-sm" style="margin-top:20px; color:black; font-family: arial; font-size:9pt; border-top-style:solid; border-bottom-style:solid; border-width:1px; border-color:black">
      
      <tr >
        <td style="width:15.5%; text-align:left">
          <Strong>Warenwert</Strong>
        </td>
        <td style="width:23%; text-align:left">
          <span t-field="o.currency_id"/>
        </td>
        <td style="width:12%; text-align:left"></td>
        <td style="width:17%; text-align:left">         
        </td>
        <td style="width:14%; text-align:right">
          <Strong>Bestellbetrag</Strong>
        </td>
        <td style="width:18%; text-align:right" class="text-right">
          <span t-field="o.currency_id"/>
        </td>
      </tr>

    </table>    
  </xpath>

</data>
```
Source: [snippets/purchase.report_purchasequotation_document.modify_main_table.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.modify_main_table.xml)

### Remove Date Planned  
ID: `mint_system.purchase.report_purchasequotation_document.remove_date_planned`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="50">

  <xpath expr="//th[@name='th_expected_date']" position="replace">
  </xpath>

  <xpath expr="//span[@t-field='order_line.date_planned']/.." position="replace">
  </xpath>

</data>
```
Source: [snippets/purchase.report_purchasequotation_document.remove_date_planned.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.remove_date_planned.xml)

### Remove Incoterms  
ID: `mint_system.purchase.report_purchasequotation_document.remove_incoterms`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="50">

  <xpath expr="//p[@t-field='o.incoterm_id.code']/.." position="replace"/>

  <!--
  <xpath expr="/t[1]/t[1]/div[1]/div[2]/div[1]/strong[1]" position="replace"/>
  <xpath expr="/t[1]/t[1]/div[1]/div[2]/div[1]/p[1]" position="replace"/>
  -->

</data>

```
Source: [snippets/purchase.report_purchasequotation_document.remove_incoterms.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.remove_incoterms.xml)

### Remove Vat  
ID: `mint_system.purchase.report_purchasequotation_document.remove_vat`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="50">>

    <xpath expr="//t[@t-set='address']/p" position="replace">
    </xpath>

</data>
```
Source: [snippets/purchase.report_purchasequotation_document.remove_vat.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.remove_vat.xml)

### Repeat Table Header  
ID: `mint_system.purchase.report_purchasequotation_document.repeat_table_header`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="50">

  <xpath expr="//thead[@style='display: table-row-group']" position="attributes">
    <attribute name="style"/>
  </xpath>

</data>
```
Source: [snippets/purchase.report_purchasequotation_document.repeat_table_header.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.repeat_table_header.xml)

### Replace Partner Id  
ID: `mint_system.purchase.report_purchasequotation_document.replace_partner_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="50">

  <xpath expr="//t[@t-set='address']/div" position="replace">
    <div style="font-size:10pt; line-height: 1.2; padding-bottom:33mm">
      <t t-if="o.partner_order_id.parent_name">
        <div t-field="o.partner_order_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: False}" name="purchase_order_id"/>
      </t>
      <t t-if="not o.partner_order_id.parent_name">
        <div t-field="o.partner_order_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: False}" name="purchase_order_id"/>
      </t>
    </div>
  </xpath>

</data>
```
Source: [snippets/purchase.report_purchasequotation_document.replace_partner_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.replace_partner_id.xml)

### Replace Product Description  
ID: `mint_system.purchase.report_purchasequotation_document.replace_product_description`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="50">

  <xpath expr="//td[@id='product']" position="replace">
      <td id="product">
        <span class="o_bold" t-field="order_line.product_id.name"/><br/>
        <span t-field="order_line.name"/>  
      </td>
  </xpath>
  
</data>
```
Source: [snippets/purchase.report_purchasequotation_document.replace_product_description.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.replace_product_description.xml)

### Row Date Align Left  
ID: `mint_system.purchase.report_purchasequotation_document.row_date_align_left`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="50">

  <xpath expr="//table/thead/tr/th[2]" position="attributes">
    <attribute name="class" separator=" " add="text-left" remove="text-center"/>
  </xpath>
  <xpath expr="//table/tbody/t/tr/t[1]/td[2]" position="attributes">
    <attribute name="class" separator=" " add="text-left" remove="text-center"/>
  </xpath>

</data>
```
Source: [snippets/purchase.report_purchasequotation_document.row_date_align_left.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.row_date_align_left.xml)

### Sequence In Table  
ID: `mint_system.purchase.report_purchasequotation_document.sequence_in_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="50">

  <xpath expr="//table[1]/thead/tr/th[1]" position="before">
    <th>
      <span>Pos</span>
    </th>
  </xpath>

  <xpath expr="//tr[@t-foreach='lines']" position="before">
    <t t-set="index" t-value="1"/>
  </xpath>

  <xpath expr="//table[1]/tbody/tr/td[1]" position="before">
    <td>
      <span t-esc="index"/><t t-set="index" t-value="index+1"/>
    </td>
  </xpath>

</data>

```
Source: [snippets/purchase.report_purchasequotation_document.sequence_in_table.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.sequence_in_table.xml)

### Set Ids  
ID: `mint_system.purchase.report_purchasequotation_document.set_ids`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="50">

	<xpath expr="//span[@t-field='line.product_qty']" position="attributes">
		<attribute name="id">product_qty</attribute>
	</xpath>

</data>
```
Source: [snippets/purchase.report_purchasequotation_document.set_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.set_ids.xml)

### Style Moser  
ID: `mint_system.purchase.report_purchasequotation_document.style_moser`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="60">

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
		</style>
	</xpath>

	<xpath expr="//th[@name='th_description']" position="attributes">
		<attribute name="style" separator=" " add="text-align: left"/>
	</xpath>

	<xpath expr="//span[@t-field='order_line.date_planned']" position="attributes">
		<attribute name="t-options-widget">"date"</attribute>
	</xpath>

	<xpath expr="//div[1]/div[1]" position="attributes">
		<attribute name="t-options-fields">['address']</attribute>
	</xpath>

	<xpath expr="//div[@t-field='o.partner_id']" position="attributes">
		<attribute name="t-options-fields">['address', 'name']</attribute>
	</xpath>

</data>
```
Source: [snippets/purchase.report_purchasequotation_document.style_moser.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.style_moser.xml)

### Style Trimada  
ID: `mint_system.purchase.report_purchasequotation_document.style_trimada`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="60">

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

	<xpath expr="//table[2]" position="attributes">
		<attribute name="class" separator=" " add="trimada table-borderless"/>
	</xpath>

  	<xpath expr="//div[@name='information_block']" position="attributes">
		<attribute name="class" separator=" " add="trimada table-borderless"/>
	</xpath>

</data>
```
Source: [snippets/purchase.report_purchasequotation_document.style_trimada.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.style_trimada.xml)

### Terms And Conditions  
ID: `mint_system.purchase.report_purchasequotation_document.terms_and_conditions`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="50">

  <xpath expr="/t/t/div/div[3]" position="after">
    <div class="row">
      <div class="col">
        <b>Terms and Conditions:</b>
        <ul>
          <li>An order confirmation is required within 5 working days</li>
          <li>The delivery date is the day of arrival at <span t-field="res_company.name"/></li>
          <li>Partial deliveries only after prior release</li>
          <li>If the confirmed delivery date is not respected, <span t-field="res_company.name"/> is applying a penalty of 2% of the order value, until max. 10%</li>
        </ul>
      </div>
    </div>
  </xpath>

</data>

```
Source: [snippets/purchase.report_purchasequotation_document.terms_and_conditions.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.terms_and_conditions.xml)

### Title Margin  
ID: `mint_system.purchase.report_purchasequotation_document.title_margin`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="50">

  <xpath expr="//div/h2[1]" position="attributes">
    <attribute name="style" separator=";" add="margin-top: 2rem"/>
  </xpath>

</data>
```
Source: [snippets/purchase.report_purchasequotation_document.title_margin.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.title_margin.xml)

### X Warranty  
ID: `mint_system.purchase.report_purchasequotation_document.x_warranty`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.report_purchasequotation_document" priority="50">

  <xpath expr="//td[@id='product']" position="inside">
    <br/>
    <span t-field="order_line.product_id.x_warranty"/>
  </xpath>

</data>
```
Source: [snippets/purchase.report_purchasequotation_document.x_warranty.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.report_purchasequotation_document.x_warranty.xml)

## View Purchase Order Filter  
### Add State  
ID: `mint_system.purchase.view_purchase_order_filter.add_state`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.view_purchase_order_filter" priority="50">

  <xpath expr="//filter[@name='order_date']" position="after">
     <filter string="Status" name="order_state" domain="[]" context="{'group_by': 'state'}"/>
  </xpath> 

</data>
```
Source: [snippets/purchase.view_purchase_order_filter.add_state.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.view_purchase_order_filter.add_state.xml)

### Modify Product Id  
ID: `mint_system.purchase.view_purchase_order_filter.modify_product_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="purchase.view_purchase_order_filter" priority="50">

  <xpath expr="//field[@name='product_id']" position="replace">
     <field name="product_id" filter_domain="['|','|',('order_line.product_id', 'ilike', self),('order_line.product_id.type_description', 'ilike', self),('order_line.product_id.type_description2', 'ilike', self)]"/>
  </xpath>

</data>
```
Source: [snippets/purchase.view_purchase_order_filter.modify_product_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/purchase.view_purchase_order_filter.modify_product_id.xml)

