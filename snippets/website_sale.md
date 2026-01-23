# Website Sale

## Address

### Countries Filter

ID: `mint_system.website_sale.address.countries_filter`

```xml
<data inherit_id="website_sale.address" priority="50">
    <t t-foreach="countries" position="attributes">
        <attribute name="t-foreach">countries.filtered(lambda c: c.code in ['CH', 'LI'])</attribute>
    </t>
</data>

```
Edit: [snippets/mint_system.website_sale.address.countries_filter.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.website_sale.address.countries_filter.xml)

Source: [snippets/mint_system.website_sale.address.countries_filter.xml](https://odoo.build/snippets/mint_system.website_sale.address.countries_filter.xml)

### Hide Shipping Use Same

ID: `mint_system.website_sale.address.hide_shipping_use_same`

```xml
<data inherit_id="website_sale.address" priority="50">
    <xpath expr="//input[@id='shipping_use_same']/.." position="attributes">
        <attribute name="style">display: none;</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.website_sale.address.hide_shipping_use_same.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.website_sale.address.hide_shipping_use_same.xml)

Source: [snippets/mint_system.website_sale.address.hide_shipping_use_same.xml](https://odoo.build/snippets/mint_system.website_sale.address.hide_shipping_use_same.xml)

### Hide State

ID: `mint_system.website_sale.address.hide_state`

```xml
<data inherit_id="website_sale.address" priority="50">
    <xpath expr="//div[@id='div_state']" position="replace">    
    </xpath>    
</data>

```
Edit: [snippets/mint_system.website_sale.address.hide_state.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.website_sale.address.hide_state.xml)

Source: [snippets/mint_system.website_sale.address.hide_state.xml](https://odoo.build/snippets/mint_system.website_sale.address.hide_state.xml)

### Hide Street2

ID: `mint_system.website_sale.address.hide_street2`

```xml
<data inherit_id="website_sale.address" priority="50">
    <xpath expr="//div[@id='div_street2']" position="replace">    
    </xpath>    
</data>

```
Edit: [snippets/mint_system.website_sale.address.hide_street2.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.website_sale.address.hide_street2.xml)

Source: [snippets/mint_system.website_sale.address.hide_street2.xml](https://odoo.build/snippets/mint_system.website_sale.address.hide_street2.xml)

### Overwrite Required

ID: `mint_system.website_sale.address.overwrite_required`

```xml
<data inherit_id="website_sale.address" priority="50">
    <xpath expr="//input[@name='field_required']" position="replace">
        <input type="hidden" name="field_required" t-att-value="'name,email'"/>
    </xpath>
    <xpath expr="//label[@for='city']" position="attributes">
        <attribute name="class">font-weight-normal</attribute>
    </xpath>
    <xpath expr="//label[@for='zip']" position="attributes">
        <attribute name="class">font-weight-normal</attribute>
    </xpath>
    <xpath expr="//label[@for='country_id']" position="attributes">
        <attribute name="class">font-weight-normal</attribute>
    </xpath>
    <xpath expr="//label[@for='phone']" position="attributes">
        <attribute name="class">font-weight-normal</attribute>
    </xpath>
    <xpath expr="//label[@for='street']" position="attributes">
        <attribute name="class">font-weight-normal</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.website_sale.address.overwrite_required.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.website_sale.address.overwrite_required.xml)

Source: [snippets/mint_system.website_sale.address.overwrite_required.xml](https://odoo.build/snippets/mint_system.website_sale.address.overwrite_required.xml)

### Show Firstname Lastname

ID: `mint_system.website_sale.address.show_firstname_lastname`

```xml
<data inherit_id="website_sale.address" priority="50">
    <xpath expr="//input[@name='name']/.." position="after">
        <div t-attf-class="mb-3 #{error.get('firstname') and 'o_has_error' or ''} col-lg-12 div_firstname">
            <label class="col-form-label" for="firstname">Firstname</label>
            <input type="text" name="firstname" t-attf-class="form-control #{error.get('firstname') and 'is-invalid' or ''}" t-att-value="'firstname' in checkout and checkout['firstname']"/>
        </div>
        <div t-attf-class="mb-3 #{error.get('lastname') and 'o_has_error' or ''} col-lg-12 div_lastname">
            <label class="col-form-label" for="lastname">Lastname</label>
            <input type="text" name="lastname" t-attf-class="form-control #{error.get('lastname') and 'is-invalid' or ''}" t-att-value="'lastname' in checkout and checkout['lastname']"/>
        </div>
    </xpath>
    <xpath expr="//input[@name='name']/.." position="attributes">
        <attribute name="style">display: none</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.website_sale.address.show_firstname_lastname.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.website_sale.address.show_firstname_lastname.xml)

Source: [snippets/mint_system.website_sale.address.show_firstname_lastname.xml](https://odoo.build/snippets/mint_system.website_sale.address.show_firstname_lastname.xml)

## Confirmation

### Show Shipping Name

ID: `mint_system.website_sale.confirmation.show_shipping_name`

```xml
<data inherit_id="website_sale.confirmation" priority="50">
    <span t-esc="order.partner_invoice_id" position="before"><span t-esc="order.partner_invoice_id.name" class="address-inline"/>,
  </span>
    <span t-esc="order.partner_shipping_id" position="before"><span t-esc="order.partner_shipping_id.name" class="address-inline"/>,
  </span>
</data>

```
Edit: [snippets/mint_system.website_sale.confirmation.show_shipping_name.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.website_sale.confirmation.show_shipping_name.xml)

Source: [snippets/mint_system.website_sale.confirmation.show_shipping_name.xml](https://odoo.build/snippets/mint_system.website_sale.confirmation.show_shipping_name.xml)

## Header Cart Link

### Hide Cart

ID: `mint_system.website_sale.header_cart_link.hide_cart`

```xml
<data inherit_id="website_sale.header_cart_link" priority="50">
    <xpath expr="//t[@t-attf='o_wsale_my_cart']" position="attributes">
        <attribute name="t-if">request.session.uid</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.website_sale.header_cart_link.hide_cart.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.website_sale.header_cart_link.hide_cart.xml)

Source: [snippets/mint_system.website_sale.header_cart_link.hide_cart.xml](https://odoo.build/snippets/mint_system.website_sale.header_cart_link.hide_cart.xml)

## Payment Confirmation Status

### Remove Communication

ID: `mint_system.website_sale.payment_confirmation_status.remove_communication`

```xml
<data inherit_id="website_sale.payment_confirmation_status" priority="50">
    <xpath expr="//div[@t-if='order.reference']" position="replace"/>
</data>

```
Edit: [snippets/mint_system.website_sale.payment_confirmation_status.remove_communication.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.website_sale.payment_confirmation_status.remove_communication.xml)

Source: [snippets/mint_system.website_sale.payment_confirmation_status.remove_communication.xml](https://odoo.build/snippets/mint_system.website_sale.payment_confirmation_status.remove_communication.xml)

## Product

### Hide Cart

ID: `mint_system.website_sale.product.hide_cart`

```xml
<data inherit_id="website_sale.product" priority="50">
    <xpath expr="//div[@id='add_to_cart_wrap']" position="attributes">
        <attribute name="t-if">request.session.uid</attribute>
    </xpath>
    <xpath expr="//div[@id='add_to_cart_wrap']" position="before">
        <style t-if="not request.session.uid">
        .css_quantity{display: none !important;}
    </style>
    </xpath>
</data>

```
Edit: [snippets/mint_system.website_sale.product.hide_cart.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.website_sale.product.hide_cart.xml)

Source: [snippets/mint_system.website_sale.product.hide_cart.xml](https://odoo.build/snippets/mint_system.website_sale.product.hide_cart.xml)

### Hide Price

ID: `mint_system.website_sale.product.hide_price`

```xml
<data inherit_id="website_sale.product" priority="50">
    <xpath expr="//t[@t-call='website_sale.product_price']" position="attributes">
        <attribute name="t-if">request.session.uid</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.website_sale.product.hide_price.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.website_sale.product.hide_price.xml)

Source: [snippets/mint_system.website_sale.product.hide_price.xml](https://odoo.build/snippets/mint_system.website_sale.product.hide_price.xml)

### Show Default Code

ID: `mint_system.website_sale.product.show_default_code`

```xml
<data inherit_id="website_sale.product" priority="50">
    <p t-field="product.description_sale" position="after">
        <p t-if="product_variant.default_code">
            <strong>Artikelnummer:</strong>
            <span t-field="product_variant.default_code"/>
        </p>
    </p>
</data>

```
Edit: [snippets/mint_system.website_sale.product.show_default_code.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.website_sale.product.show_default_code.xml)

Source: [snippets/mint_system.website_sale.product.show_default_code.xml](https://odoo.build/snippets/mint_system.website_sale.product.show_default_code.xml)

### Show Product Dimension

ID: `mint_system.website_sale.product.show_product_dimension`

```xml
<data inherit_id="website_sale.product" priority="50">
    <xpath expr="//div[@id='product_details']" position="inside">
        <div t-if="product_variant.material_ids" name="material_ids"><strong>Dimensions</strong>: <br/><ul class="un-styled"><t t-foreach="product_variant.dimension_ids" t-as="dimension"><li><span t-field="dimension.name"/><t t-if="dimension.value"><span t-field="dimension.value"/></t></li></t></ul></div>
    </xpath>
</data>

```
Edit: [snippets/mint_system.website_sale.product.show_product_dimension.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.website_sale.product.show_product_dimension.xml)

Source: [snippets/mint_system.website_sale.product.show_product_dimension.xml](https://odoo.build/snippets/mint_system.website_sale.product.show_product_dimension.xml)

### Show Product Material

ID: `mint_system.website_sale.product.show_product_material`

```xml
<data inherit_id="website_sale.product" priority="50">
    <xpath expr="//div[@id='product_details']" position="inside">
        <div t-if="product_variant.material_ids" name="material_ids"><strong>Materials</strong>: <br/><ul class="un-styled"><t t-foreach="product_variant.material_ids" t-as="material"><li><span t-field="material.name"/><t t-if="material.percent"><span t-field="material.percent"/></t></li></t></ul></div>
    </xpath>
</data>

```
Edit: [snippets/mint_system.website_sale.product.show_product_material.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.website_sale.product.show_product_material.xml)

Source: [snippets/mint_system.website_sale.product.show_product_material.xml](https://odoo.build/snippets/mint_system.website_sale.product.show_product_material.xml)

## Products Categories

### Bigger Categories Button

ID: `mint_system.website_sale.products_categories.bigger_categories_button`

```xml
<!-- Add class to categories button -->
<data inherit_id="website_sale.products_categories" priority="50">
    <xpath expr="//button" position="replace">
        <button type="button" class="btn btn-secondary d-lg-none mb-2" data-target="#wsale_products_categories_collapse" data-toggle="collapse">
          Show categories
      </button>
    </xpath>
</data>

```
Edit: [snippets/mint_system.website_sale.products_categories.bigger_categories_button.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.website_sale.products_categories.bigger_categories_button.xml)

Source: [snippets/mint_system.website_sale.products_categories.bigger_categories_button.xml](https://odoo.build/snippets/mint_system.website_sale.products_categories.bigger_categories_button.xml)

## Products Item

### Hide Price

ID: `mint_system.website_sale.products_item.hide_price`

```xml
<data inherit_id="website_sale.products_item" priority="50">
    <xpath expr="//div[hasclass('o_wsale_product_sub')]" position="attributes">
        <attribute name="t-if">request.session.uid</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.website_sale.products_item.hide_price.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.website_sale.products_item.hide_price.xml)

Source: [snippets/mint_system.website_sale.products_item.hide_price.xml](https://odoo.build/snippets/mint_system.website_sale.products_item.hide_price.xml)

### Prefix Price

ID: `mint_system.website_sale.products_item.prefix_price`

```xml
<data inherit_id="website_sale.products_item" priority="50">
    <xpath expr="//div[@class='product_price'][1]/t[1]" position="before">
        <span>From</span>
    </xpath>
</data>

```
Edit: [snippets/mint_system.website_sale.products_item.prefix_price.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.website_sale.products_item.prefix_price.xml)

Source: [snippets/mint_system.website_sale.products_item.prefix_price.xml](https://odoo.build/snippets/mint_system.website_sale.products_item.prefix_price.xml)

