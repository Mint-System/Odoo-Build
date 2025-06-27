# Purchase
## Mail Notification Confirm  
### Modify Buttons  
ID: `mint_system.purchase.mail_notification_confirm.modify_buttons`  
```xml
<data inherit_id="purchase.mail_notification_confirm" priority="50">
    <xpath expr="//t[1]/a/.." position="replace">
        <t t-if="record._name == 'purchase.order' and record.env.context.get('is_reminder')">
            <a t-att-href="record.get_confirm_url(confirm_type='reminder')" style="margin-right: 10px; background-color: #875A7B; padding: 8px 16px 8px 16px; text-decoration: none; color: #fff; border-radius: 5px; font-size:13px;">
                    We have no update
            </a>
            <div>&amp;nbsp;</div>
            <br/>
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
Source: [snippets/purchase.mail_notification_confirm.modify_buttons.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.mail_notification_confirm.modify_buttons.xml)

## Purchase Order Form  
### Add Qty To Invoice  
ID: `mint_system.purchase.purchase_order_form.add_qty_to_invoice`  
```xml
<data inherit_id="purchase.purchase_order_form" priority="50">
    <xpath expr="//page[@name='products']//tree/field[@name='date_planned']" position="after">
        <field name="qty_to_invoice" optional="hide"/>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_form.add_qty_to_invoice.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_form.add_qty_to_invoice.xml)

### Add X Comment  
ID: `mint_system.purchase.purchase_order_form.add_x_comment`  
```xml
<data inherit_id="purchase.purchase_order_form" priority="50">
    <xpath expr="//field[@name='user_id']" position="after">
        <field name="x_comment"/>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_form.add_x_comment.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_form.add_x_comment.xml)

### Date Planned Readonly  
ID: `mint_system.purchase.purchase_order_form.date_planned_readonly`  
```xml
<data inherit_id="purchase.purchase_order_form" priority="50">
    <xpath expr="//div[@name='date_planned_div']/field[@name='date_planned']" position="attributes">
        <attribute name="attrs">{'readonly': True}</attribute>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_form.date_planned_readonly.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_form.date_planned_readonly.xml)

### Filter Customer Is Company  
ID: `mint_system.purchase.purchase_order_form.filter_customer_is_company`  
```xml
<data inherit_id="purchase.purchase_order_form" priority="50">
    <xpath expr="//group[1]/group[1]/field[2]" position="replace">
        <field name="partner_id" widget="res_partner_many2one" domain="[('is_company', '=', True)]" context="{'res_partner_search_mode': 'supplier', 'show_vat': True, 'default_is_company': 'True'}" placeholder="Name, TIN, Email, or Reference"/>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_form.filter_customer_is_company.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_form.filter_customer_is_company.xml)

### Format Dates  
ID: `mint_system.purchase.purchase_order_form.format_dates`  
```xml
<data inherit_id="purchase.purchase_order_form" priority="50">
    <xpath expr="//field[@name='date_order']" position="attributes">
        <attribute name="options">{"show_time":false}</attribute>
        <attribute name="widget">datetime</attribute>
    </xpath>
    <xpath expr="//field[@name='date_approve']" position="attributes">
        <attribute name="options">{"show_time":false}</attribute>
        <attribute name="widget">datetime</attribute>
    </xpath>
    <xpath expr="//tree/field[@name='date_planned']" position="attributes">
        <attribute name="options">{"show_time":false}</attribute>
        <attribute name="widget">datetime</attribute>
    </xpath>
    <xpath expr="//div/field[@name='date_planned']" position="attributes">
        <attribute name="options">{"show_time":false}</attribute>
        <attribute name="widget">datetime</attribute>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_form.format_dates.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_form.format_dates.xml)

### Modify Readonly Date Approve  
ID: `mint_system.purchase.purchase_order_form.modify_readonly_date_approve`  
```xml
<data inherit_id="purchase.purchase_order_form" priority="50">
    <xpath expr="//field[@name='date_approve']" position="attributes">
        <attribute name="readonly">0</attribute>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_form.modify_readonly_date_approve.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_form.modify_readonly_date_approve.xml)

### Modify Readonly Invoice Status  
ID: `mint_system.purchase.purchase_order_form.modify_readonly_invoice_status`  
```xml
<data inherit_id="purchase.purchase_order_form" priority="50">
    <xpath expr="//field[@name='invoice_status']" position="attributes">
        <attribute name="attrs">{"readonly": False}</attribute>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_form.modify_readonly_invoice_status.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_form.modify_readonly_invoice_status.xml)

### Modify Readonly Partner Ref  
ID: `mint_system.purchase.purchase_order_form.modify_readonly_partner_ref`  
```xml
<data inherit_id="purchase.purchase_order_form" priority="50">
    <xpath expr="//field[@name='partner_ref']" position="attributes">
        <attribute name="readonly">0</attribute>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_form.modify_readonly_partner_ref.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_form.modify_readonly_partner_ref.xml)

### Modify Readonly Partner Shipping Id  
ID: `mint_system.purchase.purchase_order_form.modify_readonly_partner_shipping_id`  
```xml
<data inherit_id="purchase.purchase_order_form" priority="50">
    <xpath expr="//field[@name='partner_shipping_id']" position="attributes">
        <attribute name="readonly">0</attribute>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_form.modify_readonly_partner_shipping_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_form.modify_readonly_partner_shipping_id.xml)

### Modify Visibility Button Confirm Reminder Mail  
ID: `mint_system.purchase.purchase_order_form.modify_visibility_button_confirm_reminder_mail`  
```xml
<data inherit_id="purchase.purchase_order_form" priority="50">
    <xpath expr="//button[@name='confirm_reminder_mail']" position="attributes">
        <attribute name="groups">base.group_user</attribute>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_form.modify_visibility_button_confirm_reminder_mail.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_form.modify_visibility_button_confirm_reminder_mail.xml)

### Relocate Product Qty And Uom  
ID: `mint_system.purchase.purchase_order_form.relocate_product_qty_and_uom`  
```xml
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
Source: [snippets/purchase.purchase_order_form.relocate_product_qty_and_uom.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_form.relocate_product_qty_and_uom.xml)

### Remove Optional Qty Received  
ID: `mint_system.purchase.purchase_order_form.remove_optional_qty_received`  
```xml
<data inherit_id="purchase.purchase_order_form" priority="50">
    <xpath expr="//field[@name='qty_received']" position="attributes">
        <attribute name="optional"/>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_form.remove_optional_qty_received.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_form.remove_optional_qty_received.xml)

### Show Dest Address Id  
ID: `mint_system.purchase.purchase_order_form.show_dest_address_id`  
```xml
<data inherit_id="purchase.purchase_order_form" priority="50">
    <xpath expr="//page[@name='purchase_delivery_invoice']//field[@name='company_id']" position="after">
        <field name="dest_address_id"/>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_form.show_dest_address_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_form.show_dest_address_id.xml)

### Show Move Dest  
ID: `mint_system.purchase.purchase_order_form.show_move_dest`  
```xml
<data inherit_id="purchase.purchase_order_form" priority="50">
    <xpath expr="//field[@name='order_line']/tree//field[@name='price_unit']" position="after">
        <field name="move_ids" widget="many2many" optional="hide"/>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_form.show_move_dest.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_form.show_move_dest.xml)

### Show Procurement Group  
ID: `mint_system.purchase.purchase_order_form.show_procurement_group`  
```xml
<data inherit_id="purchase.purchase_order_form" priority="50">
    <xpath expr="//field[@name='origin']" position="after">
        <field name="group_id"/>
    </xpath>
    <xpath expr="//field[@name='order_line']/tree//field[@name='price_unit']" position="after">
        <field name="group_id" optional="hide"/>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_form.show_procurement_group.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_form.show_procurement_group.xml)

### X Drawing File  
ID: `mint_system.purchase.purchase_order_form.x_drawing_file`  
```xml
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
Source: [snippets/purchase.purchase_order_form.x_drawing_file.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_form.x_drawing_file.xml)

### X Group Ids  
ID: `mint_system.purchase.purchase_order_form.x_group_ids`  
```xml
<data inherit_id="purchase.purchase_order_form" priority="50">
    <field name="user_id" position="after">
        <field name="x_group_ids" widget="many2many_tags"/>
    </field>
</data>

```
Source: [snippets/purchase.purchase_order_form.x_group_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_form.x_group_ids.xml)

### X Is Hidden  
ID: `mint_system.purchase.purchase_order_form.x_is_hidden`  
```xml
<data inherit_id="purchase.purchase_order_form" priority="50">
    <xpath expr="//field[@name='user_id']" position="after">
        <field name="x_is_hidden" groups="purchase.group_purchase_executives"/>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_form.x_is_hidden.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_form.x_is_hidden.xml)

### X Payment State  
ID: `mint_system.purchase.purchase_order_form.x_payment_state`  
```xml
<data inherit_id="purchase.purchase_order_form" priority="50">
    <xpath expr="//field[@name='picking_type_id']" position="after">
        <field name="x_payment_state"/>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_form.x_payment_state.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_form.x_payment_state.xml)

### X Recurring Inverval  
ID: `mint_system.purchase.purchase_order_form.x_recurring_inverval`  
```xml
<data inherit_id="purchase.purchase_order_form" priority="50">
    <field name="order_type" position="after">
        <field name="x_recurring_inverval"/>
    </field>
</data>

```
Source: [snippets/purchase.purchase_order_form.x_recurring_inverval.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_form.x_recurring_inverval.xml)

## Purchase Order Kpis Tree  
### Add Comment  
ID: `mint_system.purchase.purchase_order_kpis_tree.add_comment`  
```xml
<data inherit_id="purchase.purchase_order_kpis_tree" priority="50">
    <xpath expr="//field[@name='date_order']" position="after">
        <field name="comment" optional="show"/>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_kpis_tree.add_comment.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_kpis_tree.add_comment.xml)

### Add Date Planned  
ID: `mint_system.purchase.purchase_order_kpis_tree.add_date_planned`  
```xml
<data inherit_id="purchase.purchase_order_kpis_tree" priority="50">
    <xpath expr="//field[@name='date_order']" position="after">
        <field string="Lieferdatum" widget="date" name="date_planned" decoration-danger="date_planned &lt; current_date"/>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_kpis_tree.add_date_planned.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_kpis_tree.add_date_planned.xml)

### Add Mail Reception Confirmed  
ID: `mint_system.purchase.purchase_order_kpis_tree.add_mail_reception_confirmed`  
```xml
<data inherit_id="purchase.purchase_order_kpis_tree" priority="50">
    <xpath expr="//field[@name='invoice_status']" position="after">
        <field name="mail_reception_confirmed" optional="show"/>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_kpis_tree.add_mail_reception_confirmed.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_kpis_tree.add_mail_reception_confirmed.xml)

### Add Receipt Status  
ID: `mint_system.purchase.purchase_order_kpis_tree.add_receipt_status`  
```xml
<data inherit_id="purchase.purchase_order_kpis_tree" priority="50">
    <xpath expr="//field[@name='state']" position="after">
        <field name="receipt_status" decoration-success="receipt_status=='full'" decoration-danger="receipt_status=='pending'" decoration-warning="receipt_status=='partial'"/>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_kpis_tree.add_receipt_status.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_kpis_tree.add_receipt_status.xml)

### Format Date Order  
ID: `mint_system.purchase.purchase_order_kpis_tree.format_date_order`  
```xml
<data inherit_id="purchase.purchase_order_kpis_tree" priority="50">
    <xpath expr="//field[@name='date_order']" position="attributes">
        <attribute name="widget">date</attribute>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_kpis_tree.format_date_order.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_kpis_tree.format_date_order.xml)

### X Payment State  
ID: `mint_system.purchase.purchase_order_kpis_tree.x_payment_state`  
```xml
<data inherit_id="purchase.purchase_order_kpis_tree" priority="50">
    <xpath expr="//field[@name='invoice_status']" position="before">
        <field name="x_payment_state" decoration-success="x_payment_state=='paid'" decoration-danger="x_payment_state=='not_paid'" decoration-warning="x_payment_state=='in_payment'" widget="badge"/>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_kpis_tree.x_payment_state.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_kpis_tree.x_payment_state.xml)

## Purchase Order Line Tree  
### Reset View  
ID: `mint_system.purchase.purchase_order_line_tree.reset_view`  
```xml
<data inherit_id="purchase.purchase_order_line_tree" priority="50">
    <field name="name" position="replace">
    </field>
    <field name="price_unit" position="replace">
    </field>
    <field name="discount" position="replace">
    </field>
    <field name="order_id" position="after">
        <field name="x_origin"/>
    </field>
    <field name="order_id" position="after">
        <field name="x_state"/>
    </field>
    <field name="product_id" position="after">
        <field name="x_user_id"/>
    </field>
    <field name="partner_id" position="after">
        <field name="x_partner_ref"/>
    </field>
    <field name="date_planned" position="after">
        <field name="x_date_approve"/>
    </field>
    <field name="product_qty" position="after">
        <field name="qty_invoiced"/>
    </field>
    <field name="product_qty" position="after">
        <field name="qty_received"/>
    </field>
</data>

```
Source: [snippets/purchase.purchase_order_line_tree.reset_view.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_line_tree.reset_view.xml)

## Purchase Order View Search  
### Add Invoice Status  
ID: `mint_system.purchase.purchase_order_view_search.add_invoice_status`  
```xml
<data inherit_id="purchase.purchase_order_view_search" priority="50">
    <xpath expr="//filter[@name='order_date']" position="after">
        <filter string="Invoice Status" name="invoice_state" domain="[]" context="{'group_by': 'invoice_status'}"/>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_view_search.add_invoice_status.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_view_search.add_invoice_status.xml)

### Modify Product Id  
ID: `mint_system.purchase.purchase_order_view_search.modify_product_id`  
```xml
<data inherit_id="purchase.purchase_order_view_search" priority="50">
    <xpath expr="//field[@name='product_id']" position="replace">
        <field name="product_id" filter_domain="['|','|',('order_line.product_id', 'ilike', self),('order_line.product_id.type_description', 'ilike', self),('order_line.product_id.type_description2', 'ilike', self)]"/>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_view_search.modify_product_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_view_search.modify_product_id.xml)

## Purchase Order View Tree  
### Add Mail Reception Confirmed  
ID: `mint_system.purchase.purchase_order_view_tree.add_mail_reception_confirmed`  
```xml
<data inherit_id="purchase.purchase_order_view_tree" priority="50">
    <xpath expr="//field[@name='invoice_status']" position="after">
        <field name="mail_reception_confirmed" optional="show"/>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_view_tree.add_mail_reception_confirmed.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_view_tree.add_mail_reception_confirmed.xml)

### Format State  
ID: `mint_system.purchase.purchase_order_view_tree.format_state`  
```xml
<data inherit_id="purchase.purchase_order_view_tree" priority="50">
    <xpath expr="//field[@name='state']" position="attributes">
        <attribute name="invisible">0</attribute>
        <attribute name="widget">badge</attribute>
        <attribute name="decoration-success">state == 'purchase' or state == 'done'</attribute>
        <attribute name="decoration-warning">state == 'to approve'</attribute>
        <attribute name="decoration-info">state == 'draft' or state == 'sent'</attribute>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_view_tree.format_state.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_view_tree.format_state.xml)

### X Payment Tree  
ID: `mint_system.purchase.purchase_order_view_tree.x_payment_tree`  
```xml
<data inherit_id="purchase.purchase_order_view_tree" priority="50">
    <xpath expr="//field[@name='invoice_status']" position="before">
        <field name="x_payment_state" decoration-success="x_payment_state=='paid'" decoration-danger="x_payment_state=='not_paid'" decoration-warning="x_payment_state=='in_payment'" widget="badge"/>
    </xpath>
</data>

```
Source: [snippets/purchase.purchase_order_view_tree.x_payment_tree.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.purchase_order_view_tree.x_payment_tree.xml)

## Report Purchaseorder Document  
### Add Address Copy  
ID: `mint_system.purchase.report_purchaseorder_document.add_address copy`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

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


					<span style="font-size: 7pt">Lieferadresse</span>
					<hr class="company_invoice_line"/>

					<div>
						<t>
							<div t-field="o.picking_type_id.warehouse_id.partner_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}"/>
						</t>
					</div>

				</td>
				<td style="width: 70px"/>
				<td style="width: 260px; vertical-align: top">
					<span style="font-size: 7pt">Rechnungsadresse</span>
					<hr class="company_invoice_line"/>
					<div>
						<t>
							<div t-field="o.company_id.partner_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}"/>
						</t>
					</div>
				</td>
			</tr>
		</table>


		<table name="detailed_information" style="margin-left: 0px; margin-top: 20px; margin-bottom: 50px; border: transparent; line-height: 1.3">

			<tr>
				<td style="width: 120px; vertical-align: top; padding-left: 5mm;">
					<t t-if="o.picking_type_id.warehouse_id.partner_id.vat">
						<div>USt-IdNr.</div>
					</t>
					<t t-if="o.picking_type_id.warehouse_id.partner_id.x_vat">
						<div>MWST Nr.</div>
					</t>
					<t t-if="o.picking_type_id.warehouse_id.partner_id.x_eori">
						<div>EORI Nr.</div>
					</t>
					<t t-if="o.picking_type_id.warehouse_id.partner_id.x_zaz">
						<div>ZAZ Konto Nr.</div>
					</t>
				</td>
				<td style="width: 180px; vertical-align: top">
					<t t-if="o.picking_type_id.warehouse_id.partner_id.vat">
						<div t-field="o.picking_type_id.warehouse_id.partner_id.vat"/>
					</t>
					<t t-if="o.picking_type_id.warehouse_id.partner_id.x_vat">
						<div t-field="o.picking_type_id.warehouse_id.partner_id.x_vat"/>
					</t>
					<t t-if="o.picking_type_id.warehouse_id.partner_id.x_eori">
						<div t-field="o.picking_type_id.warehouse_id.partner_id.x_eori"/>
					</t>
					<t t-if="o.picking_type_id.warehouse_id.partner_id.x_zaz">
						<div t-field="o.picking_type_id.warehouse_id.partner_id.x_zaz"/>
					</t>
				</td>
			</tr>

		</table>

	</xpath>
</data>
```
Source: [snippets/purchase.report_purchaseorder_document.add_address copy.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.add_address copy.xml)

### Add Agreement  
ID: `mint_system.purchase.report_purchaseorder_document.add_agreement`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="/t/t/div/div[2]/div[4]" position="after">
        <div t-if="o.requisition_id" class="col-3 bm-2">
            <strong>Purchase Agreement:</strong>
            <p t-field="o.requisition_id.display_name" class="m-0"/>
        </div>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.add_agreement.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.add_agreement.xml)

### Add Date Approve  
ID: `mint_system.purchase.report_purchaseorder_document.add_date_approve`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="/t/t/div/div/div[3]" position="replace">
        <div t-if="o.user_id" class="col-3 bm-2">
            <strong>Order Date:</strong>
            <p t-field="o.date_approve" class="m-0" t-options="{ &quot;widget&quot;: &quot;date&quot; }"/>
        </div>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.add_date_approve.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.add_date_approve.xml)

### Add Date Planned  
ID: `mint_system.purchase.report_purchaseorder_document.add_date_planned`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

    <xpath expr="//th[@name='th_description']" position="after">
        <th name="th_date_planned" class="text-start">
            <strong>Date planned</strong>
        </th>
    </xpath>
    <xpath expr="//td[@id='product']" position="after">
        <td class="text-start">
            <span t-field="line.date_planned" t-options="{'widget': 'date'}"/>
        </td>
    </xpath>

</data>


```
Source: [snippets/purchase.report_purchaseorder_document.add_date_planned.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.add_date_planned.xml)

### Add Discount  
ID: `mint_system.purchase.report_purchaseorder_document.add_discount`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="//th[@name='th_price_unit']" position="after">
        <th name="th_discount" class="text-end">
            <strong>Discount</strong>
        </th>
    </xpath>
    <xpath expr="//td/span[@t-field='line.price_unit']/.." position="after">
        <td id="td_discount" class="text-end">
            <span t-out="line.discount" t-options="{&quot;widget&quot;: &quot;integer&quot;}"/><span> %</span>
        </td>
    </xpath>
</data>
```
Source: [snippets/purchase.report_purchaseorder_document.add_discount.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.add_discount.xml)

### Add Email  
ID: `mint_system.purchase.report_purchaseorder_document.add_email`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="/t[1]/t[1]/div[1]/div[2]/div[1]/p[1]" position="after">
        <span t-field="o.user_id.email"/>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.add_email.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.add_email.xml)

### Add Footer  
ID: `mint_system.purchase.report_purchaseorder_document.add_footer`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="//div[@class='oe_structure']/.." position="after">
        <style>
      table#footer {
        width: 100%;
        font-size: 8pt;
        margin-top: 25px;
        border-color: white;
      }
      table#footer tr, td {
        vertical-align: top;
      }
    </style>
        <table id="footer">
            <tr>
                <td width="40%" t-if="o.payment_term_id.note">
                    <span>Zahlungsbedingungen </span>
                    <span t-field="o.payment_term_id"/>
                </td>
                <td width="60%">
                    <span>Lieferung gem&#xE4;ss unseren allgemeinen Einkaufsbedingungen</span>
                </td>
            </tr>
            <tr>
                <td>
                    <span>MWST-Nr: </span>
                    <span t-field="o.company_id.vat"/>
                </td>
            </tr>
        </table>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.add_footer.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.add_footer.xml)

### Add Infotable  
ID: `mint_system.purchase.report_purchaseorder_document.add_infotable`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="//div[@id='informations']" position="before">
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
                <td width="17%">Oder Date</td>
                <td width="40%">
                    <t t-if="o.date_approve">
                        <span id="date_approve" t-field="o.date_approve" t-options="{ &quot;widget&quot;: &quot;date&quot; }"/>
                    </t>
                    <t t-else="">
                        <span t-field="o.date_order" t-options="{ &quot;widget&quot;: &quot;date&quot; }"/>
                    </t>
                </td>
                <td width="18%">Our Reference</td>
                <td width="25%">
                    <span t-field="o.user_id"/>
                </td>
            </tr>
            <tr>
                <td>Customer No.</td>
                <td>
                    <span t-field="o.partner_id.ref"/>
                </td>
                <td>Incoterm</td>
                <td>
                    <span t-field="o.incoterm_id"/>
                </td>
            </tr>
            <tr>
                <td/>
                <td>
                    <span t-field="o.partner_ref"/>
                </td>
                <t t-if="o.requisition_id">
                    <td>Purchase Contract</td>
                    <td>
                        <span t-field="o.requisition_id"/>
                        <t t-if="o.requisition_id.partner_ref"> /              <span t-field="o.requisition_id.partner_ref"/>
            </t>
                    </td>
                </t>
            </tr>
            <tr>
                <td>Reference</td>
                <td>
                    <span t-field="o.comment"/>
                </td>
                <td/>
                <td/>
            </tr>
        </table>
        <t t-if="o.note_header != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
            <span class="note" t-field="o.note_header"/>
        </t>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.add_infotable.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.add_infotable.xml)

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
Source: [snippets/purchase.report_purchaseorder_document.add_taxes.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.add_taxes.xml)

### Append Incoterm  
ID: `mint_system.purchase.report_purchaseorder_document.append_incoterm`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="//div[@id='total']" position="after">
        <div class="row">
            <div class="col">
                <span t-if="o.incoterm_id.display_name">
           Lieferbedingungen: <strong t-field="o.incoterm_id.display_name"/>
        </span>
            </div>
        </div>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.append_incoterm.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.append_incoterm.xml)

### Append Payment Terms  
ID: `mint_system.purchase.report_purchaseorder_document.append_payment_terms`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="//div[@id='total']" position="after">
        <div class="row" style="margin-top: 1rem; margin-bottom: 1rem">
            <div class="col">
                <t t-if="o.payment_term_id" name="payment_term">
                    <strong>Payment Terms: </strong>
                    <span t-field="o.payment_term_id.name"/>
                </t>
            </div>
        </div>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.append_payment_terms.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.append_payment_terms.xml)

### Date Created  
ID: `mint_system.purchase.report_purchaseorder_document.date_created`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="/t/t/div/div[2]/div[2]" position="after">
        <div t-if="o.create_date" class="col-3 bm-2">
            <strong>Date Created:</strong>
            <p t-field="o.create_date" t-options="{&quot;widget&quot;: &quot;date&quot;}" class="m-0"/>
        </div>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.date_created.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.date_created.xml)

### Format Address Blocks  
ID: `mint_system.purchase.report_purchaseorder_document.format_address_blocks`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="//t[@t-set='address']/div" position="attributes">
        <attribute name="style">font-size:10pt; line-height: 1.2; padding-bottom:33mm;</attribute>
        <attribute name="t-options-fields">['address', 'name']</attribute>
    </xpath>
    <xpath expr="/t/t/t[4]/t/strong" position="replace">
        <div style="font-size:8pt; font-weight:bold; padding-bottom: 5px">Shipping address:</div>
    </xpath>
    <xpath expr="/t/t/t[4]/t/div/span" position="replace">
  </xpath>
    <xpath expr="/t/t/t[4]/t/div/div" position="attributes">
        <attribute name="style">font-size:10pt; line-height: 1.2;</attribute>
        <attribute name="t-options-fields">['address', 'name']</attribute>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.format_address_blocks.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.format_address_blocks.xml)

### Format As Date  
ID: `mint_system.purchase.report_purchaseorder_document.format_as_date`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="/t[1]/t[1]/div[1]/div[2]/div[3]/p[1]" position="attributes">
        <attribute name="t-options-widget">"date"</attribute>
    </xpath>
    <xpath expr="//table[1]/tbody[1]/t[2]/tr[1]/t[1]/td[3]/span[1]" position="attributes">
        <attribute name="t-options-widget">"date"</attribute>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.format_as_date.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.format_as_date.xml)

### Format Date  
ID: `mint_system.purchase.report_purchaseorder_document.format_date`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">&gt;

  <xpath expr="//tbody//td/span[@t-field='line.date_planned']" position="attributes"><attribute name="t-options-widget">"date"</attribute></xpath>

</data>

```
Source: [snippets/purchase.report_purchaseorder_document.format_date.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.format_date.xml)

### Format Qty  
ID: `mint_system.purchase.report_purchaseorder_document.format_qty`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="//span[@t-field='order_line.product_qty']" position="replace">
        <t t-if="order_line.product_uom.id == 1">
            <span t-field="order_line.product_qty" t-options="{'widget': 'integer'}"/>
        </t>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.format_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.format_qty.xml)

### Format Qty With Decimal  
ID: `mint_system.purchase.report_purchaseorder_document.format_qty_with_decimal`  
```xml
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
Source: [snippets/purchase.report_purchaseorder_document.format_qty_with_decimal.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.format_qty_with_decimal.xml)

### Format Title  
ID: `mint_system.purchase.report_purchaseorder_document.format_title`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">&gt;

  <xpath expr="//div/h2[1]" position="attributes"><attribute name="style">color: black; margin-top: 2rem</attribute></xpath>
  
  <xpath expr="//div/h2[2]" position="attributes"><attribute name="style">color: black; margin-top: 2rem</attribute></xpath>
  
  <xpath expr="//div/h2[3]" position="attributes"><attribute name="style">color: black; margin-top: 2rem</attribute></xpath>

</data>

```
Source: [snippets/purchase.report_purchaseorder_document.format_title.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.format_title.xml)

### Format Total  
ID: `mint_system.purchase.report_purchaseorder_document.format_total`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="//div[@id='total']/div" position="attributes">
        <attribute name="class"/>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.format_total.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.format_total.xml)

### General Information  
ID: `mint_system.purchase.report_purchaseorder_document.general_information`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

    <xpath expr="//p[@t-field='o.notes']" position="after">
       
            <t t-if="o.company_id.id == 1">
                <table style="margin-left: 0px; margin-top: 30px; border: transparent">
                    <tr>
                        <td style="width: 335px; font-size: 6pt; padding-bottom: 0px">
                            <span>Es gelten die Allgemeinen Einkaufsbedingungen der Lapp Engineering AG.</span><br/>
                            <span>Aktuelle Version siehe www.lappengineering.com</span>
                        </td>
                    </tr>
                </table>
            </t>
                
             <t t-if="o.company_id.id == 2">
                <table style="margin-left: 0px; margin-top: 30px; border: transparent">
                    <tr>
                        <td style="width: 325px; font-size: 6pt; padding-bottom: 0px">
                            <span>Es gelten die Allgemeinen Einkaufsbedingungen der Xinomer AG.</span><br/>
                            <span>Aktuelle Version siehe www.xinomer.ch</span>
                        </td>
                    </tr>
                </table>
            </t>

    </xpath>
	
</data>
```
Source: [snippets/purchase.report_purchaseorder_document.general_information.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.general_information.xml)

### Get Position  
ID: `mint_system.purchase.report_purchaseorder_document.get_position`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="//table/thead/tr/th[1]" position="before">
        <th>
            <strong>Pos</strong>
        </th>
    </xpath>
    <xpath expr="//table/tbody/t/tr/t[1]/td[1]" position="before">
        <td>
            <span t-esc="line.position"/>
        </td>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.get_position.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.get_position.xml)

### Header Margin  
ID: `mint_system.purchase.report_purchaseorder_document.header_margin`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="/t/t/div/table" position="attributes">
        <attribute name="style" separator=";" add="margin-top: 2rem"/>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.header_margin.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.header_margin.xml)

### Hide Taxes  
ID: `mint_system.purchase.report_purchaseorder_document.hide_taxes`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

    <xpath expr="//th[@name='th_taxes']" position="replace">
        <t t-set="display_tax" t-value="any(l.taxes_id for l in o.order_line)"/>
        <th name="th_taxes" t-if="display_tax">
            <strong>Taxes</strong>
        </th>
    </xpath>

    <xpath expr="//td[@name='td_taxes']" position="replace">
        <t t-set="display_tax" t-value="any(l.taxes_id for l in o.order_line)"/>
        <td name="td_taxes" t-if="display_tax" t-attf-class="text-end {{ 'text-nowrap' if len(taxes) &lt; 10 else '' }}">
            <span t-out="taxes">Tax 15%</span>
        </td>
    </xpath>

</data>
```
Source: [snippets/purchase.report_purchaseorder_document.hide_taxes.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.hide_taxes.xml)

### Modify Main Table  
ID: `mint_system.purchase.report_purchaseorder_document.modify_main_table`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <!-- add default_code   -->
    <xpath expr="//table/thead/tr/th[1]" position="after">
        <th>
            <strong>Artikel Nr.</strong>
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
    <xpath expr="//table[@class='table table-sm o_main_table table-borderless mt-4']" position="attributes">
        <attribute name="style">width: 100%; font-size:9pt</attribute>
        <attribute name="class">table table-borderless table-sm</attribute>
    </xpath>
    <!-- header-->
    <xpath expr="//table[@class='table table-borderless table-sm']/thead/tr" position="attributes">
        <attribute name="style">border-top:solid 1px; border-bottom: solid 1px; color: black; font-weight:bold;</attribute>
    </xpath>
    <!-- header: position -->
    <xpath expr="//table[@class='table table-borderless table-sm']/thead/tr/th[1]" position="attributes">
        <attribute name="style">width: 5mm</attribute>
    </xpath>
    <!-- header: default code -->
    <xpath expr="//table[@class='table table-borderless table-sm']/thead/tr/th[2]" position="attributes">
        <attribute name="style">width: 27mm; text-align: right; padding-right: 10px</attribute>
    </xpath>
    <!-- header: description -->
    <xpath expr="//table[@class='table table-borderless table-sm']/thead/tr/th[3]" position="attributes">
        <attribute name="style">text-align: left; width: 73mm</attribute>
    </xpath>
    <!-- header: commitment date -->
    <xpath expr="//table[@class='table table-borderless table-sm']/thead/tr/th[5]" position="attributes">
        <attribute name="class" separator=" " add="text-start" remove="text-center"/>
    </xpath>
    <!-- header: qty -->
    <xpath expr="//table[@class='table table-borderless table-sm']/thead/tr/th[5]" position="attributes">
        <attribute name="style">text-align: right; padding-right: 5px</attribute>
    </xpath>
    <!-- position -->
    <xpath expr="//table[@class='table table-borderless table-sm']/tbody/t[2]/tr/t[1]/td[1]" position="attributes">
        <attribute name="style">text-align: right</attribute>
    </xpath>
    <!-- default code -->
    <xpath expr="//table[@class='table table-borderless table-sm']/tbody/t[2]/tr/t[1]/td[2]" position="attributes">
        <attribute name="style">text-align: right; padding-right: 10px;</attribute>
    </xpath>
    <!-- remove taxes -->
    <xpath expr="//thead/tr[1]/th[4]" position="replace"/>
    <xpath expr="//tbody/t[2]/tr[1]/t[1]/td[4]" position="replace"/>
    <!-- commitment date -->
    <xpath expr="//table[@class='table table-borderless table-sm']/tbody/t[2]/tr/t[1]/td[4]" position="attributes">
        <attribute name="class">text-start</attribute>
        <attribute name="t-options-widget">"date"</attribute>
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
        <span t-esc="'%g' % line.price_unit if str(line.price_unit)[::-1].find('.') &gt;= 3 else '%.2f' % line.price_unit"/>
    </xpath>
    <!-- note footer -->
    <xpath expr="//table[@class='table table-borderless table-sm']" position="after">
        <t t-if="o.note_footer != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
            <span class="note" t-field="o.note_footer"/>
        </t>
    </xpath>
    <!-- Summary -->
    <xpath expr="//div[@id='total']" position="attributes">
        <attribute name="style">font-size:9pt;</attribute>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.modify_main_table.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.modify_main_table.xml)

### Product Description Replace  
ID: `mint_system.purchase.report_purchaseorder_document.product_description_replace`  
```xml
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
Source: [snippets/purchase.report_purchaseorder_document.product_description_replace.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.product_description_replace.xml)

### Product Hide Bracket Description  
ID: `mint_system.purchase.report_purchaseorder_document.product_hide_bracket_description`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="//td[@id='product']" position="replace">
        <td id="product">
            <span t-esc="line.name.split('(')[0].strip()"/>
        </td>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.product_hide_bracket_description.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.product_hide_bracket_description.xml)

### Qty Remaining  
ID: `mint_system.purchase.report_purchaseorder_document.qty_remaining`  
```xml
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
Source: [snippets/purchase.report_purchaseorder_document.qty_remaining.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.qty_remaining.xml)

### Remove Informations  
ID: `mint_system.purchase.report_purchaseorder_document.remove_informations`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="//div[@id='informations']" position="replace">
</xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.remove_informations.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.remove_informations.xml)

### Remove Summary Table  
ID: `mint_system.purchase.report_purchaseorder_document.remove_summary_table`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="//div[@id='total']" position="replace">
</xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.remove_summary_table.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.remove_summary_table.xml)

### Remove Taxes  
ID: `mint_system.purchase.report_purchaseorder_document.remove_taxes`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="//th[@name='th_taxes']" position="replace"/>
    <xpath expr="//td[@name='td_taxes']" position="replace"/>
</data>
```
Source: [snippets/purchase.report_purchaseorder_document.remove_taxes.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.remove_taxes.xml)

### Remove User Id  
ID: `mint_system.purchase.report_purchaseorder_document.remove_user_id`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="//p[@t-field='o.user_id']/.." position="replace">
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.remove_user_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.remove_user_id.xml)

### Remove Vat  
ID: `mint_system.purchase.report_purchaseorder_document.remove_vat`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="//p[@t-if='o.partner_id.vat']" position="replace">
</xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.remove_vat.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.remove_vat.xml)

### Rename Deadline  
ID: `mint_system.purchase.report_purchaseorder_document.rename_deadline`  
```xml
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
Source: [snippets/purchase.report_purchaseorder_document.rename_deadline.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.rename_deadline.xml)

### Replace Address And Information Block  
ID: `mint_system.purchase.report_purchaseorder_document.replace_address_and_information_block`  
```xml
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
Source: [snippets/purchase.report_purchaseorder_document.replace_address_and_information_block.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.replace_address_and_information_block.xml)

### Replace Informations  
ID: `mint_system.purchase.report_purchaseorder_document.replace_informations`  
```xml
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
        <table id="info">
            <tr>
                <td width="17%">Oder Date</td>
                <td width="40%">
                    <t t-if="o.date_approve">
                        <span id="date_approve" t-field="o.date_approve" t-options="{ &quot;widget&quot;: &quot;date&quot; }"/>
                    </t>
                    <t t-else="">
                        <span t-field="o.date_order" t-options="{ &quot;widget&quot;: &quot;date&quot; }"/>
                    </t>
                </td>
                <td width="18%">Our Reference</td>
                <td width="25%">
                    <span t-field="o.user_id"/>
                </td>
            </tr>
            <tr>
                <td>Customer No.</td>
                <td>
                    <span t-field="o.partner_id.ref"/>
                </td>
                <td>Incoterm</td>
                <td>
                    <span t-field="o.incoterm_id"/>
                </td>
            </tr>
            <tr>
                <td/>
                <td>
                    <span t-field="o.partner_ref"/>
                </td>
                <t t-if="o.requisition_id">
                    <td>Purchase Contract</td>
                    <td>
                        <span t-field="o.requisition_id"/>
                        <t t-if="o.requisition_id.partner_ref"> /              <span t-field="o.requisition_id.partner_ref"/>
            </t>
                    </td>
                </t>
            </tr>
            <tr>
                <td>Reference</td>
                <td>
                    <span t-field="o.comment"/>
                </td>
                <td/>
                <td/>
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
Source: [snippets/purchase.report_purchaseorder_document.replace_informations.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.replace_informations.xml)

### Replace Informations2  
ID: `mint_system.purchase.report_purchaseorder_document.replace_informations2`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

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
                <t t-if="o.date_approve">
                    <td width="200px">Date</td>
                    <td width="500px">
                        <span id="date_order" t-field="o.date_approve" t-options="{ &quot;widget&quot;: &quot;date&quot; }"/>
                    </td>
                </t>
            </tr>
             <tr>
                <t t-if="o.date_planned">
                    <td>Delivery Date</td>
                    <td>
                        <span t-field="o.date_planned"/>
                    </td>
                </t>
            </tr>
            <tr>
                <t t-if="o.partner_ref">
                    <td>Your Reference</td>
                    <td>
                        <span t-field="o.partner_ref"/>
                    </td>
                </t>
            </tr>
            <tr>
                <t t-if="o.partner_id.parent_id">
                    <td>Your Contact</td>
                    <td>
                        <span t-field="o.partner_id.name"/>
                    </td>
                </t>
            </tr>
            
            <tr>
                <t t-if="o.incoterm_id">
                    <td>Incoterm</td>
                    <td>
                        <span t-field="o.incoterm_id.name"/>
                    </td>
                </t>
            </tr>
            <tr>
                <t t-if="o.payment_term_id">
                    <td>Payment terms</td>
                    <td>
                        <span t-field="o.payment_term_id"/>
                    </td>
                </t>
            </tr>
            <tr>
                <t t-if="o.user_id">
                    <td>Our Contact</td>
                    <td>
                        <span t-field="o.user_id"/>
                        <t t-if="o.user_id.email">
                           ,                            <span t-field="o.user_id.email"/>
                        </t>
                        <t t-if="o.user_id.phone">
                           ,                            <span t-field="o.user_id.phone"/>
                        </t>
                    </td>
                </t>
            </tr>
        </table>      
    </xpath>
</data>
```
Source: [snippets/purchase.report_purchaseorder_document.replace_informations2.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.replace_informations2.xml)

### Replace Partner Id  
ID: `mint_system.purchase.report_purchaseorder_document.replace_partner_id`  
```xml
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
Source: [snippets/purchase.report_purchaseorder_document.replace_partner_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.replace_partner_id.xml)

### Replace Product Description  
ID: `mint_system.purchase.report_purchaseorder_document.replace_product_description`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="//td[@id='product']" position="replace">
        <td id="product">
            <span class="o_bold" t-field="line.product_id.name"/>
            <br/>
            <span t-field="line.name"/>
        </td>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.replace_product_description.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.replace_product_description.xml)

### Replace Representative  
ID: `mint_system.purchase.report_purchaseorder_document.replace_representative`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="//div[@id='informations']//p[@t-field='o.user_id']" position="replace">
        <p t-field="o.user_id.email"/>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.replace_representative.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.replace_representative.xml)

### Replace Taxes Id  
ID: `mint_system.purchase.report_purchaseorder_document.replace_taxes_id`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="//thead//th[@name='th_taxes']" position="replace"/>
    <xpath expr="//thead//th[@name='th_amount']" position="before">
        <th name="th_taxes" class="text-right">
            <strong>Taxes</strong>
        </th>
    </xpath>
    <xpath expr="//tbody//td[@name='td_taxes']" position="replace"/>
    <xpath expr="//tbody//span[@t-field='line.price_subtotal']/.." position="before">
        <td name="td_taxes" class="text-right">
            <span t-esc="', '.join(map(lambda x: (x.description or x.name), line.taxes_id))"/>
        </td>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.replace_taxes_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.replace_taxes_id.xml)

### Round Price  
ID: `mint_system.purchase.report_purchaseorder_document.round_price`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="//tbody//span[@t-field='line.price_unit']" position="replace">
        <span t-esc="'%g' % line.price_unit if str(line.price_unit)[::-1].find('.') &gt;= 3 else '%.2f' % line.price_unit"/>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.round_price.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.round_price.xml)

### Row Date Align Left  
ID: `mint_system.purchase.report_purchaseorder_document.row_date_align_left`  
```xml
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
Source: [snippets/purchase.report_purchaseorder_document.row_date_align_left.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.row_date_align_left.xml)

### Second Row  
ID: `mint_system.purchase.report_purchaseorder_document.second_row`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">

    <xpath expr="//td[@id='product']/../.." position="after">
        <t t-if="line.position">
            <tr style="border-top: solid white !important">
                <td/>
                <td colspan="5">
                    <span t-field="line.name"/>
                    <t t-if="line.product_id.hs_code">
                        <br/>
                        <span>HS-Code: </span><br/>
                        <span t-field="line.product_id.hs_code"/>
                    </t>
                </td>
                <td/>
            </tr>
        </t>
    </xpath>

    <xpath expr="//td[@id='product']" position="replace">
        <td name="td_name">
            <strong t-field="line.product_id"/>
        </td>
    </xpath>

</data>
```
Source: [snippets/purchase.report_purchaseorder_document.second_row.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.second_row.xml)

### Sequence In Table  
ID: `mint_system.purchase.report_purchaseorder_document.sequence_in_table`  
```xml
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
            <span t-esc="index"/>
            <t t-set="index" t-value="index+1"/>
        </td>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.sequence_in_table.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.sequence_in_table.xml)

### Set Ids  
ID: `mint_system.purchase.report_purchaseorder_document.set_ids`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="//span[@t-field='line.product_qty']" position="attributes">
        <attribute name="id">product_qty</attribute>
    </xpath>
    <xpath expr="//span[@t-field='line.product_uom.name']" position="attributes">
        <attribute name="id">product_uom</attribute>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.set_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.set_ids.xml)

### Show Seller Product  
ID: `mint_system.purchase.report_purchaseorder_document.show_seller_product`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <!-- <t t-foreach="line.product_id.seller_ids" t-as="seller">
      <span t-field="seller.name"/>
  </t> -->
    <xpath expr="//tbody/t[2]/tr/t[1]/td[1]/span" position="after"><t t-set="seller" t-value="line.product_id.seller_ids.browse(o.partner_id.id)"/>
    Product Code: <span t-field="seller.product_code"/>
    Product Name: <span t-field="seller.product_name"/>
  </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.show_seller_product.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.show_seller_product.xml)

### Sort By Name  
ID: `mint_system.purchase.report_purchaseorder_document.sort_by_name`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="//span[@t-field='line.product_qty']" position="attributes">
        <attribute name="id">product_qty</attribute>
    </xpath>
    <xpath expr="//span[@t-field='line.product_uom.name']" position="attributes">
        <attribute name="id">product_uom</attribute>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.sort_by_name.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.sort_by_name.xml)

### Style Airwork  
ID: `mint_system.purchase.report_purchaseorder_document.style_airwork`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="60">
    <xpath expr="//div[hasclass('page')]" position="before">
        <style>
        h2 {
            color: black;
        }
        .o_company_1_layout.o_report_layout_boxed h2 span {
            color: black;
        }
        </style>
    </xpath>
    
    <xpath expr="//table[2]" position="attributes">
        <attribute name="class">table table-sm o_main_table  mt-4</attribute>
    </xpath>    

    <xpath expr="//th[@name='th_description']" position="attributes">
        <attribute name="class">text-start</attribute>
    </xpath>

</data>
```
Source: [snippets/purchase.report_purchaseorder_document.style_airwork.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.style_airwork.xml)

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
        h2 {
               font-size: 1.5rem;
              }
        </style>
    </xpath>
    <xpath expr="//p[@t-field='o.date_order']" position="attributes">
        <attribute name="t-options-widget">"date"</attribute>
    </xpath>
    <xpath expr="//span[@t-field='line.date_planned']" position="attributes">
        <attribute name="t-options-widget">"date"</attribute>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.style_carbo_link.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.style_carbo_link.xml)

### Style Gelso  
ID: `mint_system.purchase.report_purchaseorder_document.style_gelso`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="//th[@name='th_description']" position="attributes">
        <attribute name="class">text-start</attribute>
        <attribute name="style" separator=" " add="width: 350px"/>
    </xpath>

    <xpath expr="//span[@t-field='line.date_planned']" position="attributes">
        <attribute name="t-options">{'widget': 'date'}</attribute>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.style_gelso.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.style_gelso.xml)

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
Source: [snippets/purchase.report_purchaseorder_document.style_moser.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.style_moser.xml)

### Style Tissa  
ID: `mint_system.purchase.report_purchaseorder_document.style_tissa`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
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
				color: black;
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
			#th_description {
			  text-align: left;
			}
		</style>
    </xpath>
    <xpath expr="//div[@t-field='o.picking_type_id.warehouse_id.partner_id']" position="attributes">
        <attribute name="t-options">{"widget": "contact", "fields": ["address"], "no_marker": True, "phone_icons": False}</attribute>
    </xpath>
    <xpath expr="//div[@t-field='o.partner_id']" position="attributes">
        <attribute name="t-options">{"widget": "contact", "fields": ["address", "name"], "no_marker": True, "phone_icons": False}</attribute>
    </xpath>
    <xpath expr="//th[@name='th_description']" position="attributes">
        <attribute name="style">text-align: left</attribute>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.style_tissa.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.style_tissa.xml)

### Style Trimada  
ID: `mint_system.purchase.report_purchaseorder_document.style_trimada`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="//div[hasclass('page')]" position="before">
        <style>
		.o_company_1_layout {
  			font-family: arial;
		}			
		</style>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.style_trimada.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.style_trimada.xml)

### Style Xinomer  
ID: `mint_system.purchase.report_purchaseorder_document.style_xinomer`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="60">

	<xpath expr="//h2" position="attributes">
		<attribute name="style">color: black; font-size:13pt; font-weight:bold; margin-top:10mm; margin-bottom:3mm</attribute>
	</xpath>

	<xpath expr="//table[@class='table table-sm o_main_table table-borderless mt-4']" position="attributes">
		<attribute name="class">table table-sm o_main_table mt-4 custom-border</attribute>
		<attribute name="style">border-top-width: 1px</attribute>
	</xpath>

	<xpath expr="//th[1]" position="attributes">
		<attribute name="class">text-start</attribute>
	</xpath>

	<xpath expr="//th[@name='th_description']" position="attributes">
		<attribute name="class">text-start</attribute>
	</xpath>

	<xpath expr="//th[@name='th_taxes']" position="attributes">
		<attribute name="class">text-end</attribute>
	</xpath>

	<xpath expr="//tbody//td/span[@t-field='line.date_planned']" position="attributes">
		<attribute name="t-options-widget">"date"</attribute>
	</xpath>

</data>
```
Source: [snippets/purchase.report_purchaseorder_document.style_xinomer.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.style_xinomer.xml)

### Terms And Conditions  
ID: `mint_system.purchase.report_purchaseorder_document.terms_and_conditions`  
```xml
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
Source: [snippets/purchase.report_purchaseorder_document.terms_and_conditions.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.terms_and_conditions.xml)

### Title Margin  
ID: `mint_system.purchase.report_purchaseorder_document.title_margin`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="/t/t/div/div[1]" position="attributes">
        <attribute name="style" separator=";" add="margin-top: 2rem"/>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.title_margin.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.title_margin.xml)

### X Warranty  
ID: `mint_system.purchase.report_purchaseorder_document.x_warranty`  
```xml
<data inherit_id="purchase.report_purchaseorder_document" priority="50">
    <xpath expr="//td[@id='product']" position="inside">
        <br/>
        <span t-field="line.product_id.x_warranty"/>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchaseorder_document.x_warranty.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchaseorder_document.x_warranty.xml)

## Report Purchasequotation Document  
### Add Default Code  
ID: `mint_system.purchase.report_purchasequotation_document.add_default_code`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">
    <xpath expr="//thead/tr/th[1]" position="after">
        <th>
            <strong>Artikel Nr.</strong>
        </th>
    </xpath>
    <xpath expr="//tbody/t/tr/t[1]/td[1]" position="after">
        <td>
            <span t-field="order_line.product_id.default_code"/>
        </td>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.add_default_code.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.add_default_code.xml)

### Add Footer  
ID: `mint_system.purchase.report_purchasequotation_document.add_footer`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">
    <xpath expr="//div[@class='oe_structure']/.." position="after">
        <style>
      table#footer {
        width: 100%;
        font-size: 8pt;
        margin-top: 25px;
        border-color: white;
      }
      table#footer tr, td {
        vertical-align: top;
      }
    </style>
        <table id="footer">
            <tr>
                <td width="40%" t-if="o.payment_term_id.note">
                    <span>Zahlungsbedingungen </span>
                    <span t-field="o.payment_term_id"/>
                </td>
                <td width="60%">
                    <span>Lieferung gem&#xE4;ss unseren allgemeinen Einkaufsbedingungen</span>
                </td>
            </tr>
            <tr>
                <td>
                    <span>MWST-Nr: </span>
                    <span t-field="o.company_id.vat"/>
                </td>
            </tr>
        </table>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.add_footer.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.add_footer.xml)

### Add Infoblock  
ID: `mint_system.purchase.report_purchasequotation_document.add_infoblock`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">
    <xpath expr="//h2" position="after">
        <div id="infoblock" class="row mt32 mb32">
            <div t-if="o.user_id" class="col-3 bm-2">
                <strong>Buyer</strong>
                <p t-field="o.user_id.email" class="m-0"/>
            </div>
            <div class="col-2 bm-2">
                <strong>Date</strong>
                <p t-field="o.write_date" class="m-0" t-options="{ &quot;widget&quot;: &quot;date&quot; }"/>
            </div>
            <div t-if="o.partner_ref" class="col-3 bm-2">
                <strong>Your Order Reference</strong>
                <p t-field="o.partner_ref" class="m-0"/>
            </div>
            <div t-if="o.date_order" class="col-3 bm-2">
                <strong>Deadline for submission of offer</strong>
                <p t-field="o.date_order" class="m-0" t-options="{ &quot;widget&quot;: &quot;date&quot; }"/>
            </div>
            <div t-if="o.incoterm_id" class="col-3 bm-2">
                <strong>Incoterm</strong>
                <p t-field="o.incoterm_id.code" class="m-0"/>
            </div>
        </div>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.add_infoblock.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.add_infoblock.xml)

### Add Informations2  
ID: `mint_system.purchase.report_purchasequotation_document.add_informations2`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">
    <xpath expr="//h2" position="after">

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
        <table id="info">
            <tr>
                <td width="20%">Oder Date</td>
                <td width="30%">
                    <t t-if="o.date_approve">
                        <span id="date_approve" t-field="o.date_approve" t-options="{ &quot;widget&quot;: &quot;date&quot; }"/>
                    </t>
                    <t t-else="">
                        <span t-field="o.date_order" t-options="{ &quot;widget&quot;: &quot;date&quot; }"/>
                    </t>
                </td>
                <td width="20%">Incoterm</td>
                <td width="30%">
                    <span t-field="o.incoterm_id"/>
                </td>
            </tr>
            <tr>
                <td>Customer No.</td>
                <td>
                    <span t-field="o.partner_ref"/>
                </td>
                <td>Payment terms</td>
                <td>
                    <span t-field="o.payment_term_id"/>
                </td>
            </tr>
            <tr>
                <t t-if="o.partner_id.parent_id">
                    <td>Your Reference</td>
                    <td>
                        <span t-field="o.partner_id.name"/>
                    </td>
                </t>
                <t t-else="">
                    <td></td>
                    <td></td>
                </t>
                <td>Our Reference</td>
                <td width="25%">
                    <span t-field="o.user_id"/>
,                         
                    <span t-field="o.user_id.email"/>
,                         
                    <span t-field="o.user_id.phone"/>
                </td>
            </tr>
        </table>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.add_informations2.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.add_informations2.xml)

### Add Infotable  
ID: `mint_system.purchase.report_purchasequotation_document.add_infotable`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">
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
                <td width="17%">Order Deadline</td>
                <td width="40%">
                    <span t-field="o.date_order" t-options="{ &quot;widget&quot;: &quot;date&quot; }"/>
                </td>
                <td width="18%">Our Reference</td>
                <td width="25%">
                    <span t-field="o.user_id"/>
                </td>
            </tr>
            <tr>
                <td>Customer No.</td>
                <td>
                    <span t-field="o.partner_id.ref"/>
                </td>
                <td>Incoterm</td>
                <td>
                    <span t-field="o.incoterm_id"/>
                </td>
            </tr>
            <tr>
                <td/>
                <td>
                    <span t-field="o.partner_ref"/>
                </td>
                <t t-if="o.requisition_id">
                    <td>Purchase Contract</td>
                    <td>
                        <span t-field="o.requisition_id"/>
                        <t t-if="o.requisition_id.partner_ref"> /              <span t-field="o.requisition_id.partner_ref"/>
            </t>
                    </td>
                </t>
            </tr>
            <tr>
                <td>Reference</td>
                <td>
                    <span t-field="o.comment"/>
                </td>
                <td/>
                <td/>
            </tr>
        </table>
        <t t-if="o.note_header != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
            <span class="note" t-field="o.note_header"/>
        </t>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.add_infotable.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.add_infotable.xml)

### Append Payment Terms  
ID: `mint_system.purchase.report_purchasequotation_document.append_payment_terms`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">
    <xpath expr="/t/t/div/table" position="after">
        <div class="row" style="margin-top: 1rem; margin-bottom: 1rem">
            <div class="col">
                <t t-if="o.payment_term_id" name="payment_term">
                    <strong>Zahlungsbedingungen: </strong>
                    <span t-field="o.payment_term_id.name"/>
                </t>
            </div>
        </div>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.append_payment_terms.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.append_payment_terms.xml)

### Format Address Blocks  
ID: `mint_system.purchase.report_purchasequotation_document.format_address_blocks`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">
    <xpath expr="//t[@t-set='address']/div" position="attributes">
        <attribute name="style">font-size:10pt; line-height: 1.2; padding-bottom:33mm;</attribute>
        <attribute name="t-options-fields">['address', 'name']</attribute>
    </xpath>
    <xpath expr="//div/div/div[1]" position="after">
        <t t-set="information_block">
            <div style="font-weight: bold; font-size:8pt; padding-bottom: 5px">Shipping address:</div>
            <div style="font-size:10pt; line-height: 1.2">
                <div t-field="o.picking_type_id.warehouse_id.partner_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;], &quot;no_marker&quot;: True, &quot;phone_icons&quot;: False}"/>
            </div>
        </t>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.format_address_blocks.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.format_address_blocks.xml)

### Format As Date  
ID: `mint_system.purchase.report_purchasequotation_document.format_as_date`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">
    <xpath expr="//span[@t-field='order_line.date_planned']" position="attributes">
        <attribute name="t-options-widget">"date"</attribute>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.format_as_date.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.format_as_date.xml)

### Format Date  
ID: `mint_system.purchase.report_purchasequotation_document.format_date`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">
    <xpath expr="//tbody//td/span[@t-field='order_line.date_planned']" position="attributes">
        <attribute name="t-options-widget">"date"</attribute>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.format_date.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.format_date.xml)

### Format Qty  
ID: `mint_system.purchase.report_purchasequotation_document.format_qty`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">
    <xpath expr="//span[@t-field='order_line.product_qty']" position="replace">
        <t t-if="order_line.product_uom.id == 1">
            <span t-field="order_line.product_qty" t-options="{'widget': 'integer'}"/>
        </t>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.format_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.format_qty.xml)

### Format Qty With Decimal  
ID: `mint_system.purchase.report_purchasequotation_document.format_qty_with_decimal`  
```xml
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
Source: [snippets/purchase.report_purchasequotation_document.format_qty_with_decimal.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.format_qty_with_decimal.xml)

### Format Title  
ID: `mint_system.purchase.report_purchasequotation_document.format_title`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">>

  <xpath expr="//div/h2[1]" position="attributes">
    <attribute name="style">color: black; margin-top: 2rem</attribute>
  </xpath>

</data>
```
Source: [snippets/purchase.report_purchasequotation_document.format_title.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.format_title.xml)

### Get Position  
ID: `mint_system.purchase.report_purchasequotation_document.get_position`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">
    <xpath expr="//table/thead/tr/th[1]" position="before">
        <th class="text-start">
            <strong>Pos</strong>
        </th>
    </xpath>
    <xpath expr="//table/tbody/t/tr/t[1]/td[1]" position="before">
        <td>
            <span t-esc="order_line.position"/>
        </td>
    </xpath>
</data>
```
Source: [snippets/purchase.report_purchasequotation_document.get_position.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.get_position.xml)

### Header Margin  
ID: `mint_system.purchase.report_purchasequotation_document.header_margin`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">;

  <xpath expr="//div/h2[1]" position="attributes"><attribute name="style">color: black; margin-top: 2rem</attribute></xpath>

</data>

```
Source: [snippets/purchase.report_purchasequotation_document.header_margin.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.header_margin.xml)

### Hide Incoterm  
ID: `mint_system.purchase.report_purchasequotation_document.hide_incoterm`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">
    <xpath expr="//div[@t-if='o.incoterm_id']" position="replace"/>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.hide_incoterm.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.hide_incoterm.xml)

### Modify Main Table  
ID: `mint_system.purchase.report_purchasequotation_document.modify_main_table`  
```xml
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
            <td style="padding-bottom :10px; padding-left:3px; line-height: 1.2"/>
            <td style="padding:0; padding-left:3px; line-height: 1.2"/>
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
            <td colspan="8"/>
        </tr>
    </xpath>
    <xpath expr="//table[2]" position="attributes">
        <attribute name="style">color: black; font-size:9pt; font-family: arial</attribute>
        <attribute name="class">table table-borderless table-sm </attribute>
    </xpath>
    <!-- header -->
    <xpath expr="//table[2]/thead" position="attributes">
        <attribute name="style">color: black; font-size:9pt; border-top-style:solid; border-bottom-style:solid; border-width:1px; border-color:black</attribute>
    </xpath>
    <!-- Header: position -->
    <xpath expr="//table[2]/thead/tr/th[1]" position="attributes"><attribute name="style">width: 20px</attribute>/&gt;
  </xpath>
    <!-- header: default code -->
    <xpath expr="//table/thead/tr/th[2]" position="attributes">
        <attribute name="style">width: 100px; text-align: right; padding-right: 10px</attribute>
    </xpath>
    <!-- header: description -->
    <xpath expr="//table/thead/tr/th[3]" position="attributes">
        <attribute name="style">width: 400px;</attribute>
        <attribute name="class" separator=" " add="text-start" remove="text-center"/>
    </xpath>
    <!-- header: date_planned -->
    <xpath expr="//table/thead/tr/th[4]" position="attributes">
        <attribute name="class" separator=" " add="text-left" remove="text-center"/>
    </xpath>
    <!-- position -->
    <xpath expr="//table/tbody/t/tr/t[1]/td[1]" position="attributes"><attribute name="style">text-align: right;</attribute>/&gt;
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
            <tr>
                <td style="width:15.5%; text-align:left">
                    <Strong>Warenwert</Strong>
                </td>
                <td style="width:23%; text-align:left">
                    <span t-field="o.currency_id"/>
                </td>
                <td style="width:12%; text-align:left"/>
                <td style="width:17%; text-align:left">         
        </td>
                <td style="width:14%; text-align:right">
                    <Strong>Bestellbetrag</Strong>
                </td>
                <td style="width:18%; text-align:right" class="text-end">
                    <span t-field="o.currency_id"/>
                </td>
            </tr>
        </table>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.modify_main_table.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.modify_main_table.xml)

### Product Hide Bracket Description  
ID: `mint_system.purchase.report_purchasequotation_document.product_hide_bracket_description`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">
    <xpath expr="//td[@id='product']" position="replace">
        <td id="product">
            <span t-esc="order_line.name.split('(')[0].strip()"/>
        </td>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.product_hide_bracket_description.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.product_hide_bracket_description.xml)

### Qty With Decimal  
ID: `mint_system.purchase.report_purchasequotation_document.qty_with_decimal`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">
    <xpath expr="//span[@id='product_qty']" position="replace">
        <t t-if="order_line.product_uom.id == 1">
            <span id="product_qty" t-field="order_line.product_qty" t-options="{'widget': 'integer'}"/>
        </t>
        <t t-else="">
            <span id="product_qty" t-field="order_line.product_qty"/>
        </t>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.qty_with_decimal.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.qty_with_decimal.xml)

### Remove Date Planned  
ID: `mint_system.purchase.report_purchasequotation_document.remove_date_planned`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">
    <xpath expr="//th[@name='th_expected_date']" position="replace">
  </xpath>
    <xpath expr="//span[@t-field='order_line.date_planned']/.." position="replace">
  </xpath>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.remove_date_planned.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.remove_date_planned.xml)

### Remove Incoterms  
ID: `mint_system.purchase.report_purchasequotation_document.remove_incoterms`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">
    <xpath expr="//div[@id='informations']" position="replace"/>
    <!--
    <xpath expr="/t[1]/t[1]/div[1]/div[2]/div[1]/strong[1]" position="replace"/>
    <xpath expr="/t[1]/t[1]/div[1]/div[2]/div[1]/p[1]" position="replace"/>
    -->
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.remove_incoterms.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.remove_incoterms.xml)

### Remove Vat  
ID: `mint_system.purchase.report_purchasequotation_document.remove_vat`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">&gt;

    <xpath expr="//t[@t-set='address']/p" position="replace">
    </xpath>

</data>

```
Source: [snippets/purchase.report_purchasequotation_document.remove_vat.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.remove_vat.xml)

### Repeat Table Header  
ID: `mint_system.purchase.report_purchasequotation_document.repeat_table_header`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">
    <xpath expr="//thead[@style='display: table-row-group']" position="attributes">
        <attribute name="style"/>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.repeat_table_header.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.repeat_table_header.xml)

### Replace Informations2  
ID: `mint_system.purchase.report_purchasequotation_document.replace_informations2`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">
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
        <table id="info">
            <tr>
                <td width="20%">Oder Date</td>
                <td width="30%">
                    <t t-if="o.date_approve">
                        <span id="date_approve" t-field="o.date_approve" t-options="{ &quot;widget&quot;: &quot;date&quot; }"/>
                    </t>
                    <t t-else="">
                        <span t-field="o.date_order" t-options="{ &quot;widget&quot;: &quot;date&quot; }"/>
                    </t>
                </td>
                <td width="20%">Incoterm</td>
                <td width="30%">
                    <span t-field="o.incoterm_id"/>
                </td>
            </tr>
            <tr>
                <td>Customer No.</td>
                <td>
                    <span t-field="o.partner_ref"/>
                </td>
                <td>Payment terms</td>
                <td>
                    <span t-field="o.payment_term_id"/>
                </td>
            </tr>
            <tr>
                <t t-if="o.partner_id.parent_id">
                    <td>Your Reference</td>
                    <td>
                        <span t-field="o.partner_id.name"/>
                    </td>
                    <td>Our Reference</td>
                    <td width="25%">
                        <span t-field="o.user_id"/>,                         
                        <span t-field="o.user_id.email"/>,                         
                        <span t-field="o.user_id.phone"/>
                    </td>
                </t>
            </tr>
        </table>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.replace_informations2.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.replace_informations2.xml)

### Replace Partner Id  
ID: `mint_system.purchase.report_purchasequotation_document.replace_partner_id`  
```xml
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
Source: [snippets/purchase.report_purchasequotation_document.replace_partner_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.replace_partner_id.xml)

### Replace Product Description  
ID: `mint_system.purchase.report_purchasequotation_document.replace_product_description`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">
    <xpath expr="//td[@id='product']" position="replace">
        <td id="product">
            <span class="o_bold" t-field="order_line.product_id.name"/>
            <br/>
            <span t-field="order_line.name"/>
        </td>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.replace_product_description.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.replace_product_description.xml)

### Replace Title  
ID: `mint_system.purchase.report_purchasequotation_document.replace_title`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">
    <xpath expr="//div[@t-field='o.name']/.." position="replace">

<div class="mt-4">
                <h2 t-if="o.state in ['draft', 'sent', 'to approve']">Request for Quotation <span t-field="o.name"/></h2>
                <h2 t-if="o.state in ['purchase', 'done']">Purchase Order <span t-field="o.name"/></h2>
                <h2 t-if="o.state == 'cancel'">Cancelled Purchase Order <span t-field="o.name"/></h2>
            </div>

    </xpath>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.replace_title.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.replace_title.xml)

### Row Date Align Left  
ID: `mint_system.purchase.report_purchasequotation_document.row_date_align_left`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">
    <xpath expr="//table/thead/tr/th[2]" position="attributes">
        <attribute name="class" separator=" " add="text-left" remove="text-center"/>
    </xpath>
    <xpath expr="//table/tbody/t/tr/t[1]/td[2]" position="attributes">
        <attribute name="class" separator=" " add="text-left" remove="text-center"/>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.row_date_align_left.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.row_date_align_left.xml)

### Sequence In Table  
ID: `mint_system.purchase.report_purchasequotation_document.sequence_in_table`  
```xml
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
            <span t-esc="index"/>
            <t t-set="index" t-value="index+1"/>
        </td>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.sequence_in_table.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.sequence_in_table.xml)

### Set Ids  
ID: `mint_system.purchase.report_purchasequotation_document.set_ids`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">
    <xpath expr="//span[@t-field='order_line.product_qty']" position="attributes">
        <attribute name="id">product_qty</attribute>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.set_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.set_ids.xml)

### Sort By Name  
ID: `mint_system.purchase.report_purchasequotation_document.sort_by_name`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">
    <xpath expr="//table/tbody/t" position="attributes">
        <attribute name="t-foreach">sorted_order_lines</attribute>
        <attribute name="t-as">order_lines</attribute>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.sort_by_name.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.sort_by_name.xml)

### Style Airwork  
ID: `mint_system.purchase.report_purchasequotation_document.style_airwork`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="60">
  <xpath expr="//div[hasclass('page')]" position="before">
    <style>
        h2 {
            color: black;
        }
        .o_company_1_layout.o_report_layout_boxed h2 span {
            color: black;
        }
            </style>
  </xpath>

  <xpath expr="//table[@class='table table-sm mt-4']" position="attributes">
    <attribute name="class">table table-sm o_main_table mt-4</attribute>
  </xpath>

  <xpath expr="//th[@name='th_description']" position="attributes">
    <attribute name="class">text-start</attribute>
  </xpath>

  <xpath expr="//t[@t-set='information_block']/div/div" position="attributes">
    <attribute name="t-options">{"widget": "contact", "fields": ["address"], "no_marker": True, "phone_icons": True}</attribute>
  </xpath>

  <xpath expr="//t[@t-set='address']/div" position="attributes">
    <attribute name="t-options">{"widget": "contact", "fields": ["address", "name"], "no_marker": True, "phone_icons": True}</attribute>
  </xpath>

</data>
```
Source: [snippets/purchase.report_purchasequotation_document.style_airwork.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.style_airwork.xml)

### Style Gelso  
ID: `mint_system.purchase.report_purchasequotation_document.style_gelso`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">

  <xpath expr="//table[@class='table table-sm mt-4']" position="attributes">
    <attribute name="class">table table-borderless mt-4</attribute>
  </xpath>

  <xpath expr="//th[@name='th_description']" position="attributes">
    <attribute name="class">text-start</attribute>
  </xpath>

  <xpath expr="//th[@name='th_expected_date']" position="attributes">
    <attribute name="class">text-start</attribute>
  </xpath>

</data>

```
Source: [snippets/purchase.report_purchasequotation_document.style_gelso.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.style_gelso.xml)

### Style Moser  
ID: `mint_system.purchase.report_purchasequotation_document.style_moser`  
```xml
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
Source: [snippets/purchase.report_purchasequotation_document.style_moser.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.style_moser.xml)

### Style Tissa  
ID: `mint_system.purchase.report_purchasequotation_document.style_tissa`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">

	<xpath expr="//div[hasclass('page')]" position="before">
		<style>
			table#info {
				font-size: 9pt;
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

	<xpath expr="//div[@t-field='o.picking_type_id.warehouse_id.partner_id']" position="attributes">
		<attribute name="t-options">{"widget": "contact", "fields": ["address"], "no_marker": True, "phone_icons": False}</attribute>
	</xpath>

	<xpath expr="//div[@t-field='o.partner_id']" position="attributes">
		<attribute name="t-options">{"widget": "contact", "fields": ["address", "name"], "no_marker": True, "phone_icons": False}</attribute>
	</xpath>
	
	<xpath expr="//th[@name='th_description']" position="attributes">
		<attribute name="class">text-start</attribute>&gt;
	</xpath>

</data>
```
Source: [snippets/purchase.report_purchasequotation_document.style_tissa.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.style_tissa.xml)

### Style Trimada  
ID: `mint_system.purchase.report_purchasequotation_document.style_trimada`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="60">
    <xpath expr="//div[hasclass('page')]" position="before">
        <style>
    .o_company_1_layout {
      font-family: arial;
    }
    </style>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.style_trimada.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.style_trimada.xml)

### Terms And Conditions  
ID: `mint_system.purchase.report_purchasequotation_document.terms_and_conditions`  
```xml
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
Source: [snippets/purchase.report_purchasequotation_document.terms_and_conditions.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.terms_and_conditions.xml)

### Title Margin  
ID: `mint_system.purchase.report_purchasequotation_document.title_margin`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">
    <xpath expr="//div/h2[1]" position="attributes">
        <attribute name="style" separator=";" add="margin-top: 2rem"/>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.title_margin.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.title_margin.xml)

### X Warranty  
ID: `mint_system.purchase.report_purchasequotation_document.x_warranty`  
```xml
<data inherit_id="purchase.report_purchasequotation_document" priority="50">
    <xpath expr="//td[@id='product']" position="inside">
        <br/>
        <span t-field="order_line.product_id.x_warranty"/>
    </xpath>
</data>

```
Source: [snippets/purchase.report_purchasequotation_document.x_warranty.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.report_purchasequotation_document.x_warranty.xml)

## View Purchase Order Filter  
### Add State  
ID: `mint_system.purchase.view_purchase_order_filter.add_state`  
```xml
<data inherit_id="purchase.view_purchase_order_filter" priority="50">
    <xpath expr="//filter[@name='order_date']" position="after">
        <filter string="Status" name="order_state" domain="[]" context="{'group_by': 'state'}"/>
    </xpath>
</data>

```
Source: [snippets/purchase.view_purchase_order_filter.add_state.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.view_purchase_order_filter.add_state.xml)

### Modify Product Id  
ID: `mint_system.purchase.view_purchase_order_filter.modify_product_id`  
```xml
<data inherit_id="purchase.view_purchase_order_filter" priority="50">
    <xpath expr="//field[@name='product_id']" position="replace">
        <field name="product_id" filter_domain="['|','|',('order_line.product_id', 'ilike', self),('order_line.product_id.type_description', 'ilike', self),('order_line.product_id.type_description2', 'ilike', self)]"/>
    </xpath>
</data>

```
Source: [snippets/purchase.view_purchase_order_filter.modify_product_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/purchase.view_purchase_order_filter.modify_product_id.xml)

