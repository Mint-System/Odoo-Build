---
prev: ./snippets.md
---
# Base
## Contact Name  
### Modify Name  
ID: `mint_system.base.contact_name.modify_name`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.contact_name" priority="50">

  <xpath expr="//div" position="replace">
    <t t-if="object.parent_name">
      <div t-esc="object.parent_name"/>
      <div t-esc="object.parent_id.name2"/>
      <span t-field="object.title"/>
      <span t-esc="object.name"/>
      <div t-esc="object.department"/>
    </t>
    <t t-if="not object.parent_name">
      <div t-esc="object.name"/>
      <span t-esc="object.name2"/>
    </t>
    <t t-if="options.get('country_image') and 'country_id' in fields and object.country_id and object.country_id.image_url">
      <span t-field="object.country_id.image_url" t-options="{&quot;widget&quot;: &quot;image_url&quot;, &quot;class&quot;: &quot;country_flag&quot;}"/>
    </t>
  </xpath>

</data>
```
Source: [snippets/base.contact_name.modify_name.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.contact_name.modify_name.xml)

## Ir Cron View Tree  
### Show Ir Actions Server Id  
ID: `mint_system.base.ir_cron_view_tree.show_ir_actions_server_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.ir_cron_view_tree" priority="50">

  <field name="model_id" position="after">
    <field name="ir_actions_server_id" optional="hide"/>
  </field>

</data>

```
Source: [snippets/base.ir_cron_view_tree.show_ir_actions_server_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.ir_cron_view_tree.show_ir_actions_server_id.xml)

## Ir Filters View Form  
### Remove Domain Widget  
ID: `mint_system.base.ir_filters_view_form.remove_domain_widget`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.ir_filters_view_form" priority="50">

    <field name="domain" position="attributes">
        <attribute name="widget"/>
    </field>

</data>
```
Source: [snippets/base.ir_filters_view_form.remove_domain_widget.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.ir_filters_view_form.remove_domain_widget.xml)

## Res Bank View Search  
### Add Zip Bic Code City  
ID: `mint_system.base.res_bank_view_search.add_zip_bic_code_city`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.res_bank_view_search" priority="50">

<xpath expr="//field[@name='name']" position="after">
  <separator/>
    <field string="PLZ" name="zip"/>
    <field string="Bankleitzahl" name="bic"/>
    <field string="Code" name="code"/>
    <field string="Stadt" name="city"/>
</xpath>

</data>
```
Source: [snippets/base.res_bank_view_search.add_zip_bic_code_city.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.res_bank_view_search.add_zip_bic_code_city.xml)

## Res Partner Kanban View  
### Show Agreements Count  
ID: `mint_system.base.res_partner_kanban_view.show_agreements_count`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.res_partner_kanban_view" priority="50">

    <xpath expr="//kanban/field[@name='type']" position="after">
        <field name="agreements_count"/>
    </xpath>

    <xpath expr="//div[hasclass('oe_kanban_details')]/ul" position="after">
        <a class="o_project_kanban_box" name="action_open_agreement" type="object">
            <div>
                <span class="o_value">
                    <t t-esc="record.agreements_count.value"/>
                </span>
                <span class="o_label">Agreements</span>
            </div>
        </a>
    </xpath>

</data>

```
Source: [snippets/base.res_partner_kanban_view.show_agreements_count.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.res_partner_kanban_view.show_agreements_count.xml)

### Show Phone  
ID: `mint_system.base.res_partner_kanban_view.show_phone`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.res_partner_kanban_view" priority="50">

  <xpath expr="//li/field[@name='email']/.." position="before">
    <li t-if="record.phone.raw_value" class="o_text_overflow"><field name="phone"/></li>
  </xpath>

</data>
```
Source: [snippets/base.res_partner_kanban_view.show_phone.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.res_partner_kanban_view.show_phone.xml)

### Show Website  
ID: `mint_system.base.res_partner_kanban_view.show_website`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.res_partner_kanban_view" priority="50">

  <xpath expr="//li/field[@name='email']/.." position="after">
    <li t-if="record.website.raw_value" class="o_text_overflow"><field name="website"/></li>
  </xpath>

</data>
```
Source: [snippets/base.res_partner_kanban_view.show_website.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.res_partner_kanban_view.show_website.xml)

## User Groups View  
### Remove Fleet Groups  
ID: `mint_system.base.user_groups_view.remove_fleet_groups`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.user_groups_view" priority="50">

  <field name="in_group_154" position="replace" />
  <field name="in_group_153" position="replace" />

</data>
```
Source: [snippets/base.user_groups_view.remove_fleet_groups.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.user_groups_view.remove_fleet_groups.xml)

## View Bank Form  
### Add Display Name  
ID: `mint_system.base.view_bank_form.add_display_name`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.view_bank_form" priority="50">

  <xpath expr="//field[@name='name']" position="after">
    <field name="display_name"/>
  </xpath>

</data>

```
Source: [snippets/base.view_bank_form.add_display_name.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.view_bank_form.add_display_name.xml)

## View Partner Form  
### Add Commercial Partner Id  
ID: `mint_system.base.view_partner_form.add_commercial_partner_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.view_partner_form" priority="50">

  <xpath expr="//field[@name='bank_ids']/.." position="before">
    <group>
      <field name="commercial_partner_id" readonly="0" />
    </group>
  </xpath>

</data>
```
Source: [snippets/base.view_partner_form.add_commercial_partner_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.view_partner_form.add_commercial_partner_id.xml)

### Add Credit Limit  
ID: `mint_system.base.view_partner_form.add_credit_limit`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.view_partner_form" priority="50">

  <xpath expr="//field[@name='property_account_payable_id']" position="after">
    <field name="credit_limit"/>
  </xpath>

  <xpath expr="//group[@name='misc']/field" position="replace">
  </xpath>

</data>

```
Source: [snippets/base.view_partner_form.add_credit_limit.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.view_partner_form.add_credit_limit.xml)

### Add Department And Lang On Page Contact Addresses  
ID: `mint_system.base.view_partner_form.add_department_and_lang_on_page_contact_addresses`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.view_partner_form" priority="52">>

<data>
  <xpath expr="//page[@name='contact_addresses']/field[@name='child_ids']/form[1]/sheet[1]/group[1]/group[1]/field[@name='comment']" position="before">
    <field name="department"/>
    <field name="lang"/>
  </xpath>
</data>

</data>
```
Source: [snippets/base.view_partner_form.add_department_and_lang_on_page_contact_addresses.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.view_partner_form.add_department_and_lang_on_page_contact_addresses.xml)

### Add Display Name  
ID: `mint_system.base.view_partner_form.add_display_name`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.view_partner_form" priority="50">

  <xpath expr="//field[@name='name']" position="after">
    <field name="display_name"/>
  </xpath>
  
</data>
```
Source: [snippets/base.view_partner_form.add_display_name.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.view_partner_form.add_display_name.xml)

### Move Ref  
ID: `mint_system.base.view_partner_form.move_ref`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.view_partner_form" priority="50">

  <xpath expr="//field[@name='ref']" position="replace">
  </xpath>

  <xpath expr="//field[@name='vat']" position="after">
    <field name="ref"/>
  </xpath>

</data>

```
Source: [snippets/base.view_partner_form.move_ref.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.view_partner_form.move_ref.xml)

### Show Industry  
ID: `mint_system.base.view_partner_form.show_industry`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.view_partner_form" priority="50">

  <xpath expr="//field[@name='industry_id']" position="attributes">
    <attribute name="attrs">{'invisible': False}</attribute>
  </xpath>

</data>

```
Source: [snippets/base.view_partner_form.show_industry.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.view_partner_form.show_industry.xml)

### Show User Id  
ID: `mint_system.base.view_partner_form.show_user_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.view_partner_form" priority="50">

  <xpath expr="//page[@name='internal_notes']" position="inside">
    <field name="user_id"/>
  </xpath>

</data>

```
Source: [snippets/base.view_partner_form.show_user_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.view_partner_form.show_user_id.xml)

### X External Ref  
ID: `mint_system.base.view_partner_form.x_external_ref`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.view_partner_form" priority="50">

  <xpath expr="//field[@name='vat']" position="after">
    <field name="x_external_ref"/>
  </xpath>

</data>

```
Source: [snippets/base.view_partner_form.x_external_ref.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.view_partner_form.x_external_ref.xml)

### X Packaging Ref  
ID: `mint_system.base.view_partner_form.x_packaging_ref`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.view_partner_form" priority="50">

  <xpath expr="//field[@name='ref']" position="after">
    <field name="x_packaging_ref"/>
  </xpath>

</data>

```
Source: [snippets/base.view_partner_form.x_packaging_ref.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.view_partner_form.x_packaging_ref.xml)

## View Partner Tree  
### Add Ref Zip Type  
ID: `mint_system.base.view_partner_tree.add_ref_zip_type`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.view_partner_tree" priority="50">

<xpath expr="//field[@name='display_name']" position="after">
  <field name="ref"/>
</xpath>

<xpath expr="//field[@name='city']" position="before">
  <field name="zip"/>
</xpath>

<xpath expr="//field[@name='category_id']" position="after">
  <field name="type"/>
</xpath>

</data>
```
Source: [snippets/base.view_partner_tree.add_ref_zip_type.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.view_partner_tree.add_ref_zip_type.xml)

### Move Zip And City  
ID: `mint_system.base.view_partner_tree.move_zip_and_city`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.view_partner_tree" priority="60">

  <field name="city" position="replace" />
  <field name="zip" position="replace" />
  <field name="display_name" position="after">
    <field name="zip" />
    <field name="city" />
  </field>

</data>

```
Source: [snippets/base.view_partner_tree.move_zip_and_city.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.view_partner_tree.move_zip_and_city.xml)

### Optional Payment Terms  
ID: `mint_system.base.view_partner_tree.optional_payment_terms`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.view_partner_tree" priority="50">

  <field name="vat" position="after">
    <field name="property_payment_term_id" optional="hide"/>
  </field>

</data>

```
Source: [snippets/base.view_partner_tree.optional_payment_terms.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.view_partner_tree.optional_payment_terms.xml)

### Optional Zip  
ID: `mint_system.base.view_partner_tree.optional_zip`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.view_partner_tree" priority="50">

  <field name="city" position="before">
    <field name="zip" optional="hide"/>
  </field>

</data>

```
Source: [snippets/base.view_partner_tree.optional_zip.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.view_partner_tree.optional_zip.xml)

### Show Industry  
ID: `mint_system.base.view_partner_tree.show_industry`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.view_partner_tree" priority="50">

  <field name="country_id" position="after">
    <field name="industry_id" optional="hide"/>
  </field>

</data>

```
Source: [snippets/base.view_partner_tree.show_industry.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.view_partner_tree.show_industry.xml)

### Show Property Product Pricelist  
ID: `mint_system.base.view_partner_tree.show_property_product_pricelist`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.view_partner_tree" priority="60">

  <field name="country_id" position="after">
    <field name="property_product_pricelist" optional="hide"/>
  </field>
  
</data>

```
Source: [snippets/base.view_partner_tree.show_property_product_pricelist.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.view_partner_tree.show_property_product_pricelist.xml)

### Show Type  
ID: `mint_system.base.view_partner_tree.show_type`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.view_partner_tree" priority="50">

  <field name="display_name" position="before">
    <field name="type" optional="hide"/>
  </field>

</data>

```
Source: [snippets/base.view_partner_tree.show_type.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.view_partner_tree.show_type.xml)

## View Res Bank Tree  
### Add Zip  
ID: `mint_system.base.view_res_bank_tree.add_zip`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.view_res_bank_tree" priority="50">	

<xpath expr="//field[@name='city']" position="before">
  <field name="zip"/>
</xpath>

</data>
```
Source: [snippets/base.view_res_bank_tree.add_zip.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.view_res_bank_tree.add_zip.xml)

## View Res Partner Filter  
### Add Type Description  
ID: `mint_system.base.view_res_partner_filter.add_type_description`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.view_res_partner_filter" priority="50">

<xpath expr="//field[@name='pricelist_id']" position="after">
  <separator/>
    <field string="Typenbezeichnung" name="type_description"/>
    <field string="Typenbezeichnung 2" name="type_description2"/>
</xpath>

</data>
```
Source: [snippets/base.view_res_partner_filter.add_type_description.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.view_res_partner_filter.add_type_description.xml)

### Add Zip And City  
ID: `mint_system.base.view_res_partner_filter.add_zip_and_city`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.view_res_partner_filter" priority="50">

<xpath expr="//field[@name='user_id']" position="after">
  <separator/>
    <field string="PLZ" name="zip"/>
    <field string="Stadt" name="city"/>
</xpath>

</data>
```
Source: [snippets/base.view_res_partner_filter.add_zip_and_city.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.view_res_partner_filter.add_zip_and_city.xml)

### Search Zip  
ID: `mint_system.base.view_res_partner_filter.search_zip`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.view_res_partner_filter" priority="50">

  <field name="user_id" position="after">
    <field name="zip" />
  </field>

</data>

```
Source: [snippets/base.view_res_partner_filter.search_zip.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.view_res_partner_filter.search_zip.xml)

## View Translation Lang Src Value Tree  
### Show Comments  
ID: `mint_system.base.view_translation_lang_src_value_tree.show_comments`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.view_translation_lang_src_value_tree" priority="50">

  <field name="value" position="after">
    <field name="comments"/>
  </field>

</data>

```
Source: [snippets/base.view_translation_lang_src_value_tree.show_comments.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.view_translation_lang_src_value_tree.show_comments.xml)

## View Translation Tree  
### Show Comments  
ID: `mint_system.base.view_translation_tree.show_comments`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.view_translation_tree" priority="50">

  <field name="state" position="after">
    <field name="comments"/>
  </field>

  <field name="name" position="attributes">
    <attribute name="optional">hide</attribute>
  </field>

  <field name="module" position="attributes">
    <attribute name="optional">hide</attribute>
  </field>

  <field name="type" position="attributes">
    <attribute name="optional">hide</attribute>
  </field>

  <field name="state" position="attributes">
    <attribute name="optional">hide</attribute>
  </field>

</data>

```
Source: [snippets/base.view_translation_tree.show_comments.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.view_translation_tree.show_comments.xml)

## View Users Form  
### Email  
ID: `mint_system.base.view_users_form.email`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.view_users_form" priority="50">

  <field name="odoobot_state" position="after">
    <field name="email" />
  </field>

</data>
```
Source: [snippets/base.view_users_form.email.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.view_users_form.email.xml)

### Write Partner Id  
ID: `mint_system.base.view_users_form.write_partner_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="base.view_users_form" priority="50">

  <xpath expr="//group/field[@name='partner_id']" position="attributes">
    <attribute name="readonly">0</attribute>
  </xpath>

</data>
```
Source: [snippets/base.view_users_form.write_partner_id.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/base.view_users_form.write_partner_id.xml)

