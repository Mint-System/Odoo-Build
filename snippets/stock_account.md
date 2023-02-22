---
prev: ./snippets
---
# Stock Account
## Stock Valuation Layer Tree  
### Add Stock Move Id  
ID: `mint_system.stock_account.stock_valuation_layer_tree.add_stock_move_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock_account.stock_valuation_layer_tree" priority="50">

    <xpath expr="//field[@name='product_id']" position="after">
        <field name="stock_move_id"/>
    </xpath>

</data>
```
Source: [snippets/stock_account.stock_valuation_layer_tree.add_stock_move_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/stock_account.stock_valuation_layer_tree.add_stock_move_id.xml)

### Add X Quant Location Id  
ID: `mint_system.stock_account.stock_valuation_layer_tree.add_x_quant_location_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock_account.stock_valuation_layer_tree" priority="50">

    <xpath expr="//field[@name='product_id']" position="after">
        <field name="x_quant_location_id"/>
    </xpath>

</data>
```
Source: [snippets/stock_account.stock_valuation_layer_tree.add_x_quant_location_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/stock_account.stock_valuation_layer_tree.add_x_quant_location_id.xml)

## View Inventory Valuation Search  
### Group By X Quant Location Id  
ID: `mint_system.stock_account.view_inventory_valuation_search.group_by_x_quant_location_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock_account.view_inventory_valuation_search" priority="50">

    <xpath expr="//field[@name='product_tmpl_id']" position="after">
        <filter string="Ort" name="x_quant_location_id" domain="[]" context="{'group_by': 'x_quant_location_id'}"/>
    </xpath>

</data>
```
Source: [snippets/stock_account.view_inventory_valuation_search.group_by_x_quant_location_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/stock_account.view_inventory_valuation_search.group_by_x_quant_location_id.xml)

