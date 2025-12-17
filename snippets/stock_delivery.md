# Stock Delivery

## Stock Report Delivery Has Serial Move Line Inherit Delivery

### Intrastat Code Id

ID: `mint_system.stock_delivery.stock_report_delivery_has_serial_move_line_inherit_delivery.intrastat_code_id`

```xml
<data inherit_id="stock_delivery.stock_report_delivery_has_serial_move_line_inherit_delivery" priority="50">
    <xpath expr="//span[@t-field='move_line.product_id.hs_code']/.." position="replace">
        <td t-if="has_hs_code">
            <span t-field="move_line.product_id.intrastat_code_id.code"/>
        </td>
    </xpath>
</data>
```
Edit: [snippets/mint_system.stock_delivery.stock_report_delivery_has_serial_move_line_inherit_delivery.intrastat_code_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.stock_delivery.stock_report_delivery_has_serial_move_line_inherit_delivery.intrastat_code_id.xml)

Source: [snippets/mint_system.stock_delivery.stock_report_delivery_has_serial_move_line_inherit_delivery.intrastat_code_id.xml](https://odoo.build/snippets/mint_system.stock_delivery.stock_report_delivery_has_serial_move_line_inherit_delivery.intrastat_code_id.xml)

