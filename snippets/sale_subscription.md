# Sale Subscription
## Payment Checkout Inherit  
### Remove Is Subscription Note  
ID: `mint_system.sale_subscription.payment_checkout_inherit.remove_is_subscription_note`  
```xml
<?xml version="1.0"?>
<data inherit_id="sale_subscription.payment_checkout_inherit" priority="50">

  <label t-if="is_subscription" position="replace" />

</data>
```
Source: [snippets/sale_subscription.payment_checkout_inherit.remove_is_subscription_note.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/sale_subscription.payment_checkout_inherit.remove_is_subscription_note.xml)

## Sale Subscription Template View Form  
### Journal Id Domain  
ID: `mint_system.sale_subscription.sale_subscription_template_view_form.journal_id_domain`  
```xml
<?xml version="1.0"?>
<data inherit_id="sale_subscription.sale_subscription_template_view_form" priority="50">

  <xpath expr="//field[@name='journal_id']" position="attributes">
    <attribute name="attrs">{'domain': []}</attribute>
  </xpath>

</data>

```
Source: [snippets/sale_subscription.sale_subscription_template_view_form.journal_id_domain.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/sale_subscription.sale_subscription_template_view_form.journal_id_domain.xml)

