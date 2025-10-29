# Agreement Legal

## Partner Agreement Form View

### Agreement Subtype Domain

ID: `mint_system.agreement_legal.partner_agreement_form_view.agreement_subtype_domain`

```xml
<data inherit_id="agreement_legal.partner_agreement_form_view" priority="50">
    <field name="agreement_subtype_id" position="attributes">
        <attribute name="domain"/>
    </field>
</data>

```
Source: [snippets/agreement_legal.partner_agreement_form_view.agreement_subtype_domain.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/agreement_legal.partner_agreement_form_view.agreement_subtype_domain.xml)

### Description Optional

ID: `mint_system.agreement_legal.partner_agreement_form_view.description_optional`

```xml
<data inherit_id="agreement_legal.partner_agreement_form_view" priority="50">
    <field name="description" position="attributes">
        <attribute name="required">False</attribute>
    </field>
    <xpath expr="//group[@class='oe_edit_only']" position="replace"/>
</data>

```
Source: [snippets/agreement_legal.partner_agreement_form_view.description_optional.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/agreement_legal.partner_agreement_form_view.description_optional.xml)

### Hide Description

ID: `mint_system.agreement_legal.partner_agreement_form_view.hide_description`

```xml
<data inherit_id="agreement_legal.partner_agreement_form_view" priority="50">
    <field name="description" position="replace"/>
</data>

```
Source: [snippets/agreement_legal.partner_agreement_form_view.hide_description.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/agreement_legal.partner_agreement_form_view.hide_description.xml)

### Hide Parties

ID: `mint_system.agreement_legal.partner_agreement_form_view.hide_parties`

```xml
<data inherit_id="agreement_legal.partner_agreement_form_view" priority="50">
    <field name="use_parties_content" position="attributes">
        <attribute name="invisible">1</attribute>
    </field>
    <xpath expr="//group[@name='cust_parties']/p" position="replace"/>
    <xpath expr="//group[@name='partner_left']" position="replace"/>
    <xpath expr="//group[@name='contact_right']" position="replace"/>
</data>

```
Source: [snippets/agreement_legal.partner_agreement_form_view.hide_parties.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/agreement_legal.partner_agreement_form_view.hide_parties.xml)

### Hide Special Terms

ID: `mint_system.agreement_legal.partner_agreement_form_view.hide_special_terms`

```xml
<data inherit_id="agreement_legal.partner_agreement_form_view" priority="50">
    <page name="structure" position="attributes">
        <attribute name="invisible">1</attribute>
    </page>
    <page name="products" position="attributes">
        <attribute name="invisible">1</attribute>
    </page>
    <page name="child_agreements" position="attributes">
        <attribute name="invisible">1</attribute>
    </page>
    <page name="performance" position="attributes">
        <attribute name="invisible">1</attribute>
    </page>
</data>

```
Source: [snippets/agreement_legal.partner_agreement_form_view.hide_special_terms.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/agreement_legal.partner_agreement_form_view.hide_special_terms.xml)

### X Group Ids And X User Ids

ID: `mint_system.agreement_legal.partner_agreement_form_view.x_group_ids_and_x_user_ids`

```xml
<data inherit_id="agreement_legal.partner_agreement_form_view" priority="50">
    <field name="agreement_subtype_id" position="after">
        <field name="x_group_ids" widget="many2many_tags" domain="[('category_id.name','=','Agreement')]"/>
        <field name="x_user_ids" widget="many2many_tags"/>
    </field>
</data>

```
Source: [snippets/agreement_legal.partner_agreement_form_view.x_group_ids_and_x_user_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/agreement_legal.partner_agreement_form_view.x_group_ids_and_x_user_ids.xml)

## Partner Agreement List View

### Replace Tree

ID: `mint_system.agreement_legal.partner_agreement_list_view.replace_tree`

```xml
<data inherit_id="agreement_legal.partner_agreement_list_view" priority="50">
    <tree position="replace">
        <tree string="Agreements" default_order="code desc, name" multi_edit="1">
            <field name="code"/>
            <field name="name" optional="hide"/>
            <field name="partner_id"/>
            <field name="description"/>
            <field name="signed_contract" widget="binary" filename="name" optional="show"/>
            <field name="start_date"/>
            <field name="agreement_type_id"/>
            <field name="agreement_subtype_id"/>
            <field name="stage_id"/>
            <field name="active" invisible="1"/>
        </tree>
    </tree>
</data>

```
Source: [snippets/agreement_legal.partner_agreement_list_view.replace_tree.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/agreement_legal.partner_agreement_list_view.replace_tree.xml)

## Partner Agreement Search View

### Partner First

ID: `mint_system.agreement_legal.partner_agreement_search_view.partner_first`

```xml
<data inherit_id="agreement_legal.partner_agreement_search_view" priority="50">
    <field name="name" position="replace"/>
    <field name="partner_id" position="replace"/>
    <field name="code" position="before">
        <field name="partner_id"/>
    </field>
    <field name="code" position="before">
        <field name="name"/>
    </field>
</data>

```
Source: [snippets/agreement_legal.partner_agreement_search_view.partner_first.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/agreement_legal.partner_agreement_search_view.partner_first.xml)

