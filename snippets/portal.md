# Portal

## Address Form Fields

### Add Company Type

ID: `mint_system.portal.address_form_fields.add_company_type`\
Inherit ID: `portal.address_form_fields`

```xml
<data priority="50">
    <xpath expr="//input[@name='street2']" position="attributes">
        <attribute name="name">street2_display</attribute>
    </xpath>

    <xpath expr="//input[@name='street2_display']" position="after">
        <input type="hidden" name="street2" class="js_street2_hidden"/>
    </xpath>
    
    <xpath expr="//t[@name='b2b_fields']/div" position="after">
        <div id="company_type" class="col-lg-12 mb-2">
            <div>
                <t t-foreach="['person', 'company']" t-as="ct">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input js_company_type_selector" type="radio" name="company_type_ui" t-att-value="ct" t-att-id="'o_type_%s' % ct" t-att-checked="'checked' if partner_sudo.company_type == ct else None"/>
                        <label class="form-check-label" t-att-for="'o_type_%s' % ct">
                            <span t-if="ct == 'person'">Person</span>
                            <span t-if="ct == 'company'">Other Company</span>
                        </label>
                    </div>
                </t>
            </div>
        </div>
    </xpath>
    
     <xpath expr="//input[@name='required_fields']" position="after">
       <script type="text/javascript">
            (function () {
                var form = document.currentScript.closest('form');
                if (!form) return;

                function syncHiddenStreet2() {
                    var displayInput = form.querySelector("input[name='street2_display']");
                    var hiddenInput = form.querySelector("input[name='street2']");
                    var selectedType = form.querySelector(".js_company_type_selector:checked");
                    if (displayInput &amp;&amp; hiddenInput &amp;&amp; selectedType) {
                        hiddenInput.value = displayInput.value + '###' + selectedType.value;
                    }
                }

                var displayInput = form.querySelector("input[name='street2_display']");
                if (displayInput) {
                    displayInput.addEventListener('input', syncHiddenStreet2);
                }
                form.querySelectorAll('.js_company_type_selector').forEach(function (radio) {
                    radio.addEventListener('change', syncHiddenStreet2);
                });
                form.addEventListener('submit', syncHiddenStreet2);

                // initial sync on load, in case the user submits without touching anything
                syncHiddenStreet2();
            })();
        </script>
    </xpath>
</data>
```
Edit: [snippets/mint_system.portal.address_form_fields.add_company_type.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.portal.address_form_fields.add_company_type.xml)\
Source: [snippets/mint_system.portal.address_form_fields.add_company_type.xml](https://odoo.build/snippets/mint_system.portal.address_form_fields.add_company_type.xml)

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

## Address List

### Hide Edit Business Address

ID: `mint_system.portal.address_list.hide_edit_business_address`\
Inherit ID: `portal.address_list`

```xml
<data priority="50">
     <xpath expr="//t[@t-set='can_be_edited']" position="replace">
        <t t-set="can_be_edited" t-value="address._can_be_edited_by_current_customer() and address.type != 'invoice'"/>
    </xpath>
</data>
```
Edit: [snippets/mint_system.portal.address_list.hide_edit_business_address.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.portal.address_list.hide_edit_business_address.xml)\
Source: [snippets/mint_system.portal.address_list.hide_edit_business_address.xml](https://odoo.build/snippets/mint_system.portal.address_list.hide_edit_business_address.xml)

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

### Hide New Address Link

ID: `mint_system.portal.my_addresses.hide_new_address_link`\
Inherit ID: `portal.my_addresses`

```xml
<data priority="50">
    <xpath expr="(//a[@role='button'])[2]" position="replace">
    </xpath>
</data>
```
Edit: [snippets/mint_system.portal.my_addresses.hide_new_address_link.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.portal.my_addresses.hide_new_address_link.xml)\
Source: [snippets/mint_system.portal.my_addresses.hide_new_address_link.xml](https://odoo.build/snippets/mint_system.portal.my_addresses.hide_new_address_link.xml)

### Hide Use Delivery As Billing

ID: `mint_system.portal.my_addresses.hide_use_delivery_as_billing`\
Inherit ID: `portal.my_addresses`

```xml
<data priority="50">
     <xpath expr="//div[@class='form-check form-switch mt-2']" position="attributes">
         <attribute name="class">d-none</attribute>
    </xpath>
</data>
```
Edit: [snippets/mint_system.portal.my_addresses.hide_use_delivery_as_billing.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.portal.my_addresses.hide_use_delivery_as_billing.xml)\
Source: [snippets/mint_system.portal.my_addresses.hide_use_delivery_as_billing.xml](https://odoo.build/snippets/mint_system.portal.my_addresses.hide_use_delivery_as_billing.xml)

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

