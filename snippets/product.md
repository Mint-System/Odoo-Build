# Product

## Product Category Form View

### X Relevant For Certificate

ID: `mint_system.product.product_category_form_view.x_relevant_for_certificate`

```xml
<data inherit_id="product.product_category_form_view" priority="50">
    <field name="parent_id" position="after">
        <field name="x_relevant_for_certificate"/>
    </field>
</data>

```
Edit: [snippets/mint_system.product.product_category_form_view.x_relevant_for_certificate.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_category_form_view.x_relevant_for_certificate.xml)

Source: [snippets/mint_system.product.product_category_form_view.x_relevant_for_certificate.xml](https://odoo.build/snippets/mint_system.product.product_category_form_view.x_relevant_for_certificate.xml)

## Product Normal Form View

### Add Feeder Id

ID: `mint_system.product.product_normal_form_view.add_feeder_id`

```xml
<data inherit_id="product.product_normal_form_view" priority="50">
    <xpath expr="//page[@name='general_information']//field[@name='categ_id']" position="after">
        <field name="feeder_id"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.product.product_normal_form_view.add_feeder_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_normal_form_view.add_feeder_id.xml)

Source: [snippets/mint_system.product.product_normal_form_view.add_feeder_id.xml](https://odoo.build/snippets/mint_system.product.product_normal_form_view.add_feeder_id.xml)

### Hide Default Code

ID: `mint_system.product.product_normal_form_view.hide_default_code`

```xml
<data inherit_id="product.product_normal_form_view" priority="50">
    <xpath expr="//page[@name='general_information']//field[@name='default_code']" position="replace"/>
</data>

```
Edit: [snippets/mint_system.product.product_normal_form_view.hide_default_code.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_normal_form_view.hide_default_code.xml)

Source: [snippets/mint_system.product.product_normal_form_view.hide_default_code.xml](https://odoo.build/snippets/mint_system.product.product_normal_form_view.hide_default_code.xml)

### Relocate Barcode

ID: `mint_system.product.product_normal_form_view.relocate_barcode`

```xml
<data inherit_id="product.product_normal_form_view" priority="50">
    <xpath expr="//page[@name='general_information']//field[@name='barcode']" position="replace"/>
    <xpath expr="//page[@name='general_information']//field[@name='categ_id']" position="after">
        <field name="barcode"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.product.product_normal_form_view.relocate_barcode.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_normal_form_view.relocate_barcode.xml)

Source: [snippets/mint_system.product.product_normal_form_view.relocate_barcode.xml](https://odoo.build/snippets/mint_system.product.product_normal_form_view.relocate_barcode.xml)

### Remove Barcode

ID: `mint_system.product.product_normal_form_view.remove_barcode`

```xml
<data inherit_id="product.product_normal_form_view" priority="50">
    <xpath expr="//field[@name='barcode']" position="replace"/>
</data>

```
Edit: [snippets/mint_system.product.product_normal_form_view.remove_barcode.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_normal_form_view.remove_barcode.xml)

Source: [snippets/mint_system.product.product_normal_form_view.remove_barcode.xml](https://odoo.build/snippets/mint_system.product.product_normal_form_view.remove_barcode.xml)

### X Hide On Sale Order

ID: `mint_system.product.product_normal_form_view.x_hide_on_sale_order`

```xml
<data inherit_id="product.product_normal_form_view" priority="50">
    <field name="description_sale" position="after">
        <field name="x_hide_on_sale_order"/>
    </field>
</data>

```
Edit: [snippets/mint_system.product.product_normal_form_view.x_hide_on_sale_order.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_normal_form_view.x_hide_on_sale_order.xml)

Source: [snippets/mint_system.product.product_normal_form_view.x_hide_on_sale_order.xml](https://odoo.build/snippets/mint_system.product.product_normal_form_view.x_hide_on_sale_order.xml)

### X Warranty

ID: `mint_system.product.product_normal_form_view.x_warranty`

```xml
<data inherit_id="product.product_normal_form_view" priority="50">
    <field name="product_tag_ids" position="after">
        <field name="x_warranty"/>
    </field>
</data>

```
Edit: [snippets/mint_system.product.product_normal_form_view.x_warranty.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_normal_form_view.x_warranty.xml)

Source: [snippets/mint_system.product.product_normal_form_view.x_warranty.xml](https://odoo.build/snippets/mint_system.product.product_normal_form_view.x_warranty.xml)

## Product Normal Only Form View

### Add X Product Label

ID: `mint_system.product.product_normal_only_form_view.add_x_product_label`

```xml
<data inherit_id="product.product_normal_only_form_view" priority="50">
    <field name="barcode" position="after">
        <field name="x_product_label"/>
    </field>
</data>

```
Edit: [snippets/mint_system.product.product_normal_only_form_view.add_x_product_label.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_normal_only_form_view.add_x_product_label.xml)

Source: [snippets/mint_system.product.product_normal_only_form_view.add_x_product_label.xml](https://odoo.build/snippets/mint_system.product.product_normal_only_form_view.add_x_product_label.xml)

## Product Packaging Form View

### X Description

ID: `mint_system.product.product_packaging_form_view.x_description`

```xml
<data inherit_id="product.product_packaging_form_view" priority="50">
    <field name="product_id" position="before">
        <field name="x_description"/>
    </field>
</data>

```
Edit: [snippets/mint_system.product.product_packaging_form_view.x_description.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_packaging_form_view.x_description.xml)

Source: [snippets/mint_system.product.product_packaging_form_view.x_description.xml](https://odoo.build/snippets/mint_system.product.product_packaging_form_view.x_description.xml)

### X Packaging Uom Id

ID: `mint_system.product.product_packaging_form_view.x_packaging_uom_id`

```xml
<data inherit_id="product.product_packaging_form_view" priority="50">
    <field name="barcode" position="before">
        <field name="x_packaging_uom_id"/>
    </field>
</data>

```
Edit: [snippets/mint_system.product.product_packaging_form_view.x_packaging_uom_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_packaging_form_view.x_packaging_uom_id.xml)

Source: [snippets/mint_system.product.product_packaging_form_view.x_packaging_uom_id.xml](https://odoo.build/snippets/mint_system.product.product_packaging_form_view.x_packaging_uom_id.xml)

### X Print Parent Only

ID: `mint_system.product.product_packaging_form_view.x_print_parent_only`

```xml
<data inherit_id="product.product_packaging_form_view" priority="50">
    <field name="barcode" position="before">
        <field name="x_print_parent_only"/>
    </field>
</data>

```
Edit: [snippets/mint_system.product.product_packaging_form_view.x_print_parent_only.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_packaging_form_view.x_print_parent_only.xml)

Source: [snippets/mint_system.product.product_packaging_form_view.x_print_parent_only.xml](https://odoo.build/snippets/mint_system.product.product_packaging_form_view.x_print_parent_only.xml)

### X Print Without Parent

ID: `mint_system.product.product_packaging_form_view.x_print_without_parent`

```xml
<data inherit_id="product.product_packaging_form_view" priority="50">
    <field name="barcode" position="before">
        <field name="x_print_without_parent"/>
    </field>
</data>

```
Edit: [snippets/mint_system.product.product_packaging_form_view.x_print_without_parent.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_packaging_form_view.x_print_without_parent.xml)

Source: [snippets/mint_system.product.product_packaging_form_view.x_print_without_parent.xml](https://odoo.build/snippets/mint_system.product.product_packaging_form_view.x_print_without_parent.xml)

### X Qty Description

ID: `mint_system.product.product_packaging_form_view.x_qty_description`

```xml
<data inherit_id="product.product_packaging_form_view" priority="50">
    <field name="barcode" position="before">
        <field name="x_qty_description"/>
    </field>
</data>

```
Edit: [snippets/mint_system.product.product_packaging_form_view.x_qty_description.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_packaging_form_view.x_qty_description.xml)

Source: [snippets/mint_system.product.product_packaging_form_view.x_qty_description.xml](https://odoo.build/snippets/mint_system.product.product_packaging_form_view.x_qty_description.xml)

## Product Packaging Tree View

### Show Barcode

ID: `mint_system.product.product_packaging_tree_view.show_barcode`

```xml
<data inherit_id="product.product_packaging_tree_view" priority="50">
    <field name="product_id" position="after">
        <field name="barcode" optional="show"/>
    </field>
</data>

```
Edit: [snippets/mint_system.product.product_packaging_tree_view.show_barcode.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_packaging_tree_view.show_barcode.xml)

Source: [snippets/mint_system.product.product_packaging_tree_view.show_barcode.xml](https://odoo.build/snippets/mint_system.product.product_packaging_tree_view.show_barcode.xml)

### X Description

ID: `mint_system.product.product_packaging_tree_view.x_description`

```xml
<data inherit_id="product.product_packaging_tree_view" priority="50">
    <field name="product_id" position="after">
        <field name="x_description" optional="show"/>
    </field>
</data>

```
Edit: [snippets/mint_system.product.product_packaging_tree_view.x_description.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_packaging_tree_view.x_description.xml)

Source: [snippets/mint_system.product.product_packaging_tree_view.x_description.xml](https://odoo.build/snippets/mint_system.product.product_packaging_tree_view.x_description.xml)

## Product Pricelist Item Tree View

### Make Editable

ID: `mint_system.product.product_pricelist_item_tree_view.make_editable`

```xml
<data inherit_id="product.product_pricelist_item_tree_view" priority="50">
    <tree position="attributes">
        <attribute name="editable">bottom</attribute>
    </tree>
    <field name="price" position="after">
        <field name="fixed_price"/>
    </field>
</data>

```
Edit: [snippets/mint_system.product.product_pricelist_item_tree_view.make_editable.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_pricelist_item_tree_view.make_editable.xml)

Source: [snippets/mint_system.product.product_pricelist_item_tree_view.make_editable.xml](https://odoo.build/snippets/mint_system.product.product_pricelist_item_tree_view.make_editable.xml)

## Product Pricelist View

### Show Product

ID: `mint_system.product.product_pricelist_view.show_product`

```xml
<data inherit_id="product.product_pricelist_view" priority="50">
    <field name="name" position="before">
        <field name="product_tmpl_id"/>
    </field>
</data>

```
Edit: [snippets/mint_system.product.product_pricelist_view.show_product.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_pricelist_view.show_product.xml)

Source: [snippets/mint_system.product.product_pricelist_view.show_product.xml](https://odoo.build/snippets/mint_system.product.product_pricelist_view.show_product.xml)

## Product Template Form View

### Add Type Description

ID: `mint_system.product.product_template_form_view.add_type_description`

```xml
<data inherit_id="product.product_template_form_view" priority="50">
    <xpath expr="//h1/field[@name='name']" position="after">
        <h2>
            <field name="type_description"/>
        </h2>
        <h3>
            <field name="type_description2"/>
        </h3>
    </xpath>
</data>

```
Edit: [snippets/mint_system.product.product_template_form_view.add_type_description.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_form_view.add_type_description.xml)

Source: [snippets/mint_system.product.product_template_form_view.add_type_description.xml](https://odoo.build/snippets/mint_system.product.product_template_form_view.add_type_description.xml)

### Last Incoming Date

ID: `mint_system.product.product_template_form_view.last_incoming_date`

```xml
<data inherit_id="product.product_template_form_view" priority="50">
    <xpath expr="//page[@name='inventory']//field[@name='tracking']" position="after">
        <field name="last_incoming_date"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.product.product_template_form_view.last_incoming_date.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_form_view.last_incoming_date.xml)

Source: [snippets/mint_system.product.product_template_form_view.last_incoming_date.xml](https://odoo.build/snippets/mint_system.product.product_template_form_view.last_incoming_date.xml)

### Last Moves

ID: `mint_system.product.product_template_form_view.last_moves`

```xml
<data inherit_id="product.product_template_form_view" priority="50">
    <xpath expr="//page[@name='inventory']/group[@name='inventory']" position="after">
        <group name="moves" string="Bewegungen" colspan="4">
            <field name="last_outgoing_date"/>
            <field name="last_incoming_date"/>
        </group>
    </xpath>
</data>

```
Edit: [snippets/mint_system.product.product_template_form_view.last_moves.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_form_view.last_moves.xml)

Source: [snippets/mint_system.product.product_template_form_view.last_moves.xml](https://odoo.build/snippets/mint_system.product.product_template_form_view.last_moves.xml)

### Last Outgoing Date

ID: `mint_system.product.product_template_form_view.last_outgoing_date`

```xml
<data inherit_id="product.product_template_form_view" priority="50">
    <xpath expr="//page[@name='inventory']//field[@name='tracking']" position="after">
        <field name="last_outgoing_date"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.product.product_template_form_view.last_outgoing_date.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_form_view.last_outgoing_date.xml)

Source: [snippets/mint_system.product.product_template_form_view.last_outgoing_date.xml](https://odoo.build/snippets/mint_system.product.product_template_form_view.last_outgoing_date.xml)

### Remove List Price

ID: `mint_system.product.product_template_form_view.remove_list_price`

```xml
<data inherit_id="product.product_template_form_view" priority="50">
    <xpath expr="//group[@name='group_standard_price']//div[@name='pricing']" position="replace"/>
    <xpath expr="//group[@name='group_standard_price']//label[@for='list_price']" position="replace"/>
</data>

```
Edit: [snippets/mint_system.product.product_template_form_view.remove_list_price.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_form_view.remove_list_price.xml)

Source: [snippets/mint_system.product.product_template_form_view.remove_list_price.xml](https://odoo.build/snippets/mint_system.product.product_template_form_view.remove_list_price.xml)

### Remove Standard Price

ID: `mint_system.product.product_template_form_view.remove_standard_price`

```xml
<data inherit_id="product.product_template_form_view" priority="50">
    <xpath expr="//group[@name='group_standard_price']//div[@name='standard_price_uom']" position="replace"/>
    <xpath expr="//group[@name='group_standard_price']//label[@for='standard_price']" position="replace"/>
</data>

```
Edit: [snippets/mint_system.product.product_template_form_view.remove_standard_price.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_form_view.remove_standard_price.xml)

Source: [snippets/mint_system.product.product_template_form_view.remove_standard_price.xml](https://odoo.build/snippets/mint_system.product.product_template_form_view.remove_standard_price.xml)

### Remove Uom Po Id

ID: `mint_system.product.product_template_form_view.remove_uom_po_id`

```xml
<data inherit_id="product.product_template_form_view" priority="50">
    <xpath expr="//group[@name='group_general']/field[@name='uom_po_id']" position="replace"/>
</data>

```
Edit: [snippets/mint_system.product.product_template_form_view.remove_uom_po_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_form_view.remove_uom_po_id.xml)

Source: [snippets/mint_system.product.product_template_form_view.remove_uom_po_id.xml](https://odoo.build/snippets/mint_system.product.product_template_form_view.remove_uom_po_id.xml)

### Replace Title

ID: `mint_system.product.product_template_form_view.replace_title`

```xml
<data inherit_id="product.product_template_form_view" priority="50">
    <xpath expr="//div[@class='oe_title']" position="replace">
        <div class="oe_title">
            <table style="width:100%">
                <tr>
                    <td style="width:60%">
                        <h1>
                            <field name="name" placeholder="Product Name"/>
                        </h1>
                    </td>
                    <td style="width:40%; text-valign: bottom">
                        <label for="default_code"/>
                        <field name="default_code"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h2>
                            <field name="type_description"/>
                        </h2>
                        <h3>
                            <field name="type_description2"/>
                        </h3>
                    </td>
                    <td>
                        <div>
                            <field name="sale_ok"/>
                            <label for="sale_ok"/>
                        </div>
                        <div>
                            <field name="purchase_ok"/>
                            <label for="purchase_ok"/>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </xpath>
</data>

```
Edit: [snippets/mint_system.product.product_template_form_view.replace_title.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_form_view.replace_title.xml)

Source: [snippets/mint_system.product.product_template_form_view.replace_title.xml](https://odoo.build/snippets/mint_system.product.product_template_form_view.replace_title.xml)

## Product Template Kanban View

### Add Product Info

ID: `mint_system.product.product_template_kanban_view.add_product_info`

```xml
<data inherit_id="product.product_template_kanban_view" priority="50">&gt;

  <xpath expr="//div[@class='oe_kanban_details']" position="replace"><div class="oe_kanban_details"><t t-if="record.default_code.value">[<field name="default_code"/>] </t><strong class="o_kanban_record_title"><field name="name"/></strong><div><field name="type_description"/></div><div t-if="record.type.raw_value == 'product'">On hand: <field name="qty_available"/> <field name="uom_id"/> / <field name="virtual_available"/> <field name="uom_id"/>
    </div></div></xpath>

</data>

```
Edit: [snippets/mint_system.product.product_template_kanban_view.add_product_info.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_kanban_view.add_product_info.xml)

Source: [snippets/mint_system.product.product_template_kanban_view.add_product_info.xml](https://odoo.build/snippets/mint_system.product.product_template_kanban_view.add_product_info.xml)

## Product Template Only Form View

### Add X Product Label

ID: `mint_system.product.product_template_only_form_view.add_x_product_label`

```xml
<data inherit_id="product.product_template_only_form_view" priority="50">
    <field name="barcode" position="after">
        <field name="x_product_label"/>
    </field>
</data>

```
Edit: [snippets/mint_system.product.product_template_only_form_view.add_x_product_label.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_only_form_view.add_x_product_label.xml)

Source: [snippets/mint_system.product.product_template_only_form_view.add_x_product_label.xml](https://odoo.build/snippets/mint_system.product.product_template_only_form_view.add_x_product_label.xml)

### Hide Barcode

ID: `mint_system.product.product_template_only_form_view.hide_barcode`

```xml
<data inherit_id="product.product_template_only_form_view" priority="50">
    <xpath expr="//field[@name='barcode']" position="attributes">
        <attribute name="groups">base.group_erp_manager</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.product.product_template_only_form_view.hide_barcode.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_only_form_view.hide_barcode.xml)

Source: [snippets/mint_system.product.product_template_only_form_view.hide_barcode.xml](https://odoo.build/snippets/mint_system.product.product_template_only_form_view.hide_barcode.xml)

### Hide Default Code

ID: `mint_system.product.product_template_only_form_view.hide_default_code`

```xml
<data inherit_id="product.product_template_only_form_view" priority="50">
    <xpath expr="//page[@name='general_information']//field[@name='default_code']" position="replace"/>
</data>

```
Edit: [snippets/mint_system.product.product_template_only_form_view.hide_default_code.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_only_form_view.hide_default_code.xml)

Source: [snippets/mint_system.product.product_template_only_form_view.hide_default_code.xml](https://odoo.build/snippets/mint_system.product.product_template_only_form_view.hide_default_code.xml)

### Hide Intrastat Supplementary

ID: `mint_system.product.product_template_only_form_view.hide_intrastat_supplementary`

```xml
<data inherit_id="product.product_template_only_form_view" priority="50">

    <xpath expr="//label[@for='intrastat_supplementary_unit_amount']" position="attributes">
        <attribute name="invisible">True</attribute>
    </xpath>
    <xpath expr="//div/field[@name='intrastat_supplementary_unit_amount']/.." position="attributes">
        <attribute name="invisible">True</attribute>
    </xpath>

</data>
```
Edit: [snippets/mint_system.product.product_template_only_form_view.hide_intrastat_supplementary.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_only_form_view.hide_intrastat_supplementary.xml)

Source: [snippets/mint_system.product.product_template_only_form_view.hide_intrastat_supplementary.xml](https://odoo.build/snippets/mint_system.product.product_template_only_form_view.hide_intrastat_supplementary.xml)

### Remove Barcode

ID: `mint_system.product.product_template_only_form_view.remove_barcode`

```xml
<data inherit_id="product.product_template_only_form_view" priority="50">
    <xpath expr="//field[@name='barcode']" position="replace"/>
</data>

```
Edit: [snippets/mint_system.product.product_template_only_form_view.remove_barcode.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_only_form_view.remove_barcode.xml)

Source: [snippets/mint_system.product.product_template_only_form_view.remove_barcode.xml](https://odoo.build/snippets/mint_system.product.product_template_only_form_view.remove_barcode.xml)

### Replace Feeder Id

ID: `mint_system.product.product_template_only_form_view.replace_feeder_id`

```xml
<data inherit_id="product.product_template_only_form_view" priority="50">
    <field name="feeder_id" position="replace">
  </field>
    <field name="barcode" position="before">
        <field name="feeder_id"/>
    </field>
</data>

```
Edit: [snippets/mint_system.product.product_template_only_form_view.replace_feeder_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_only_form_view.replace_feeder_id.xml)

Source: [snippets/mint_system.product.product_template_only_form_view.replace_feeder_id.xml](https://odoo.build/snippets/mint_system.product.product_template_only_form_view.replace_feeder_id.xml)

### Show Can Be Expensed

ID: `mint_system.product.product_template_only_form_view.show_can_be_expensed`

```xml
<data inherit_id="product.product_template_only_form_view" priority="50">
    <xpath expr="//field[@name='sale_ok']/.." position="after">
        <span class="d-inline-block">
            <field name="can_be_expensed"/>
            <label for="can_be_expensed"/>
        </span>
    </xpath>
</data>

```
Edit: [snippets/mint_system.product.product_template_only_form_view.show_can_be_expensed.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_only_form_view.show_can_be_expensed.xml)

Source: [snippets/mint_system.product.product_template_only_form_view.show_can_be_expensed.xml](https://odoo.build/snippets/mint_system.product.product_template_only_form_view.show_can_be_expensed.xml)

### Show Handle

ID: `mint_system.product.product_template_only_form_view.show_handle`

```xml
<data inherit_id="product.product_template_only_form_view" priority="50">
    <data>
        <xpath expr="//field[@name='packaging_ids']" position="inside">
            <tree string="Product Packagings">
                <field name="sequence" widget="handle"/>
                <field name="name" string="Packaging"/>
                <field name="qty"/>
                <field name="product_uom_id" options="{'no_open': True, 'no_create': True}" groups="uom.group_uom"/>
                <field name="company_id" groups="base.group_multi_company"/>
            </tree>
        </xpath>
    </data>
</data>

```
Edit: [snippets/mint_system.product.product_template_only_form_view.show_handle.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_only_form_view.show_handle.xml)

Source: [snippets/mint_system.product.product_template_only_form_view.show_handle.xml](https://odoo.build/snippets/mint_system.product.product_template_only_form_view.show_handle.xml)

### X Calibre

ID: `mint_system.product.product_template_only_form_view.x_calibre`

```xml
<data inherit_id="product.product_template_only_form_view" priority="50">
    <field name="hs_code" position="after">
        <field name="x_calibre"/>
    </field>
</data>

```
Edit: [snippets/mint_system.product.product_template_only_form_view.x_calibre.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_only_form_view.x_calibre.xml)

Source: [snippets/mint_system.product.product_template_only_form_view.x_calibre.xml](https://odoo.build/snippets/mint_system.product.product_template_only_form_view.x_calibre.xml)

### X Expiration Days

ID: `mint_system.product.product_template_only_form_view.x_expiration_days`

```xml
<data inherit_id="product.product_template_only_form_view" priority="50">
    <field name="hs_code" position="after">
        <field name="x_expiration_days"/>
    </field>
</data>

```
Edit: [snippets/mint_system.product.product_template_only_form_view.x_expiration_days.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_only_form_view.x_expiration_days.xml)

Source: [snippets/mint_system.product.product_template_only_form_view.x_expiration_days.xml](https://odoo.build/snippets/mint_system.product.product_template_only_form_view.x_expiration_days.xml)

### X Hide On Delivery

ID: `mint_system.product.product_template_only_form_view.x_hide_on_delivery`

```xml
<data inherit_id="product.product_template_only_form_view" priority="50">
    <field name="hs_code" position="after">
        <field name="x_hide_on_delivery" widget="boolean_toggle"/>
    </field>
</data>

```
Edit: [snippets/mint_system.product.product_template_only_form_view.x_hide_on_delivery.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_only_form_view.x_hide_on_delivery.xml)

Source: [snippets/mint_system.product.product_template_only_form_view.x_hide_on_delivery.xml](https://odoo.build/snippets/mint_system.product.product_template_only_form_view.x_hide_on_delivery.xml)

### X Hide On Invoice

ID: `mint_system.product.product_template_only_form_view.x_hide_on_invoice`

```xml
<data inherit_id="product.product_template_only_form_view" priority="50">
    <group name="properties" position="before">
        <group>
            <group>
                <field name="x_hide_on_invoice" widget="boolean_toggle"/>
            </group>
        </group>
    </group>
</data>

```
Edit: [snippets/mint_system.product.product_template_only_form_view.x_hide_on_invoice.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_only_form_view.x_hide_on_invoice.xml)

Source: [snippets/mint_system.product.product_template_only_form_view.x_hide_on_invoice.xml](https://odoo.build/snippets/mint_system.product.product_template_only_form_view.x_hide_on_invoice.xml)

### X Hide On Sale Order

ID: `mint_system.product.product_template_only_form_view.x_hide_on_sale_order`

```xml
<data inherit_id="product.product_template_only_form_view" priority="50">
    <field name="description_sale" position="after">
        <field name="x_hide_on_sale_order" widget="boolean_toggle"/>
    </field>
</data>

```
Edit: [snippets/mint_system.product.product_template_only_form_view.x_hide_on_sale_order.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_only_form_view.x_hide_on_sale_order.xml)

Source: [snippets/mint_system.product.product_template_only_form_view.x_hide_on_sale_order.xml](https://odoo.build/snippets/mint_system.product.product_template_only_form_view.x_hide_on_sale_order.xml)

### X Purchase Price

ID: `mint_system.product.product_template_only_form_view.x_purchase_price`

```xml
<data inherit_id="product.product_template_only_form_view" priority="50">
    <field name="categ_id" position="before">
        <field name="x_purchase_price" widget="float" options="{'currency_field':'currency_id','field_digits':true,'digits':[1,3]}"/>
    </field>
</data>
```
Edit: [snippets/mint_system.product.product_template_only_form_view.x_purchase_price.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_only_form_view.x_purchase_price.xml)

Source: [snippets/mint_system.product.product_template_only_form_view.x_purchase_price.xml](https://odoo.build/snippets/mint_system.product.product_template_only_form_view.x_purchase_price.xml)

### X Storage Temperature

ID: `mint_system.product.product_template_only_form_view.x_storage_temperature`

```xml
<data inherit_id="product.product_template_only_form_view" priority="50">
    <field name="hs_code" position="after">
        <field name="x_storage_temperature"/>
    </field>
</data>

```
Edit: [snippets/mint_system.product.product_template_only_form_view.x_storage_temperature.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_only_form_view.x_storage_temperature.xml)

Source: [snippets/mint_system.product.product_template_only_form_view.x_storage_temperature.xml](https://odoo.build/snippets/mint_system.product.product_template_only_form_view.x_storage_temperature.xml)

### X Warranty

ID: `mint_system.product.product_template_only_form_view.x_warranty`

```xml
<data inherit_id="product.product_template_only_form_view" priority="50">
    <field name="product_tag_ids" position="after">
        <field name="x_warranty"/>
    </field>
</data>

```
Edit: [snippets/mint_system.product.product_template_only_form_view.x_warranty.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_only_form_view.x_warranty.xml)

Source: [snippets/mint_system.product.product_template_only_form_view.x_warranty.xml](https://odoo.build/snippets/mint_system.product.product_template_only_form_view.x_warranty.xml)

## Product Template Search View

### Add Type Description

ID: `mint_system.product.product_template_search_view.add_type_description`

```xml
<data inherit_id="product.product_template_search_view" priority="50">
    <xpath expr="//field[@name='attribute_line_ids']" position="after">
        <separator/>
        <field string="Typenbezeichnung" name="type_description" filter_domain="['|', ('type_description', 'like', self), ('type_description2', 'like', self)]"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.product.product_template_search_view.add_type_description.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_search_view.add_type_description.xml)

Source: [snippets/mint_system.product.product_template_search_view.add_type_description.xml](https://odoo.build/snippets/mint_system.product.product_template_search_view.add_type_description.xml)

### Modify Name

ID: `mint_system.product.product_template_search_view.modify_name`

```xml
<data inherit_id="product.product_template_search_view" priority="50">
    <xpath expr="//field[@name='name']" position="replace">
        <field name="name" string="Product" filter_domain="['|', '|', '|', '|','|',('default_code', 'ilike', self), ('product_variant_ids.default_code', 'ilike', self),('name', 'ilike', self), ('barcode', 'ilike', self), ('type_description', 'ilike', self), ('type_description2', 'ilike', self)]"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.product.product_template_search_view.modify_name.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_search_view.modify_name.xml)

Source: [snippets/mint_system.product.product_template_search_view.modify_name.xml](https://odoo.build/snippets/mint_system.product.product_template_search_view.modify_name.xml)

## Product Template Tree View

### Add Default Code And Type Description

ID: `mint_system.product.product_template_tree_view.add_default_code_and_type_description`

```xml
<data inherit_id="product.product_template_tree_view" priority="51">
    <xpath expr="//field[@name='name']" position="before">
        <field name="default_code"/>
        <field name="type_description"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.product.product_template_tree_view.add_default_code_and_type_description.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_tree_view.add_default_code_and_type_description.xml)

Source: [snippets/mint_system.product.product_template_tree_view.add_default_code_and_type_description.xml](https://odoo.build/snippets/mint_system.product.product_template_tree_view.add_default_code_and_type_description.xml)

### Add Last Update Create Date And X Xml Id

ID: `mint_system.product.product_template_tree_view.add_last_update_create_date_and_x_xml_id`

```xml
<data inherit_id="product.product_template_tree_view" priority="50">
    <xpath expr="//field[@name='list_price']" position="before">
        <field name="x_xml_id" optional="show"/>
        <field name="__last_update" optional="show"/>
        <field name="create_date" optional="show"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.product.product_template_tree_view.add_last_update_create_date_and_x_xml_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_tree_view.add_last_update_create_date_and_x_xml_id.xml)

Source: [snippets/mint_system.product.product_template_tree_view.add_last_update_create_date_and_x_xml_id.xml](https://odoo.build/snippets/mint_system.product.product_template_tree_view.add_last_update_create_date_and_x_xml_id.xml)

### Remove Default Code And Responsible

ID: `mint_system.product.product_template_tree_view.remove_default_code_and_responsible`

```xml
<data inherit_id="product.product_template_tree_view" priority="50">
    <xpath expr="//field[@name='default_code']" position="replace">

    </xpath>
    <xpath expr="//field[@name='responsible_id']" position="replace">

    </xpath>
</data>

```
Edit: [snippets/mint_system.product.product_template_tree_view.remove_default_code_and_responsible.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_tree_view.remove_default_code_and_responsible.xml)

Source: [snippets/mint_system.product.product_template_tree_view.remove_default_code_and_responsible.xml](https://odoo.build/snippets/mint_system.product.product_template_tree_view.remove_default_code_and_responsible.xml)

### Set Default Order

ID: `mint_system.product.product_template_tree_view.set_default_order`

```xml
<data inherit_id="product.product_template_tree_view" priority="50">
    <xpath expr="/tree" position="attributes">
        <attribute name="default_order">default_code asc"</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.product.product_template_tree_view.set_default_order.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_tree_view.set_default_order.xml)

Source: [snippets/mint_system.product.product_template_tree_view.set_default_order.xml](https://odoo.build/snippets/mint_system.product.product_template_tree_view.set_default_order.xml)

### Show Accounts

ID: `mint_system.product.product_template_tree_view.show_accounts`

```xml
<data inherit_id="product.product_template_tree_view" priority="50">
    <xpath expr="//field[@name='list_price']" position="before">
        <field name="property_account_income_id" optional="hide"/>
        <field name="property_account_expense_id" optional="hide"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.product.product_template_tree_view.show_accounts.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_tree_view.show_accounts.xml)

Source: [snippets/mint_system.product.product_template_tree_view.show_accounts.xml](https://odoo.build/snippets/mint_system.product.product_template_tree_view.show_accounts.xml)

### X Expiration Days

ID: `mint_system.product.product_template_tree_view.x_expiration_days`

```xml
<data inherit_id="product.product_template_tree_view" priority="50">
    <field name="list_price" position="after">
        <field name="x_expiration_days" optional="show"/>
    </field>
</data>

```
Edit: [snippets/mint_system.product.product_template_tree_view.x_expiration_days.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_tree_view.x_expiration_days.xml)

Source: [snippets/mint_system.product.product_template_tree_view.x_expiration_days.xml](https://odoo.build/snippets/mint_system.product.product_template_tree_view.x_expiration_days.xml)

### X Storage Temperature

ID: `mint_system.product.product_template_tree_view.x_storage_temperature`

```xml
<data inherit_id="product.product_template_tree_view" priority="50">
    <field name="list_price" position="after">
        <field name="x_storage_temperature" optional="hide"/>
    </field>
</data>

```
Edit: [snippets/mint_system.product.product_template_tree_view.x_storage_temperature.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_template_tree_view.x_storage_temperature.xml)

Source: [snippets/mint_system.product.product_template_tree_view.x_storage_temperature.xml](https://odoo.build/snippets/mint_system.product.product_template_tree_view.x_storage_temperature.xml)

## Product Variant Easy Edit View

### Hide Barcode

ID: `mint_system.product.product_variant_easy_edit_view.hide_barcode`

```xml
<data inherit_id="product.product_variant_easy_edit_view" priority="50">
    <xpath expr="//field[@name='barcode']" position="attributes">
        <attribute name="groups">base.group_erp_manager</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.product.product_variant_easy_edit_view.hide_barcode.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.product_variant_easy_edit_view.hide_barcode.xml)

Source: [snippets/mint_system.product.product_variant_easy_edit_view.hide_barcode.xml](https://odoo.build/snippets/mint_system.product.product_variant_easy_edit_view.hide_barcode.xml)

## Report Producttemplatelabel

### Trimada

ID: `mint_system.product.report_producttemplatelabel.trimada`

```xml
<t t-name="product.report_producttemplatelabel.trimada">
    <t t-call="web.basic_layout">
        <t t-foreach="docs" t-as="template">
            <t t-foreach="template.product_variant_ids" t-as="product">
                <style>
        .label {
            font-family: arial;
        }
        .box1 {
            margin: 9mm 0 2mm 0;
        }
        .box2 {
            margin: 7mm 0 2mm 0;
        }
        .box3 {
            margin: 2mm 0 2mm 0;
        }
        .title {
            font-size: 11mm;
            margin: 3mm 3mm 0 3mm;
            font-weight: bold;
            text-align: center;
            border-bottom: solid 1px;
            line-height: 1;
        }
        .frame {
            border-bottom: solid 1px;
            margin: 0 3mm 0 3mm;
        }
        .description {
            font-size: 7mm;
            height: 23mm;
            width: 98%;
            overflow: hidden;
            text-overflow: ellipsis;
            text-align: center;
            padding: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .delivery {
            font-size: 7mm;
            margin: 3mm 3mm 0 3mm;
            text-align: left;
            border-bottom: solid 1px;
            line-height: 1;
            height: 34mm;
        }
        .comment {
            font-size: 5mm;
            text-align: center;
            height: 8mm;
            line-height: 10mm;
        }
        .col-6 {
            padding-right: 0;
            padding-left: 0;
        }
        </style>
                <div class="page">
                    <div class="label">
                        <div class="row title">
                            <div class="col-6 box2">
                                <span t-esc="product.default_code"/>
                            </div>
                            <div t-if="product.barcode" class="col-6 box2 text-right">
                                <img t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=0' % ('Code128', product.barcode, 250, 85)" alt="Barcode"/>
                            </div>
                        </div>
                        <div class="frame">
                            <div class="description">
                                <span class="sub1" t-esc="product.name"/>
                            </div>
                            <div class="description">
                                <span class="sub1" t-esc="product.type_description"/>
                            </div>
                        </div>
                        <div class="row delivery">
                            <div class="col-12 box3 text-center">
                                <div t-if="product.feeder_id">
                                    <img t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=0' % ('Code128', product.feeder_id, 250, 80)" alt="Barcode"/>
                                    <br/>
                                </div>
                                <div class="text-center">
                                    <span class="text-center" t-esc="product.feeder_id"/>
                                </div>
                            </div>
                        </div>
                        <div class="comment">
                            <span>Trimada AG, CH-5610 Wohlen &#x2013; www.trimada.ch</span>
                        </div>
                    </div>
                    <p style="page-break-before:always;"/>
                </div>
            </t>
        </t>
    </t>
</t>

```
Edit: [snippets/mint_system.product.report_producttemplatelabel.trimada.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.product.report_producttemplatelabel.trimada.xml)

Source: [snippets/mint_system.product.report_producttemplatelabel.trimada.xml](https://odoo.build/snippets/mint_system.product.report_producttemplatelabel.trimada.xml)

