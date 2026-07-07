# Stock Delivery

## Report Delivery Document2

### Hide Carrier

ID: `mint_system.stock_delivery.report_delivery_document2.hide_carrier`\
Inherit ID: `stock_delivery.report_delivery_document2`

```xml
<data priority="50">
    <xpath expr="//div[@t-if='o.carrier_id']" position="replace"/>
</data>
```

Edit: [snippets/mint_system.stock_delivery.report_delivery_document2.hide_carrier.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.stock_delivery.report_delivery_document2.hide_carrier.xml)\
Source: [snippets/mint_system.stock_delivery.report_delivery_document2.hide_carrier.xml](https://odoo.build/snippets/mint_system.stock_delivery.report_delivery_document2.hide_carrier.xml)

### Hide Carrier Code

ID: `mint_system.stock_delivery.report_delivery_document2.hide_carrier_code`\
Inherit ID: `stock_delivery.report_delivery_document2`

```xml
<data priority="50">
    <xpath expr="//div[t[@t-if='o.carrier_tracking_ref']]" position="replace"/>
</data>
```

Edit: [snippets/mint_system.stock_delivery.report_delivery_document2.hide_carrier_code.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.stock_delivery.report_delivery_document2.hide_carrier_code.xml)\
Source: [snippets/mint_system.stock_delivery.report_delivery_document2.hide_carrier_code.xml](https://odoo.build/snippets/mint_system.stock_delivery.report_delivery_document2.hide_carrier_code.xml)

### Hide Carrier Tracking Ref

ID: `mint_system.stock_delivery.report_delivery_document2.hide_carrier_tracking_ref`\
Inherit ID: `stock_delivery.report_delivery_document2`

```xml
<data priority="50">
     <xpath expr="//div[@t-if='o.carrier_tracking_ref']" position="replace"/>
</data>
```

Edit: [snippets/mint_system.stock_delivery.report_delivery_document2.hide_carrier_tracking_ref.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.stock_delivery.report_delivery_document2.hide_carrier_tracking_ref.xml)\
Source: [snippets/mint_system.stock_delivery.report_delivery_document2.hide_carrier_tracking_ref.xml](https://odoo.build/snippets/mint_system.stock_delivery.report_delivery_document2.hide_carrier_tracking_ref.xml)

### Hide Total Weight

ID: `mint_system.stock_delivery.report_delivery_document2.hide_total_weight`\
Inherit ID: `stock_delivery.report_delivery_document2`

```xml
<data priority="50">
     <xpath expr="//div[@t-if='o.shipping_weight']" position="replace"/>
</data>
```

Edit: [snippets/mint_system.stock_delivery.report_delivery_document2.hide_total_weight.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.stock_delivery.report_delivery_document2.hide_total_weight.xml)\
Source: [snippets/mint_system.stock_delivery.report_delivery_document2.hide_total_weight.xml](https://odoo.build/snippets/mint_system.stock_delivery.report_delivery_document2.hide_total_weight.xml)

## Stock Report Delivery Has Serial Move Line Inherit Delivery

### Intrastat Code Id

ID: `mint_system.stock_delivery.stock_report_delivery_has_serial_move_line_inherit_delivery.intrastat_code_id`\
Inherit ID: `stock_delivery.stock_report_delivery_has_serial_move_line_inherit_delivery`

```xml
<data priority="50">
    <xpath expr="//span[@t-field='move_line.product_id.hs_code']/.." position="replace">
        <td t-if="has_hs_code">
            <span t-field="move_line.product_id.intrastat_code_id.code"/>
        </td>
    </xpath>
</data>
```

Edit: [snippets/mint_system.stock_delivery.stock_report_delivery_has_serial_move_line_inherit_delivery.intrastat_code_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.stock_delivery.stock_report_delivery_has_serial_move_line_inherit_delivery.intrastat_code_id.xml)\
Source: [snippets/mint_system.stock_delivery.stock_report_delivery_has_serial_move_line_inherit_delivery.intrastat_code_id.xml](https://odoo.build/snippets/mint_system.stock_delivery.stock_report_delivery_has_serial_move_line_inherit_delivery.intrastat_code_id.xml)
