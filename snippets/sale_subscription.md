# Sale Subscription

## Payment Checkout Inherit

### Remove Is Subscription Note

ID: `mint_system.sale_subscription.payment_checkout_inherit.remove_is_subscription_note`

```xml
<data inherit_id="sale_subscription.payment_checkout_inherit" priority="50">
    <label t-if="is_subscription" position="replace"/>
</data>

```
Source: [snippets/sale_subscription.payment_checkout_inherit.remove_is_subscription_note.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_subscription.payment_checkout_inherit.remove_is_subscription_note.xml)

## Sale Subscription Order View Form

### Remove Upsell Button

ID: `mint_system.sale_subscription.sale_subscription_order_view_form.remove_upsell_button`

```xml
<data
    inherit_id="sale_subscription.sale_subscription_order_view_form"
    priority="50"
>
    <button name="prepare_upsell_order" position="replace" />
</data>

```
Source: [snippets/sale_subscription.sale_subscription_order_view_form.remove_upsell_button.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_subscription.sale_subscription_order_view_form.remove_upsell_button.xml)

### Show End Date

ID: `mint_system.sale_subscription.sale_subscription_order_view_form.show_end_date`

```xml
<data inherit_id="sale_subscription.sale_subscription_order_view_form" priority="50">
    <xpath expr="//group[@name='sales_person']//field[@name='to_renew']" position="before">
        <field name="end_date" attrs="{'invisible': [('recurrence_id', '=', False)]}"/>
    </xpath>
</data>

```
Source: [snippets/sale_subscription.sale_subscription_order_view_form.show_end_date.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_subscription.sale_subscription_order_view_form.show_end_date.xml)

### Show Template Id

ID: `mint_system.sale_subscription.sale_subscription_order_view_form.show_template_id`

```xml
<data
    inherit_id="sale_subscription.sale_subscription_order_view_form"
    priority="50"
>
    <field name="sale_order_template_id" position="attributes">
        <attribue name="attrs">{'invisible': [('subscription_management', '=', 'upsell')]}</attribue>
    </field>
</data>

```
Source: [snippets/sale_subscription.sale_subscription_order_view_form.show_template_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_subscription.sale_subscription_order_view_form.show_template_id.xml)

## Sale Subscription Template View Form

### Journal Id Domain

ID: `mint_system.sale_subscription.sale_subscription_template_view_form.journal_id_domain`

```xml
<data inherit_id="sale_subscription.sale_subscription_template_view_form" priority="50">
    <xpath expr="//field[@name='journal_id']" position="attributes">
        <attribute name="attrs">{'domain': []}</attribute>
    </xpath>
</data>

```
Source: [snippets/sale_subscription.sale_subscription_template_view_form.journal_id_domain.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/sale_subscription.sale_subscription_template_view_form.journal_id_domain.xml)

