# Sale Order Line Date
## Report Saleorder Document  
### Hide In State Draft  
ID: `mint_system.sale_order_line_date.report_saleorder_document.hide_in_state_draft`  
```xml
<?xml version="1.0"?>
<data inherit_id="sale_order_line_date.report_saleorder_document" priority="50">

  <xpath expr="//table/thead//tr[1]//th[2]" position="replace">
    <th t-if="doc.state not in ['draft']" id="commitment_date" class="text-left">Commitment Date</th>
  </xpath>
  
  <xpath expr="//table/tbody[hasclass('sale_tbody')]//tr[1]//td[2]" position="replace">
    <td t-if="doc.state not in ['draft']" id="commitment_date">
      <span t-field="line.commitment_date" t-options="{'widget': 'date'}"/>
    </td>
  </xpath>
  
</data>

```
Source: [snippets/sale_order_line_date.report_saleorder_document.hide_in_state_draft.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/sale_order_line_date.report_saleorder_document.hide_in_state_draft.xml)

