# Portal

## Address Form Fields

### Move B2b Fields

ID: `mint_system.portal.address_form_fields.move_b2b_fields`\
Inherit ID: `portal.address_form_fields`

```xml
<data priority="50">

    <div id="div_name" position="before">
        <t name="b2b_fields" position="move" />
    </div>

</data>
```
Edit: [snippets/mint_system.portal.address_form_fields.move_b2b_fields.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.portal.address_form_fields.move_b2b_fields.xml)\
Source: [snippets/mint_system.portal.address_form_fields.move_b2b_fields.xml](https://odoo.build/snippets/mint_system.portal.address_form_fields.move_b2b_fields.xml)

## My Addresses

### Hide Billing Address

ID: `mint_system.portal.my_addresses.hide_billing_address`\
Inherit ID: `portal.my_addresses`

```xml
<data priority="50">
    <xpath expr="//div[@id='billing_container']" position="replace"/>
    <xpath expr="//div[@class='d-flex justify-content-between align-items-start gap-3 mt-4 pt-2']" position="replace"/>
    <xpath expr="//div[@class='form-check form-switch mt-2']" position="replace"/>
</data>
```
Edit: [snippets/mint_system.portal.my_addresses.hide_billing_address.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.portal.my_addresses.hide_billing_address.xml)\
Source: [snippets/mint_system.portal.my_addresses.hide_billing_address.xml](https://odoo.build/snippets/mint_system.portal.my_addresses.hide_billing_address.xml)

## Portal My Details Fields

### Show Firstname Lastname

ID: `mint_system.portal.portal_my_details_fields.show_firstname_lastname`\
Inherit ID: `portal.portal_my_details_fields`

```xml
<data priority="50">
    <xpath expr="//input[@name='name']/.." position="replace">
        <div t-attf-class="mb-3 #{error.get('firstname') and 'o_has_error' or ''} col-xl-6">
            <label class="col-form-label" for="firstname">Firstname</label>
            <input type="text" name="firstname" t-attf-class="form-control #{error.get('firstname') and 'is-invalid' or ''}" t-att-value="firstname or partner.firstname"/>
        </div>
        <div t-attf-class="mb-3 #{error.get('lastname') and 'o_has_error' or ''} col-xl-6">
            <label class="col-form-label" for="lastname">Lastname</label>
            <input type="text" name="lastname" t-attf-class="form-control #{error.get('lastname') and 'is-invalid' or ''}" t-att-value="lastname or partner.lastname"/>
        </div>
    </xpath>
</data>

```
Edit: [snippets/mint_system.portal.portal_my_details_fields.show_firstname_lastname.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.portal.portal_my_details_fields.show_firstname_lastname.xml)\
Source: [snippets/mint_system.portal.portal_my_details_fields.show_firstname_lastname.xml](https://odoo.build/snippets/mint_system.portal.portal_my_details_fields.show_firstname_lastname.xml)

### Show Street

ID: `mint_system.portal.portal_my_details_fields.show_street`\
Inherit ID: `portal.portal_my_details_fields`

```xml
<data priority="50">
    <xpath expr="//input[@name='street']/.." position="after">
        <div t-attf-class="mb-3 #{error.get('street') and 'o_has_error' or ''} col-xl-6">
            <label class="col-form-label" for="street2">Street2</label>
            <input type="text" name="street2" t-attf-class="form-control #{error.get('street2') and 'is-invalid' or ''}" t-att-value="street2 or partner.street2"/>
        </div>
    </xpath>
</data>

```
Edit: [snippets/mint_system.portal.portal_my_details_fields.show_street.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.portal.portal_my_details_fields.show_street.xml)\
Source: [snippets/mint_system.portal.portal_my_details_fields.show_street.xml](https://odoo.build/snippets/mint_system.portal.portal_my_details_fields.show_street.xml)

