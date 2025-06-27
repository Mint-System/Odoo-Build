# Account Batch Payment
## Print Batch Payment  
### Add Row  
ID: `mint_system.account_batch_payment.print_batch_payment.add_row`  
```xml
<data inherit_id="account_batch_payment.print_batch_payment" priority="50">
    <xpath expr="//table/thead/tr/th[3]" position="after">
        <th class="text-left">Purpose</th>
    </xpath>
    <xpath expr="//table/tr/td[3]" position="after">
        <td class="text-left">
            <t t-esc="x_studio_bemerkungen"/>
        </td>
    </xpath>
    <xpath expr="//table/tfoot/tr/td[3]" position="after">
        <td/>
    </xpath>
</data>

```
Source: [snippets/account_batch_payment.print_batch_payment.add_row.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/account_batch_payment.print_batch_payment.add_row.xml)

### Sort  
ID: `mint_system.account_batch_payment.print_batch_payment.sort`  
```xml
<data inherit_id="account_batch_payment.print_batch_payment" priority="50">
    <xpath expr=" //tr[@t-as='payment']" position="replace">
      
      <t t-set="sorted_payments" t-value="sorted(o.payment_ids, key=lambda p: (p.partner_id.name or ''))"/>
      
        <tr t-foreach="sorted_payments" t-as="payment">
            <td class="text-start">
                <t t-esc="payment.partner_id.name"/>
            </td>
            <td class="text-start">
                <t t-esc="payment.date" t-options="{&quot;widget&quot;: &quot;date&quot;}"/>
            </td>
            <td class="text-start">
                <t t-esc="payment.ref"/>
            </td>
            <td class="text-end">
                <t t-esc="payment.amount" t-options="{'widget': 'monetary', 'display_currency': payment.currency_id}"/>
            </td>
        </tr>
       
    </xpath>
</data>
```
Source: [snippets/account_batch_payment.print_batch_payment.sort.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/account_batch_payment.print_batch_payment.sort.xml)

## View Batch Payment Form  
### Show Sct Generic  
ID: `mint_system.account_batch_payment.view_batch_payment_form.show_sct_generic`  
```xml
<data inherit_id="account_batch_payment.view_batch_payment_form" priority="50">
    <field name="batch_type" position="after">
        <field name="sct_generic"/>
    </field>
</data>

```
Source: [snippets/account_batch_payment.view_batch_payment_form.show_sct_generic.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/account_batch_payment.view_batch_payment_form.show_sct_generic.xml)

