# Account Batch Payment
## Print Batch Payment  
### Add Row  
ID: `mint_system.account_batch_payment.print_batch_payment.add_row`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_batch_payment.print_batch_payment" priority="50">
    <xpath expr="//table/thead/tr/th[3]" position="after">
        <th class="text-left">Purpose</th>
    </xpath>
    <xpath expr="//table/tr/td[3]" position="after">
        <td class="text-left"><t t-esc="x_studio_bemerkungen"/></td>
    </xpath>
    <xpath expr="//table/tfoot/tr/td[3]" position="after">
        <td></td>
    </xpath>
</data>
```
Source: [snippets/account_batch_payment.print_batch_payment.add_row.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/account_batch_payment.print_batch_payment.add_row.xml)

### Sort  
ID: `mint_system.account_batch_payment.print_batch_payment.sort`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_batch_payment.print_batch_payment" priority="50">
    <xpath expr=" //tr[@t-as='payment']" position="replace">
        <tr t-foreach="sorted(page['payments'], key=lambda l: l.partner_id.name)" t-as="payment">
            <td class="text-left">
                <t t-esc="payment.partner_id.name"/>
            </td>
            <td class="text-left">
                <t t-esc="payment.date" t-options="{&quot;widget&quot;: &quot;date&quot;}"/>
            </td>
            <td class="text-left">
                <t t-esc="payment.ref"/>
            </td>
            <td class="text-right">
                <t t-esc="payment.amount" t-options="{'widget': 'monetary', 'display_currency': payment.currency_id}"/>
            </td>
        </tr>
    </xpath>
</data>
```
Source: [snippets/account_batch_payment.print_batch_payment.sort.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/account_batch_payment.print_batch_payment.sort.xml)

## View Batch Payment Form  
### Show Sct Generic  
ID: `mint_system.account_batch_payment.view_batch_payment_form.show_sct_generic`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_batch_payment.view_batch_payment_form" priority="50">
    <field name="batch_type" position="after">
        <field name="sct_generic" />
    </field>
</data>

```
Source: [snippets/account_batch_payment.view_batch_payment_form.show_sct_generic.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/account_batch_payment.view_batch_payment_form.show_sct_generic.xml)

