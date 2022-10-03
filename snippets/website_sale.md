---
prev: ./snippets.md
---
# Website Sale
## Address  
### Overwrite Required  
ID: `mint_system.website_sale.address.overwrite_required`  
```xml
<?xml version="1.0"?>
<!-- Set required field and change formatting -->
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
Source: [snippets/website_sale.address.overwrite_required.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/website_sale.address.overwrite_required.xml)

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
Source: [snippets/website_sale.products_categories.bigger_categories_button.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/website_sale.products_categories.bigger_categories_button.xml)

