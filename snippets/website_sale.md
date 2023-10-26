# Website Sale
## Address  
### Hide Shipping Use Same  
ID: `mint_system.website_sale.address.hide_shipping_use_same`  
```xml
<data inherit_id="website_sale.address" priority="50">
  
    <xpath expr="//input[@id='shipping_use_same']/.." position="attributes">
            <attribute name="style">display: none;</attribute>
        </xpath>
    
</data>
```
Source: [snippets/website_sale.address.hide_shipping_use_same.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/website_sale.address.hide_shipping_use_same.xml)

### Overwrite Required  
ID: `mint_system.website_sale.address.overwrite_required`  
```xml
<?xml version="1.0"?>
<data inherit_id="website_sale.address" priority="50">

  <xpath expr="//input[@name='field_required']" position="replace">
    <input type="hidden" name="field_required" t-att-value="'name,email'" />
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
Source: [snippets/website_sale.address.overwrite_required.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/website_sale.address.overwrite_required.xml)

### Show Firstname Lastname  
ID: `mint_system.website_sale.address.show_firstname_lastname`  
```xml
<?xml version="1.0"?>
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
Source: [snippets/website_sale.address.show_firstname_lastname.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/website_sale.address.show_firstname_lastname.xml)

## Payment Confirmation Status  
### Remove Communication  
ID: `mint_system.website_sale.payment_confirmation_status.remove_communication`  
```xml
<?xml version="1.0"?>
<data inherit_id="website_sale.payment_confirmation_status" priority="50">

  <xpath expr="//div[@t-if='order.reference']" position="replace" />

</data>
```
Source: [snippets/website_sale.payment_confirmation_status.remove_communication.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/website_sale.payment_confirmation_status.remove_communication.xml)

## Products Categories  
### Bigger Categories Button  
ID: `mint_system.website_sale.products_categories.bigger_categories_button`  
```xml
<?xml version="1.0"?>
<!-- Add class to categories button -->
<data inherit_id="website_sale.products_categories" priority="50">

    <xpath expr="//button" position="replace">
      <button type="button" class="btn btn-secondary d-lg-none mb-2"
          data-target="#wsale_products_categories_collapse" data-toggle="collapse">
          Show categories
      </button>
    </xpath>

</data>

```
Source: [snippets/website_sale.products_categories.bigger_categories_button.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/website_sale.products_categories.bigger_categories_button.xml)

## Product  
### Show Product Dimension  
ID: `mint_system.website_sale.product.show_product_dimension`  
```xml
<?xml version="1.0"?>

<data inherit_id="website_sale.product" priority="50">

    <xpath expr="//div[@id='product_details']" position="inside">
        <div t-if="product_variant.material_ids" name="material_ids">
            <strong>Dimensions</strong>: <br />
            <ul class="un-styled">
                <t t-foreach="product_variant.dimension_ids" t-as="dimension">
                    <li>
                        <span t-field="dimension.name" />
                        <t t-if="dimension.value">
                            <span t-field="dimension.value" />
                        </t>
                    </li>
                </t>
            </ul>
        </div>
    </xpath>

</data>
```
Source: [snippets/website_sale.product.show_product_dimension.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/website_sale.product.show_product_dimension.xml)

### Show Product Material  
ID: `mint_system.website_sale.product.show_product_material`  
```xml
<?xml version="1.0"?>

<data inherit_id="website_sale.product" priority="50">

    <xpath expr="//div[@id='product_details']" position="inside">
        <div t-if="product_variant.material_ids" name="material_ids">
            <strong>Materials</strong>: <br />
            <ul class="un-styled">
                <t t-foreach="product_variant.material_ids" t-as="material">
                    <li>
                        <span t-field="material.name" />
                        <t t-if="material.percent">
                            <span t-field="material.percent" />
                        </t>
                    </li>
                </t>
            </ul>
        </div>
    </xpath>

</data>
```
Source: [snippets/website_sale.product.show_product_material.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/website_sale.product.show_product_material.xml)

