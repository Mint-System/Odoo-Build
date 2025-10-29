# Stock Delivery Note

## Report Delivery Document

### Move Delivery Note

ID: `mint_system.stock_delivery_note.report_delivery_document.move_delivery_note`

```xml
<data inherit_id="stock_delivery_note.report_delivery_document" priority="50">
    <xpath expr="//p[@t-if='o.delivery_note']" position="replace">
    </xpath>
    <xpath expr="//h2" position="after">
        <p t-if="o.delivery_note">
            <div t-field="o.delivery_note"/>
            <br/>
        </p>
    </xpath>
</data>

```
Source: [snippets/stock_delivery_note.report_delivery_document.move_delivery_note.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/stock_delivery_note.report_delivery_document.move_delivery_note.xml)

## Stock Picking Form View

### Move Delivery Note

ID: `mint_system.stock_delivery_note.stock_picking_form_view.move_delivery_note`

```xml
<data inherit_id="stock_delivery_note.stock_picking_form_view" priority="50">
    <field name="delivery_note" position="replace">
    </field>
    <field name="partner_id" position="after">
        <field name="delivery_note" placeholder="Delivery note"/>
    </field>
</data>

```
Source: [snippets/stock_delivery_note.stock_picking_form_view.move_delivery_note.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/stock_delivery_note.stock_picking_form_view.move_delivery_note.xml)

