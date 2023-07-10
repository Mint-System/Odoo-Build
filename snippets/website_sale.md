# Website Sale
## Address  
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

