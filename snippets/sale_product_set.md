# Sale Product Set

## View Order Stock Form

### Show Button Always

ID: `mint_system.sale_product_set.view_order_stock_form.show_button_always`

```xml
<data inherit_id="sale_product_set.view_order_stock_form" priority="50">
    <button name="639" position="attributes">
        <attribute name="attrs"/>
    </button>
</data>

```
Source: [snippets/sale_product_set.view_order_stock_form.show_button_always.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_product_set.view_order_stock_form.show_button_always.xml)

## View Product Set Form

### X Categ Id

ID: `mint_system.sale_product_set.view_product_set_form.x_categ_id`

```xml
<data inherit_id="sale_product_set.view_product_set_form" priority="50">
    <field name="product_id" position="after">
        <field name="x_categ_id"/>
    </field>
</data>

```
Source: [snippets/sale_product_set.view_product_set_form.x_categ_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_product_set.view_product_set_form.x_categ_id.xml)

