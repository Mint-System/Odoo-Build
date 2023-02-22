---
prev: ./snippets
---
# Sale Management
## Sale Order Form Quote  
### Hide Optional Products  
ID: `mint_system.sale_management.sale_order_form_quote.hide_optional_products`  
```xml
<?xml version="1.0"?>
<data inherit_id="sale_management.sale_order_form_quote" priority="50">

  <xpath expr="//page[@name='optional_products']" position="attributes">
    <attribute name="invisible">1</attribute>
  </xpath>

</data>
```
Source: [snippets/sale_management.sale_order_form_quote.hide_optional_products.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/sale_management.sale_order_form_quote.hide_optional_products.xml)

