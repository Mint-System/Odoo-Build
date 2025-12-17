# Sale Order Picking Note

## View Order Form Inherit Sale Stock

### Move Note Fields

ID: `mint_system.sale_order_picking_note.view_order_form_inherit_sale_stock.move_note_fields`

```xml
<data inherit_id="sale_order_picking_note.view_order_form_inherit_sale_stock" priority="50" type="form" model="sale.order">
    <field name="picking_note" position="replace"/>
    <field name="picking_customer_note" position="replace"/>
    <field name="note" position="before">
        <group colspan="4">
            <field name="picking_note" nolabel="1" placeholder="Picking Internal Note"/>
        </group>
        <group colspan="4">
            <field name="picking_customer_note" nolabel="1" placeholder="Picking Customer Comments"/>
        </group>
    </field>
</data>

```
Edit: [snippets/mint_system.sale_order_picking_note.view_order_form_inherit_sale_stock.move_note_fields.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale_order_picking_note.view_order_form_inherit_sale_stock.move_note_fields.xml)

Source: [snippets/mint_system.sale_order_picking_note.view_order_form_inherit_sale_stock.move_note_fields.xml](https://odoo.build/snippets/mint_system.sale_order_picking_note.view_order_form_inherit_sale_stock.move_note_fields.xml)

