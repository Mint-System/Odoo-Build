# Portal
## Portal My Details Fields  
### Show Firstname Lastname  
ID: `mint_system.portal.portal_my_details_fields.show_firstname_lastname`  
```xml
<?xml version="1.0"?>
<data inherit_id="portal.portal_my_details_fields" priority="50">

  <xpath expr="//input[@name='name']/.." position="replace">
    <div t-attf-class="mb-3 #{error.get('firstname') and 'o_has_error' or ''} col-xl-6">
      <label class="col-form-label" for="firstname">Firstname</label>
      <input type="text" name="firstname" t-attf-class="form-control #{error.get('firstname') and 'is-invalid' or ''}" t-att-value="firstname or partner.firstname" />
    </div>
    <div t-attf-class="mb-3 #{error.get('lastname') and 'o_has_error' or ''} col-xl-6">
      <label class="col-form-label" for="lastname">Lastname</label>
      <input type="text" name="lastname" t-attf-class="form-control #{error.get('lastname') and 'is-invalid' or ''}" t-att-value="lastname or partner.lastname" />
    </div>
  </xpath>

</data>
```
Source: [snippets/portal.portal_my_details_fields.show_firstname_lastname.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/portal.portal_my_details_fields.show_firstname_lastname.xml)

### Show Street2  
ID: `mint_system.portal.portal_my_details_fields.show_street2`  
```xml
<?xml version="1.0"?>
<data inherit_id="portal.portal_my_details_fields" priority="50">

  <xpath expr="//input[@name='street']/.." position="after">
    <div t-attf-class="mb-3 #{error.get('street') and 'o_has_error' or ''} col-xl-6">
      <label class="col-form-label" for="street2">Street2</label>
      <input type="text" name="street2" t-attf-class="form-control #{error.get('street2') and 'is-invalid' or ''}" t-att-value="street2 or partner.street2"/>
    </div>
  </xpath>

</data>
```
Source: [snippets/portal.portal_my_details_fields.show_street2.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/portal.portal_my_details_fields.show_street2.xml)

