# Stock
## Label Transfer Template View  
### Basis57  
ID: `mint_system.stock.label_transfer_template_view.basis57`  
```xml
<t t-name="stock.label_transfer_template_view.basis57">
    <t t-call="web.basic_layout">
        <style>
            .external-ref {
                font-size: 14mm;
            }
            .box.external-ref {
                font-size: 20mm;
            }
            .title {
                font-size: 12mm;
            }
            .address {
                font-size: 10mm;
            }
            .box.address {
                font-size: 14mm;
                font-weight: bolder;
            }
            .barcode {
                font-size: 6mm;
            }
            .default {
                font-size: 7mm;
            }
            .bolder {
                font-size: 7mm;
                font-weight: bolder;
            }
            .footer {
                font-size: 7mm;
            }
            div.label {
                line-height: 1.2;
                text-align: center;
            }
            br {
                font-size: 2mm;
            }
            .space-right {
                margin-right: 2mm
            }
            .space-left {
                margin-left: 2mm
            }
            .address-space-right {
                padding-right: 3mm
            }
            svg {
                position: absolute;
                left: 10px;
                margin-top: 10px
            }
        </style>

        <t t-foreach="docs" t-as="picking">
            <t t-foreach="picking.move_lines.filtered(lambda m: m.quantity_done > 0 and m.product_packaging)" t-as="move">

                <!--Set default values-->
                <t t-set="temperature" t-value="2" />
                <t t-set="today" t-value="context_timestamp(datetime.datetime.now())" />
                <t t-set="packaging" t-value="move.product_packaging" />
                <t t-set="external_ref" t-value="picking.partner_id.x_external_ref" />
                <t t-set="print_header" t-value="True" />
                <t t-set="print_delivery_date" t-value="False" />
                <t t-set="print_delivery_date_only" t-value="False" />
                <t t-set="barcode" t-value="packaging.barcode" />
                <t t-set="qty_description" t-value="packaging.x_qty_description" />
                                
                <!--Print delivery date if shipping method is Bordereau-->
                <t t-if="picking.carrier_id.name == 'Bordereau'">
                    <t t-set="print_delivery_date" t-value="True" />
                </t>

                <!--Calculate default expiration date-->
                <t t-set="delta" t-value="datetime.timedelta(days=move.product_id.x_expiration_days)" />
                <t t-set="consume_until" t-value="today + delta" />

                <!--Print report for each move line-->
                <t t-set="move_lines" t-value="move.move_line_ids.filtered(lambda l: l.qty_done > 0)" />
                <t t-foreach="move_lines" t-as="move_line">
                  
                    <!--Set default values-->
                    <t t-set="count_boxes" t-value="0" />
                    <t t-set="count_labels" t-value="0" />
                    <t t-set="count_labels" t-value="move_line.qty_done/(packaging.qty or 1.0)" />
                
                    <t t-if="packaging.name == 'Kiste'">
                        <t t-set="print_weight" t-value="True" />
                    </t>
                    
                    <!--Compute box count-->
                    <t t-if="count_boxes == 0">
                        <!--<span>qty_done:</span><span t-esc="move_line.qty_done" />-->
                        <!--<span>quantity_done:</span><span t-esc="move.quantity_done" />-->
                        <!--<span>x_count_boxes:</span><span t-esc="move.x_count_boxes" />-->
                        <t t-set="count_boxes" t-value="int(((move_line.qty_done + 0.1) / move.quantity_done) * move.x_count_boxes)" />
                    </t>
                    <t t-if="packaging.x_print_without_parent" t-set="count_boxes" t-value="0" />
                    <t t-set="count_pages" t-value="int(count_labels + count_boxes)" />
                    <t t-if="packaging.x_print_parent_only" t-set="count_pages" t-value="int(count_boxes)" />

                    <!--<span>count_boxes:</span><span t-esc="count_boxes" />-->
                    <!--<span>count_labels:</span><span t-esc="count_labels" />-->
                    <!--<span>count_pages:</span><span t-esc="count_pages" />-->

                    <!--Print report for each label and box count-->
                    <t t-foreach="range(0, count_pages)" t-as="page">

                        <!--Caclulate expiration date from settings-->
                        <t t-if="move.product_id.use_expiration_date">
                            <t t-set="delta" t-value="datetime.timedelta(days=move.product_id.expiration_time)" />
                            <t t-set="consume_until" t-value="context_timestamp(move_line.lot_id.removal_date)" />
                            <t t-set="today" t-value="consume_until - delta" />
                        </t>
                
                        <!--First print normal labels and then box labels-->
                        <t t-if="page_index >= (count_pages - count_boxes)">
                            <t t-set="qty_description"></t>
                            <t t-if="external_ref">
                                <t t-set="print_header" t-value="False" />
                                <t t-set="print_delivery_date_only" t-value="True" />
                            </t>
                            <t t-if="packaging.parent_packaging">
                                <t t-if="packaging.parent_packaging.barcode" t-set="barcode" t-value="packaging.parent_packaging.barcode" />
                                <t t-set="qty_description" t-value="packaging.parent_packaging.x_qty_description" />
                            </t>
                        </t>

                        <div class="page">
                            <div class="label">

                                <t t-if="picking.partner_id.hide_address or not print_header">
                                    <br />
                                    <br />
                                </t>
                                <br />
                                <br />

                                <t t-if="print_header">
                                    <t t-if="picking.partner_id.x_packaging_ref">
                                        <span class="text-uppercase use-font-opensans-medium title space-right" t-esc="picking.partner_id.x_packaging_ref" />
                                    </t>
                                    <span class="text-uppercase use-font-opensans-medium title">Gotthard-Zander</span>
                                    <br />
                                    <span class="text-uppercase use-font-opensans-bold title" t-esc="move.product_id.name" />
                                    <t t-if="move.product_id.x_calibre">
                                        <span class="use-font-opensans-medium default space-left" t-esc="move.product_id.x_calibre" />
                                    </t>
                                    <br />
                                    <span class="use-font-opensans-medium default">(Sander lucioperca) in Aquakultur gewonnen</span>
                                    <br />
                                    <t t-if="qty_description or print_weight">
                                        <span class="use-font-opensans-medium default">Gewicht: </span>
                                        <span class="use-font-opensans-medium default" t-if="not print_weight" t-esc="qty_description" />
                                        <span class="use-font-opensans-medium default" t-if="print_weight" t-esc="move.quantity_done *1000" t-options='{"widget": "float", "precision": 0}' />
                                        <span class="use-font-opensans-medium default" t-if="print_weight">
                                            g zu
                                            <span t-esc="move.x_count_boxes" />
                                            Kisten
                                        </span>
                                    </t>
                                </t>
                                <br />
                                <t t-if="print_delivery_date and not print_delivery_date_only">
                                  <span class="use-font-opensans-medium bolder">Lieferdatum: </span>
                                  <span class="use-font-opensans-medium bolder" t-esc="picking.scheduled_date.strftime('%d.%m.%Y')" />
                                  <br />
                                </t>
                                <br />

                                <t t-if="not picking.partner_id.hide_address">
                                    <div id="address">
                                        <t t-if="external_ref and print_header">
                                            <span class="use-font-opensans-bold external-ref" t-esc="external_ref" />
                                            <br />
                                            <span class="use-font-opensans-bold address" t-field="picking.partner_id.name" />
                                            <br />
                                            <span class="use-font-opensans-bold address address-space-right" t-field="picking.partner_id.zip" />
                                            <span class="use-font-opensans-bold address" t-field="picking.partner_id.city" />
                                            <br />
                                            <br />
                                        </t>
                                        <t t-if="external_ref and not print_header">
                                            <span class="use-font-opensans-bold box external-ref" t-esc="external_ref" />
                                            <br />
                                            <span class="use-font-opensans-bold box address" t-field="picking.partner_id.name" />
                                            <br />
                                            <!--<span class="use-font-opensans-bold box address address-space-right" t-field="picking.partner_id.zip" />-->
                                            <!--<span class="use-font-opensans-bold box address" t-field="picking.partner_id.city" />-->
                                            <br />
                                            <br />
                                        </t>
                                        <t t-if="not external_ref and print_header">
                                            <span class="use-font-opensans-bold address" t-field="picking.partner_id.name" />
                                            <br />
                                            <span class="use-font-opensans-bold address address-space-right" t-field="picking.partner_id.zip" />
                                            <span class="use-font-opensans-bold address" t-field="picking.partner_id.city" />
                                            <br />
                                            <br />
                                        </t>
                                    </div>
                                </t>

                                <t t-if="not print_delivery_date_only">
                                    <span class="use-font-opensans-medium default">Verpackt am: </span>
                                    <span class="use-font-opensans-medium default" t-esc="today.strftime('%d.%m.%Y')" />
                                    <br />
                                    <span class="use-font-opensans-medium default">Mindestens haltbar bis: </span>
                                    <span class="use-font-opensans-medium default" t-esc="consume_until.strftime('%d.%m.%Y')" />
                                    <br />
                                    <span class="use-font-opensans-medium default">
                                        Aufbewahrung: bei
                                        <span t-esc="move.product_id.x_storage_temperature" />
                                        °C
                                    </span>
                                </t>
                                <t t-if="print_delivery_date_only">
                                    <span class="use-font-opensans-medium address">Lieferdatum: </span>
                                    <span class="use-font-opensans-medium address" t-esc="picking.scheduled_date.strftime('%d.%m.%Y')" />
                                    <br />
                                </t>

                                <br />
                                <br />

                                <t t-if="move_line.lot_id.name">
                                    <img t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s' % ('EAN13', barcode, 600, 50)" alt="Barcode" />
                                    <br />
                                    <span class="use-font-opensans-medium barcode" t-esc="'%s %s %s' % (barcode[0], barcode[1:8], barcode[8:])" />
                                </t>
                                <t t-else="">
                                    <span class="use-font-opensans-medium default text-muted">No barcode available</span>
                                </t>
                                <br />
                                <br />

                                <span class="text-uppercase use-font-opensans-bold default">Gotthard-Zander</span>
                                <span class="use-font-opensans-bold default"> by Basis57</span>
                                <br />
                                <br />
                                <span class="use-font-opensans-medium footer" t-field="res_company.street" />
                                <span class="use-font-opensans-medium footer space-right">,</span>
                                <span class="use-font-opensans-medium footer space-right" t-field="res_company.zip" />
                                <span class="use-font-opensans-medium footer" t-field="res_company.city" />
                                <br />
                                <span class="use-font-opensans-medium footer">www.gotthard-zander.ch</span>
                                <svg viewBox="0 0 150 100" width="150" height="100">
                                  <ellipse style="stroke: rgb(0, 0, 0); fill: none; stroke-width: 4px;" cx="75" cy="49.556" rx="70" ry="45" data-bx-origin="-1.166667 -2"></ellipse>
                                  <text style="fill: rgb(51, 51, 51); font-family: Arial, sans-serif; font-size: 14px; font-weight: 700; text-anchor: middle; white-space: pre;" data-bx-origin="-1.600941 -3.727571" transform="matrix(1.475051, 0, 0, 1.713593, -78.134323, -123.083534)"><tspan x="102.8" y="96.183">CH</tspan><tspan x="102.8" dy="1em">​</tspan><tspan>71758556</tspan></text>
                                </svg>

                            </div>
                            <p style="page-break-before:always;" />
                        </div>

                    </t>
                </t>

            </t>
        </t>
    </t>
</t>
```
Source: [snippets/stock.label_transfer_template_view.basis57.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.label_transfer_template_view.basis57.xml)

### Trimada  
ID: `mint_system.stock.label_transfer_template_view.trimada`  
```xml
<t t-name="stock.label_transfer_template_view.trimada">
    <t t-call="web.basic_layout">
        <t t-foreach="docs" t-as="picking">
            <t t-foreach="picking.move_lines" t-as="move">
                <style>
                    .label {
                        font-family: arial;
                    }
                    .box {
                        margin: 0mm 0 2mm 0;
                    }
                    .box1 {
                        margin: 9mm 0 2mm 0;
                    }
                    .box2 {
                        margin: 7mm 0 2mm 0;
                    }
                    .box3 {
                        margin: 2mm 0 2mm 0;
                    }
                    .padding {
                        padding-bottom: 3mm;
                    }
                    .title {
                        font-size: 11mm;
                        margin: 3mm 3mm 0 3mm;
                        font-weight: bold;
                        text-align: center;
                        border-bottom: solid 1px;
                        line-height: 1;
                    }
                    .frame {
                        border-bottom: solid 1px;
                        margin: 0 3mm 0 3mm;
                    }
                    .description {
                        font-size: 7mm;
                        height: 23mm;
                        width: 98%;
                        overflow: hidden;
                        text-overflow: ellipsis;
                        text-align: center;
                        padding: 10px;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                    }
                    .delivery {
                        font-size: 6mm;
                        margin: 3mm 3mm 0 3mm;
                        text-align: left;
                        border-bottom: solid 1px;
                        line-height: 1;
                        height: 35mm;
                    }
                    .comment {
                        font-size: 5mm;
                        text-align: center;
                        height: 8mm;
                        line-height: 10mm;
                    }
                    .col-6 {
                        padding-right: 0;
                        padding-left: 0;
                    }
                </style>
                <div class="page">
                    <div class="label">
                        <div class="row title">
                            <div class="col-6 box2">
                                <span t-esc="move.product_id.default_code"/>
                            </div>
                            <div t-if="move.product_id.barcode" class="col-6 box2 text-right">
                                <img t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=0' % ('Code128', move.product_id.barcode, 250, 85)" alt="Barcode"/>
                            </div>
                        </div>
                        <div class="frame">
                            <div class="description">
                                <span t-esc="move.product_id.name"/>
                            </div>
                            <div class="description">
                                <span t-esc="move.product_id.type_description"/>
                            </div>
                        </div>
                        <div class="row delivery">
                            <div class="col-6 box">
                                <div class="padding">
                                    <span t-esc="move.date" t-options="{'widget': 'date'}"/>
                                </div>
                                <div class="padding">
                                    <span t-esc="move.origin"/>
                                </div>
                            </div>
                            <div class="col-6 box3">
                                <div t-if="move.product_id.feeder_id" class="text-right">
                                    <img t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=0' % ('Code128', move.product_id.feeder_id, 250, 80)" alt="Barcode"/>
                                    <br/>
                                </div>
                                <div class="text-center">
                                    <span class="text-center" t-esc="move.product_id.feeder_id"></span>
                                </div>
                            </div>
                        </div>
                        <div class="comment">
                            <span>Trimada AG, CH-5610 Wohlen – www.trimada.ch</span>
                        </div>
                    </div>
                </div>
                <p style="page-break-before:always;" />
            </t>
        </t>
    </t>
</t>
```
Source: [snippets/stock.label_transfer_template_view.trimada.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.label_transfer_template_view.trimada.xml)

## Product Template Search Form View Stock  
### Hide Location Id  
ID: `mint_system.stock.product_template_search_form_view_stock.hide_location_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.product_template_search_form_view_stock" priority="50">
  
  <xpath expr="//field[@name='location_id']" position="replace">   
  </xpath>

</data>
```
Source: [snippets/stock.product_template_search_form_view_stock.hide_location_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.product_template_search_form_view_stock.hide_location_id.xml)

### Hide Pricelist Id  
ID: `mint_system.stock.product_template_search_form_view_stock.hide_pricelist_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.product_template_search_form_view_stock" priority="50">
  
  <xpath expr="//field[@name='pricelist_id']" position="replace">   
  </xpath>

</data>
```
Source: [snippets/stock.product_template_search_form_view_stock.hide_pricelist_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.product_template_search_form_view_stock.hide_pricelist_id.xml)

### Hide Warehouse Id  
ID: `mint_system.stock.product_template_search_form_view_stock.hide_warehouse_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.product_template_search_form_view_stock" priority="50">
  
  <xpath expr="//field[@name='warehouse_id']" position="replace">   
  </xpath>

</data>
```
Source: [snippets/stock.product_template_search_form_view_stock.hide_warehouse_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.product_template_search_form_view_stock.hide_warehouse_id.xml)

## Report Bordero  
### Basis57  
ID: `mint_system.stock.report_bordero.basis57`  
```xml
<t t-name="stock.report_bordero.basis57">
    <t t-call="web.html_container">
        <t t-call="web.external_layout">
            <div class="page">

                <h2>Bordereau</h2>
                <p>Lieferdatum: <span t-esc="context_timestamp(docs[0].scheduled_date).strftime('%Y-%m-%d')"/>
                </p>

                <table class="table table-sm">
                    <thead>
                        <tr>
                            <th>Kunde</th>
                            <th>Strasse</th>
                            <th>PLZ</th>
                            <th>Ort</th>
                            <th class="text-right">Gebinde</th>
                            <th class="text-right">Total Gewicht</th>
                        </tr>
                    </thead>
                    <tbody>
                        <t t-set="total_boxes" t-value="0"/>
                        <t t-set="total_weight" t-value="0"/>
                        <tr t-foreach="set([picking.partner_id for picking in docs.move_ids_without_package])" t-as="partner_id">

                            <t t-set="partner_moves" t-value="docs.move_ids_without_package.filtered(lambda x: x.partner_id == partner_id)"/>
                            <t t-set="count_boxes" t-value="sum(partner_moves.filtered(lambda m: m.product_id.x_storage_temperature &gt; -20).mapped('x_count_boxes'))"/>
                            <t t-set="count_cold_storage_boxes" t-value="sum(partner_moves.filtered(lambda m: m.product_id.x_storage_temperature &lt; -20).mapped('x_count_boxes'))"/>
                            
                            <t t-set="boxes_weight" t-value="sum(partner_moves.mapped('weight'))"/>
                            <t t-set="total_boxes" t-value="total_boxes + count_boxes + count_cold_storage_boxes"/>
                            <t t-set="total_weight" t-value="total_weight + boxes_weight"/>
                            

                            <td>
                                <span t-field="partner_id.name"/>
                            </td>
                            <td>
                                <span t-field="partner_id.street"/>
                            </td>
                            <td>
                                <span t-field="partner_id.zip"/>
                            </td>
                            <td>
                                <span t-field="partner_id.city"/>
                            </td>
                            <td class="text-right">
                                <t t-if="count_boxes > 0">
                                  <span><span t-esc="count_boxes"/> Frisch</span>
                                </t>
                                <t t-if="count_cold_storage_boxes > 0">
                                  <span><span t-esc="count_cold_storage_boxes"/> TK</span>
                                </t>
                            </td>
                            <td class="text-right">
                                <span t-esc="round(boxes_weight,2)"/>
                                <span> kg</span>
                            </td>
                        </tr>

                    </tbody>
                </table>

                <div class="clearfix">
                    <div id="total" class="row">
                        <div t-attf-class="#{'col-6' if report_type != 'html' else 'col-sm-7 col-md-6'} ml-auto">
                            <table class="table table-sm" style="page-break-inside: avoid;">
                                <tr class="border-black o_total">
                                    <td>
                                        <strong>Total</strong>
                                    </td>
                                    <td class="text-right">
                                        <span t-esc="total_boxes"/>
                                        <span> Gebinde</span>
                                    </td>
                                    <td class="text-right">
                                        <span t-esc="round(total_weight,2)"/>
                                        <span> kg</span>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                
                <br/>
                
                <t t-set="footer" t-value="docs.env['ir.translation'].search([('src', '=', 'stock.report_bordero.basis57.footer')], limit=1)"/>
                <t t-if="footer">
                  <p><t t-raw="footer.value"/></p>
                </t>

            </div>
        </t>
    </t>
</t>
```
Source: [snippets/stock.report_bordero.basis57.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_bordero.basis57.xml)

## Report Certificatecofc Simplified  
### Tissa  
ID: `mint_system.stock.report_certificatecofc_simplified.tissa`  
```xml
<?xml version="1.0"?>
<t t-name="stock.report_certificatecofc.tissa">
  <t t-call="web.html_container">
    <t t-call="web.external_layout">
      <t t-foreach="docs" t-as="o">

        <style>
          table {
            width: 100%;
            margin-bottom: 25px;
            font-size: 11pt;
            font-family: arial;
          }
          table th {
            padding: 0 5px 0 5px;
          }
          table td {
            padding: 0 5px 0 5px;
          }
          table#title {
              background-color: rgb(216,216,216);
          }
          .table_info {
              border: solid 1px;
          }
          table#workorder {
              border: solid 1px;
          }
          table#quality {
              border: solid 1px;
          }
          table#tracing {
              border: solid 1px;
          }
          h2 {
            font-size: 16pt;
            font-weight: bold;
            margin-top: 10mm;
            margin-bottom: 10mm;
            text-align: center;
          }
          div#subtitle {
              font-size: 11pt;
              font-family: arial;
          }
        </style>

        <t t-set="o" t-value="o.with_context(lang=o.partner_id.lang)"/>

        <div class="page">

          <h2>
            <span>Werkszeugnis nach EN 10 204-3.1 für Glasgewebe</span>
          </h2>

          <table id='title'>
            <tr>
              <td width="50%">Hersteller:</td>
              <td>
                <span t-field="o.company_id.name"/>
,                <span t-field="o.company_id.country_id.code"/>
-                <span t-field="o.company_id.zip"/>
                <span t-field="o.company_id.city"/>
              </td>
            </tr>
          </table>

          <table class="table_info">
            <tr>
              <td width="50%">Hersteller Bezeichnung:</td>
              <td width="50%">
                <span t-field="o.product_id.categ_id"/>
              </td>
            </tr>
            <tr style="border-bottom: solid 1px">
              <td>Artikelnr.</td>
              <td width="50%">
                <span t-field="o.product_id.name"/>
              </td>
            </tr>
            <tr>
              <td>Liefermenge:</td>
              <td>
                <span t-field="o.move_lines[0].quantity_done"/>
                <span t-field="o.move_lines[0].product_uom"/>
              </td>
            </tr>
            <tr>
              <td>Lieferdatum:</td>
              <td>
                <span t-field="o.date_done" t-options='{"widget": "date"}'/>
              </td>
            </tr>
            <tr style="border-bottom: solid 1px">
              <td>Lieferschein-/Auftragsnummer:</td>
              <td>
                <span t-field="o.name"/>
 / 
                <span t-field="o.origin"/>
                <t t-if="o.move_line_ids[0].lot_id.x_production_ids[0].move_raw_ids[0].move_line_ids[0].lot_id.x_production_id">
                     /                  <span t-field="o.move_line_ids[0].lot_id.x_production_ids[0].move_raw_ids[0].move_line_ids[0].lot_id.x_production_id"/>
                </t>
              </td>
            </tr>
            <tr>
              <td>Kunde / Fax:</td>
              <td>
                <span t-field="o.partner_id"/>
              </td>
            </tr>
            <tr style="border-bottom: solid 1px">
              <td></td>
              <td>
                <span t-field="o.partner_id.mobile"/>
              </td>
            </tr>
            <tr>
              <td>Bestellnummer:</td>
              <td>
                <span t-field="o.x_studio_kundenreferenz"/>
              </td>
            </tr>
            <tr>
              <td>Kunden Artikelbezeichnung:</td>
              <td>
                <span t-field="o.product_id.x_studio_kundenartikelnr"/>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <span t-field="o.product_id.description_sale"/>
              </td>
            </tr>

            <table class="table_info">
              <tr>
                <td width="50%">Gewebebindung:</td>
                <td width="50%">
                  <span t-field="o.product_id.x_studio_bindung_1"/>
                </td>
              </tr>
            </table>
          </table>

          <table id='workorder'>
            <tr>
              <th width="50%">Liefermenge</th>
              <th width="50%">Chargennummer</th>
            </tr>
            <tr>
              <t t-set="lines" t-value="o.move_line_ids"/>
              <tr t-foreach="lines" t-as="move_line">
                <td width="25%">
                  <span t-field="move_line.qty_done"/>
                </td>
                <td width="75%">
                  <span t-field="move_line.lot_id"/>
                </td>
              </tr>
            </tr>
          </table>

          <t t-set="products" t-value="list(set([line.product_id for line in o.move_line_ids.lot_id.x_production_ids.move_raw_ids.move_line_ids.lot_id.x_production_ids.traceability_line_ids]))" />
          <table id='tracing'>
            <tr>
              <th width="45%">Ressource</th>
              <th width="10%">Tex</th>
              <th width="10%">Rohmat.</th>
              <th width="10%">Filament</th>
              <th width="10%">Drehung</th>
              <th width="15%">Schlichte</th>
            </tr>

            <t t-foreach="products" t-as="product_line">

              <t t-if="product_line.product_tmpl_id.categ_id.x_relevant_for_certificate == true">
                <tr>
                  <td>
                    <span t-field="product_line.name"/>
                  </td>
                  <td>
                    <span t-field="product_line.x_studio_tex_2"/>
                  </td>
                  <td>
                    <span t-field="product_line.x_studio_rohmaterialtyp"/>
                  </td>
                  <td>
                    <span t-field="product_line.x_studio_filament"/>
                  </td>
                  <td>
                    <span t-field="product_line.x_studio_drehung"/>
                  </td>
                  <td>
                    <span t-field="product_line.product_template_attribute_value_ids.name"/>
                  </td>

                </tr>
              </t>

            </t>
            <tr>
              <td colspan="6"></td>
            </tr>
          </table>

          <t t-set="qualitycheck_line" t-value="o.move_line_ids[0].lot_id.x_production_ids[0].move_raw_ids.move_line_ids[0].lot_id.x_production_ids[0].x_quality_check_ids[0]"/>
          <div id="subtitle">
      Qualitätsprüfung <span t-field="qualitycheck_line.name"/>
          </div>
          <table id="quality">
            <tr>
              <th width="50%"></th>
              <th width="25%">Sollwert</th>
              <th width="25%">Istwert</th>
            </tr>

            <t t-if="qualitycheck_line.x_studio_kette_1_fdcm > 0">
              <tr>
                <td>Fadendichte per cm Kette 1:</td>
                <td>
                  <span t-field="qualitycheck_line.x_studio_kette_1_fdcm"/>
                </td>
                <td>
                  <span t-field="qualitycheck_line.x_studio_kette_1_fdcm"/>
                </td>
              </tr>
            </t>

            <t t-if="qualitycheck_line.x_studio_kette_2_fdcm > 0">
              <tr>
                <td>Fadendichte per cm Kette 2:</td>
                <td>
                  <span t-field="qualitycheck_line.x_studio_kette_2_fdcm"/>
                </td>
                <td>
                  <span t-field="qualitycheck_line.x_studio_kette_2_fdcm"/>
                </td>
              </tr>
            </t>

            <t t-if="qualitycheck_line.x_studio_kette_3_fdcm > 0">
              <tr>
                <td>Fadendichte per cm Kette 3:</td>
                <td>
                  <span t-field="qualitycheck_line.x_studio_kette_3_fdcm"/>
                </td>
                <td>
                  <span t-field="qualitycheck_line.x_studio_kette_3_fdcm"/>
                </td>
              </tr>
            </t>

            <t t-if="qualitycheck_line.x_studio_kette_4_fdcm > 0">
              <tr>
                <td>Fadendichte per cm Kette 4:</td>
                <td>
                  <span t-field="qualitycheck_line.x_studio_kette_4_fdcm"/>
                </td>
                <td>
                  <span t-field="qualitycheck_line.x_studio_kette_4_fdcm"/>
                </td>
              </tr>
            </t>

            <t t-if="qualitycheck_line.x_studio_schuss_1_fdcm > 0">
              <tr>
                <td>Fadendichte per cm Schuss 1:</td>
                <td>
                  <span t-field="qualitycheck_line.x_studio_schuss_1_fdcm"/>
                </td>
                <td>
                  <span t-field="qualitycheck_line.x_studio_schuss_1_fdcm"/>
                </td>
              </tr>
            </t>

            <t t-if="qualitycheck_line.x_studio_schuss_2_fdcm > 0">
              <tr>
                <td>Fadendichte per cm Schuss 2:</td>
                <td>
                  <span t-field="qualitycheck_line.x_studio_schuss_2_fdcm"/>
                </td>
                <td>
                  <span t-field="qualitycheck_line.x_studio_schuss_2_fdcm"/>
                </td>
              </tr>
            </t>

            <tr>
              <td>Gewebebreite in mm:</td>
              <td>
                <span t-field="qualitycheck_line.x_studio_breite_von_mm"/>
                <span> - </span>
                <span t-field="qualitycheck_line.x_studio_breite_bis_mm"/>
              </td>
              <td>
                <span t-field="qualitycheck_line.x_studio_breite_ist_mm"/>
              </td>
            </tr>
            <tr>
              <td>Flächengewicht gr per m2:</td>
              <td>
                <span t-field="qualitycheck_line.x_studio_gewicht_von_gm2"/>
                <span> - </span>
                <span t-field="qualitycheck_line.x_studio_gewicht_bis_gm2"/>
              </td>
              <td>
                <span t-field="qualitycheck_line.x_studio_gewicht_ist_gm2"/>
              </td>
            </tr>
          </table>

          <table>
            <tr>
              <td>
            Unterschrift
                <br></br>
                <br></br>
              </td>
            </tr>
            <tr>
              <td>
            Der Hersteller bescheinigt, dass das Glasgewebe den obigen Angaben entspricht.<br></br>
            Mit freundlichen Grüssen
            Tissa Glasweberei AG
              </td>
            </tr>
          </table>
        </div>
      </t>
    </t>
  </t>
</t>
```
Source: [snippets/stock.report_certificatecofc_simplified.tissa.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_certificatecofc_simplified.tissa.xml)

## Report Certificatecofc  
### Tissa  
ID: `mint_system.stock.report_certificatecofc.tissa`  
```xml
<?xml version="1.0"?>
<t t-name="stock.report_certificatecofc.tissa">
  <t t-call="web.html_container">
    <t t-call="web.external_layout">
      <t t-foreach="docs" t-as="o">

        <style>
          table {
            width: 100%;
            margin-bottom: 25px;
            font-size: 11pt;
            font-family: arial;
          }
          table th {
            padding: 0 5px 0 5px;
          }
          table td {
            padding: 0 5px 0 5px;
          }
          table#title {
              background-color: rgb(216,216,216);
          }
          .table_info {
              border: solid 1px;
          }
          table#workorder {
              border: solid 1px;
          }
          table#quality {
              border: solid 1px;
          }
          table#tracing {
              border: solid 1px;
          }
          h2 {
            font-size: 16pt;
            font-weight: bold;
            margin-top: 10mm;
            margin-bottom: 10mm;
            text-align: center;
          }
          div#subtitle {
              font-size: 11pt;
              font-family: arial;
          }
        </style>

        <t t-set="o" t-value="o.with_context(lang=o.partner_id.lang)"/>

        <div class="page">

          <h2>
            <span>Werkszeugnis nach EN 10 204-3.1 für Glasgewebe</span>
          </h2>

          <table id='title'>
            <tr>
              <td width="50%">Hersteller:</td>
              <td>
                <span t-field="o.company_id.name"/>
,                <span t-field="o.company_id.country_id.code"/>
-                <span t-field="o.company_id.zip"/>
                <span t-field="o.company_id.city"/>
              </td>
            </tr>
          </table>

          <table class="table_info">
            <tr>
              <td width="50%">Hersteller Bezeichnung:</td>
              <td width="50%">
                <span t-field="o.product_id.categ_id"/>
              </td>
            </tr>
            <tr style="border-bottom: solid 1px">
              <td>Artikelnr.</td>
              <td width="50%">
                <span t-field="o.product_id.name"/>
              </td>
            </tr>
            <tr>
              <td>Liefermenge:</td>
              <td>
                <span t-field="o.move_lines[0].quantity_done"/>
                <span t-field="o.move_lines[0].product_uom"/>
              </td>
            </tr>
            <tr>
              <td>Lieferdatum:</td>
              <td>
                <span t-field="o.date_done" t-options='{"widget": "date"}'/>
              </td>
            </tr>
            <tr style="border-bottom: solid 1px">
              <td>Lieferschein-/Auftragsnummer:</td>
              <td>
                <span t-field="o.name"/>
 / 
                <span t-field="o.origin"/>
                <t t-if="o.move_line_ids[0].lot_id.x_production_ids[0].move_raw_ids[0].move_line_ids[0].lot_id.x_production_id">
                     /                  <span t-field="o.move_line_ids[0].lot_id.x_production_ids[0].move_raw_ids[0].move_line_ids[0].lot_id.x_production_id"/>
                </t>
              </td>
            </tr>
            <tr>
              <td>Kunde / Fax:</td>
              <td>
                <span t-field="o.partner_id"/>
              </td>
            </tr>
            <tr style="border-bottom: solid 1px">
              <td></td>
              <td>
                <span t-field="o.partner_id.mobile"/>
              </td>
            </tr>
            <tr>
              <td>Bestellnummer:</td>
              <td>
                <span t-field="o.x_studio_kundenreferenz"/>
              </td>
            </tr>
            <tr>
              <td>Kunden Artikelbezeichnung:</td>
              <td>
                <span t-field="o.product_id.x_studio_kundenartikelnr"/>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <span t-field="o.product_id.description_sale"/>
              </td>
            </tr>

            <table class="table_info">
              <tr>
                <td width="50%">Gewebebindung:</td>
                <td width="50%">
                  <span t-field="o.product_id.x_studio_bindung_1"/>
                </td>
              </tr>
            </table>
          </table>

          <table id='workorder'>
            <tr>
              <th width="50%">Liefermenge</th>
              <th width="50%">Chargennummer</th>
            </tr>
            <tr>
              <t t-set="lines" t-value="o.move_line_ids"/>
              <tr t-foreach="lines" t-as="move_line">
                <td width="25%">
                  <span t-field="move_line.qty_done"/>
                </td>
                <td width="75%">
                  <span t-field="move_line.lot_id"/>
                </td>
              </tr>
            </tr>
          </table>

          <t t-set="products" t-value="list(set([line.product_id for line in o.move_line_ids.lot_id.x_production_ids.move_raw_ids.move_line_ids.lot_id.x_production_ids.traceability_line_ids]))" />
          <table id='tracing'>
            <tr>
              <th width="25%">Ressource</th>
              <th width="10%">Tex</th>
              <th width="10%">Rohmat.</th>
              <th width="10%">Filament</th>
              <th width="10%">Drehung</th>
              <th width="15%">Schlichte</th>
              <th width="20%">Los</th>
            </tr>



            <t t-foreach="products" t-as="product_line">

              <t t-set="lots_seen" t-value="[]" />
              <t t-set="move_lines" t-value="o.move_line_ids.lot_id.x_production_ids.move_raw_ids.move_line_ids.lot_id.x_production_ids.traceability_line_ids.filtered(lambda l: product_line.id == l.product_id.id)"/>

              <tr t-foreach="move_lines" t-as="move_line">

                <t t-if="move_line.lot_id not in lots_seen">
                  <t t-esc="lots_seen.append(move_line.lot_id)"/>

                  <t t-if="move_line.product_id.product_tmpl_id.categ_id.x_relevant_for_certificate == true">

                    <td>
                      <span t-field="move_line.product_id"/>
                    </td>
                    <td>
                      <span t-field="move_line.product_id.product_tmpl_id.x_studio_tex_2"/>
                    </td>
                    <td>
                      <span t-field="move_line.product_id.product_tmpl_id.x_studio_rohmaterialtyp"/>
                    </td>
                    <td>
                      <span t-field="move_line.product_id.product_tmpl_id.x_studio_filament"/>
                    </td>
                    <td>
                      <span t-field="move_line.product_id.product_tmpl_id.x_studio_drehung"/>
                    </td>
                    <td>
                      <span t-field="move_line.product_id.product_template_attribute_value_ids.name"/>

                    </td>
                    <td>
                      <span t-field="move_line.lot_id"/>
                    </td>
                  </t>
                </t>
              </tr>

            </t>
            <tr>
              <td colspan="7"></td>
            </tr>
          </table>

          <t t-set="qualitycheck_line" t-value="o.move_line_ids[0].lot_id.x_production_ids[0].move_raw_ids[0].move_line_ids[0].lot_id.x_production_ids[0].x_quality_check_ids[0]"/>
          <div id="subtitle">
      Qualitätsprüfung <span t-field="qualitycheck_line.name"/>
          </div>
          <table id="quality">
            <tr>
              <th width="50%"></th>
              <th width="25%">Sollwert</th>
              <th width="25%">Istwert</th>
            </tr>

            <t t-if="qualitycheck_line.x_studio_kette_1_fdcm > 0">
              <tr>
                <td>Fadendichte per cm Kette 1:</td>
                <td>
                  <span t-field="qualitycheck_line.x_studio_kette_1_fdcm"/>
                </td>
                <td>
                  <span t-field="qualitycheck_line.x_studio_kette_1_fdcm"/>
                </td>
              </tr>
            </t>

            <t t-if="qualitycheck_line.x_studio_kette_2_fdcm > 0">
              <tr>
                <td>Fadendichte per cm Kette 2:</td>
                <td>
                  <span t-field="qualitycheck_line.x_studio_kette_2_fdcm"/>
                </td>
                <td>
                  <span t-field="qualitycheck_line.x_studio_kette_2_fdcm"/>
                </td>
              </tr>
            </t>

            <t t-if="qualitycheck_line.x_studio_kette_3_fdcm > 0">
              <tr>
                <td>Fadendichte per cm Kette 3:</td>
                <td>
                  <span t-field="qualitycheck_line.x_studio_kette_3_fdcm"/>
                </td>
                <td>
                  <span t-field="qualitycheck_line.x_studio_kette_3_fdcm"/>
                </td>
              </tr>
            </t>

            <t t-if="qualitycheck_line.x_studio_kette_4_fdcm > 0">
              <tr>
                <td>Fadendichte per cm Kette 4:</td>
                <td>
                  <span t-field="qualitycheck_line.x_studio_kette_4_fdcm"/>
                </td>
                <td>
                  <span t-field="qualitycheck_line.x_studio_kette_4_fdcm"/>
                </td>
              </tr>
            </t>

            <t t-if="qualitycheck_line.x_studio_schuss_1_fdcm > 0">
              <tr>
                <td>Fadendichte per cm Schuss 1:</td>
                <td>
                  <span t-field="qualitycheck_line.x_studio_schuss_1_fdcm"/>
                </td>
                <td>
                  <span t-field="qualitycheck_line.x_studio_schuss_1_fdcm"/>
                </td>
              </tr>
            </t>

            <t t-if="qualitycheck_line.x_studio_schuss_2_fdcm > 0">
              <tr>
                <td>Fadendichte per cm Schuss 2:</td>
                <td>
                  <span t-field="qualitycheck_line.x_studio_schuss_2_fdcm"/>
                </td>
                <td>
                  <span t-field="qualitycheck_line.x_studio_schuss_2_fdcm"/>
                </td>
              </tr>
            </t>

            <tr>
              <td>Gewebebreite in mm:</td>
              <td>
                <span t-field="qualitycheck_line.x_studio_breite_von_mm"/>
                <span> - </span>
                <span t-field="qualitycheck_line.x_studio_breite_bis_mm"/>
              </td>
              <td>
                <span t-field="qualitycheck_line.x_studio_breite_ist_mm"/>
              </td>
            </tr>
            <tr>
              <td>Flächengewicht gr per m2:</td>
              <td>
                <span t-field="qualitycheck_line.x_studio_gewicht_von_gm2"/>
                <span> - </span>
                <span t-field="qualitycheck_line.x_studio_gewicht_bis_gm2"/>
              </td>
              <td>
                <span t-field="qualitycheck_line.x_studio_gewicht_ist_gm2"/>
              </td>
            </tr>
          </table>

          <table>
            <tr>
              <td>
            Unterschrift
                <br></br>
                <br></br>
              </td>
            </tr>
            <tr>
              <td>
            Der Hersteller bescheinigt, dass das Glasgewebe den obigen Angaben entspricht.<br></br>
            Mit freundlichen Grüssen
            Tissa Glasweberei AG
              </td>
            </tr>
          </table>
        </div>
      </t>
    </t>
  </t>
</t>
```
Source: [snippets/stock.report_certificatecofc.tissa.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_certificatecofc.tissa.xml)

## Report Delivery Document  
### Add Address Space  
ID: `mint_system.stock.report_delivery_document.add_address_space`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

    <t t-set="address" position="before">
        <style>
            div.address {
                padding-top: 3rem
            }
        </style>
    </t>

</data>
```
Source: [snippets/stock.report_delivery_document.add_address_space.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.add_address_space.xml)

### Add Date  
ID: `mint_system.stock.report_delivery_document.add_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">
  
  <xpath expr="//th[@name='th_sm_product']" position="after">
    <th>
      <strong>Lieferdatum</strong>
    </th>
  </xpath>
  
  <xpath expr="//span[@t-field='move.product_id']" position="after">
    <td>
    <span t-field="move.date" t-options='{"widget": "date"}'/>
    </td>
  </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.add_date.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.add_date.xml)

### Add Header And Footer Note  
ID: `mint_system.stock.report_delivery_document.add_header_and_footer_note`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//table[@id='infotable']" position="after">
    <t t-if="o.note_header != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
      <span class="note" t-field="o.note_header"/>
    </t>
  </xpath>

  <xpath expr="//table[@name='stock_move_line_table']" position="after">
    <t t-if="o.note_footer != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">
      <span class="note" t-field="o.note_footer"/>
    </t>
  </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.add_header_and_footer_note.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.add_header_and_footer_note.xml)

### Add Header Space  
ID: `mint_system.stock.report_delivery_document.add_header_space`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

    <xpath expr="//h2" position="attributes">
        <attribute name="style">padding-top: 5rem</attribute>
    </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.add_header_space.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.add_header_space.xml)

### Add Incoterms  
ID: `mint_system.stock.report_delivery_document.add_incoterms`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//div[1]/div[1]/div[2]" position="after">
    <div class="col-auto" name="div_incoterms">
       <strong>Incoterms:</strong>
        <t>
          <p t-field="res_company.incoterm_id.code"/>
        </t>
    </div>
  </xpath>

</data>

```
Source: [snippets/stock.report_delivery_document.add_incoterms.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.add_incoterms.xml)

### Add Infotable  
ID: `mint_system.stock.report_delivery_document.add_infotable`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//h2" position="after">
    <style>
      .info_table tbody tr td:first-of-type {
      text-align: left;
      width: 5mm;
     }
      .note {
        font-size: 9pt;
      }
    </style>

    <table id="infotable" class="info_table" style="width:100%; margin-bottom:25px; padding-left:0px; font-size:9pt; font-family:arial; color:black;">

      <tr style="line-height: 1.2">
        <td style="width:25mm;">Date</td>
        <td style="width:85mm;">
          <span t-field='o.date_done' t-options='{ "widget": "date" }'/>
        </td>
        <td style="width:25mm;">Order No.</td>
        <td style="width:45mm;">
          <span t-field='o.origin'/>
        </td>
      </tr>

      <tr style="line-height: 1.2">
        <td>Customer No.</td>
        <td>
          <span t-field='o.sale_id.partner_id.ref'/>
        </td>
        <td>Our Reference</td>
        <td>
          <span t-field='o.user_id'/>
        </td>
      </tr>

      <tr style="line-height: 1.2">
        <td>Order</td>
        <td>
          <span t-field="o.sale_id.client_order_ref"/>
        </td>

        <td>Delivery Method</td>
        <td>
          <span t-field='o.carrier_id'/>
        </td>
      </tr>

      <tr style="line-height: 1.2">
        <td>Reference</td>
        <td>
          <span t-field="o.sale_id.comment"/>
        </td>
        <td>Incoterm</td>
        <td>
          <span t-field="o.sale_id.incoterm"/>
        </td>
      </tr>

    </table>

  </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.add_infotable.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.add_infotable.xml)

### Add Note  
ID: `mint_system.stock.report_delivery_document.add_note`  
```xml
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//div[@name='signature']" position="before">
    <div style="margin-top: 50px">

      <div>
        <t t-if="o.partner_id.parent_id.country_id.code == 'CH'">
          <span>The exporter of the products covered by this document declares that, except where otherwise clearly indicated, these products are of swiss preferential origin.</span>
          <br/>
          <span style="font-style: italic">"The total quantity of delivered products is missing from delivery note"</span>
        </t>
        <t t-elif="o.partner_id.parent_id.country_id.code == 'DE'">
          <span style="font-weight: bold">EORI: DE379461566911068 / Incoterms: DAP</span>
          <br/>
          <span>The exporter of the products covered by this document declares that, except where otherwise clearly indicated, these products are of swiss preferential origin.</span>
          <br/>
          <span style="font-style: italic">"The total quantity of delivered products is missing from delivery note"</span>
        </t>
        <t t-elif="o.partner_id.parent_id.country_id.code in ['GR', 'AL', 'HR', 'MNE', 'MC']">
          <span style="font-weight: bold">EORI: DE379461566911068 / Incoterms: Ex-works / Tax free intracommunity delivery acc. to UstG §6a.</span>
          <br/>
          <span>The exporter of the products covered by this document declares that, except where otherwise clearly indicated, these products are of swiss preferential origin.</span>
          <br/>
          <span style="font-style: italic">"The total quantity of delivered products is missing from delivery note"</span>
        </t>
        <t t-elif="o.partner_id.parent_id.country_id.country_group_ids and o.partner_id.parent_id.country_id.country_group_ids[0].id == 1">
          <span style="font-weight: bold">EORI: DE379461566911068 / Incoterms: DDP / Tax free intracommunity delivery acc. to UstG §6a.</span>
          <br/>
          <span>The exporter of the products covered by this document declares that, except where otherwise clearly indicated, these products are of swiss preferential origin.</span>
          <br/>
          <span style="font-style: italic">"The total quantity of delivered products is missing from delivery note"</span>
        </t>
        <t t-else="">
          <span style="font-weight: bold">Incoterms: Ex-works</span>
          <br/>
          <span>The exporter of the products covered by this document declares that, except where otherwise clearly indicated, these products are of swiss preferential origin.</span>
          <br/>
          <span style="font-style: italic">"The total quantity of delivered products is missing from delivery note"</span>
        </t>
      </div>

    </div>
  </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.add_note.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.add_note.xml)

### Add Open Quantity In Backorder  
ID: `mint_system.stock.report_delivery_document.add_open_quantity_in_backorder`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//table[@name='stock_backorder_table']/thead/tr/th[2]" position="after">
    <th>
      <strong>Open Quantity</strong>
    </th>
  </xpath>
  <xpath expr="//table[@name='stock_backorder_table']/tbody//td[3]" position="after">
    <th>
    </th>
  </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.add_open_quantity_in_backorder.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.add_open_quantity_in_backorder.xml)

### Add Table Margin  
ID: `mint_system.stock.report_delivery_document.add_table_margin`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//div/table[1]" position="attributes">
    <attribute name="style" separator=";" add="margin-top: 1rem"/>
  </xpath>

  <xpath expr="//div/table[2]" position="attributes">
    <attribute name="style" separator=";" add="margin-top: 1rem"/>
  </xpath>

</data>

```
Source: [snippets/stock.report_delivery_document.add_table_margin.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.add_table_margin.xml)

### Add Weight  
ID: `mint_system.stock.report_delivery_document.add_weight`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//th[@name='th_sm_quantity']" position="before">
    <th>
      <span>Weight</span>
    </th>
  </xpath>

  <xpath expr="//span[@t-field='move.quantity_done']/.." position="before">
    <td>
      <span t-field="move.product_id.weight"/>
      <span t-field="move.product_id.weight_uom_name"/>
    </td>
  </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.add_weight.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.add_weight.xml)

### Append Signature Text  
ID: `mint_system.stock.report_delivery_document.append_signature_text`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//table[@name='stock_move_line_table']" position="after">
    <style>
      div#signature {
      padding-left: 75px;
      padding-right: 75px;
      margin-top: 3rem;
      }
    </style>
    <div id="signature">
      <p>Hiermit bestätigen wir den Erhalt der Ware gemäss Lieferung.</p>
      <br />
      <br />
      <div class="row">
        <div class="col-6">
          <p>Ort/Datum: __________________________________</p>
        </div>
        <div class="col-6">
          <p>Unterschrift Kunde: __________________________________</p>
        </div>
      </div>
    </div>
  </xpath>

  <xpath expr="//table[@name='stock_move_line_table']" position="after">
    <div class="row" style="margin-top: 3rem;">
      <div class="col-5">
        <p>Gebinde geliefert: _____</p>
        <p>Gebinde zurück: _____</p>
        <br />
        <p>Unterschrift Transport: _______________</p>
      </div>
      <div class="col-2" />
      <div class="col-5">
        <p>Produkte einwandfrei erhalten.</p>
        <br />
        <p>Unterschrift Kunde: _______________</p>
      </div>
    </div>
  </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.append_signature_text.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.append_signature_text.xml)

### Backorder Signature Section  
ID: `mint_system.stock.report_delivery_document.backorder_signature_section`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//table[@name='stock_move_line_table']" position="after">
    <p>Retouren:<br/><br/>
        KEG:             ___________  Anzahl<br/><br/>
        Harassen:  ___________  Anzahl<br/><br/>
        Waren erhalten:   Datum:  ______________________  Unterschrift:  _________________________________
    </p>
  </xpath>

</data>

```
Source: [snippets/stock.report_delivery_document.backorder_signature_section.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.backorder_signature_section.xml)

### Barcode Customer Reference  
ID: `mint_system.stock.report_delivery_document.barcode_customer_reference`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//t[@name='partner_header']" position="before">
    <span t-field="o.sale_id.client_order_ref" t-options='{"widget": "barcode", "width": 350, "height": 50}' />
  </xpath>

</data>

```
Source: [snippets/stock.report_delivery_document.barcode_customer_reference.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.barcode_customer_reference.xml)

### Disable Stock Move Line Table  
ID: `mint_system.stock.report_delivery_document.disable_stock_move_line_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">
  
  <table name="stock_move_table" position="attributes">
    <attribute name="t-if"></attribute>
  </table>

  <table name="stock_move_line_table" position="attributes">
    <attribute name="t-if">False</attribute>
  </table>
  
</data>

```
Source: [snippets/stock.report_delivery_document.disable_stock_move_line_table.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.disable_stock_move_line_table.xml)

### Filter Qty Done  
ID: `mint_system.stock.report_delivery_document.filter_qty_done`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//table[@name='stock_move_table']/tbody/t" position="after">
    <t t-set="lines" t-value="lines.filtered(lambda l: l.quantity_done > 0)"/>
  </xpath>

  <xpath expr="//t[@name='no_package_move_lines']" position="before">
    <t t-set="move_lines" t-value="move_lines.filtered(lambda l: l.qty_done > 0)"/>
  </xpath>

  <xpath expr="//t[@t-set='package_move_lines']" position="after">
    <t t-set="package_move_lines" t-value="package_move_lines.filtered(lambda l: l.qty_done > 0)"/>
  </xpath>

</data>

```
Source: [snippets/stock.report_delivery_document.filter_qty_done.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.filter_qty_done.xml)

### Format Address Blocks  
ID: `mint_system.stock.report_delivery_document.format_address_blocks`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//t[@t-set='address']/div" position="attributes">
    <attribute name="style">font-size:10pt; line-height: 1.2; padding-bottom:33mm</attribute>
    <attribute name="t-options-fields">['address', 'name']</attribute>
  </xpath>

</data>

<!--
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//div[@name='div_outgoing_address']" position="attributes">
    <attribute name="t-options-fields">['address', 'name']</attribute>
  </xpath>
  
  <xpath expr="//div[@t-field='partner.commercial_partner_id']" position="attributes">
    <attribute name="t-options-fields">['address', 'name']</attribute>
  </xpath>
 
</data>
-->

```
Source: [snippets/stock.report_delivery_document.format_address_blocks.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.format_address_blocks.xml)

### Format Date Short  
ID: `mint_system.stock.report_delivery_document.format_date_short`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//p[@t-field='o.date_done']" position="attributes">
    <attribute name="t-options-widget">"date"</attribute>
  </xpath>

  <xpath expr="//p[@t-field='o.scheduled_date']" position="attributes">
    <attribute name="t-options-widget">"date"</attribute>
  </xpath>

  <xpath expr="//div[1]/div[1]/div[2]/t[1]/p[1]" position="attributes">
    <attribute name="t-options-widget">"date"</attribute>
  </xpath>

  <xpath expr="//div[1]/div[1]/div[2]/t[2]/p[1]" position="attributes">
    <attribute name="t-options-widget">"date"</attribute>
  </xpath>

</data>

```
Source: [snippets/stock.report_delivery_document.format_date_short.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.format_date_short.xml)

### Format Main Table  
ID: `mint_system.stock.report_delivery_document.format_main_table`  
```xml
<?xml version="1.0"?>
<!-- Change style of first column -->
<data inherit_id="stock.report_delivery_document" priority="50">

    <xpath expr="//table" position="attributes">
        <attribute name="class" add="mint-system" separator=" " />
    </xpath>

    <xpath expr="//div[hasclass('page')]" position="inside">
        <style>
            table.mint-system tbody tr td:first-of-type {
                text-align: right;
                width: 5mm;
            }
        </style>
    </xpath>

</data> 
```
Source: [snippets/stock.report_delivery_document.format_main_table.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.format_main_table.xml)

### Format Pos  
ID: `mint_system.stock.report_delivery_document.format_pos`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//table[@name='stock_backorder_table']/tbody//td" position="attributes">
    <attribute name="style">text-align: right; width: 5mm</attribute>
  </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.format_pos.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.format_pos.xml)

### Format Qty  
ID: `mint_system.stock.report_delivery_document.format_qty`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="60">

    <span t-field="move.product_uom_qty" position="attributes">
        <attribute name="t-options-widget">"integer"</attribute>
    </span>

    <span t-field="move.quantity_done" position="attributes">
        <attribute name="t-options-widget">"integer"</attribute>
    </span>

</data>
```
Source: [snippets/stock.report_delivery_document.format_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.format_qty.xml)

### Format Table Border  
ID: `mint_system.stock.report_delivery_document.format_table_border`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

    <xpath expr="//table[@name='stock_move_table']" position="before">
        <style>
            thead tr.border-solid-black {
                border-top: 1px solid black !important;
                color: #5c516e;
            }
            thead th {
                 border-top: none !important;
            }
            tbody tr.border-solid-black {
                border-bottom: 1px solid black !important;
            }
        </style>
    </xpath>

    <xpath expr="//table[@name='stock_move_table']/thead/tr" position="attributes">
        <attribute name="class" separator=" " add="border-solid-black" />
    </xpath>

    <xpath expr="(//table[@name='stock_move_table']//tr)[last()]" position="attributes">
        <attribute name="class" separator=" " add="border-solid-black" />
    </xpath>

</data> 
```
Source: [snippets/stock.report_delivery_document.format_table_border.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.format_table_border.xml)

### Format Title Trimada  
ID: `mint_system.stock.report_delivery_document.format_title_trimada`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="60">

  <xpath expr="//h2" position="attributes">
    <attribute name="style">color: black; font-size:13pt; font-weight:bold; margin-top:10mm; margin-bottom:3mm</attribute>
  </xpath>
  
</data>

```
Source: [snippets/stock.report_delivery_document.format_title_trimada.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.format_title_trimada.xml)

### Format Title  
ID: `mint_system.stock.report_delivery_document.format_title`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//h2" position="replace">
    <h2>
      <span t-esc="'Lieferschein ' + o.name.replace('WH/OUT/', '')"/>
    </h2>
  </xpath>

</data>

```
Source: [snippets/stock.report_delivery_document.format_title.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.format_title.xml)

### Get Position  
ID: `mint_system.stock.report_delivery_document.get_position`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="60">

  <xpath expr="//table[@name='stock_move_table']/thead/tr/th[1]" position="before">
    <t t-if="o.sale_id or o.purchase_id">
      <th id="position">
        <strong>Pos</strong>
      </th>
    </t>
  </xpath>

  <xpath expr="//table[@name='stock_move_line_table']/thead/tr/th[1]" position="before">
    <t t-if="o.sale_id or o.purchase_id">
      <th id="position">
        <strong>Pos</strong>
      </th>
    </t>
  </xpath>

  <xpath expr="//table[@name='stock_backorder_table']/thead/tr/th[1]" position="before">
    <t t-if="o.sale_id or o.purchase_id">
      <th id="position">
        <strong>Pos</strong>
      </th>
    </t>
  </xpath>
  
  <xpath expr="//table[@name='stock_move_table']/tbody/tr/td[1]" position="before">
    <t t-if="o.sale_id or o.purchase_id">
      <td id="position">
        <span t-esc="move.position"/>
      </td>
    </t>
  </xpath>

  <xpath expr="//table[@name='stock_backorder_table']/tbody//tr/td[1]" position="before">
    <t t-if="o.sale_id or o.purchase_id">
      <td id="position">
        <span t-esc="bo_line.position"/>
      </td>
    </t>
  </xpath>

</data>

```
Source: [snippets/stock.report_delivery_document.get_position.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.get_position.xml)

### Hide Address  
ID: `mint_system.stock.report_delivery_document.hide_address`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

    <xpath expr="//div[@name='customer_address']" position="replace"/>
    <xpath expr="//div[@name='partner_header']" position="replace"/>

</data>
```
Source: [snippets/stock.report_delivery_document.hide_address.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.hide_address.xml)

### Hide Backorder Quantity  
ID: `mint_system.stock.report_delivery_document.hide_backorder_quantity`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

    <xpath expr="//table[@name='stock_backorder_table']/thead//th[4]" position="replace">
        <th></th>
    </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.hide_backorder_quantity.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.hide_backorder_quantity.xml)

### Hide If Not In State Done  
ID: `mint_system.stock.report_delivery_document.hide_if_not_in_state_done`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//div[@class='page']" position="attributes">
    <attribute name="t-if">o.state == 'done'</attribute>
  </xpath>

  <xpath expr="//div[@class='page']" position="after">
    <t t-if="o.state != 'done'">
      <span style="color: red; font-size: 20px">Dieser Lieferschein ist noch nicht im Status "ERLEDIGT"</span>
    </t>
  </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.hide_if_not_in_state_done.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.hide_if_not_in_state_done.xml)

### Hide Name  
ID: `mint_system.stock.report_delivery_document.hide_name`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">
  <xpath expr="//span[@t-field='o.name']/.." position="replace">
  </xpath>
</data>
```
Source: [snippets/stock.report_delivery_document.hide_name.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.hide_name.xml)

### Hide Product Uom Qty  
ID: `mint_system.stock.report_delivery_document.hide_product_uom_qty`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">
  <xpath expr="//span[@t-field='move.product_uom_qty']/..." position="replace">
  </xpath>
</data>
```
Source: [snippets/stock.report_delivery_document.hide_product_uom_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.hide_product_uom_qty.xml)

### Hs Code Origin And Weight  
ID: `mint_system.stock.report_delivery_document.hs_code_origin_and_weight`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//div/table[1]/tbody/tr/td[1]/span" position="after">
    <t t-if="move.product_id.hs_code">
      <br/>
      HS Code: <span t-field="move.product_id.hs_code"/>
    </t>
    <t t-if="move.product_id.country_of_origin_id.code">
      <br/>
      Country of Origin: <span t-field="move.product_id.country_of_origin_id.code"/>
    </t>
    <t t-if="move.product_id.weight">
      <br/>
      Weight: <span t-field="move.product_id.weight"/>
    <span t-field="move.product_id.weight_uom_id.display_name"/>
  </t>
</xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.hs_code_origin_and_weight.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.hs_code_origin_and_weight.xml)

### Margin After Title  
ID: `mint_system.stock.report_delivery_document.margin_after_title`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="60">

  <xpath expr="//h2" position="attributes">
    <attribute name="style" separator=";" add="margin-bottom: 1rem"/>
  </xpath>

</data>

```
Source: [snippets/stock.report_delivery_document.margin_after_title.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.margin_after_title.xml)

### Margin Before Title  
ID: `mint_system.stock.report_delivery_document.margin_before_title`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="60">

  <xpath expr="//h2" position="attributes">
    <attribute name="style" separator=";" add="margin-top: 1rem"/>
  </xpath>
</data>

```
Source: [snippets/stock.report_delivery_document.margin_before_title.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.margin_before_title.xml)

### Modify Main Table  
ID: `mint_system.stock.report_delivery_document.modify_main_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <!-- header -->
  <!--<xpath expr="//table[@name='stock_move_table']/thead" position="attributes">-->
  <!--  <attribute name="style">color: black; border-top-style:solid; border-bottom-style:solid; border-width:1px; border-color:black</attribute>-->
  <!--</xpath>-->
  
  <!--<xpath expr="//table[@name='stock_move_line_table']/thead" position="attributes">-->
  <!--  <attribute name="style">color: black; border-top-style:solid; border-bottom-style:solid; border-width:1px; border-color:black</attribute>-->
  <!--</xpath>-->
  
  <!-- <xpath expr="//table[@name='stock_backorder_table']/thead" position="attributes">-->
  <!--  <attribute name="style">color: black; border-top-style:solid; border-bottom-style:solid; border-width:1px; border-color:black</attribute>-->
  <!--</xpath>-->
  
  <!-- pos -->
  <!--<xpath expr="//thead/tr/th[1]" position="attributes">-->
  <!--  <attribute name="style">text-align: right; width: 5mm</attribute>-->
  <!--</xpath>-->

  <!-- quantity -->
   <xpath expr="//table[@name='stock_move_table']/thead/tr/th[2]" position="attributes">
      <attribute name="class">text-right</attribute>
  </xpath>
   
  <!--<xpath expr="//table[@name='stock_move_line_table']/thead/tr/th[2]" position="attributes">-->
  <!--    <attribute name="class">text-right</attribute>-->
  <!--</xpath>-->
  
   <xpath expr="//table[@name='stock_backorder_table']/thead/tr/th[2]" position="attributes">
      <attribute name="class">text-right</attribute>
      <attribute name="style">width:20mm</attribute>
  </xpath>
  
  <xpath t-if="o.state!='done'" expr="//table[@name='stock_move_table']/tbody/tr/td[1]" position="replace">
    <td style="text-align: right; padding-right: 10px">
        <span t-field="move.product_id.default_code"/>
    </td>
  </xpath>
  
  <xpath t-if="o.state!='done'" expr="//table[@name='stock_move_table']/tbody/tr/td[2]" position="after">
    <td style="text-align: right; ">
        <span style="text-align: right; font-weight: bold" t-field="move.product_uom_qty"/>
        <span t-field="move.product_uom"/>
    </td>
  </xpath>
  
  <xpath expr="//t[@t-if='o.backorder_ids and backorders']/p" position="replace">
      <div style="margin-top: 20mm; margin-bottom: 5mm; font-size: 9pt; padding-top: 15px; padding-bottom: 5px">
         <span>All items couldn't be shipped, the following items will be shipped as soon as they become available.</span>
      </div >
   </xpath> 
  
  <!-- add default_code -->
  <xpath t-if="o.state!='done'" expr="//table[@name='stock_move_table']/thead/tr[1]/th[1]" position="before">
    <th style="text-align: right; width: 27mm; padding-right: 10px">
      <strong >Part No.</strong>
    </th>
  </xpath>
  
  <!--<xpath t-if="o.state=='done'" expr="//table[@name='stock_move_line_table']/thead/tr[1]/th[1]" position="before">-->
  <!--  <th style="text-align: right; width: 27mm; padding-right: 10px">-->
  <!--    <strong >Part No.</strong>-->
  <!--  </th>-->
  <!--</xpath>-->
  
   <xpath expr="//span[@t-field='bo_line.product_uom_qty']" position="attributes">
      <attribute name="style">font-weight: bold</attribute>
      <attribute name="t-options-widget">"integer"</attribute>
  </xpath>

  <!--<xpath expr="//tbody/t/tr/td[2]" position="attributes">-->
  <!--    <attribute name="class">text-right</attribute>-->
  <!--</xpath>-->
  
    
  <xpath t-if="o.backorder_ids and backorders" expr="//table[@name='stock_backorder_table']/thead/tr/th[1]" position="before">
   <th style="text-align: right; width: 27mm; padding-right: 10px">
     <strong>Part No.</strong>
     </th>
  </xpath>
  
   <xpath t-if="o.backorder_ids and backorders" expr="//table[@name='stock_backorder_table']/thead/tr/th[2]" position="after">
   <th style="text-align: right; width: 27mm; padding-right: 10px">
     <strong>Open Quantity</strong>
     </th>
  </xpath>
  
  <xpath t-if="o.backorder_ids and backorders" expr="//table[@name='stock_backorder_table']/tbody//td[2]" position="after">
   <tr style="border-bottom: 1px solid rgb(220,220,220)">
      <td colspan="8"></td>
    </tr>
  </xpath>
  
  <!--<xpath expr="//table[@name='stock_move_line_table']" position="after">-->
  <!--  <t t-if="o.note_footer != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'">-->
  <!--    <span class="note" t-field="o.note_footer"/>-->
  <!--  </t>-->
  <!--</xpath>  -->
  
</data>

```
Source: [snippets/stock.report_delivery_document.modify_main_table.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.modify_main_table.xml)

### Move Lines  
ID: `mint_system.stock.report_delivery_document.move_lines`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//table[@name='stock_move_line_table']" position="before">   

    <table class="tissa table table-sm" name="move_table">
      <thead>
        <tr>
          <th>
            <strong>Pos</strong>
          </th>
          <th>
            <strong>Product (Sales Description)</strong>
          </th>
          <th>
            <strong></strong>
          </th>
          <th class="cell_right">
            <strong>Quantity</strong>
          </th>
        </tr>
      </thead>
      <tbody>
        <t t-set="moves" t-value="o.move_lines"/>
        <tr t-if="move.quantity_done > 0" t-foreach="moves" t-as="move">
          <td>
            <span t-esc="move.position"/>
          </td>
          <td>
            <span t-esc="move.product_id.description_sale"/>
          </td>
          <td></td>
          <td class="cell_right">
            <span t-esc="move.quantity_done"/>
            <span t-field="move.product_uom"/>
          </td>
        </tr>
      </tbody>
    </table>

  </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.move_lines.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.move_lines.xml)

### Pos In Table  
ID: `mint_system.stock.report_delivery_document.pos_in_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//table[1]/thead/tr/th[1]" position="before">
    <th>
      <span>Pos</span>
    </th>
  </xpath>

  <xpath expr="//table[2]/thead/tr/th[1]" position="before">
    <th>
      <span>Pos</span>
    </th>
  </xpath>

  <xpath expr="//t[@t-foreach='packages']" position="before">
    <t t-set="index" t-value="1"/>
  </xpath>

  <xpath expr="//tr[@t-foreach='lines']" position="before">
    <t t-set="index" t-value="1"/>
  </xpath>

  <xpath expr="//t[@name='aggregated_move_lines']/t[1]" position="before">
      <t t-set="index" t-value="1"/>
  </xpath>

  <xpath expr="//table[1]/tbody/tr/td[1]" position="before">
    <td>
      <span t-esc="index"/><t t-set="index" t-value="index+1"/>
    </td>
  </xpath>

</data>

```
Source: [snippets/stock.report_delivery_document.pos_in_table.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.pos_in_table.xml)

### Remove Informations  
ID: `mint_system.stock.report_delivery_document.remove_informations`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

<xpath expr="//div[@name='div_origin']/.." position="replace">
</xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.remove_informations.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.remove_informations.xml)

### Replace Address And Information Block  
ID: `mint_system.stock.report_delivery_document.replace_address_and_information_block`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//t[@t-set='address']" position="replace"/>

  <xpath expr="//t[@t-set='information_block']" position="replace">

    <span>Carbo-Link AG | Undermülistrasse 25 | CH 8320 Fehraltorf</span>

    <div class="row text-900 o_bold">
      <div class="col-7">Delivery Address</div>
      <div class="col-5">Customer</div>
    </div>

    <div class="row">
      <div class="col-7">
        <span t-field="o.sale_id.partner_shipping_id.commercial_company_name"/>
      </div>
      <div class="col-5">
        <span t-field="o.sale_id.partner_shipping_id.commercial_company_name"/>
      </div>
    </div>

    <div class="row">
      <div class="col-7">
        <span t-field="o.sale_id.partner_shipping_id" t-options-widget="&quot;contact&quot;" t-options-fields="['address']" t-options-no_marker="True"/>
      </div>
      <div class="col-5">
        <span t-field="o.sale_id.partner_id.name"/>
      </div>
    </div>

    <div class="row">
      <div class="col-5 text-900 o_bold offset-7" style="margin-top:25px">Invoice Address</div>
    </div>

    <div class="row">
      <div class="col-5 offset-7">
        <span t-field="o.sale_id.partner_shipping_id.commercial_company_name"/>
      </div>
    </div>

    <div class="row">
      <div class="col-5 offset-7">
        <span t-field="o.sale_id.partner_invoice_id" t-options-widget="&quot;contact&quot;" t-options-fields="['address']" t-options-no_marker="True"/>
      </div>
    </div>

    <div class="row o_bold text-900" style="margin-top:25px">
      <div class="col-7">Your Contact</div>
      <div class="col-5">Our Contact</div>
    </div>

    <div class="row">
      <div class="col-7">
        <span t-field="o.sale_id.partner_id.name"/>
      </div>
      <div class="col-5">
        <span t-field="o.sale_id.user_id.name"/>
      </div>
    </div>

    <div class="row">
      <div class="col-7" style="margin-bottom:25px">
        <span t-field="o.sale_id.partner_id" t-options-widget="&quot;contact&quot;" t-options-fields="['phone', 'email']" t-options-no_marker="True"/>
      </div>
      <div class="col-5">
        <span t-field="o.sale_id.user_id" t-options-widget="&quot;contact&quot;" t-options-fields="['phone', 'email']" t-options-no_marker="True"/>
      </div>
    </div>

  </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.replace_address_and_information_block.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.replace_address_and_information_block.xml)

### Replace Description Sale  
ID: `mint_system.stock.report_delivery_document.replace_description_sale`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="55">

    <xpath expr="//span[@t-field='move.product_id']" position="replace">
        <t t-if="move.product_id.description_sale">
            <span t-field="move.product_id.description_sale" />
        </t>
        <t t-else="">
            <span t-field="move.product_id" />
        </t>
    </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.replace_description_sale.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.replace_description_sale.xml)

### Replace Header  
ID: `mint_system.stock.report_delivery_document.replace_header`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">
    <xpath expr="//div[@t-if='o.origin']/.." position="before">
        <style>
        table#header {
            width: 100%;
            border: solid 1px;
            font-size: 18pt;
        }
        table#header td {
            padding: 5px;
            padding-left: 10px;
            vertical-align: middle;
            font-weight: bold;
        }
        </style>
        <table id='header'>
        <tr>
            <td>Lieferschein <span t-field="o.name"/>
            </td>
            <td>
                <span>
                    <img t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=0' % ('Code128', o.name, 600, 100)" style="width:210px;height:60px; float:right;"/>
                </span>
            </td>
        </tr>
        </table>
    </xpath>
</data>
```
Source: [snippets/stock.report_delivery_document.replace_header.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.replace_header.xml)

### Replace Informations  
ID: `mint_system.stock.report_delivery_document.replace_informations`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

    <xpath expr="//div[@class='page']/div[1]" position="replace">
        <style>
            div#informations p {
                margin-bottom: 0rem;
            }
            div#informations div {
                display: inline-block;
                vertical-align: top;
            }
        </style>
        <div id="informations">
            <table class="table table-borderless table-sm">
                <tr>
                    <td>
                        <strong>Versanddatum:</strong>
                        <t t-if="o.state == 'done'">
                            <span t-field="o.date_done" t-options='{"widget": "date"}' />
                        </t>
                        <t t-if="o.state != 'done'">
                            <span t-field="o.scheduled_date" t-options='{"widget": "date"}' />
                        </t>
                    </td>
                    <td>
                        <strong>Unser Kontakt:</strong>
                        <span t-field="o.sudo().sale_id.user_id" />
                    </td>
                    <td>
                        <strong>Ihr Kontakt:</strong>
                        <span t-field="o.sudo().sale_id.partner_sale_id.name" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <strong>&#160;Unsere Referenz:</strong>
                        <span t-field="o.origin" />
                    </td>
                    <td t-if="o.sudo().sale_id.client_order_ref">
                        <strong>Ihre Referenz:</strong>
                        <span t-field="o.sudo().sale_id.client_order_ref" />
                    </td>
                </tr>
            </table>
        </div>
    </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.replace_informations.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.replace_informations.xml)

### Replace Information Table2  
ID: `mint_system.stock.report_delivery_document.replace_information_table2`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//div[@class='page']/div[1]" position="replace">
  <div>
  <table style="border-style:none; width:100%">
    <tr >
      <td style="border-style:none">
        <strong>Customer Reference</strong>
        <p t-field="o.sudo().sale_id.client_order_ref"/>
      </td>
      <td style="border-style:none">
        <strong>Shipping Date</strong>
           <p t-field="o.scheduled_date" t-options='{"widget": "date"}'/>
      </td>
      <td style="border-style:none">
         <strong>Incoterms</strong>
         <p t-field="res_company.incoterm_id.code"/>
      </td>
      <td style="border-style:none">
         <strong>Carrier</strong>
         <p t-field="o.carrier_id"/>
      </td>
      <td style="border-style:none">
         <span><strong>Total Weight</strong></span><br></br>
         <span t-field="o.shipping_weight"/> <span t-field="o.weight_uom_name"/>
         </td>
      <td style="border-style:none">
          <strong>Order</strong>
          <p t-field="o.origin"/>
      </td>
    </tr>
    
  </table> 
  </div>
  
  </xpath>
</data>
```
Source: [snippets/stock.report_delivery_document.replace_information_table2.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.replace_information_table2.xml)

### Replace Information Table  
ID: `mint_system.stock.report_delivery_document.replace_information_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//div[@class='page']/div[1]" position="replace">
    <table class="table table-borderless table-sm">
      <tr>
        <td>
          <strong>Verkaufsauftrag: </strong>
          <span t-field="o.sale_id.name"/>
        </td>

        <td>
          <strong>Bestelldatum: </strong>
          <span t-field="o.sale_id.date_order" t-options='{"widget": "date"}' />
        </td>

        <td>
          <strong>Kontakt Verkauf: </strong>
          <span t-field="o.sale_id.user_id" />
        </td>
      </tr>
      <tr>
        <td>
          <strong>Kunden-Nr.: </strong>
          <span t-field="o.partner_id.ref" />
        </td>

        <td>
          <strong>Lieferdatum: </strong>
          <span t-field="o.move_lines[0].date_deadline" t-options='{"widget": "date"}' />
        </td>

        <td>
          <strong>Tel. Direkt: </strong>
          <t t-foreach="res_company.partner_id.child_ids.filtered(lambda c: c.type == 'delivery' and c.phone)" t-as="delivery_partner">
            <span t-esc="delivery_partner.phone" />
          </t>
        </td>
      </tr>
      <tr>
        <td></td>
        <td>
          <div t-if="o.picking_type_id.code == 'outgoing' and o.carrier_id">
            <strong>Spediteur: </strong>
            <span t-field="o.carrier_id"/>
          </div>
        </td>
        <td>
          <strong>E-Mail: </strong>
          <t t-foreach="res_company.partner_id.child_ids.filtered(lambda c: c.type == 'delivery' and c.email)" t-as="delivery_partner">
            <span t-esc="delivery_partner.email" />
          </t>
        </td>
      </tr>
    </table>
  </xpath>

</data>

```
Source: [snippets/stock.report_delivery_document.replace_information_table.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.replace_information_table.xml)

### Replace Infotable  
ID: `mint_system.stock.report_delivery_document.replace_infotable`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//div[@class='page']/div[1]" position="replace">

    <style>
      table#infotable td,
      table#infotable th {
        padding-top: 0;
        padding-bottom: 0;
      }
    </style>
    <table id="infotable" class="table table-sm table-borderless">
      <thead class="o_thead">
        <tr>
          <th id="origin">Auftrag:</th>
          <th t-if="o.state == 'done'" id="date_done">Versanddatum:</th>
          <th t-if="o.state != 'done'" id="scheduled_date">Versanddatum:</th>
          <th id="client_order_ref">Kundenreferenz:</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td id="origin">
            <span t-field="o.origin" />
          </td>
          <td t-if="o.state == 'done'" id="date_done">
            <span t-field="o.date_done" />
          </td>
          <td t-if="o.state != 'done'" id="scheduled_date">
            <span t-field="o.scheduled_date" />
          </td>
          <td id="client_order_ref">
            <span t-field="o.sudo().sale_id.client_order_ref" />
          </td>
        </tr>
      </tbody>
    </table>

  </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.replace_infotable.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.replace_infotable.xml)

### Replace Name  
ID: `mint_system.stock.report_delivery_document.replace_name`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

    <xpath expr="//span[@t-field='o.name']/.." position="replace">
        <h2>
            Delivery slip <span t-field="o.name"/>
        </h2>
    </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.replace_name.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.replace_name.xml)

### Replace Order Definition  
ID: `mint_system.stock.report_delivery_document.replace_order_definition`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">
  <xpath expr="//div[@t-if='o.origin']/.." position="replace">    
    <style>
      table#titel {
      width: 100%;
      font-size: 11pt;
      margin-top: 10px;
      }
      table#titel tr {
      border-bottom: 1px solid rgb(220,220,220);
      }
      table#titel td {
      padding-left: 10px;
      padding-bottom: 5px;
      }
        </style>
    <table id='titel'>
      <tr>
        <td style="width: 44%;"><strong>Fertigungsauftrag <span t-field="o.origin"/></strong></td>
        <td style="width: 56%"><strong>Produkt </strong><span t-field="o.product_id"/></td>
      </tr>
      <tr>
        <td>Status: <span t-field="o.state"/></td>
        <td>Datum: <span t-field="o.scheduled_date" t-options='{"widget": "date"}'></span></td>
      </tr>
    </table>
  </xpath>
</data>
```
Source: [snippets/stock.report_delivery_document.replace_order_definition.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.replace_order_definition.xml)

### Replace Product Description On Backorder  
ID: `mint_system.stock.report_delivery_document.replace_product_description_on_backorder`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">  
  
  <xpath t-if="o.backorder_ids and backorders" expr="//table[@name='stock_backorder_table']/tbody/t/tr/td[1]" position="replace">
   <td>
        <span style="font-weight: bold" t-field="bo_line.product_id.type_description"/><br/>
        <span t-field="bo_line.description_picking"/><br/>
      
        <t t-if="bo_line.product_id.country_of_origin_id.code and bo_line.product_id.hs_code">
          Country of origin: <span t-esc="bo_line.product_id.country_of_origin_id.code"/>
          / HS Code: <span t-esc="bo_line.product_id.hs_code"/><br/>
        </t>

        <t t-if="bo_line.product_id.hs_code and not bo_line.product_id.country_of_origin_id.code">
          HS Code: <span t-esc="bo_line.product_id.hs_code"/>
        </t>

        <t t-if="bo_line.product_id.country_of_origin_id.code and not bo_line.product_id.hs_code">
          Country of origin: <span t-esc="bo_line.product_id.country_of_origin_id.code"/>
        </t>
        
    </td>
  </xpath>
  
   <xpath t-if="o.backorder_ids and backorders" expr="//table[@name='stock_backorder_table']/tbody/t/tr/td[1]" position="before">
   <td style="text-align: right; padding-right: 10px">
      <span t-field="bo_line.product_id.default_code"/>
    </td>
  </xpath>  
  
</data>
```
Source: [snippets/stock.report_delivery_document.replace_product_description_on_backorder.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.replace_product_description_on_backorder.xml)

### Replace Product Description  
ID: `mint_system.stock.report_delivery_document.replace_product_description`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//table[@name='stock_move_table']/tbody/tr/td[1]" position="replace">
    <td>
      <t t-if="move.product_id.type_description">
        <strong><span t-field="move.product_id.type_description"/></strong><br/>
      </t>
      <span t-field="move.description_picking"/><br/>
      <t t-if="move.product_id.country_of_origin_id.code">Ursprungsland: <span t-field="move.product_id.country_of_origin_id.code"/></t>
      <t t-if="move.product_id.hs_code"> / Zollposition: <span t-field="move.product_id.hs_code"/></t>
      </td>
  </xpath>
  
</data>
```
Source: [snippets/stock.report_delivery_document.replace_product_description.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.replace_product_description.xml)

### Replace Product Uom Qty  
ID: `mint_system.stock.report_delivery_document.replace_product_uom_qty`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="60">

    <xpath expr="//span[@t-field='move.product_uom_qty']" position="replace">
        <span t-field="move.quantity_done"/>
    </xpath>

</data>

```
Source: [snippets/stock.report_delivery_document.replace_product_uom_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.replace_product_uom_qty.xml)

### Replace Sale Line Name  
ID: `mint_system.stock.report_delivery_document.replace_sale_line_name`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="55">

    <xpath expr="//span[@t-field='move.product_id']" position="replace">
        <t t-if="move.sale_line_id">
            <span t-field="move.sale_line_id.name" />
        </t>
        <t t-else="">
            <span t-field="move.product_id" />
        </t>
    </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.replace_sale_line_name.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.replace_sale_line_name.xml)

### Replace Table  
ID: `mint_system.stock.report_delivery_document.replace_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

<xpath expr="//table[@name='stock_move_table']" position="replace">
  
 <table style="width:100%; font-family: arial; font-size: 9pt; margin-top: 20px; " t-if="o.state!='done'" name="stock_move_table">
    <thead>
        <tr style="color:black; border-bottom: 1px solid rgb(220,220,220);">
            <th style="padding-left: 9px; padding-bottom: 10px; width:10%;">Art. Nr.</th>
            <th name="th_sm_product" style="width:35%;"><strong>Bezeichnung</strong></th>
            <th style="width:25%;">Typenbezeichnung</th>
            <th name="th_sm_quantity" style="width:20%; text-align:right; padding-right:20px;"><strong>Menge</strong></th>
            <th style="width:15%; text-align: right; padding-right: 10px">Lieferdatum</th>
        </tr>
    </thead>
    <tbody>
        <t t-set="lines" t-value="o.move_lines.filtered(lambda x: x.product_uom_qty)"/>
        <tr t-foreach="lines" t-as="move" style="border-bottom: 1px solid rgb(220,220,220);">
            <td style="padding-left: 10px; padding-top:5px; vertical-align:top;">
                <span t-field="move.product_id.default_code"/>
            </td>
            <td style="padding-top:5px; padding-right: 10px; vertical-align:top;">
                <span t-field="move.product_id.name"/>
                <p t-if="move.description_picking != move.product_id.name">
                    <span t-field="move.description_picking"/>
                </p>
            </td>
            <td style="padding-top:5px; vertical-align:top;">
                <span t-field="move.product_id.type_description"/>
            </td>
            <td style="width:18%; text-align:right; padding-right:20px; padding-top:5px; vertical-align:top;">
                <span t-field="move.product_uom_qty"/>
                <span t-field="move.product_uom"/>
            </td>
            <td style="text-align: right; padding-right: 10px; padding-top:5px; vertical-align:top;">
                <span t-field="move.date" t-options='{"widget": "date"}'/>
            </td>
        </tr>
    </tbody>
</table>
</xpath>
</data>

```
Source: [snippets/stock.report_delivery_document.replace_table.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.replace_table.xml)

### Round Qty2  
ID: `mint_system.stock.report_delivery_document.round_qty2`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//span[@id='qty']" position="replace">
    <!-- 34.00 -> 34 -->
    <!-- 34.50 -> 34.5 -->
    <!-- 34.75 -> 34.75 -->
    <span id="qty" t-esc="'%g' % move.product_uom_qty" />
  </xpath>
  
  <xpath expr="//span[@id='open_qty']" position="replace">
    <!-- 34.00 -> 34 -->
    <!-- 34.50 -> 34.5 -->
    <!-- 34.75 -> 34.75 -->
    <span id="open_qty" t-esc="'%g' % bo_line.product_uom_qty" />
  </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.round_qty2.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.round_qty2.xml)

### Round Qty  
ID: `mint_system.stock.report_delivery_document.round_qty`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//span[@id='qty']" position="replace">
    <!-- 34.00 -> 34 -->
    <!-- 34.50 -> 34.50 -->
    <!-- 34.75 -> 34.75 -->
    <span id="qty" t-esc="'%g' % move.product_uom_qty if int(move.product_uom_qty) == move.product_uom_qty else '%.2f' % move.product_uom_qty" />
  </xpath>
  
  <xpath expr="//span[@id='open_qty']" position="replace">
    <!-- 34.00 -> 34 -->
    <!-- 34.50 -> 34.50 -->
    <!-- 34.75 -> 34.75 -->
    <span id="open_qty" t-esc="'%g' % bo_line.product_uom_qty if int(bo_line.product_uom_qty) == bo_line.product_uom_qty else '%.2f' % bo_line.product_uom_qty" />
  </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.round_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.round_qty.xml)

### Sale Order Note  
ID: `mint_system.stock.report_delivery_document.sale_order_note`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//table[@name='stock_move_line_table']" position="after">
    <p t-if="o.sale_id.note" style="margin-top: 3rem;" t-field="o.sale_id.note"/>
  </xpath>

</data>

```
Source: [snippets/stock.report_delivery_document.sale_order_note.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.sale_order_note.xml)

### Sale Stock Picking Note  
ID: `mint_system.stock.report_delivery_document.sale_stock_picking_note`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="55">

  <xpath expr="//p[@t-if='o.customer_note']" position="replace">
  </xpath>

  <xpath expr="//table[@name='stock_move_line_table']" position="after">
    <p t-if="o.customer_note" style="margin-top: 3rem;" t-field="o.customer_note"/>
  </xpath>

</data>

```
Source: [snippets/stock.report_delivery_document.sale_stock_picking_note.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.sale_stock_picking_note.xml)

### Sequence In Table  
ID: `mint_system.stock.report_delivery_document.sequence_in_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//table[1]/thead/tr/th[1]" position="before">
    <th>
      <span>Pos</span>
    </th>
  </xpath>

  <xpath expr="//table[1]/tbody/tr/td[1]" position="before">
    <td>
      <span t-esc="move.sequence-9"/>
    </td>
  </xpath>

</data>

```
Source: [snippets/stock.report_delivery_document.sequence_in_table.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.sequence_in_table.xml)

### Set Customer Reference  
ID: `mint_system.stock.report_delivery_document.set_customer_reference`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//t[@t-set='address']" position="before">
    <t t-set="information_block">
      <span><strong>Kundennummer: </strong></span>
      <span t-esc="partner.ref"/>
      <br/>
      <br/>
    </t>
  </xpath>

</data>

```
Source: [snippets/stock.report_delivery_document.set_customer_reference.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.set_customer_reference.xml)

### Set Ids  
ID: `mint_system.stock.report_delivery_document.set_ids`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="60">

    <xpath expr="//table[@name='stock_move_table']//th[2]" position="attributes">
        <attribute name="id">description</attribute>
    </xpath>

    <xpath expr="//table[@name='stock_move_table']//th[3]" position="attributes">
        <attribute name="id">quantity</attribute>
    </xpath>
    <xpath expr="//table[@name='stock_move_table']//td[3]" position="attributes">
        <attribute name="id">quantity</attribute>
    </xpath>
    <xpath expr="//table[@name='stock_move_table']//td[3]/span[1]" position="attributes">
        <attribute name="id">qty</attribute>
    </xpath>

    <xpath expr="//table[@name='stock_backorder_table']//th[2]" position="attributes">
        <attribute name="id">description</attribute>
    </xpath>

    <xpath expr="//table[@name='stock_backorder_table']//th[3]" position="attributes">
        <attribute name="id">open_quantity</attribute>
    </xpath>
    <xpath expr="//table[@name='stock_backorder_table']//td[3]" position="attributes">
        <attribute name="id">open_quantity</attribute>
    </xpath>

    <xpath expr="//table[@name='stock_backorder_table']//th[3]" position="attributes">
        <attribute name="id">open_quantity</attribute>
    </xpath>
    <xpath expr="//table[@name='stock_backorder_table']//td[3]/span[1]" position="attributes">
        <attribute name="id">open_qty</attribute>
    </xpath>

    <xpath expr="//table[@name='stock_backorder_table']//th[4]" position="attributes">
        <attribute name="id">quantity</attribute>
    </xpath>

    <xpath expr="//table[@name='stock_backorder_table']/../p" position="attributes">
        <attribute name="class">subtitel</attribute>
    </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.set_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.set_ids.xml)

### Set Name  
ID: `mint_system.stock.report_delivery_document.set_name`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="60">

    <xpath expr="//table[@name='stock_move_table']//td[1]" position="attributes">
        <attribute name="name">td_sm_product</attribute>
    </xpath>

    <xpath expr="//table[@name='stock_move_table']//td[2]" position="attributes">
        <attribute name="name">td_sm_ordered</attribute>
    </xpath>

    <xpath expr="//table[@name='stock_move_table']//td[3]" position="attributes">
        <attribute name="name">td_sm_quantity</attribute>
    </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.set_name.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.set_name.xml)

### Set Page Font Size  
ID: `mint_system.stock.report_delivery_document.set_page_font_size`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="60">

    <xpath expr="//div[hasclass('page')]" position="inside">
        <style>
            body {
                font-size: 0.9rem;
            }
        </style>
    </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.set_page_font_size.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.set_page_font_size.xml)

### Set Table Font Size  
ID: `mint_system.stock.report_delivery_document.set_table_font_size`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="60">

    <xpath expr="//table[@name='stock_move_table']" position="before">
        <style>
            table th,
            table td {
                font-size: 0.8rem;
            }
        </style>
    </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.set_table_font_size.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.set_table_font_size.xml)

### Set Title Font Size  
ID: `mint_system.stock.report_delivery_document.set_title_font_size`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="60">

    <xpath expr="//div[hasclass('page')]" position="inside">
        <style>
            h2 {
                font-size: 1.5rem;
            }
        </style>
    </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.set_title_font_size.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.set_title_font_size.xml)

### Show Customer Info Product Code  
ID: `mint_system.stock.report_delivery_document.show_customer_info_product_code`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

<span t-field="move.product_id" position="before">
    <t t-set="customer_info" t-value="move.product_id._select_customerinfo(partner=o.partner_id)" />
    <t t-if="customer_info">
      <span t-esc="'[%s] ' % customer_info[0].product_code" />
    </t>
  </span>

</data>
```
Source: [snippets/stock.report_delivery_document.show_customer_info_product_code.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.show_customer_info_product_code.xml)

### Show Default Code  
ID: `mint_system.stock.report_delivery_document.show_default_code`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//table[@name='stock_move_table']" position="before">
    <style>
      th#default_code,
      td#default_code {
        white-space: nowrap;
      }
    </style>
  </xpath>
  
  <xpath expr="//table[@name='stock_move_table']//th[@name='th_sm_product']" position="before">
    <th id="default_code" name="th_default_code">
      <strong>Referenz</strong>
    </th>
  </xpath>

  <!-- <xpath expr="//table[@name='stock_backorder_table']/thead/tr/th[1]" position="before">
    <th id="default_code">
      <strong >Nr.</strong>
    </th>
  </xpath> -->

  <xpath expr="//table[@name='stock_move_table']//span[@t-field='move.product_id']/.." position="before">
    <td id="default_code"  name="td_default_code">
      <span t-field="move.product_id.default_code"/>
    </td>
  </xpath>

</data>

```
Source: [snippets/stock.report_delivery_document.show_default_code.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.show_default_code.xml)

### Show Lot Ids  
ID: `mint_system.stock.report_delivery_document.show_lot_ids`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <!-- <xpath expr="//table[@name='stock_move_table']//th[@name='th_sm_product']" position="after">
    <th name="th_lot_ids">
      <strong>Seriennummer</strong>
    </th>
  </xpath> -->

  <xpath expr="//table[@name='stock_move_table']//span[@t-field='move.description_picking']/.." position="after">
    <t t-if="move.lot_ids">
      <br />
      <span>Seriennummern:</span>
      <t t-esc="', '.join(move.lot_ids.mapped('name'))" />
    </t>

    <!-- <td name="td_lots"> -->
      <!-- <t t-esc="', '.join(move.lot_ids.mapped('name'))" /> -->
      <!-- <ul class="list-unstyled">
        <t t-foreach="move.lot_ids" t-as="lot">
          <li t-esc="lot.name" />
        </t>
      </ul> -->
    <!-- </td> -->

  </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.show_lot_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.show_lot_ids.xml)

### Show Quantity Done  
ID: `mint_system.stock.report_delivery_document.show_quantity_done`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//table[@name='stock_move_table']/tbody/t/td[2]/span[1]" position="attributes">
    <attribute name="t-field">move.quantity_done</attribute>
  </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.show_quantity_done.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.show_quantity_done.xml)

### Sort By Position  
ID: `mint_system.stock.report_delivery_document.sort_by_position`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//table[@name='stock_move_table']/tbody/t" position="after">
    <t t-set="lines" t-value="lines.sorted(key=lambda l: (l.position))"/>
  </xpath>

  <xpath expr="//table[@name='stock_backorder_table']/tbody/t/t" position="after">
    <t t-set="bo_lines" t-value="bo_lines.sorted(key=lambda l: (l.position))"/>
  </xpath>

  <xpath expr="//t[@name='no_package_move_lines']" position="before">
    <t t-set="move_lines" t-value="move_lines.sorted(key=lambda l: (l.position))"/>
  </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.sort_by_position.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.sort_by_position.xml)

### Style Carbo Link  
ID: `mint_system.stock.report_delivery_document.style_carbo_link`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="60">

    <xpath expr="//div[hasclass('page')]" position="before">
        <style>
        .o_company_1_layout {
            font-family: Dobra-Book;
            font-size: 80%;
            }
        </style>
    </xpath>
    
    <xpath expr="//p[@t-field='o.date_done']" position="attributes">
        <attribute name="t-options-widget">"date"</attribute>
    </xpath>
    
    <xpath expr="//p[@t-field='o.scheduled_date']" position="attributes">
        <attribute name="t-options-widget">"date"</attribute>
    </xpath>
    
</data>
```
Source: [snippets/stock.report_delivery_document.style_carbo_link.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.style_carbo_link.xml)

### Style Swissfragrance  
ID: `mint_system.stock.report_delivery_document.style_swissfragrance`  
```xml
<data inherit_id="stock.report_delivery_document" priority="60">

    <style>
      .cell_left {
      text-align: left;
      }
    </style>

    <xpath expr="//div[hasclass('page')]" position="before">
        <style>
        h2 {
        margin-top: 50px;
            }
        </style>
    </xpath>

    <xpath expr="//th[@name='th_sml_product']" position="attributes">
        <attribute name="class" separator=" " add="cell_left"/>
    </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.style_swissfragrance.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.style_swissfragrance.xml)

### Style Tissa  
ID: `mint_system.stock.report_delivery_document.style_tissa`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="60">

    <xpath expr="//div[hasclass('page')]" position="before">
      
        <style>
      table.tissa {
      margin-top: 30px;
      margin-bottom: 30px;
      }
      .cell_right {
      text-align: right;
      padding-right: 10px !important;
      }
    </style>
    
    </xpath>

    <xpath expr="//th[@name='th_sml_quantity']" position="attributes">
             <attribute name="class">cell_right</attribute>
    </xpath>
    
    <xpath expr="//th[@name='th_sm_quantity']" position="attributes">
             <attribute name="class" separator=" " add="cell_right"/>
    </xpath>
    
    <xpath expr="//table[@name='stock_move_table']//td[2]" position="attributes">
             <attribute name="class" separator=" " add="cell_right"/>
    </xpath>
    
</data>

```
Source: [snippets/stock.report_delivery_document.style_tissa.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.style_tissa.xml)

### Style Trimada  
ID: `mint_system.stock.report_delivery_document.style_trimada`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="60">

    <xpath expr="//div[hasclass('page')]" position="before">
        <style>
            table.trimada {
                font-size: 9pt;
                font-family: arial;
                color: black;
            }
            table.trimada thead tr {
                border-top:solid 1px;
                border-bottom: solid 1px;
            }
            table.trimada thead th#position {
                width: 5mm;
            }
            table.trimada thead th#default_code {
              width: 27mm;
              text-align: right;
            }
            table.trimada thead th#open_quantity {
              width: 30mm;
              text-align: right;
            }
            table.trimada thead th#quantity {
              width: 25mm;
              text-align: right !important;
            }
            table.trimada tbody td#position {
              text-align: right;
            }
            table.trimada tbody tr {
                border-bottom: 1px solid rgb(220,220,220)
            }
            table.trimada tbody td#default_code {
              text-align: right;
            }
            table.trimada tbody td#open_quantity {
              text-align: right !important;
            }
            table.trimada tbody td#quantity {
              text-align: right;
            }            
            table.trimada tbody span#qty {
              font-weight: bold;
            }
            table.trimada tbody span#open_qty {
              font-weight: bold;
            }
            .subtitel {
                font-size: 11pt;
                font-family: arial;
                margin-top: 10mm;
            }
            .note {
                font-size: 9pt;
                font-family: arial;
            }
        </style>
    </xpath>

    <table name="stock_move_table" position="attributes">
        <attribute name="class" separator=" " add="trimada table-borderless"/>
    </table>

    <table name="stock_backorder_table" position="attributes">
        <attribute name="class" separator=" " add="trimada table-borderless"/>
    </table>

</data>

```
Source: [snippets/stock.report_delivery_document.style_trimada.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.style_trimada.xml)

### Switch Address Block  
ID: `mint_system.stock.report_delivery_document.switch_address_block`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//t[@t-set='address']" position="after">
    <t t-set="information_block">
      <div t-esc="partner" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;, &quot;phone&quot;], &quot;no_marker&quot;: True}"/>
    </t>
  </xpath>

  <xpath expr="//t[@t-set='address']" position="replace">
    <t t-set="address">
    </t>
  </xpath>

</data>

```
Source: [snippets/stock.report_delivery_document.switch_address_block.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.switch_address_block.xml)

### Title Supplement  
ID: `mint_system.stock.report_delivery_document.title_supplement`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//h2" position="replace">
    <h2>Delivery Slip <span t-field="o.name"/></h2>
  </xpath>

</data>
```
Source: [snippets/stock.report_delivery_document.title_supplement.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.title_supplement.xml)

### X Hide On Delivery  
ID: `mint_system.stock.report_delivery_document.x_hide_on_delivery`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_delivery_document" priority="50">

  <xpath expr="//table[@name='stock_move_table']/tbody/t" position="after">
    <t t-set="lines" t-value="lines.filtered(lambda l: not l.product_id.x_hide_on_delivery)"/>
  </xpath>

  <xpath expr="//t[@name='no_package_move_lines']" position="before">
    <t t-set="move_lines" t-value="move_lines.filtered(lambda l: not l.product_id.x_hide_on_delivery)"/>
  </xpath>

  <xpath expr="//t[@t-set='package_move_lines']" position="after">
    <t t-set="package_move_lines" t-value="package_move_lines.filtered(lambda l: not l.product_id.x_hide_on_delivery)"/>
  </xpath>

</data>

```
Source: [snippets/stock.report_delivery_document.x_hide_on_delivery.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_delivery_document.x_hide_on_delivery.xml)

## Report Label  
### Aersolution  
ID: `mint_system.stock.report_label.aersolution`  
```xml
<t t-name="stock.report_label.aersolution">
    <t t-foreach="range(0, label_qty)" t-as="label_qty">

        <div class="row">
            <div class="col-6">
               <img t-if="company_id.logo" t-att-src="image_data_uri(company_id.logo)" style="max-width: 180px;" alt="Logo"/>
            </div>
            <div class="col-6">
                <strong><t t-esc="company_id.partner_id.name"/><br/>
                <t t-esc="company_id.partner_id.country_id.code"/>-<t t-esc="company_id.partner_id.zip"/> <t t-esc="company_id.partner_id.city"/></strong>
            </div>
        </div>
        
        <br/>
        
        <p t-esc="product_id.display_name"/>

        <p><span style="margin-right: 8px;">LS/SN:</span><t t-esc="lot_id.name if lot_id else picking.name"/></p>

        <p t-if="lot_id.expiration_date"><span style="margin-right: 8px;">EXP:</span><span t-field="lot_id.expiration_date" t-options="{'widget': 'date'}"/></p>

         <t t-set="putaway_rule_id" t-value="product_id.putaway_rule_ids[:1]"/>
        <p><span style="margin-right: 8px;">LOC:</span><span t-esc="putaway_rule_id.location_out_id.display_name if putaway_rule_id else 'WH/Stock'"/></p>

        <p style="page-break-before:always;"/>
    </t>
</t>
```
Source: [snippets/stock.report_label.aersolution.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_label.aersolution.xml)

## Report Lot Label  
### Aersolution  
ID: `mint_system.stock.report_lot_label.aersolution`  
```xml
<t t-name="stock.report_lot_label.aersolution">
    <t t-call="web.basic_layout">
        <div class="page">

            <t t-foreach="docs" t-as="lot">
                <t t-set="label_qty" t-value="1"/>
                <t t-set="company_id" t-value="lot.company_id"/>
                <t t-set="lot_id" t-value="lot"/>
                <t t-set="product_id" t-value="lot.product_id"/>

                <t t-call="mint_system.stock.report_label.aersolution"/>
            </t>

        </div>
    </t>
</t>
```
Source: [snippets/stock.report_lot_label.aersolution.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_lot_label.aersolution.xml)

## Report Picking  
### Add Address Block  
ID: `mint_system.stock.report_picking.add_address_block`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//table[1]" position="after">
    <div class="table address_block">
      <div class="row">
        <div class="col">
          <div t-field="o.partner_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}"/>
        </div>
      </div>
    </div>
  </xpath>

</data>
```
Source: [snippets/stock.report_picking.add_address_block.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.add_address_block.xml)

### Add Delivery Note  
ID: `mint_system.stock.report_picking.add_delivery_note`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

    <xpath expr="/t/t/t/t/div/table[1]" position="after">
        <p t-field="o.delivery_note"/>
    </xpath>

</data>

```
Source: [snippets/stock.report_picking.add_delivery_note.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.add_delivery_note.xml)

### Add Mrp Production X Note  
ID: `mint_system.stock.report_picking.add_mrp_production_x_note`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//table[@id='main_table']" position="after">
    <t t-set="production" t-value="o.group_id.mrp_production_ids"/>
    <t t-foreach="production" t-as="production_line">
      <t t-if="production_line.x_note != '&lt;br&gt;'">
        <p class="oe_no_empty" t-field="production_line.x_note"/>
      </t>
    </t>
  </xpath>

</data>
```
Source: [snippets/stock.report_picking.add_mrp_production_x_note.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.add_mrp_production_x_note.xml)

### Barcode Label  
ID: `mint_system.stock.report_picking.barcode_label`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//div/div/div/img" position="before">
    <strong>Rüstschein Code:</strong>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.barcode_label.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.barcode_label.xml)

### Format Delivery Date  
ID: `mint_system.stock.report_picking.format_delivery_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//p[@t-field='o.scheduled_date']" position="attributes">
    <attribute name="t-options-widget">"date"</attribute>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.format_delivery_date.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.format_delivery_date.xml)

### Format Qty Available  
ID: `mint_system.stock.report_picking.format_qty_available`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="60">

    <span id="qty_available" position="attributes">
        <attribute name="t-options-widget">"integer"</attribute>
    </span>

</data>
```
Source: [snippets/stock.report_picking.format_qty_available.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.format_qty_available.xml)

### Format Qty  
ID: `mint_system.stock.report_picking.format_qty`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//span[@id='product_uom_qty']" position="replace">
    <t t-if="ml.product_uom_id.id == 1">
      <span id="product_uom_qty" t-field="ml.product_uom_qty" t-options="{'widget': 'integer'}"/>
    </t>
    <t t-else="">
      <span id="product_uom_qty" t-field="ml.product_uom_qty"/>
    </t>
  </xpath>

  <xpath expr="//span[@id='qty_available']" position="replace">
    <t t-if="ml.product_uom_id.id == 1">
      <span id="qty_available" t-field="ml.product_id.qty_available" t-options="{'widget': 'integer'}"/>
    </t>
    <t t-else="">
      <span id="qty_available" t-field="ml.product_id.qty_available"/>
    </t>
  </xpath>

</data>
```
Source: [snippets/stock.report_picking.format_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.format_qty.xml)

### Format Title  
ID: `mint_system.stock.report_picking.format_title`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//h1[@t-field='o.name']" position="replace">
    <h1 t-esc="'Rüstschein ' + o.name.replace('WH/OUT/', '')"/>
  </xpath>
  
</data>

```
Source: [snippets/stock.report_picking.format_title.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.format_title.xml)

### Get Position  
ID: `mint_system.stock.report_picking.get_position`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <!-- <xpath expr="//th[@name='th_product']" position="before">
    <t t-if="o.sale_id or o.purchase_id"> -->
  <xpath expr="//th[@id='default_code']" position="before">
      <th id="position">
        <strong>Pos</strong>
      </th>
    <!-- </t> -->
  </xpath>
  
 <xpath expr="//td[@id='default_code']" position="before">
  <!-- <xpath expr="//span[@t-field='ml.product_id.description_picking']/.." position="before"> -->
    <!-- <t t-if="o.sale_id or o.purchase_id"> -->
      <td id="position">
        <span t-esc="move.position"/>
      </td>
    <!-- </t> -->
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.get_position.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.get_position.xml)

### Group By Date  
ID: `mint_system.stock.report_picking.group_by_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//div[hasclass('page')]" position="before">
    <!-- Get all lines without duplicates -->
    <t t-set="dates" t-value="list(set([date.date() for date in o.move_ids_without_package.mapped('date')]))" />
    <!-- Store if has dates -->
    <t t-set="has_dates" t-value="len(dates) > 0" />
    <!-- Store if has multiple dates -->
    <t t-set="has_multiple_dates" t-value="len(dates) > 1" />
  </xpath>

  <!-- Replace loop -->
  <xpath expr="//t[@t-foreach='o.move_ids_without_package']" position="replace">

    <!--<p t-esc="dates" />-->
    <!--<p t-esc="has_dates" />-->
    <!--<p t-esc="has_multiple_dates" />-->

    <!-- Loop each group item -->
    <t t-foreach="dates" t-as="date">

      <!-- Insert group item -->
      <tr t-if="has_dates and date" class="o_line_note">
        <td colspan="99" style="padding-top: 1rem;">
          <strong>
            <span>Lieferdatum: </span>
            <span t-esc="date" t-options="{'widget': 'date'}" />
          </strong>
        </td>
      </tr>

      <!-- Show only move that are assigned to the group item -->
      <t t-set="move_ids" t-value="o.move_ids_without_package.filtered(lambda m: m.date.strftime('%Y-%m-%d') == date.strftime('%Y-%m-%d')).sorted(lambda m: m.date)" />
      <t t-foreach="move_ids" t-as="move">
        <t t-foreach="move.move_line_ids.sorted(key=lambda ml: ml.location_id.id)" t-as="ml">

          <tr>
            <td id="description_picking">
              <span t-field="ml.product_id.display_name" />
              <br />
              <span t-field="ml.product_id.description_picking" />
            </td>
            <td id="product_uom_qty">
              <span t-if="o.state != 'done'" t-field="ml.product_uom_qty" />
              <span t-if="o.state == 'done'" t-field="ml.qty_done" />
              <span t-field="ml.product_uom_id" groups="uom.group_uom" />

            </td>
            <td  id="location_id" t-if="o.picking_type_id.code != 'incoming'" groups="stock.group_stock_multi_locations">
              <span t-esc="ml.location_id.display_name" />
              <t t-if="ml.package_id">
                <span t-field="ml.package_id" />
              </t>
            </td>
            <td  id="location_dest_id" t-if="o.picking_type_id.code != 'outgoing'" groups="stock.group_stock_multi_locations">
              <div>
                <span t-field="ml.location_dest_id" />
                <t t-if="ml.result_package_id">
                  <span t-field="ml.result_package_id" />
                </t>
              </div>
            </td>
            <td id="has_serial_number" class=" text-center h6" t-if="has_serial_number">
              <img t-if="has_serial_number and (ml.lot_id or ml.lot_name)" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;humanreadable=1' % ('Code128', ml.lot_id.name or ml.lot_name, 400, 100)" style="width:100%;height:35px;" alt="Barcode" />

            </td>
            <td id="has_barcode" class="text-center" t-if="has_barcode">
              <t t-if="product_barcode != move.product_id.barcode">
                <span t-if="move.product_id and move.product_id.barcode">
                  <img t-if="len(move.product_id.barcode) == 13" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=%s' % ('EAN13', move.product_id.barcode, 400, 100, 0)" style="height:35px" alt="Barcode" />
                  <img t-elif="len(move.product_id.barcode) == 8" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=%s' % ('EAN8', move.product_id.barcode, 400, 100, 0)" style="height:35px" alt="Barcode" />
                  <img t-else="" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=%s' % ('Code128', move.product_id.barcode, 400, 100, 0)" style="height:35px" alt="Barcode" />

                </span>
                <t t-set="product_barcode" t-value="move.product_id.barcode" />
              </t>
            </td>
          </tr>

        </t>
      </t>
    </t>

  </xpath>

</data>
```
Source: [snippets/stock.report_picking.group_by_date.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.group_by_date.xml)

### Header Box  
ID: `mint_system.stock.report_picking.header_box`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//h1" position="replace">
    <div class="header_box">
      <div class="row align-items-center">
        <div class="col">
          <h1 class="trimada">Rüstschein <span t-field="o.name"/>
          </h1>
        </div>
        <div class="col">
          <img t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=0' % ('Code128', o.name, 600, 100)" style="width:210px;height:60px; float:right;" alt="Barcode"/>
        </div>
      </div>
    </div>
  </xpath>

</data>
```
Source: [snippets/stock.report_picking.header_box.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.header_box.xml)

### Hide Address  
ID: `mint_system.stock.report_picking.hide_address`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

    <xpath expr="//div[@name='div_outgoing_address']/.." position="replace"/>

</data>
```
Source: [snippets/stock.report_picking.hide_address.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.hide_address.xml)

### Hide Location Dest  
ID: `mint_system.stock.report_picking.hide_location_dest`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <!-- Hide destination location column for outgoing deliveries of operation type Pick Components -->
  <xpath expr="//th[@name='th_to']" position="replace">
    <th name="th_to" t-if="o.picking_type_id.code != 'outgoing' and o.picking_type_id.id != 12" groups="stock.group_stock_multi_locations">
      <strong>To</strong>
    </th>
  </xpath>

  <xpath expr="//td[@id='location_dest_id']" position="replace">
  attribute name="t-if"
    <td t-if="o.picking_type_id.code != 'outgoing' and o.picking_type_id.id != 12" groups="stock.group_stock_multi_locations">
      <div>
        <span t-field="ml.location_dest_id"/>
        <t t-if="ml.result_package_id">
          <span t-field="ml.result_package_id"/>
        </t>
      </div>
    </td>
  </xpath>

</data>
```
Source: [snippets/stock.report_picking.hide_location_dest.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.hide_location_dest.xml)

### Hide Name  
ID: `mint_system.stock.report_picking.hide_name`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

    <xpath expr="//h1[@t-field='o.name']" position="replace"/>
    
</data>
```
Source: [snippets/stock.report_picking.hide_name.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.hide_name.xml)

### Margin Barcode  
ID: `mint_system.stock.report_picking.margin_barcode`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//div/div/div/img" position="attributes">
    <attribute name="style" separator=";" add="margin-bottom: 1rem"/>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.margin_barcode.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.margin_barcode.xml)

### Margin Before Table  
ID: `mint_system.stock.report_picking.margin_before_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="60">

  <xpath expr="//table[1]" position="attributes">
    <attribute name="style" separator=";" add="margin-top: 1rem"/>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.margin_before_table.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.margin_before_table.xml)

### Modify No Reserved Product  
ID: `mint_system.stock.report_picking.modify_no_reserved_product`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//t[@t-set='no_reserved_product']" position="attributes">
    <attribute name="t-value">o.move_lines.filtered(lambda x: x.product_uom_qty != x.reserved_availability and x.state!='done')</attribute>
  </xpath>
  
</data>
```
Source: [snippets/stock.report_picking.modify_no_reserved_product.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.modify_no_reserved_product.xml)

### Partner Ref  
ID: `mint_system.stock.report_picking.partner_ref`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//div[@name='div_incoming_address']/div[1]" position="before">
    <div t-if="o.partner_id.ref">
      <span><strong>Kundennummer: </strong></span>
      <span t-field="o.partner_id.ref"/>
    </div>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.partner_ref.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.partner_ref.xml)

### Pos In Table  
ID: `mint_system.stock.report_picking.pos_in_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="60">

  <xpath expr="//table[1]/thead/tr/th[1]" position="before">
    <th>
      <strong>Pos</strong>
    </th>
  </xpath>

  <xpath expr="//t[@t-foreach='o.move_ids_without_package']" position="before">
    <span t-set="index" t-value="1"/>
  </xpath>

  <xpath expr="//table[1]/tbody/t//tr/td[1]" position="before">
    <td>
      <span t-esc="index"/>
      <t t-set="index" t-value="index+1"/>
    </td>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.pos_in_table.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.pos_in_table.xml)

### Pricelist Below Address  
ID: `mint_system.stock.report_picking.pricelist_below_address`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//div[@name='partner_header']/p" position="after">
    <span t-field="o.sale_id.pricelist_id.display_name"/>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.pricelist_below_address.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.pricelist_below_address.xml)

### Product Description  
ID: `mint_system.stock.report_picking.product_description`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

    <xpath expr="//td[@id='description_picking']" position="replace">

        <td id="description_picking">
            <strong>
                <span t-esc="move.product_id.type_description"/>
            </strong>
            <br/>
            <t t-if="move.description_picking">
              <span t-esc="move.description_picking"/>
          <br/>
            </t>
            <t t-if="not move.description_picking">
                <span t-esc="move.product_id.name"/>
                <br/>
            </t>
            <span id="description_pickingout" t-field="move.product_id.description_pickingout"/>
        </td>
    </xpath>

</data>
```
Source: [snippets/stock.report_picking.product_description.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.product_description.xml)

### Relocate Quantity  
ID: `mint_system.stock.report_picking.relocate_quantity`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

    <xpath expr="//th[@id='product_uom_qty']" position="replace"/>

    <xpath expr="//th[@id='th_to']" position="after">
        <th id="product_uom_qty">
            <strong>Quantity</strong>
        </th>
    </xpath>

  <xpath expr="//td[@id='product_uom_qty']" position="replace"/>
  
  <xpath expr="//td[@id='location_dest_id']" position="after">
        <td id="product_uom_qty">
          
            <t t-if="o.state != 'done'">
              <span id="product_uom_qty" t-esc="'%g' % ml.product_uom_qty"/>
            </t>
            
            <t t-if="o.state == 'done'">
              <span id="qty_done">
                (<span t-esc="'%g' % ml.qty_done"/>)
              </span>
              <span id="product_uom_qty" t-esc="'%g' % ml.product_uom_qty"/>
            </t>
    
            <span t-field="ml.product_uom_id" groups="uom.group_uom"/>
            <br/>
            <span id="qty_available" t-field="ml.product_id.qty_available"/>
            <span id="qty_available_uom_id" t-field="ml.product_id.uom_id"/>
        </td>
    </xpath>

</data>
```
Source: [snippets/stock.report_picking.relocate_quantity.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.relocate_quantity.xml)

### Remove From And To  
ID: `mint_system.stock.report_picking.remove_from_and_to`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//th[@name='th_from']" position="replace">
  </xpath>
  
  <xpath expr="//th[@name='th_to']" position="replace">
  </xpath>

  <xpath expr="//tbody/t//tr/td[3]" position="replace">
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.remove_from_and_to.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.remove_from_and_to.xml)

### Remove Reservation Notice  
ID: `mint_system.stock.report_picking.remove_reservation_notice`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//div[hasclass('page')]/p[1]" position="replace"/>

</data>

```
Source: [snippets/stock.report_picking.remove_reservation_notice.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.remove_reservation_notice.xml)

### Remove Serial Number  
ID: `mint_system.stock.report_picking.remove_serial_number`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//th[@t-if='has_serial_number']" position="replace">
  </xpath>

  <xpath expr="//td[@t-if='has_serial_number']" position="replace">
  </xpath>
  
</data>

```
Source: [snippets/stock.report_picking.remove_serial_number.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.remove_serial_number.xml)

### Remove To  
ID: `mint_system.stock.report_picking.remove_to`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//th[@name='th_to']" position="replace">
    <th name="th_to" t-if="o.picking_type_id.code != 'outgoing' and o.picking_type_id.id != 12" groups="stock.group_stock_multi_locations">
      <strong>To</strong>
    </th>
  </xpath>

  <xpath expr="//td[@id='location_dest_id']" position="replace">
    <td t-if="o.picking_type_id.code != 'outgoing' and o.picking_type_id.id != 12" groups="stock.group_stock_multi_locations">
      <div>
        <span t-field="ml.location_dest_id"/>
        <t t-if="ml.result_package_id">
          <span t-field="ml.result_package_id"/>
        </t>
      </div>
    </td>
  </xpath>

</data>
```
Source: [snippets/stock.report_picking.remove_to.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.remove_to.xml)

### Replace Barcode  
ID: `mint_system.stock.report_picking.replace_barcode`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

    <xpath expr="//td[@id='barcode']" position="replace">

        <td id="barcode" class="trimada" t-if="has_barcode">
            <t t-if="product_barcode != move.product_id.barcode">
                <span t-if="move.product_id and move.product_id.barcode">
                    <img t-if="len(move.product_id.barcode) == 13" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=%s' % ('EAN13', move.product_id.barcode, 290, 100, 0)" style="height:35px" alt="Barcode"/>
                    <img t-elif="len(move.product_id.barcode) == 8" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=%s' % ('EAN8', move.product_id.barcode, 290, 100, 0)" style="height:35px" alt="Barcode"/>
                    <img t-else="" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=%s' % ('Code128', move.product_id.barcode, 290, 100, 0)" style="height:35px" alt="Barcode"/>

                </span>
                <t t-set="product_barcode" t-value="move.product_id.barcode"/>
            </t>
        </td>

    </xpath>
</data>
```
Source: [snippets/stock.report_picking.replace_barcode.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.replace_barcode.xml)

### Replace Header  
ID: `mint_system.stock.report_picking.replace_header`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

    <xpath expr="//div[@name='right_box']/.." position="replace">

        <style>
            table.trimada_header {
                width: 100%;
                font-family: arial;
                font-size: 18pt;
                font-weight: bold;
                border:solid 1px;
            }
            table.trimada_header td {
                padding-left: 10px;
                vertical-align: middle;
                padding: 5px;
            }
        </style>

        <table class="trimada_header">
            <tr>
                <td>Rüstschein <span t-field="o.name"/>
                </td>
                <td>
                    <span>
                        <img t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=0' % ('Code128', o.name, 600, 100)" style="width:210px;height:60px; float:right;" alt="Barcode"/>
                    </span>
                </td>
            </tr>
        </table>

    </xpath>
</data>
```
Source: [snippets/stock.report_picking.replace_header.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.replace_header.xml)

### Replace Order Definition  
ID: `mint_system.stock.report_picking.replace_order_definition`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//div[@name='div_origin']/.." position="replace">

    <style>
            table.trimada_order {
              width: 100%;
                font-size: 11pt;
                font-family: arial;
            }
            table.trimada_order tr {
              border-bottom: 1px solid rgb(220,220,220);
            }
         .first_col {
              width: 44%;
              padding-left: 10px;
              padding-top: 5px;
              padding-bottom: 5px;
            }
            .second_col {
              width: 56%;
            }
            .last_row {
              border-bottom: 0px !important;
            }
    </style>

    <table class="trimada_order">
      <tr>
        <t t-if="o.picking_type_id.id == 12">
          <td class="first_col">
            <strong>
              Fertigungsauftrag
              <span t-field="o.origin" />
            </strong>
          </td>
          <td class="second_col">
            <strong>
              Produkt
              <span />
            </strong>
            <span t-field="o.group_id.mrp_production_ids.product_id" />
          </td>
        </t>
        <t t-if="o.picking_type_id.id != 12">
          <td class="first_col">
            <strong>
              Bestellung
              <span t-field="o.origin" />
            </strong>
          </td>
          <td></td>
        </t>
      </tr>
      <tr>
        <td class="first_col">
          Status:
          <span t-field="o.state" />
        </td>
        <td class="second_col">
          Datum:
          <span t-field="o.scheduled_date" t-options='{"widget": "date"}'></span>
        </td>
      </tr>
      <tr class="last_row">
        <td class="first_col">
          Typ:
          <span t-field="o.picking_type_id.code" />
        </td>
        <t t-if="o.carrier_id">
          <td>
            Auslieferungsmethode:
            <span t-field="o.carrier_id" />
          </td>
        </t>
      </tr>
    </table>

  </xpath>
</data>
```
Source: [snippets/stock.report_picking.replace_order_definition.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.replace_order_definition.xml)

### Replace Table  
ID: `mint_system.stock.report_picking.replace_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

<xpath expr="//table[@t-if='o.move_line_ids and o.move_ids_without_package']" position="replace">
  
<table style="width:100%; font-family: arial; font-size: 9pt; margin-top: 20px" t-if="o.move_line_ids and o.move_ids_without_package">
  <t t-set="has_barcode" t-value="any(move_line.product_id and move_line.product_id.sudo().barcode or move_line.package_id for move_line in o.move_line_ids)"/>
  <t t-set="has_serial_number" t-value="any(move_line.lot_id or move_line.lot_name for move_line in o.move_line_ids)" groups="stock.group_production_lot"/>

    <tr style="border-bottom: 1px solid rgb(220,220,220);">
        <th name="th_product" style="padding-left: 9px; padding-bottom: 10px; width:12%;">
            <strong>Art. Nr.</strong>
        </th>
        <th style="width:40%">
            <strong>Bezeichnung / Typenbezeichnung</strong>
        </th>
        <th style="width:12%" name="th_from" t-if="o.picking_type_id.code != 'incoming'" align="left" groups="stock.group_stock_multi_locations">
            <strong>Von</strong>
        </th>
        <th style="width:12%" name="th_to" t-if="o.picking_type_id.code != 'outgoing'" groups="stock.group_stock_multi_locations">
            <strong>Nach</strong>
        </th>
        <th style="width:18%; text-align:right; padding-right:20px;">
            <strong>Menge</strong>
        </th>
        <th style="width:3%; text-align:right; padding-right:10px;">
            <strong>Lager</strong>
        </th>
        <th name="th_serial_number" class="text-center" t-if="has_serial_number">
           <strong>Lot/Serial Number</strong>
        </th>
        <th style="width:3%" name="th_barcode" class="text-center" t-if="has_barcode">
            <strong></strong>
        </th>
    </tr>
                            
      <t t-foreach="o.move_ids_without_package" t-as="move">
          <!-- In case you come across duplicated lines, ask NIM or LAP -->
          <t t-foreach="move.move_line_ids.sorted(key=lambda ml: ml.location_id.id)" t-as="ml">
            
              <tr style="border-bottom: 1px solid rgb(220,220,220);">
                  <td style="padding-left: 10px; padding-top:5px; vertical-align:top;">
                      <span t-field="ml.product_id.default_code"/><br/>
                  </td>
                  <td style="padding-top:5px; vertical-align:top; padding-right: 10px">
                      <span t-field="ml.product_id.name"/><br/>
                      <span t-field="ml.product_id.type_description"/>
                  </td>
                  
                  <td style="padding-top:5px; vertical-align:top;" t-if="o.picking_type_id.code != 'incoming'" groups="stock.group_stock_multi_locations">
                      <span t-esc="ml.location_id.display_name"/>
                          <t t-if="ml.package_id">
                              <span t-field="ml.package_id"/>
                          </t>
                  </td>
                  <td style="padding-top:5px; vertical-align:top;" t-if="o.picking_type_id.code != 'outgoing'" groups="stock.group_stock_multi_locations">
                      <div>
                          <span t-field="ml.location_dest_id"/>
                          <t t-if="ml.result_package_id">
                              <span t-field="ml.result_package_id"/>
                          </t>
                      </div>
                  </td>
                  <td style="padding-top:5px; vertical-align:top; text-align:right; padding-right:20px; font-weight: bold">
                      <span t-if="o.state != 'done'" t-field="ml.product_uom_qty"/>
                      <span t-if="o.state == 'done'" t-field="ml.qty_done"/>
                      <span t-field="ml.product_uom_id" groups="uom.group_uom"/>

                  </td>
                  
                  <td style="padding-top:5px; padding-right: 10px; vertical-align:top; text-align:right">
                        <span t-field="ml.product_id.qty_available"/>
                  </td>
                  
                  <td class=" text-center h6" t-if="has_serial_number">
                      <img t-if="has_serial_number and (ml.lot_id or ml.lot_name)" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;humanreadable=1' % ('Code128', ml.lot_id.name or ml.lot_name, 400, 100)" style="width:100%;height:35px;" alt="Barcode"/>

                  </td>
                  <td style="padding-top: 5px; padding-bottom: 5px; vertical-align:middle;" class="text-center" t-if="has_barcode">
                      <t t-if="product_barcode != move.product_id.barcode">
                          <span t-if="move.product_id and move.product_id.barcode">
                              <img t-if="len(move.product_id.barcode) == 13" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=%s' % ('EAN13', move.product_id.barcode, 290, 100, 0)" style="height:35px" alt="Barcode"/>
                              <img t-elif="len(move.product_id.barcode) == 8" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=%s' % ('EAN8', move.product_id.barcode, 290, 100, 0)" style="height:35px" alt="Barcode"/>
                              <img t-else="" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=%s' % ('Code128', move.product_id.barcode, 290, 100, 0)" style="height:35px" alt="Barcode"/>

                          </span>
                          <t t-set="product_barcode" t-value="move.product_id.barcode"/>
                      </t>
                  </td>
              </tr>
          </t>
      </t>
       
  </table>                     
  
  </xpath>
  </data>
```
Source: [snippets/stock.report_picking.replace_table.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.replace_table.xml)

### Round Qty2  
ID: `mint_system.stock.report_picking.round_qty2`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//span[@id='product_uom_qty']" position="replace">
    <!-- 34.00 -> 34 -->
    <!-- 34.50 -> 34.5 -->
    <!-- 34.75 -> 34.75 -->
    <span id="product_uom_qty" t-esc="'%g' % ml.product_uom_qty" />
  </xpath>

  <xpath expr="//span[@id='qty_available']" position="replace">
    <!-- 34.00 -> 34 -->
    <!-- 34.50 -> 34.5 -->
    <!-- 34.75 -> 34.75 -->
    <span id="qty_available" t-esc="'%g' % ml.product_id.qty_available" />
  </xpath>

</data>
```
Source: [snippets/stock.report_picking.round_qty2.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.round_qty2.xml)

### Round Qty  
ID: `mint_system.stock.report_picking.round_qty`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//span[@id='product_uom_qty']" position="replace">
    <!-- 34.00 -> 34 -->
    <!-- 34.50 -> 34.50 -->
    <!-- 34.75 -> 34.75 -->
    <span id="product_uom_qty" t-esc="'%g' % ml.product_uom_qty if int(ml.product_uom_qty) == ml.product_uom_qty else '%.2f' % ml.product_uom_qty" />
  </xpath>

  <xpath expr="//span[@id='qty_available']" position="replace">
    <!-- 34.00 -> 34 -->
    <!-- 34.50 -> 34.50 -->
    <!-- 34.75 -> 34.75 -->
    <span id="qty_available" t-esc="'%g' % ml.product_id.qty_available if int(ml.product_id.qty_available) == ml.product_id.qty_available else '%.2f' % ml.product_id.qty_available" />
  </xpath>

</data>
```
Source: [snippets/stock.report_picking.round_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.round_qty.xml)

### Set Ids  
ID: `mint_system.stock.report_picking.set_ids`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="60">

    <xpath expr="//th[@name='th_product']" position="attributes">
        <attribute name="id">th_product</attribute>
    </xpath>

    <xpath expr="//th[@name='th_product']/../th[2]" position="attributes">
        <attribute name="id">product_uom_qty</attribute>
    </xpath>

    <xpath expr="//th[@name='th_to']" position="attributes">
        <attribute name="id">th_to</attribute>
    </xpath>

    <xpath expr="//td[@t-if='has_barcode']" position="attributes">
        <attribute name="id">barcode</attribute>
    </xpath>
    
    <xpath expr="//th[@name='th_product']/../../.." position="attributes">
      <attribute name="id">main_table</attribute>
    </xpath>

</data>
```
Source: [snippets/stock.report_picking.set_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.set_ids.xml)

### Show Default Code  
ID: `mint_system.stock.report_picking.show_default_code`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//th[@id='th_product']" position="before">
    <th id="default_code">
      <strong >Part No.</strong>
    </th>
  </xpath>

  <xpath expr="//td[@id='description_picking']" position="before">
    <td id="default_code">
      <span t-field="ml.product_id.default_code"/>
    </td>
  </xpath>

</data>
```
Source: [snippets/stock.report_picking.show_default_code.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.show_default_code.xml)

### Show Full Address  
ID: `mint_system.stock.report_picking.show_full_address`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//div[@name='partner_header']/div" position="attributes">
    <attribute name="t-options-fields">['name', 'phone', 'address']</attribute>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.show_full_address.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.show_full_address.xml)

### Show Lot  
ID: `mint_system.stock.report_picking.show_lot`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//th[@name='th_product']/../th[4]" position="after">
    <th name="th_lot">
      <strong>Los</strong>
    </th>
  </xpath>

  <xpath expr="//span[@t-field='move.product_uom_qty']/.." position="after">
    <td>
      <span t-if="move.lot_ids" t-esc="', '.join(move.lot_ids.mapped('display_name'))"/>
    </td>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.show_lot.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.show_lot.xml)

### Show Move Not Lines  
ID: `mint_system.stock.report_picking.show_move_not_lines`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="40">

    <xpath expr="//table[@t-if='o.move_line_ids and o.move_ids_without_package']" position="attributes">
        <attribute name="t-if">o.move_ids_without_package</attribute>
    </xpath>

    <xpath expr="//tbody/t/t" position="replace">
        <tr>
            <td>
                <span t-field="move.product_id.display_name" />
                <br />
                <span t-field="move.product_id.description_picking" />
            </td>
            <td>
                <span t-field="move.product_uom_qty" />
                <span t-if="not move.product_packaging.x_packaging_uom_id" t-field="move.product_uom" groups="uom.group_uom" />
                <span t-if="move.product_packaging.x_packaging_uom_id" t-field="move.product_packaging.x_packaging_uom_id" groups="uom.group_uom" />
            </td>
            <td t-if="o.picking_type_id.code != 'incoming'" groups="stock.group_stock_multi_locations">
                <span t-esc="move.location_id.display_name" />
            </td>
            <td t-if="o.picking_type_id.code != 'outgoing'" groups="stock.group_stock_multi_locations">
                <div>
                    <span t-field="move.location_dest_id" />
                </div>
            </td>
            <td class=" text-center h6" t-if="has_serial_number"></td>
            <td class="text-center" t-if="has_barcode">
                <t t-if="product_barcode != move.product_id.barcode">
                    <span t-if="move.product_id and move.product_id.barcode">
                        <img t-if="len(move.product_id.barcode) == 13" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=%s' % ('EAN13', move.product_id.barcode, 400, 100, 0)" style="height:35px" alt="Barcode" />
                        <img t-elif="len(move.product_id.barcode) == 8" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=%s' % ('EAN8', move.product_id.barcode, 400, 100, 0)" style="height:35px" alt="Barcode" />
                        <img t-else="" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=%s' % ('Code128', move.product_id.barcode, 400, 100, 0)" style="height:35px" alt="Barcode" />

                    </span>
                    <t t-set="product_barcode" t-value="move.product_id.barcode" />
                </t>
            </td>
        </tr>
    </xpath>

</data>
```
Source: [snippets/stock.report_picking.show_move_not_lines.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.show_move_not_lines.xml)

### Show Move Qty  
ID: `mint_system.stock.report_picking.show_move_qty`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//span[@t-field='ml.product_uom_qty']" position="replace">
    <span t-if="o.state != 'done'" t-field="move.product_uom_qty"/>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.show_move_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.show_move_qty.xml)

### Show Order Date  
ID: `mint_system.stock.report_picking.show_order_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//div[@name='div_origin']" position="after">
    <div t-if="o.sale_id" class="col-auto" name="div_date_order">
      <strong>Bestelldatum:</strong>
      <p t-esc="o.sale_id.date_order" t-options="{'widget': 'date'}"/>
    </div>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.show_order_date.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.show_order_date.xml)

### Show Packaging  
ID: `mint_system.stock.report_picking.show_packaging`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

 <xpath expr="//table[1]/thead/tr/th[1]" position="after">
    <th>
      <strong>Verpackung</strong>
    </th>
  </xpath>

  <xpath expr="//table[1]/tbody/t//tr/td[1]" position="after">
    <td>
      <span t-if="move.product_packaging" t-esc="move.product_packaging.name"/>
    </td>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.show_packaging.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.show_packaging.xml)

### Show Qty Available  
ID: `mint_system.stock.report_picking.show_qty_available`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">
 
  <xpath expr="//table[4]/thead/tr/th[6]" position="after">
    <th id="qty_available">
      <strong >Lager</strong>
    </th>
  </xpath>

  <xpath expr="//table[4]/tbody/t/t/tr/td[6]" position="after">
    <td id="qty_available">
      <span id="qty_available" t-field="ml.product_id.qty_available"/>
      <span t-field="ml.product_uom_id"/>
     </td>
  </xpath>

</data>
```
Source: [snippets/stock.report_picking.show_qty_available.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.show_qty_available.xml)

### Stock Delivery Note  
ID: `mint_system.stock.report_picking.stock_delivery_note`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="/t/t/t/t/div/table[1]" position="after">
    <div class="row">
      <div class="col">
        <p t-field="o.note"/>
      </div>
    </div>
  </xpath>
  
</data>

```
Source: [snippets/stock.report_picking.stock_delivery_note.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.stock_delivery_note.xml)

### Style Trimada  
ID: `mint_system.stock.report_picking.style_trimada`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="60">

    <xpath expr="//div[hasclass('page')]" position="before">
        <style>
          p {
            font-size: 9pt;
                font-family: arial;
          }
            table.trimada {
              width: 100%;
                font-size: 9pt;
                font-family: arial;
                margin-top: 20px;
            }
            table.trimada thead tr {
                border-top: solid 1px;
                border-bottom: solid 1px;
            }
            table.trimada thead th#position {
                width: 5mm;
            }
            table.trimada thead th#default_code {
              width: 27mm;
              padding-left: 10px;
              text-align: left;
            }
            table.trimada thead th#quantity {
              width: 25mm;
              text-align: right !important;
            }
            table.trimada thead th#product_uom_qty {
              width: 35mm;
              text-align: right;
            }
            table.trimada tbody td#position {
              text-align: right;
            }
            table.trimada tbody tr {
              vertical-align: top;
                border-bottom: 1px solid rgb(220,220,220)
            }
            table.trimada tbody td#default_code {
              padding-left: 10px;
              text-align: left;
            }
            table.trimada tbody td span#description_pickingout {
              font-style: italic;
            }
            table.trimada tbody td#product_uom_qty {
              text-align: right;
            }            
            table.trimada tbody td span#product_uom_qty {
              font-weight: bold;
            }
            table.trimada tbody td span#product_uom_qty_done {
              font-weight: bold;
            }
            table.trimada tbody td span#qty_available {
              font-size: 7pt;
            }
            table.trimada tbody td span#qty_available_uom_id {
              font-size: 7pt;
            }
            table.trimada tbody td span#qty_done {
              font-weight: normal;
              font-size: 9pt;
            }
            table.trimada #barcode {
              text-align: right;
            }
          div.address_block {
              font-size: 10pt;
                font-family: arial;
                margin-top: 20px;
                margin-left: 10px;
            }
            .subtitel {
                font-size: 11pt;
                font-family: arial;
                margin-top: 10mm;
            }
            .note {
                font-size: 9pt;
                font-family: arial;
            }
            .mrp_note {
                font-size: 9pt;
                font-family: arial;
                padding-bottom: 3mm;
            }
        </style>
    </xpath>

.    <xpath expr="//th[@name='th_product']/../../.." position="attributes">
        <attribute name="class" separator=" " add="trimada table-borderless"/>
    </xpath>

</data>
```
Source: [snippets/stock.report_picking.style_trimada.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.style_trimada.xml)

### X Count Packaging  
ID: `mint_system.stock.report_picking.x_count_packaging`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

 <xpath expr="//table[1]/thead/tr/th[2]" position="after">
    <th>
      <strong>Anzahl Verp.</strong>
    </th>
  </xpath>

  <xpath expr="//table[1]/tbody/t//tr/td[2]" position="after">
    <td>
      <span t-if="move.x_count_packaging" t-esc="move.x_count_packaging"/>
    </td>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.x_count_packaging.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.x_count_packaging.xml)

### X Packaging Uom Id  
ID: `mint_system.stock.report_picking.x_packaging_uom_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//span[@t-field='ml.product_uom_id']" position="replace">
      <span t-if="not move.product_packaging.x_packaging_uom_id" t-field="ml.product_uom_id" groups="uom.group_uom"/>
      <span t-if="move.product_packaging.x_packaging_uom_id" t-field="move.product_packaging.x_packaging_uom_id" groups="uom.group_uom"/>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.x_packaging_uom_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.x_packaging_uom_id.xml)

## Report Picking Document  
### Tissa  
ID: `mint_system.stock.report_picking_document.tissa`  
```xml
<t t-name="report_picking_document.tissa">

  <style>
    table#info {
        width: 100%;
        margin-top: 60px;
    }
    table#info tr {
        font-size: 72px;
        font-weight: normal;
    }
    tr#info_details {
        font-size: 18px;
    }
    table#info_details {
        width: 100%;
        font-size: 30px;
        border-bottom: solid 1px grey;
        margin-top: 60px;
        margin-bottom: 60px;
    }
    table#info_details th {
        font-weight: bold;
    }
    table#batch {
        width: 100%;
        font-size: 72px;
        font-weight: bold;
    }
    table#batch_details {
         width: 100%;
         font-size: 40px;
    }
  </style>

  <div class="page" style="font-family: Arial, Helvetica, sans-serif"/>

  <tr t-foreach="doc.move_line_ids" t-as="table_line">

    <div class="row">
      <div class="col-2">
        <img class="img-fluid" src="/web/image/9446-7fe212a9/230x115mm_1fbg_black_logo%20tissa%20textiles.jpg"/>
      </div>
      <div class="col-10" style="font-family: Arial, Helvetica, sans-serif; font-size: 18px">
        <strong t-field="res_company.display_name"/>
        <br/>
        <span t-field="res_company.country_id.code"/>
        <span> - </span>
        <span t-field="res_company.zip"/>
        <span></span>
        <span t-field="res_company.city"/>
      </div>
    </div>

    <table id="info">
      <tr>
        <td>
          <span t-field="table_line.display_name"/>
        </td>
        <td style="text-align: right">
          <img t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=0' % ('Code128', table_line.product_id.product_tmpl_id.barcode, 250, 85)" alt="Barcode"/>
        </td>
      </tr>

      <table id="info_details">
        <tr>
          <th style="width:33%">Name</th>
          <th style="width:33%">Lieferant</th>
          <th style="width:33%">Beschreibung</th>
        </tr>
        <tr>
          <td>
            <span t-field="table_line.product_id.product_template_attribute_value_ids"/>
          </td>
          <td>
            <span t-field="table_line.product_id.product_template_attribute_value_ids.product_attribute_value_id.x_studio_lieferant"/>
          </td>
          <td>
            <span t-field="table_line.product_id.product_template_attribute_value_ids.product_attribute_value_id.x_studio_beschreibung"/>
          </td>
        </tr>
      </table>

      <table id="batch">
        <tr>
          <td>
            <strong t-field="table_line.lot_id.display_name"/>
          </td>
          <td style="text-align: right">
            <img t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=0' % ('Code128', table_line.lot_id.display_name, 250, 85)" alt="Barcode"/>
          </td>
        </tr>
      </table>

    </table>

    <table id="batch_details">
      <tr>
        <td>
          <span t-field="table_line.qty_done"/>
          <span></span>
          <span t-field="table_line.product_uom_id.display_name"/>
          <img style="padding-left:25px" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=0' % ('Code128', table_line.qty_done, 250, 40)" alt="Barcode"/>
        </td>
      </tr>

      <tr>
        <td>
          <span t-field="table_line.lot_id.unit_on_lot"/>
          <span> Spulen</span>
        </td>
      </tr>
      <td>
        <span>Einlagerungsdatum: </span>
        <span t-field="table_line.create_date" t-options='{"widget": "date"}'/>
      </td>

    </table>

    <p style="page-break-after: always;"/>

  </tr>
</t>
```
Source: [snippets/stock.report_picking_document.tissa.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking_document.tissa.xml)

## Report Picking  
### Add Address Block  
ID: `mint_system.stock.report_picking.add_address_block`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//table[1]" position="after">
    <div class="table address_block">
      <div class="row">
        <div class="col">
          <div t-field="o.partner_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}"/>
        </div>
      </div>
    </div>
  </xpath>

</data>
```
Source: [snippets/stock.report_picking.add_address_block.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.add_address_block.xml)

### Add Delivery Note  
ID: `mint_system.stock.report_picking.add_delivery_note`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

    <xpath expr="/t/t/t/t/div/table[1]" position="after">
        <p t-field="o.delivery_note"/>
    </xpath>

</data>

```
Source: [snippets/stock.report_picking.add_delivery_note.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.add_delivery_note.xml)

### Add Mrp Production X Note  
ID: `mint_system.stock.report_picking.add_mrp_production_x_note`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//table[@id='main_table']" position="after">
    <t t-set="production" t-value="o.group_id.mrp_production_ids"/>
    <t t-foreach="production" t-as="production_line">
      <t t-if="production_line.x_note != '&lt;br&gt;'">
        <p class="oe_no_empty" t-field="production_line.x_note"/>
      </t>
    </t>
  </xpath>

</data>
```
Source: [snippets/stock.report_picking.add_mrp_production_x_note.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.add_mrp_production_x_note.xml)

### Barcode Label  
ID: `mint_system.stock.report_picking.barcode_label`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//div/div/div/img" position="before">
    <strong>Rüstschein Code:</strong>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.barcode_label.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.barcode_label.xml)

### Format Delivery Date  
ID: `mint_system.stock.report_picking.format_delivery_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//p[@t-field='o.scheduled_date']" position="attributes">
    <attribute name="t-options-widget">"date"</attribute>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.format_delivery_date.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.format_delivery_date.xml)

### Format Qty Available  
ID: `mint_system.stock.report_picking.format_qty_available`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="60">

    <span id="qty_available" position="attributes">
        <attribute name="t-options-widget">"integer"</attribute>
    </span>

</data>
```
Source: [snippets/stock.report_picking.format_qty_available.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.format_qty_available.xml)

### Format Qty  
ID: `mint_system.stock.report_picking.format_qty`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//span[@id='product_uom_qty']" position="replace">
    <t t-if="ml.product_uom_id.id == 1">
      <span id="product_uom_qty" t-field="ml.product_uom_qty" t-options="{'widget': 'integer'}"/>
    </t>
    <t t-else="">
      <span id="product_uom_qty" t-field="ml.product_uom_qty"/>
    </t>
  </xpath>

  <xpath expr="//span[@id='qty_available']" position="replace">
    <t t-if="ml.product_uom_id.id == 1">
      <span id="qty_available" t-field="ml.product_id.qty_available" t-options="{'widget': 'integer'}"/>
    </t>
    <t t-else="">
      <span id="qty_available" t-field="ml.product_id.qty_available"/>
    </t>
  </xpath>

</data>
```
Source: [snippets/stock.report_picking.format_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.format_qty.xml)

### Format Title  
ID: `mint_system.stock.report_picking.format_title`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//h1[@t-field='o.name']" position="replace">
    <h1 t-esc="'Rüstschein ' + o.name.replace('WH/OUT/', '')"/>
  </xpath>
  
</data>

```
Source: [snippets/stock.report_picking.format_title.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.format_title.xml)

### Get Position  
ID: `mint_system.stock.report_picking.get_position`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <!-- <xpath expr="//th[@name='th_product']" position="before">
    <t t-if="o.sale_id or o.purchase_id"> -->
  <xpath expr="//th[@id='default_code']" position="before">
      <th id="position">
        <strong>Pos</strong>
      </th>
    <!-- </t> -->
  </xpath>
  
 <xpath expr="//td[@id='default_code']" position="before">
  <!-- <xpath expr="//span[@t-field='ml.product_id.description_picking']/.." position="before"> -->
    <!-- <t t-if="o.sale_id or o.purchase_id"> -->
      <td id="position">
        <span t-esc="move.position"/>
      </td>
    <!-- </t> -->
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.get_position.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.get_position.xml)

### Group By Date  
ID: `mint_system.stock.report_picking.group_by_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//div[hasclass('page')]" position="before">
    <!-- Get all lines without duplicates -->
    <t t-set="dates" t-value="list(set([date.date() for date in o.move_ids_without_package.mapped('date')]))" />
    <!-- Store if has dates -->
    <t t-set="has_dates" t-value="len(dates) > 0" />
    <!-- Store if has multiple dates -->
    <t t-set="has_multiple_dates" t-value="len(dates) > 1" />
  </xpath>

  <!-- Replace loop -->
  <xpath expr="//t[@t-foreach='o.move_ids_without_package']" position="replace">

    <!--<p t-esc="dates" />-->
    <!--<p t-esc="has_dates" />-->
    <!--<p t-esc="has_multiple_dates" />-->

    <!-- Loop each group item -->
    <t t-foreach="dates" t-as="date">

      <!-- Insert group item -->
      <tr t-if="has_dates and date" class="o_line_note">
        <td colspan="99" style="padding-top: 1rem;">
          <strong>
            <span>Lieferdatum: </span>
            <span t-esc="date" t-options="{'widget': 'date'}" />
          </strong>
        </td>
      </tr>

      <!-- Show only move that are assigned to the group item -->
      <t t-set="move_ids" t-value="o.move_ids_without_package.filtered(lambda m: m.date.strftime('%Y-%m-%d') == date.strftime('%Y-%m-%d')).sorted(lambda m: m.date)" />
      <t t-foreach="move_ids" t-as="move">
        <t t-foreach="move.move_line_ids.sorted(key=lambda ml: ml.location_id.id)" t-as="ml">

          <tr>
            <td id="description_picking">
              <span t-field="ml.product_id.display_name" />
              <br />
              <span t-field="ml.product_id.description_picking" />
            </td>
            <td id="product_uom_qty">
              <span t-if="o.state != 'done'" t-field="ml.product_uom_qty" />
              <span t-if="o.state == 'done'" t-field="ml.qty_done" />
              <span t-field="ml.product_uom_id" groups="uom.group_uom" />

            </td>
            <td  id="location_id" t-if="o.picking_type_id.code != 'incoming'" groups="stock.group_stock_multi_locations">
              <span t-esc="ml.location_id.display_name" />
              <t t-if="ml.package_id">
                <span t-field="ml.package_id" />
              </t>
            </td>
            <td  id="location_dest_id" t-if="o.picking_type_id.code != 'outgoing'" groups="stock.group_stock_multi_locations">
              <div>
                <span t-field="ml.location_dest_id" />
                <t t-if="ml.result_package_id">
                  <span t-field="ml.result_package_id" />
                </t>
              </div>
            </td>
            <td id="has_serial_number" class=" text-center h6" t-if="has_serial_number">
              <img t-if="has_serial_number and (ml.lot_id or ml.lot_name)" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;humanreadable=1' % ('Code128', ml.lot_id.name or ml.lot_name, 400, 100)" style="width:100%;height:35px;" alt="Barcode" />

            </td>
            <td id="has_barcode" class="text-center" t-if="has_barcode">
              <t t-if="product_barcode != move.product_id.barcode">
                <span t-if="move.product_id and move.product_id.barcode">
                  <img t-if="len(move.product_id.barcode) == 13" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=%s' % ('EAN13', move.product_id.barcode, 400, 100, 0)" style="height:35px" alt="Barcode" />
                  <img t-elif="len(move.product_id.barcode) == 8" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=%s' % ('EAN8', move.product_id.barcode, 400, 100, 0)" style="height:35px" alt="Barcode" />
                  <img t-else="" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=%s' % ('Code128', move.product_id.barcode, 400, 100, 0)" style="height:35px" alt="Barcode" />

                </span>
                <t t-set="product_barcode" t-value="move.product_id.barcode" />
              </t>
            </td>
          </tr>

        </t>
      </t>
    </t>

  </xpath>

</data>
```
Source: [snippets/stock.report_picking.group_by_date.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.group_by_date.xml)

### Header Box  
ID: `mint_system.stock.report_picking.header_box`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//h1" position="replace">
    <div class="header_box">
      <div class="row align-items-center">
        <div class="col">
          <h1 class="trimada">Rüstschein <span t-field="o.name"/>
          </h1>
        </div>
        <div class="col">
          <img t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=0' % ('Code128', o.name, 600, 100)" style="width:210px;height:60px; float:right;" alt="Barcode"/>
        </div>
      </div>
    </div>
  </xpath>

</data>
```
Source: [snippets/stock.report_picking.header_box.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.header_box.xml)

### Hide Address  
ID: `mint_system.stock.report_picking.hide_address`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

    <xpath expr="//div[@name='div_outgoing_address']/.." position="replace"/>

</data>
```
Source: [snippets/stock.report_picking.hide_address.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.hide_address.xml)

### Hide Location Dest  
ID: `mint_system.stock.report_picking.hide_location_dest`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <!-- Hide destination location column for outgoing deliveries of operation type Pick Components -->
  <xpath expr="//th[@name='th_to']" position="replace">
    <th name="th_to" t-if="o.picking_type_id.code != 'outgoing' and o.picking_type_id.id != 12" groups="stock.group_stock_multi_locations">
      <strong>To</strong>
    </th>
  </xpath>

  <xpath expr="//td[@id='location_dest_id']" position="replace">
  attribute name="t-if"
    <td t-if="o.picking_type_id.code != 'outgoing' and o.picking_type_id.id != 12" groups="stock.group_stock_multi_locations">
      <div>
        <span t-field="ml.location_dest_id"/>
        <t t-if="ml.result_package_id">
          <span t-field="ml.result_package_id"/>
        </t>
      </div>
    </td>
  </xpath>

</data>
```
Source: [snippets/stock.report_picking.hide_location_dest.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.hide_location_dest.xml)

### Hide Name  
ID: `mint_system.stock.report_picking.hide_name`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

    <xpath expr="//h1[@t-field='o.name']" position="replace"/>
    
</data>
```
Source: [snippets/stock.report_picking.hide_name.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.hide_name.xml)

### Margin Barcode  
ID: `mint_system.stock.report_picking.margin_barcode`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//div/div/div/img" position="attributes">
    <attribute name="style" separator=";" add="margin-bottom: 1rem"/>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.margin_barcode.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.margin_barcode.xml)

### Margin Before Table  
ID: `mint_system.stock.report_picking.margin_before_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="60">

  <xpath expr="//table[1]" position="attributes">
    <attribute name="style" separator=";" add="margin-top: 1rem"/>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.margin_before_table.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.margin_before_table.xml)

### Modify No Reserved Product  
ID: `mint_system.stock.report_picking.modify_no_reserved_product`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//t[@t-set='no_reserved_product']" position="attributes">
    <attribute name="t-value">o.move_lines.filtered(lambda x: x.product_uom_qty != x.reserved_availability and x.state!='done')</attribute>
  </xpath>
  
</data>
```
Source: [snippets/stock.report_picking.modify_no_reserved_product.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.modify_no_reserved_product.xml)

### Partner Ref  
ID: `mint_system.stock.report_picking.partner_ref`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//div[@name='div_incoming_address']/div[1]" position="before">
    <div t-if="o.partner_id.ref">
      <span><strong>Kundennummer: </strong></span>
      <span t-field="o.partner_id.ref"/>
    </div>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.partner_ref.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.partner_ref.xml)

### Pos In Table  
ID: `mint_system.stock.report_picking.pos_in_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="60">

  <xpath expr="//table[1]/thead/tr/th[1]" position="before">
    <th>
      <strong>Pos</strong>
    </th>
  </xpath>

  <xpath expr="//t[@t-foreach='o.move_ids_without_package']" position="before">
    <span t-set="index" t-value="1"/>
  </xpath>

  <xpath expr="//table[1]/tbody/t//tr/td[1]" position="before">
    <td>
      <span t-esc="index"/>
      <t t-set="index" t-value="index+1"/>
    </td>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.pos_in_table.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.pos_in_table.xml)

### Pricelist Below Address  
ID: `mint_system.stock.report_picking.pricelist_below_address`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//div[@name='partner_header']/p" position="after">
    <span t-field="o.sale_id.pricelist_id.display_name"/>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.pricelist_below_address.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.pricelist_below_address.xml)

### Product Description  
ID: `mint_system.stock.report_picking.product_description`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

    <xpath expr="//td[@id='description_picking']" position="replace">

        <td id="description_picking">
            <strong>
                <span t-esc="move.product_id.type_description"/>
            </strong>
            <br/>
            <t t-if="move.description_picking">
              <span t-esc="move.description_picking"/>
          <br/>
            </t>
            <t t-if="not move.description_picking">
                <span t-esc="move.product_id.name"/>
                <br/>
            </t>
            <span id="description_pickingout" t-field="move.product_id.description_pickingout"/>
        </td>
    </xpath>

</data>
```
Source: [snippets/stock.report_picking.product_description.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.product_description.xml)

### Relocate Quantity  
ID: `mint_system.stock.report_picking.relocate_quantity`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

    <xpath expr="//th[@id='product_uom_qty']" position="replace"/>

    <xpath expr="//th[@id='th_to']" position="after">
        <th id="product_uom_qty">
            <strong>Quantity</strong>
        </th>
    </xpath>

  <xpath expr="//td[@id='product_uom_qty']" position="replace"/>
  
  <xpath expr="//td[@id='location_dest_id']" position="after">
        <td id="product_uom_qty">
          
            <t t-if="o.state != 'done'">
              <span id="product_uom_qty" t-esc="'%g' % ml.product_uom_qty"/>
            </t>
            
            <t t-if="o.state == 'done'">
              <span id="qty_done">
                (<span t-esc="'%g' % ml.qty_done"/>)
              </span>
              <span id="product_uom_qty" t-esc="'%g' % ml.product_uom_qty"/>
            </t>
    
            <span t-field="ml.product_uom_id" groups="uom.group_uom"/>
            <br/>
            <span id="qty_available" t-field="ml.product_id.qty_available"/>
            <span id="qty_available_uom_id" t-field="ml.product_id.uom_id"/>
        </td>
    </xpath>

</data>
```
Source: [snippets/stock.report_picking.relocate_quantity.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.relocate_quantity.xml)

### Remove From And To  
ID: `mint_system.stock.report_picking.remove_from_and_to`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//th[@name='th_from']" position="replace">
  </xpath>
  
  <xpath expr="//th[@name='th_to']" position="replace">
  </xpath>

  <xpath expr="//tbody/t//tr/td[3]" position="replace">
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.remove_from_and_to.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.remove_from_and_to.xml)

### Remove Reservation Notice  
ID: `mint_system.stock.report_picking.remove_reservation_notice`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//div[hasclass('page')]/p[1]" position="replace"/>

</data>

```
Source: [snippets/stock.report_picking.remove_reservation_notice.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.remove_reservation_notice.xml)

### Remove Serial Number  
ID: `mint_system.stock.report_picking.remove_serial_number`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//th[@t-if='has_serial_number']" position="replace">
  </xpath>

  <xpath expr="//td[@t-if='has_serial_number']" position="replace">
  </xpath>
  
</data>

```
Source: [snippets/stock.report_picking.remove_serial_number.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.remove_serial_number.xml)

### Remove To  
ID: `mint_system.stock.report_picking.remove_to`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//th[@name='th_to']" position="replace">
    <th name="th_to" t-if="o.picking_type_id.code != 'outgoing' and o.picking_type_id.id != 12" groups="stock.group_stock_multi_locations">
      <strong>To</strong>
    </th>
  </xpath>

  <xpath expr="//td[@id='location_dest_id']" position="replace">
    <td t-if="o.picking_type_id.code != 'outgoing' and o.picking_type_id.id != 12" groups="stock.group_stock_multi_locations">
      <div>
        <span t-field="ml.location_dest_id"/>
        <t t-if="ml.result_package_id">
          <span t-field="ml.result_package_id"/>
        </t>
      </div>
    </td>
  </xpath>

</data>
```
Source: [snippets/stock.report_picking.remove_to.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.remove_to.xml)

### Replace Barcode  
ID: `mint_system.stock.report_picking.replace_barcode`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

    <xpath expr="//td[@id='barcode']" position="replace">

        <td id="barcode" class="trimada" t-if="has_barcode">
            <t t-if="product_barcode != move.product_id.barcode">
                <span t-if="move.product_id and move.product_id.barcode">
                    <img t-if="len(move.product_id.barcode) == 13" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=%s' % ('EAN13', move.product_id.barcode, 290, 100, 0)" style="height:35px" alt="Barcode"/>
                    <img t-elif="len(move.product_id.barcode) == 8" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=%s' % ('EAN8', move.product_id.barcode, 290, 100, 0)" style="height:35px" alt="Barcode"/>
                    <img t-else="" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=%s' % ('Code128', move.product_id.barcode, 290, 100, 0)" style="height:35px" alt="Barcode"/>

                </span>
                <t t-set="product_barcode" t-value="move.product_id.barcode"/>
            </t>
        </td>

    </xpath>
</data>
```
Source: [snippets/stock.report_picking.replace_barcode.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.replace_barcode.xml)

### Replace Header  
ID: `mint_system.stock.report_picking.replace_header`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

    <xpath expr="//div[@name='right_box']/.." position="replace">

        <style>
            table.trimada_header {
                width: 100%;
                font-family: arial;
                font-size: 18pt;
                font-weight: bold;
                border:solid 1px;
            }
            table.trimada_header td {
                padding-left: 10px;
                vertical-align: middle;
                padding: 5px;
            }
        </style>

        <table class="trimada_header">
            <tr>
                <td>Rüstschein <span t-field="o.name"/>
                </td>
                <td>
                    <span>
                        <img t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=0' % ('Code128', o.name, 600, 100)" style="width:210px;height:60px; float:right;" alt="Barcode"/>
                    </span>
                </td>
            </tr>
        </table>

    </xpath>
</data>
```
Source: [snippets/stock.report_picking.replace_header.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.replace_header.xml)

### Replace Order Definition  
ID: `mint_system.stock.report_picking.replace_order_definition`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//div[@name='div_origin']/.." position="replace">

    <style>
            table.trimada_order {
              width: 100%;
                font-size: 11pt;
                font-family: arial;
            }
            table.trimada_order tr {
              border-bottom: 1px solid rgb(220,220,220);
            }
         .first_col {
              width: 44%;
              padding-left: 10px;
              padding-top: 5px;
              padding-bottom: 5px;
            }
            .second_col {
              width: 56%;
            }
            .last_row {
              border-bottom: 0px !important;
            }
    </style>

    <table class="trimada_order">
      <tr>
        <t t-if="o.picking_type_id.id == 12">
          <td class="first_col">
            <strong>
              Fertigungsauftrag
              <span t-field="o.origin" />
            </strong>
          </td>
          <td class="second_col">
            <strong>
              Produkt
              <span />
            </strong>
            <span t-field="o.group_id.mrp_production_ids.product_id" />
          </td>
        </t>
        <t t-if="o.picking_type_id.id != 12">
          <td class="first_col">
            <strong>
              Bestellung
              <span t-field="o.origin" />
            </strong>
          </td>
          <td></td>
        </t>
      </tr>
      <tr>
        <td class="first_col">
          Status:
          <span t-field="o.state" />
        </td>
        <td class="second_col">
          Datum:
          <span t-field="o.scheduled_date" t-options='{"widget": "date"}'></span>
        </td>
      </tr>
      <tr class="last_row">
        <td class="first_col">
          Typ:
          <span t-field="o.picking_type_id.code" />
        </td>
        <t t-if="o.carrier_id">
          <td>
            Auslieferungsmethode:
            <span t-field="o.carrier_id" />
          </td>
        </t>
      </tr>
    </table>

  </xpath>
</data>
```
Source: [snippets/stock.report_picking.replace_order_definition.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.replace_order_definition.xml)

### Replace Table  
ID: `mint_system.stock.report_picking.replace_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

<xpath expr="//table[@t-if='o.move_line_ids and o.move_ids_without_package']" position="replace">
  
<table style="width:100%; font-family: arial; font-size: 9pt; margin-top: 20px" t-if="o.move_line_ids and o.move_ids_without_package">
  <t t-set="has_barcode" t-value="any(move_line.product_id and move_line.product_id.sudo().barcode or move_line.package_id for move_line in o.move_line_ids)"/>
  <t t-set="has_serial_number" t-value="any(move_line.lot_id or move_line.lot_name for move_line in o.move_line_ids)" groups="stock.group_production_lot"/>

    <tr style="border-bottom: 1px solid rgb(220,220,220);">
        <th name="th_product" style="padding-left: 9px; padding-bottom: 10px; width:12%;">
            <strong>Art. Nr.</strong>
        </th>
        <th style="width:40%">
            <strong>Bezeichnung / Typenbezeichnung</strong>
        </th>
        <th style="width:12%" name="th_from" t-if="o.picking_type_id.code != 'incoming'" align="left" groups="stock.group_stock_multi_locations">
            <strong>Von</strong>
        </th>
        <th style="width:12%" name="th_to" t-if="o.picking_type_id.code != 'outgoing'" groups="stock.group_stock_multi_locations">
            <strong>Nach</strong>
        </th>
        <th style="width:18%; text-align:right; padding-right:20px;">
            <strong>Menge</strong>
        </th>
        <th style="width:3%; text-align:right; padding-right:10px;">
            <strong>Lager</strong>
        </th>
        <th name="th_serial_number" class="text-center" t-if="has_serial_number">
           <strong>Lot/Serial Number</strong>
        </th>
        <th style="width:3%" name="th_barcode" class="text-center" t-if="has_barcode">
            <strong></strong>
        </th>
    </tr>
                            
      <t t-foreach="o.move_ids_without_package" t-as="move">
          <!-- In case you come across duplicated lines, ask NIM or LAP -->
          <t t-foreach="move.move_line_ids.sorted(key=lambda ml: ml.location_id.id)" t-as="ml">
            
              <tr style="border-bottom: 1px solid rgb(220,220,220);">
                  <td style="padding-left: 10px; padding-top:5px; vertical-align:top;">
                      <span t-field="ml.product_id.default_code"/><br/>
                  </td>
                  <td style="padding-top:5px; vertical-align:top; padding-right: 10px">
                      <span t-field="ml.product_id.name"/><br/>
                      <span t-field="ml.product_id.type_description"/>
                  </td>
                  
                  <td style="padding-top:5px; vertical-align:top;" t-if="o.picking_type_id.code != 'incoming'" groups="stock.group_stock_multi_locations">
                      <span t-esc="ml.location_id.display_name"/>
                          <t t-if="ml.package_id">
                              <span t-field="ml.package_id"/>
                          </t>
                  </td>
                  <td style="padding-top:5px; vertical-align:top;" t-if="o.picking_type_id.code != 'outgoing'" groups="stock.group_stock_multi_locations">
                      <div>
                          <span t-field="ml.location_dest_id"/>
                          <t t-if="ml.result_package_id">
                              <span t-field="ml.result_package_id"/>
                          </t>
                      </div>
                  </td>
                  <td style="padding-top:5px; vertical-align:top; text-align:right; padding-right:20px; font-weight: bold">
                      <span t-if="o.state != 'done'" t-field="ml.product_uom_qty"/>
                      <span t-if="o.state == 'done'" t-field="ml.qty_done"/>
                      <span t-field="ml.product_uom_id" groups="uom.group_uom"/>

                  </td>
                  
                  <td style="padding-top:5px; padding-right: 10px; vertical-align:top; text-align:right">
                        <span t-field="ml.product_id.qty_available"/>
                  </td>
                  
                  <td class=" text-center h6" t-if="has_serial_number">
                      <img t-if="has_serial_number and (ml.lot_id or ml.lot_name)" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;humanreadable=1' % ('Code128', ml.lot_id.name or ml.lot_name, 400, 100)" style="width:100%;height:35px;" alt="Barcode"/>

                  </td>
                  <td style="padding-top: 5px; padding-bottom: 5px; vertical-align:middle;" class="text-center" t-if="has_barcode">
                      <t t-if="product_barcode != move.product_id.barcode">
                          <span t-if="move.product_id and move.product_id.barcode">
                              <img t-if="len(move.product_id.barcode) == 13" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=%s' % ('EAN13', move.product_id.barcode, 290, 100, 0)" style="height:35px" alt="Barcode"/>
                              <img t-elif="len(move.product_id.barcode) == 8" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=%s' % ('EAN8', move.product_id.barcode, 290, 100, 0)" style="height:35px" alt="Barcode"/>
                              <img t-else="" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=%s' % ('Code128', move.product_id.barcode, 290, 100, 0)" style="height:35px" alt="Barcode"/>

                          </span>
                          <t t-set="product_barcode" t-value="move.product_id.barcode"/>
                      </t>
                  </td>
              </tr>
          </t>
      </t>
       
  </table>                     
  
  </xpath>
  </data>
```
Source: [snippets/stock.report_picking.replace_table.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.replace_table.xml)

### Round Qty2  
ID: `mint_system.stock.report_picking.round_qty2`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//span[@id='product_uom_qty']" position="replace">
    <!-- 34.00 -> 34 -->
    <!-- 34.50 -> 34.5 -->
    <!-- 34.75 -> 34.75 -->
    <span id="product_uom_qty" t-esc="'%g' % ml.product_uom_qty" />
  </xpath>

  <xpath expr="//span[@id='qty_available']" position="replace">
    <!-- 34.00 -> 34 -->
    <!-- 34.50 -> 34.5 -->
    <!-- 34.75 -> 34.75 -->
    <span id="qty_available" t-esc="'%g' % ml.product_id.qty_available" />
  </xpath>

</data>
```
Source: [snippets/stock.report_picking.round_qty2.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.round_qty2.xml)

### Round Qty  
ID: `mint_system.stock.report_picking.round_qty`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//span[@id='product_uom_qty']" position="replace">
    <!-- 34.00 -> 34 -->
    <!-- 34.50 -> 34.50 -->
    <!-- 34.75 -> 34.75 -->
    <span id="product_uom_qty" t-esc="'%g' % ml.product_uom_qty if int(ml.product_uom_qty) == ml.product_uom_qty else '%.2f' % ml.product_uom_qty" />
  </xpath>

  <xpath expr="//span[@id='qty_available']" position="replace">
    <!-- 34.00 -> 34 -->
    <!-- 34.50 -> 34.50 -->
    <!-- 34.75 -> 34.75 -->
    <span id="qty_available" t-esc="'%g' % ml.product_id.qty_available if int(ml.product_id.qty_available) == ml.product_id.qty_available else '%.2f' % ml.product_id.qty_available" />
  </xpath>

</data>
```
Source: [snippets/stock.report_picking.round_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.round_qty.xml)

### Set Ids  
ID: `mint_system.stock.report_picking.set_ids`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="60">

    <xpath expr="//th[@name='th_product']" position="attributes">
        <attribute name="id">th_product</attribute>
    </xpath>

    <xpath expr="//th[@name='th_product']/../th[2]" position="attributes">
        <attribute name="id">product_uom_qty</attribute>
    </xpath>

    <xpath expr="//th[@name='th_to']" position="attributes">
        <attribute name="id">th_to</attribute>
    </xpath>

    <xpath expr="//td[@t-if='has_barcode']" position="attributes">
        <attribute name="id">barcode</attribute>
    </xpath>
    
    <xpath expr="//th[@name='th_product']/../../.." position="attributes">
      <attribute name="id">main_table</attribute>
    </xpath>

</data>
```
Source: [snippets/stock.report_picking.set_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.set_ids.xml)

### Show Default Code  
ID: `mint_system.stock.report_picking.show_default_code`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//th[@id='th_product']" position="before">
    <th id="default_code">
      <strong >Part No.</strong>
    </th>
  </xpath>

  <xpath expr="//td[@id='description_picking']" position="before">
    <td id="default_code">
      <span t-field="ml.product_id.default_code"/>
    </td>
  </xpath>

</data>
```
Source: [snippets/stock.report_picking.show_default_code.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.show_default_code.xml)

### Show Full Address  
ID: `mint_system.stock.report_picking.show_full_address`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//div[@name='partner_header']/div" position="attributes">
    <attribute name="t-options-fields">['name', 'phone', 'address']</attribute>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.show_full_address.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.show_full_address.xml)

### Show Lot  
ID: `mint_system.stock.report_picking.show_lot`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//th[@name='th_product']/../th[4]" position="after">
    <th name="th_lot">
      <strong>Los</strong>
    </th>
  </xpath>

  <xpath expr="//span[@t-field='move.product_uom_qty']/.." position="after">
    <td>
      <span t-if="move.lot_ids" t-esc="', '.join(move.lot_ids.mapped('display_name'))"/>
    </td>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.show_lot.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.show_lot.xml)

### Show Move Not Lines  
ID: `mint_system.stock.report_picking.show_move_not_lines`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="40">

    <xpath expr="//table[@t-if='o.move_line_ids and o.move_ids_without_package']" position="attributes">
        <attribute name="t-if">o.move_ids_without_package</attribute>
    </xpath>

    <xpath expr="//tbody/t/t" position="replace">
        <tr>
            <td>
                <span t-field="move.product_id.display_name" />
                <br />
                <span t-field="move.product_id.description_picking" />
            </td>
            <td>
                <span t-field="move.product_uom_qty" />
                <span t-if="not move.product_packaging.x_packaging_uom_id" t-field="move.product_uom" groups="uom.group_uom" />
                <span t-if="move.product_packaging.x_packaging_uom_id" t-field="move.product_packaging.x_packaging_uom_id" groups="uom.group_uom" />
            </td>
            <td t-if="o.picking_type_id.code != 'incoming'" groups="stock.group_stock_multi_locations">
                <span t-esc="move.location_id.display_name" />
            </td>
            <td t-if="o.picking_type_id.code != 'outgoing'" groups="stock.group_stock_multi_locations">
                <div>
                    <span t-field="move.location_dest_id" />
                </div>
            </td>
            <td class=" text-center h6" t-if="has_serial_number"></td>
            <td class="text-center" t-if="has_barcode">
                <t t-if="product_barcode != move.product_id.barcode">
                    <span t-if="move.product_id and move.product_id.barcode">
                        <img t-if="len(move.product_id.barcode) == 13" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=%s' % ('EAN13', move.product_id.barcode, 400, 100, 0)" style="height:35px" alt="Barcode" />
                        <img t-elif="len(move.product_id.barcode) == 8" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=%s' % ('EAN8', move.product_id.barcode, 400, 100, 0)" style="height:35px" alt="Barcode" />
                        <img t-else="" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=%s' % ('Code128', move.product_id.barcode, 400, 100, 0)" style="height:35px" alt="Barcode" />

                    </span>
                    <t t-set="product_barcode" t-value="move.product_id.barcode" />
                </t>
            </td>
        </tr>
    </xpath>

</data>
```
Source: [snippets/stock.report_picking.show_move_not_lines.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.show_move_not_lines.xml)

### Show Move Qty  
ID: `mint_system.stock.report_picking.show_move_qty`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//span[@t-field='ml.product_uom_qty']" position="replace">
    <span t-if="o.state != 'done'" t-field="move.product_uom_qty"/>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.show_move_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.show_move_qty.xml)

### Show Order Date  
ID: `mint_system.stock.report_picking.show_order_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//div[@name='div_origin']" position="after">
    <div t-if="o.sale_id" class="col-auto" name="div_date_order">
      <strong>Bestelldatum:</strong>
      <p t-esc="o.sale_id.date_order" t-options="{'widget': 'date'}"/>
    </div>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.show_order_date.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.show_order_date.xml)

### Show Packaging  
ID: `mint_system.stock.report_picking.show_packaging`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

 <xpath expr="//table[1]/thead/tr/th[1]" position="after">
    <th>
      <strong>Verpackung</strong>
    </th>
  </xpath>

  <xpath expr="//table[1]/tbody/t//tr/td[1]" position="after">
    <td>
      <span t-if="move.product_packaging" t-esc="move.product_packaging.name"/>
    </td>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.show_packaging.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.show_packaging.xml)

### Show Qty Available  
ID: `mint_system.stock.report_picking.show_qty_available`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">
 
  <xpath expr="//table[4]/thead/tr/th[6]" position="after">
    <th id="qty_available">
      <strong >Lager</strong>
    </th>
  </xpath>

  <xpath expr="//table[4]/tbody/t/t/tr/td[6]" position="after">
    <td id="qty_available">
      <span id="qty_available" t-field="ml.product_id.qty_available"/>
      <span t-field="ml.product_uom_id"/>
     </td>
  </xpath>

</data>
```
Source: [snippets/stock.report_picking.show_qty_available.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.show_qty_available.xml)

### Stock Delivery Note  
ID: `mint_system.stock.report_picking.stock_delivery_note`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="/t/t/t/t/div/table[1]" position="after">
    <div class="row">
      <div class="col">
        <p t-field="o.note"/>
      </div>
    </div>
  </xpath>
  
</data>

```
Source: [snippets/stock.report_picking.stock_delivery_note.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.stock_delivery_note.xml)

### Style Trimada  
ID: `mint_system.stock.report_picking.style_trimada`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="60">

    <xpath expr="//div[hasclass('page')]" position="before">
        <style>
          p {
            font-size: 9pt;
                font-family: arial;
          }
            table.trimada {
              width: 100%;
                font-size: 9pt;
                font-family: arial;
                margin-top: 20px;
            }
            table.trimada thead tr {
                border-top: solid 1px;
                border-bottom: solid 1px;
            }
            table.trimada thead th#position {
                width: 5mm;
            }
            table.trimada thead th#default_code {
              width: 27mm;
              padding-left: 10px;
              text-align: left;
            }
            table.trimada thead th#quantity {
              width: 25mm;
              text-align: right !important;
            }
            table.trimada thead th#product_uom_qty {
              width: 35mm;
              text-align: right;
            }
            table.trimada tbody td#position {
              text-align: right;
            }
            table.trimada tbody tr {
              vertical-align: top;
                border-bottom: 1px solid rgb(220,220,220)
            }
            table.trimada tbody td#default_code {
              padding-left: 10px;
              text-align: left;
            }
            table.trimada tbody td span#description_pickingout {
              font-style: italic;
            }
            table.trimada tbody td#product_uom_qty {
              text-align: right;
            }            
            table.trimada tbody td span#product_uom_qty {
              font-weight: bold;
            }
            table.trimada tbody td span#product_uom_qty_done {
              font-weight: bold;
            }
            table.trimada tbody td span#qty_available {
              font-size: 7pt;
            }
            table.trimada tbody td span#qty_available_uom_id {
              font-size: 7pt;
            }
            table.trimada tbody td span#qty_done {
              font-weight: normal;
              font-size: 9pt;
            }
            table.trimada #barcode {
              text-align: right;
            }
          div.address_block {
              font-size: 10pt;
                font-family: arial;
                margin-top: 20px;
                margin-left: 10px;
            }
            .subtitel {
                font-size: 11pt;
                font-family: arial;
                margin-top: 10mm;
            }
            .note {
                font-size: 9pt;
                font-family: arial;
            }
            .mrp_note {
                font-size: 9pt;
                font-family: arial;
                padding-bottom: 3mm;
            }
        </style>
    </xpath>

.    <xpath expr="//th[@name='th_product']/../../.." position="attributes">
        <attribute name="class" separator=" " add="trimada table-borderless"/>
    </xpath>

</data>
```
Source: [snippets/stock.report_picking.style_trimada.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.style_trimada.xml)

### X Count Packaging  
ID: `mint_system.stock.report_picking.x_count_packaging`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

 <xpath expr="//table[1]/thead/tr/th[2]" position="after">
    <th>
      <strong>Anzahl Verp.</strong>
    </th>
  </xpath>

  <xpath expr="//table[1]/tbody/t//tr/td[2]" position="after">
    <td>
      <span t-if="move.x_count_packaging" t-esc="move.x_count_packaging"/>
    </td>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.x_count_packaging.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.x_count_packaging.xml)

### X Packaging Uom Id  
ID: `mint_system.stock.report_picking.x_packaging_uom_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.report_picking" priority="50">

  <xpath expr="//span[@t-field='ml.product_uom_id']" position="replace">
      <span t-if="not move.product_packaging.x_packaging_uom_id" t-field="ml.product_uom_id" groups="uom.group_uom"/>
      <span t-if="move.product_packaging.x_packaging_uom_id" t-field="move.product_packaging.x_packaging_uom_id" groups="uom.group_uom"/>
  </xpath>

</data>

```
Source: [snippets/stock.report_picking.x_packaging_uom_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_picking.x_packaging_uom_id.xml)

## Report Reception Report Label  
### Aersolution  
ID: `mint_system.stock.report_reception_report_label.aersolution`  
```xml
<t t-name="stock.report_reception_report_label.aersolution">
    <t t-call="web.basic_layout">
        <div class="page">

            <t t-foreach="docs" t-as="picking">
                <t t-foreach="picking.move_line_ids.filtered(lambda m: m.qty_done &gt; 0.0)" t-as="move_line">

                    <t t-set="label_qty" t-value="move_line.move_id.x_label_qty"/>
                    <t t-set="company_id" t-value="picking.company_id"/>
                    <t t-set="lot_id" t-value="move_line.lot_id"/>
                    <t t-set="product_id" t-value="move_line.product_id"/>

                    <t t-call="mint_system.stock.report_label.aersolution"/>
                </t>
            </t>

        </div>
    </t>
</t>
```
Source: [snippets/stock.report_reception_report_label.aersolution.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.report_reception_report_label.aersolution.xml)

## Search Product Lot Filter  
### Filter Active  
ID: `mint_system.stock.search_product_lot_filter.filter_active`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.search_product_lot_filter" priority="50">

  <field name="product_id" position="after">
    <filter name="active" string="Archiviert" domain="[('active', '=', False)]"/>
  </field>

</data>

```
Source: [snippets/stock.search_product_lot_filter.filter_active.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.search_product_lot_filter.filter_active.xml)

## Stock Report Delivery Aggregated Move Lines  
### Add Country Of Origin And Hs Code  
ID: `mint_system.stock.stock_report_delivery_aggregated_move_lines.add_country_of_origin_and_hs_code`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.stock_report_delivery_aggregated_move_lines" priority="49">

  <xpath expr="///tr/td[1]/p/span[1]" position="after">
    <br/>
    <t t-if="aggregated_lines[line]['product']['country_of_origin_id']['code'] and aggregated_lines[line]['hs_code']">
          Country of origin: <span t-esc="aggregated_lines[line]['product']['country_of_origin_id']['code']"/>
          / HS Code: <span t-esc="aggregated_lines[line]['hs_code']"/>

  </t>
  <t t-if="aggregated_lines[line]['hs_code'] and not aggregated_lines[line]['product']['country_of_origin_id']['code']">
          HS Code: <span t-esc="aggregated_lines[line]['hs_code']"/>
  </t>

  <t t-if="aggregated_lines[line]['product']['country_of_origin_id']['code'] and not aggregated_lines[line]['hs_code']">
          Country of origin: <span t-esc="aggregated_lines[line]['product']['country_of_origin_id']['code']"/>
  </t>

</xpath>

</data>
```
Source: [snippets/stock.stock_report_delivery_aggregated_move_lines.add_country_of_origin_and_hs_code.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.stock_report_delivery_aggregated_move_lines.add_country_of_origin_and_hs_code.xml)

### Add Default Code  
ID: `mint_system.stock.stock_report_delivery_aggregated_move_lines.add_default_code`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.stock_report_delivery_aggregated_move_lines" priority="50">

  <xpath expr="//td[2]" position="after">
    <tr style="border-bottom: 1px solid rgb(220,220,220)">
      <td colspan="8"></td>
    </tr>
  </xpath>

  <xpath expr="//tr/td[1]" position="before">
    <td style="text-align: right; padding-right: 10px">
      <span t-esc="aggregated_lines[line]['product']['default_code']"/>
    </td>
  </xpath>

</data>
```
Source: [snippets/stock.stock_report_delivery_aggregated_move_lines.add_default_code.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.stock_report_delivery_aggregated_move_lines.add_default_code.xml)

### Format Pos  
ID: `mint_system.stock.stock_report_delivery_aggregated_move_lines.format_pos`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.stock_report_delivery_aggregated_move_lines" priority="50">

  <xpath expr="//t[@t-if='o.sale_id']/td" position="attributes">
    <attribute name="style">text-align: right; width: 5mm</attribute>
  </xpath>
  
  <xpath expr="//t[@t-if='o.purchase_id']/td" position="attributes">
    <attribute name="style">text-align: right; width: 5mm</attribute>
  </xpath>
 
</data>
```
Source: [snippets/stock.stock_report_delivery_aggregated_move_lines.format_pos.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.stock_report_delivery_aggregated_move_lines.format_pos.xml)

### Format Table  
ID: `mint_system.stock.stock_report_delivery_aggregated_move_lines.format_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.stock_report_delivery_aggregated_move_lines" priority="50">
 
  <xpath expr="//td[@name='move_line_aggregated_qty_done']" position="attributes">
    <attribute name="class">text-right</attribute>
  </xpath>

  <xpath expr="//td[@name='move_line_aggregated_qty_done']/span[1]" position="attributes">
    <attribute name="style">font-weight: bold</attribute>
    <attribute name="t-options">{'widget': 'integer'}</attribute>
  </xpath>
  
  <xpath expr="//tr/td/p" position="attributes">
    <attribute name="style">margin-bottom:0px</attribute>
  </xpath>

</data>
```
Source: [snippets/stock.stock_report_delivery_aggregated_move_lines.format_table.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.stock_report_delivery_aggregated_move_lines.format_table.xml)

### Get Position  
ID: `mint_system.stock.stock_report_delivery_aggregated_move_lines.get_position`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.stock_report_delivery_aggregated_move_lines" priority="50">

  <xpath expr="/t/tr/td[1]" position="before">
    <t t-if="o.purchase_id or o.sale_id">
      <td>
        <t t-if="aggregated_lines[line]['move_line']">
          <span t-esc="aggregated_lines[line]['move_line'].move_id.position"/>
        </t>
      </td>
    </t>
  </xpath>

  <!-- <xpath expr="/t/tr/td[1]" position="before">
    <t t-if="o.sale_id">
      <td>
        <span t-esc="o.sale_id.get_position(aggregated_lines[line]['product'], aggregated_lines[line]['qty_done']) or o.sale_id.get_position(aggregated_lines[line]['product'])"/>
      </td>
    </t>
    <t t-if="o.purchase_id">
      <td>
        <span t-esc="o.purchase_id.get_position(aggregated_lines[line]['product'], aggregated_lines[line]['qty_done']) or o.purchase_id.get_position(aggregated_lines[line]['product'])"/>
      </td>
    </t>
  </xpath> -->

</data>
```
Source: [snippets/stock.stock_report_delivery_aggregated_move_lines.get_position.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.stock_report_delivery_aggregated_move_lines.get_position.xml)

### Pos In Table  
ID: `mint_system.stock.stock_report_delivery_aggregated_move_lines.pos_in_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.stock_report_delivery_aggregated_move_lines" priority="50">

  <xpath expr="/t/tr/td[1]" position="before">
    <td>
      <span t-esc="index"/><t t-set="index" t-value="index+1"/>
    </td>
  </xpath>

</data>

```
Source: [snippets/stock.stock_report_delivery_aggregated_move_lines.pos_in_table.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.stock_report_delivery_aggregated_move_lines.pos_in_table.xml)

### Replace Description  
ID: `mint_system.stock.stock_report_delivery_aggregated_move_lines.replace_description`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.stock_report_delivery_aggregated_move_lines" priority="50">

  <xpath expr="//tr/td[2]" position="replace">
    <td>
      <span t-esc="aggregated_lines[line]['product']['description_sale']"/>
      <span t-esc="aggregated_lines[line]['product']['hs_code']"/>
    </td>
  </xpath>

</data>

<!--
<data inherit_id="stock.stock_report_delivery_aggregated_move_lines" priority="49">

  <xpath expr="//td[1]/span" position="replace">
    <span style="font-weight: bold" t-esc="aggregated_lines[line]['product']['name']"/>
    <br/>
      Product Code: <span t-esc="aggregated_lines[line]['product']['default_code']"/>
  <br/>
  <t t-if="aggregated_lines[line]['hs_code']">HS-Code: <span t-esc="aggregated_lines[line]['hs_code']"/>
  </t>
</xpath>

</data>
-->
```
Source: [snippets/stock.stock_report_delivery_aggregated_move_lines.replace_description.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.stock_report_delivery_aggregated_move_lines.replace_description.xml)

### Replace Name  
ID: `mint_system.stock.stock_report_delivery_aggregated_move_lines.replace_name`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.stock_report_delivery_aggregated_move_lines" priority="49">

  <xpath expr="//tr/td[1]/span[1]" position="replace">
    <strong>
      <span t-esc="aggregated_lines[line]['product']['type_description']"/>
    </strong>
  </xpath>

</data>
```
Source: [snippets/stock.stock_report_delivery_aggregated_move_lines.replace_name.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.stock_report_delivery_aggregated_move_lines.replace_name.xml)

## Stock Report Delivery Has Serial Move Line  
### Barcode  
ID: `mint_system.stock.stock_report_delivery_has_serial_move_line.barcode`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.stock_report_delivery_has_serial_move_line" priority="50">

    <xpath expr="//span[@t-field='move_line.lot_id.name']" position="after">
        <t t-set="barcode" t-value="move_line.lot_id.name" />
        <img style="padding-left: 20px" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=0' % ('EAN13', barcode, 200, 25)" alt="Barcode" />
    </xpath>

</data>
```
Source: [snippets/stock.stock_report_delivery_has_serial_move_line.barcode.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.stock_report_delivery_has_serial_move_line.barcode.xml)

### Description Sale  
ID: `mint_system.stock.stock_report_delivery_has_serial_move_line.description_sale`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.stock_report_delivery_has_serial_move_line" priority="50">

    <xpath expr="//td[1]" position="replace">
        <td>
            <t t-if="move_line.product_id.description_sale">
                <span t-field="move_line.product_id.description_sale"/>
            </t>
            <t t-else="">
                <span t-field="move_line.product_id"/>
            </t>
        </td>
    </xpath>

</data>

```
Source: [snippets/stock.stock_report_delivery_has_serial_move_line.description_sale.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.stock_report_delivery_has_serial_move_line.description_sale.xml)

### Get Position  
ID: `mint_system.stock.stock_report_delivery_has_serial_move_line.get_position`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.stock_report_delivery_has_serial_move_line" priority="50">

    <xpath expr="//td[1]" position="before">
         <t t-if="o.sale_id or o.purchase_id">
            <td id="position">
                <span t-esc="move_line.move_id.position"/>
            </td>
         </t>
    </xpath>

</data>
```
Source: [snippets/stock.stock_report_delivery_has_serial_move_line.get_position.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.stock_report_delivery_has_serial_move_line.get_position.xml)

### Pos In Table  
ID: `mint_system.stock.stock_report_delivery_has_serial_move_line.pos_in_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.stock_report_delivery_has_serial_move_line" priority="50">

  <xpath expr="/t/td[1]" position="before">
    <td>
      <span t-esc="index"/><t t-set="index" t-value="index+1"/>
    </td>
  </xpath>

</data>

```
Source: [snippets/stock.stock_report_delivery_has_serial_move_line.pos_in_table.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.stock_report_delivery_has_serial_move_line.pos_in_table.xml)

### Show Customer Info Product Code  
ID: `mint_system.stock.stock_report_delivery_has_serial_move_line.show_customer_info_product_code`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.stock_report_delivery_has_serial_move_line" priority="60">

  <xpath expr="//td[1]//span[1]" position="before">
    <t t-set="customer_info" t-value="move_line.product_id._select_customerinfo(partner=o.partner_id)" />
    <t t-if="customer_info">
      <span t-esc="'[%s] ' % customer_info[0].product_code" />
    </t>
  </xpath>

</data>

```
Source: [snippets/stock.stock_report_delivery_has_serial_move_line.show_customer_info_product_code.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.stock_report_delivery_has_serial_move_line.show_customer_info_product_code.xml)

### Style Tissa  
ID: `mint_system.stock.stock_report_delivery_has_serial_move_line.style_tissa`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.stock_report_delivery_has_serial_move_line" priority="60">

  <xpath expr="//td[1]" position="before">

    <style>
      .cell_right {
        text-align: right;
        padding-right: 10px !important;
      }
    </style>

  </xpath>

  <xpath expr="//td[@name='move_line_lot_qty_done']" position="attributes">
    <attribute name="class">cell_right</attribute>
  </xpath>

</data>
```
Source: [snippets/stock.stock_report_delivery_has_serial_move_line.style_tissa.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.stock_report_delivery_has_serial_move_line.style_tissa.xml)

### X Hide On Delivery  
ID: `mint_system.stock.stock_report_delivery_has_serial_move_line.x_hide_on_delivery`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.stock_report_delivery_has_serial_move_line" priority="55">

    <xpath expr="/t" position="replace">
      <t t-name="stock.stock_report_delivery_has_serial_move_line">
        <t t-if="not move_line.product_id.x_hide_on_delivery and move_line.qty_done > 0">
            <td>
                <span t-field="move_line.product_id"/>
                <!-- this is an annoying workaround for the multiple types of descriptions (often auto-filled) that we do not want to print -->
                <!-- this makes it so we can pre-filter the descriptions in inherited templates since we cannot extend the standard "if" condition -->
                <!-- let's agree that pre-filtered descriptions will be set to "" -->
                <t t-if="not description and description != ''">
                    <t t-set="description" t-value="move_line.move_id.description_picking"/>
                </t>
                <p t-if="description !='' and description != move_line.product_id.name">
                    <span t-esc="description"/>
                </p>
            </td>
            <t t-if="has_serial_number" name="move_line_lot">
                <td><span t-field="move_line.lot_id.name"/></td>
            </t>
            <td class="text-center" name="move_line_lot_qty_done">
                <span t-field="move_line.qty_done"/>
                <span t-field="move_line.product_uom_id"/>
            </td>
        </t>
       </t>
    </xpath>

</data>

```
Source: [snippets/stock.stock_report_delivery_has_serial_move_line.x_hide_on_delivery.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.stock_report_delivery_has_serial_move_line.x_hide_on_delivery.xml)

## Stock Report Delivery Kit Sections  
### Sequence In Table  
ID: `mint_system.stock.stock_report_delivery_kit_sections.sequence_in_table`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.stock_report_delivery_kit_sections" priority="50">
  
<xpath expr="//t[@t-set='kit_move_lines']" position="before">
  <span t-set="index" t-value="1"/>
</xpath>

</data>
```
Source: [snippets/stock.stock_report_delivery_kit_sections.sequence_in_table.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.stock_report_delivery_kit_sections.sequence_in_table.xml)

## Stock Report Delivery Package Section Line  
### Add Package Info  
ID: `mint_system.stock.stock_report_delivery_package_section_line.add_package_info`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.stock_report_delivery_package_section_line" priority="50">

  <xpath expr="/t/tr/td/span" position="before">

    <strong>Package: </strong>
    <span t-field="package.packaging_id.display_name"/>
    <strong>, </strong>
    <span t-field="package.packaging_id.packaging_length"/>
    <strong> cm x </strong>
    <span t-field="package.packaging_id.width"/>
    <strong> cm x </strong>
    <span t-field="package.packaging_id.height"/>
    <strong> cm</strong>
    <strong> (L x W x H), </strong>

  </xpath>
</data>

```
Source: [snippets/stock.stock_report_delivery_package_section_line.add_package_info.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.stock_report_delivery_package_section_line.add_package_info.xml)

### Add Type  
ID: `mint_system.stock.stock_report_delivery_package_section_line.add_type`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.stock_report_delivery_package_section_line" priority="50">

  <xpath expr="/t/tr/td/span" position="before">

    <strong>Package: </strong>
    <span t-field="package.packaging_id.display_name"/>
    <strong>, </strong>
    <span t-field="package.packaging_id.packaging_length"/>
    <strong> cm x </strong>
    <span t-field="package.packaging_id.width"/>
    <strong> cm x </strong>
    <span t-field="package.packaging_id.height"/>
    <strong> cm</strong>
    <strong> (L x W x H), </strong>

  </xpath>
</data>

```
Source: [snippets/stock.stock_report_delivery_package_section_line.add_type.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.stock_report_delivery_package_section_line.add_type.xml)

### Set Color  
ID: `mint_system.stock.stock_report_delivery_package_section_line.set_color`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.stock_report_delivery_package_section_line" priority="50">
  <xpath expr="/t/tr/td" position="attributes">
    <attribute name="class" separator=" " add="text-800"/>
  </xpath>
</data>

```
Source: [snippets/stock.stock_report_delivery_package_section_line.set_color.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.stock_report_delivery_package_section_line.set_color.xml)

## View Location Form  
### Show Barcode  
ID: `mint_system.stock.view_location_form.show_barcode`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_location_form" priority="50">

  <xpath expr="//group[@name='additional_info']//field[@name='replenish_location']" position="after">
    <field name="barcode"/>
  </xpath>

</data>
```
Source: [snippets/stock.view_location_form.show_barcode.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_location_form.show_barcode.xml)

### Show Id  
ID: `mint_system.stock.view_location_form.show_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_location_form" priority="50">

  <xpath expr="//group[@name='additional_info']//field[@name='replenish_location']" position="after">
    <field name="id"/>
  </xpath>

</data>
```
Source: [snippets/stock.view_location_form.show_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_location_form.show_id.xml)

## View Move Form  
### Enable Edit And Create  
ID: `mint_system.stock.view_move_form.enable_edit_and_create`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_form" priority="50">

  <form position="attributes">
    <attribute name="create">1</attribute>
    <attribute name="edit">1</attribute>
  </form>

</data>

```
Source: [snippets/stock.view_move_form.enable_edit_and_create.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_form.enable_edit_and_create.xml)

### Show Immediate Transfer  
ID: `mint_system.stock.view_move_form.show_immediate_transfer`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_form" priority="50">

  <field name="move_type" position="after">
    <field name="immediate_transfer"/>
  </field>

</data>

```
Source: [snippets/stock.view_move_form.show_immediate_transfer.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_form.show_immediate_transfer.xml)

### Show Locations  
ID: `mint_system.stock.view_move_form.show_locations`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_form" priority="50">

  <xpath expr="//field[@name='move_ids_without_package']//field[@name='product_id']" position="after">
    <field name="location_id"/>
    <field name="location_dest_id"/>
  </xpath>

</data>

```
Source: [snippets/stock.view_move_form.show_locations.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_form.show_locations.xml)

### Show Lot Ids  
ID: `mint_system.stock.view_move_form.show_lot_ids`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_form" priority="50">

  <field name="move_dest_ids" position="after">
    <field name="lot_ids"/>
  </field>

</data>

```
Source: [snippets/stock.view_move_form.show_lot_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_form.show_lot_ids.xml)

### Show Move Finished Ids  
ID: `mint_system.stock.view_move_form.show_move_finished_ids`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_form" priority="50">

  <xpath expr="//field[@name='procure_method']" position="after">
    <field name="move_finished_ids"/>
  </xpath>

</data>

```
Source: [snippets/stock.view_move_form.show_move_finished_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_form.show_move_finished_ids.xml)

### Show Move Lines  
ID: `mint_system.stock.view_move_form.show_move_lines`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_form" priority="50">

    <group name="origin_grp" position="before">
        <group name="move_lines">
            <field name="move_line_ids">
                <tree>
                    <field name="date" />
                    <field name="reference" />
                    <field name="lot_id" />
                    <field name="qty_done" />
                    <field name="state" />
                </tree>
            </field>
        </group>
    </group>

</data>

```
Source: [snippets/stock.view_move_form.show_move_lines.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_form.show_move_lines.xml)

### Show Order Finished Lot Ids  
ID: `mint_system.stock.view_move_form.show_order_finished_lot_ids`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_form" priority="50">

  <field name="move_dest_ids" position="after">
    <field name="order_finished_lot_ids"/>
  </field>

</data>

```
Source: [snippets/stock.view_move_form.show_order_finished_lot_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_form.show_order_finished_lot_ids.xml)

### Show Packaging  
ID: `mint_system.stock.view_move_form.show_packaging`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_form" priority="50">

  <field name="name" position="before">
    <field name="product_packaging"/>
  </field>

</data>

```
Source: [snippets/stock.view_move_form.show_packaging.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_form.show_packaging.xml)

### Show Partner  
ID: `mint_system.stock.view_move_form.show_partner`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_form" priority="50">

  <xpath expr="//field[@name='move_ids_without_package']//field[@name='product_id']" position="after">
    <field name="partner_id"/>
  </xpath>

</data>

```
Source: [snippets/stock.view_move_form.show_partner.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_form.show_partner.xml)

### Show Picking Code  
ID: `mint_system.stock.view_move_form.show_picking_code`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_form" priority="50">

  <field name="origin" position="after">
    <field name="picking_code"/>
  </field>

</data>

```
Source: [snippets/stock.view_move_form.show_picking_code.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_form.show_picking_code.xml)

### Show Picking Id  
ID: `mint_system.stock.view_move_form.show_picking_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_form" priority="50">

  <field name="origin" position="after">
    <field name="picking_id"/>
  </field>

</data>

```
Source: [snippets/stock.view_move_form.show_picking_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_form.show_picking_id.xml)

### Show Production  
ID: `mint_system.stock.view_move_form.show_production`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_form" priority="50">

  <xpath expr="//field[@name='procure_method']" position="after">
    <field name="production_id"/>
  </xpath>

</data>

```
Source: [snippets/stock.view_move_form.show_production.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_form.show_production.xml)

### Show Quantity Done  
ID: `mint_system.stock.view_move_form.show_quantity_done`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_form" priority="50">

  <field name="name" position="before">
    <field name="quantity_done"/>
  </field>

</data>

```
Source: [snippets/stock.view_move_form.show_quantity_done.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_form.show_quantity_done.xml)

### Show Reservation Date  
ID: `mint_system.stock.view_move_form.show_reservation_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_form" priority="50">

  <field name="date_deadline" position="after">
    <field name="reservation_date"/>
  </field>

</data>

```
Source: [snippets/stock.view_move_form.show_reservation_date.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_form.show_reservation_date.xml)

### Show Stock Valuation Layer Ids  
ID: `mint_system.stock.view_move_form.show_stock_valuation_layer_ids`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_form" priority="50">

  <field name="move_dest_ids" position="after">
    <field name="stock_valuation_layer_ids"/>
  </field>

</data>

```
Source: [snippets/stock.view_move_form.show_stock_valuation_layer_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_form.show_stock_valuation_layer_ids.xml)

## View Move Line Form  
### Enable Edit And Create  
ID: `mint_system.stock.view_move_line_form.enable_edit_and_create`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_line_form" priority="50">

  <form position="attributes">
    <attribute name="create">1</attribute>
    <attribute name="edit">1</attribute>
  </form>

</data>

```
Source: [snippets/stock.view_move_line_form.enable_edit_and_create.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_line_form.enable_edit_and_create.xml)

### Show Move Id  
ID: `mint_system.stock.view_move_line_form.show_move_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_line_form" priority="50">

  <field name="origin" position="after">
    <field name="move_id"/>
  </field>

</data>

```
Source: [snippets/stock.view_move_line_form.show_move_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_line_form.show_move_id.xml)

### Show Product Qty  
ID: `mint_system.stock.view_move_line_form.show_product_qty`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_line_form" priority="50">

  <field name="lot_id" position="before">
    <field name="product_qty"/>
  </field>

</data>

```
Source: [snippets/stock.view_move_line_form.show_product_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_line_form.show_product_qty.xml)

## View Move Line Tree  
### Enable Create  
ID: `mint_system.stock.view_move_line_tree.enable_create`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_line_tree" priority="50">

  <tree position="attributes">
    <attribute name="create">1</attribute>
  </tree>

</data>

```
Source: [snippets/stock.view_move_line_tree.enable_create.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_line_tree.enable_create.xml)

## View Move Tree  
### Add Partner  
ID: `mint_system.stock.view_move_tree.add_partner`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_tree" priority="50">

  <field name="location_dest_id" position="after">
    <field name="partner_id" optional="hide"/>
  </field>

</data>

```
Source: [snippets/stock.view_move_tree.add_partner.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_tree.add_partner.xml)

### Add Picking Partner  
ID: `mint_system.stock.view_move_tree.add_picking_partner`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_tree" priority="50">

  <field name="location_dest_id" position="after">
    <field name="picking_partner_id" optional="hide"/>
  </field>

</data>

```
Source: [snippets/stock.view_move_tree.add_picking_partner.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_tree.add_picking_partner.xml)

### Enable Create  
ID: `mint_system.stock.view_move_tree.enable_create`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_tree" priority="50">

  <tree position="attributes">
    <attribute name="create">1</attribute>
  </tree>

</data>

```
Source: [snippets/stock.view_move_tree.enable_create.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_tree.enable_create.xml)

### Show Create Details  
ID: `mint_system.stock.view_move_tree.show_create_details`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_tree" priority="50">

  <field name="date" position="after">
    <field name="create_date" optional="hide"/>
  </field>

</data>

```
Source: [snippets/stock.view_move_tree.show_create_details.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_tree.show_create_details.xml)

### Show Date  
ID: `mint_system.stock.view_move_tree.show_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_tree" priority="50">

  <field name="date" position="attributes">
    <attribute name="groups"></attribute>
  </field>

</data>

```
Source: [snippets/stock.view_move_tree.show_date.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_tree.show_date.xml)

### Show Optional  
ID: `mint_system.stock.view_move_tree.show_optional`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_tree" priority="50">

  <field name="product_uom_qty" position="attributes">
    <attribute name="optional">hide</attribute>
  </field>

</data>

```
Source: [snippets/stock.view_move_tree.show_optional.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_tree.show_optional.xml)

### Show Reservation Date  
ID: `mint_system.stock.view_move_tree.show_reservation_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_tree" priority="50">

  <field name="location_dest_id" position="after">
    <field name="reservation_date" optional="hide" />
  </field>

</data>

```
Source: [snippets/stock.view_move_tree.show_reservation_date.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_tree.show_reservation_date.xml)

### Sort Date  
ID: `mint_system.stock.view_move_tree.sort_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_tree" priority="50">

  <tree position="attributes">
    <attribute name="default_order">date desc</attribute>
  </tree>

</data>

```
Source: [snippets/stock.view_move_tree.sort_date.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_tree.sort_date.xml)

### X Operation Qty  
ID: `mint_system.stock.view_move_tree.x_operation_qty`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_tree" priority="50">

  <field name="product_uom_qty" position="after">
    <field name="x_operation_qty" sum="Inventar Total"/>
  </field>

</data>

```
Source: [snippets/stock.view_move_tree.x_operation_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_tree.x_operation_qty.xml)

### X Picking Partner  
ID: `mint_system.stock.view_move_tree.x_picking_partner`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_move_tree" priority="50">

  <field name="location_dest_id" position="after">
    <field name="x_picking_partner_id" optional="hide"/>
  </field>

</data>

```
Source: [snippets/stock.view_move_tree.x_picking_partner.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_move_tree.x_picking_partner.xml)

## View Picking Form  
### Modify Readonly Date Done  
ID: `mint_system.stock.view_picking_form.modify_readonly_date_done`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_picking_form" priority="50">

  <xpath expr="//field[@name='date_done']" position="attributes">
    <attribute name="attrs">{'invisible': [('state', '!=', 'done')], 'readonly': [('is_locked', '=', True)]}</attribute>
  </xpath>

</data>
```
Source: [snippets/stock.view_picking_form.modify_readonly_date_done.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_picking_form.modify_readonly_date_done.xml)

### Modify Readonly Partner Id  
ID: `mint_system.stock.view_picking_form.modify_readonly_partner_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_picking_form" priority="50">

  <xpath expr="//field[@name='partner_id']" position="attributes">
    <attribute name="attrs">{'readonly': ['|',('is_locked', '=', True), ('state', 'in' ,[('done', 'cancel')])]}</attribute>
  </xpath>

</data>
```
Source: [snippets/stock.view_picking_form.modify_readonly_partner_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_picking_form.modify_readonly_partner_id.xml)

### Modify Readonly User Id  
ID: `mint_system.stock.view_picking_form.modify_readonly_user_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_picking_form" priority="50">

  <xpath expr="//field[@name='user_id']" position="attributes">
    <attribute name="attrs">{'readonly': ['|',('is_locked', '=', True), ('state', 'in' ,[('done', 'cancel')])]}</attribute>
  </xpath>

</data>
```
Source: [snippets/stock.view_picking_form.modify_readonly_user_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_picking_form.modify_readonly_user_id.xml)

### Scheduled Date Readonly  
ID: `mint_system.stock.view_picking_form.scheduled_date_readonly`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_picking_form" priority="50">

  <xpath expr="//field[@name='scheduled_date']" position="attributes">
    <attribute name="attrs">{'readonly': True}</attribute>
  </xpath>

</data>

```
Source: [snippets/stock.view_picking_form.scheduled_date_readonly.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_picking_form.scheduled_date_readonly.xml)

### Sequence Handle  
ID: `mint_system.stock.view_picking_form.sequence_handle`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_picking_form" priority="50">

  <xpath expr="//field[@name='display_assign_serial']" position="after">
    <field name="sequence" widget="handle"/>
  </xpath>

</data>

```
Source: [snippets/stock.view_picking_form.sequence_handle.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_picking_form.sequence_handle.xml)

### Show Date  
ID: `mint_system.stock.view_picking_form.show_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_picking_form" priority="50">

  <xpath expr="//field[@name='date']" position="attributes">
    <attribute name="invisible">0</attribute>
  </xpath>

</data>

```
Source: [snippets/stock.view_picking_form.show_date.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_picking_form.show_date.xml)

### Show Details Visible  
ID: `mint_system.stock.view_picking_form.show_details_visible`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_picking_form" priority="50">

  <xpath expr="//button[@name='action_show_details']" position="attributes">
    <attribute name="attrs"></attribute>
  </xpath>

</data>

```
Source: [snippets/stock.view_picking_form.show_details_visible.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_picking_form.show_details_visible.xml)

### Show Move Line Ids  
ID: `mint_system.stock.view_picking_form.show_move_line_ids`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_picking_form" priority="50">

  <field name="backorder_id" position="after">
    <field name="move_line_ids"/>
  </field>

</data>

```
Source: [snippets/stock.view_picking_form.show_move_line_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_picking_form.show_move_line_ids.xml)

### Show Weight  
ID: `mint_system.stock.view_picking_form.show_weight`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_picking_form" priority="50">

  <field name="product_uom" position="after">
    <field name="weight" optional="hide"/>
  </field>

</data>

```
Source: [snippets/stock.view_picking_form.show_weight.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_picking_form.show_weight.xml)

### X Autocomplete  
ID: `mint_system.stock.view_picking_form.x_autocomplete`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_picking_form" priority="50">

  <field name="date_deadline" position="before">
    <field name="x_autocomplete" attrs="{'invisible': ['|', ('picking_type_code', '!=', 'incoming'), ('state', '=', 'done')]}"/>
  </field>

</data>

```
Source: [snippets/stock.view_picking_form.x_autocomplete.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_picking_form.x_autocomplete.xml)

### X Client Order Ref  
ID: `mint_system.stock.view_picking_form.x_client_order_ref`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_picking_form" priority="50">

  <field name="origin" position="after">
    <field name="x_client_order_ref"/>
  </field>

</data>
```
Source: [snippets/stock.view_picking_form.x_client_order_ref.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_picking_form.x_client_order_ref.xml)

### X Count Boxes  
ID: `mint_system.stock.view_picking_form.x_count_boxes`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_picking_form" priority="50">

  <field name="product_uom" position="after">
    <field name="x_count_boxes" optional="show"/>
  </field>

</data>

```
Source: [snippets/stock.view_picking_form.x_count_boxes.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_picking_form.x_count_boxes.xml)

### X Date Order  
ID: `mint_system.stock.view_picking_form.x_date_order`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_picking_form" priority="50">

  <field name="origin" position="after">
    <field name="x_date_order"/>
  </field>

</data>
```
Source: [snippets/stock.view_picking_form.x_date_order.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_picking_form.x_date_order.xml)

### X Label Qty  
ID: `mint_system.stock.view_picking_form.x_label_qty`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_picking_form" priority="50">

  <field name="product_uom" position="after">
    <field name="x_label_qty" optional="show"/>
  </field>

</data>

```
Source: [snippets/stock.view_picking_form.x_label_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_picking_form.x_label_qty.xml)

### X Vst  
ID: `mint_system.stock.view_picking_form.x_vst`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_picking_form" priority="50">

  <field name="origin" position="after">
    <field name="x_vst"/>
  </field>

</data>
```
Source: [snippets/stock.view_picking_form.x_vst.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_picking_form.x_vst.xml)

## View Picking Internal Search  
### Filter Groupby Expected Date  
ID: `mint_system.stock.view_picking_internal_search.filter_groupby_expected_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_picking_internal_search" priority="50">

  <filter name="expected_date" position="after">
    <filter string="Scheduled Date by Day" name="expected_date_day" domain="[]" context="{'group_by': 'scheduled_date:day'}"/>
  </filter>

</data>

```
Source: [snippets/stock.view_picking_internal_search.filter_groupby_expected_date.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_picking_internal_search.filter_groupby_expected_date.xml)

## View Production Lot Form  
### X Autoremove  
ID: `mint_system.stock.view_production_lot_form.x_autoremove`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_production_lot_form" priority="50">

  <field name="removal_date" position="after">
    <field name="x_autoremove" />
  </field>

</data>
```
Source: [snippets/stock.view_production_lot_form.x_autoremove.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_production_lot_form.x_autoremove.xml)

### X Production Id  
ID: `mint_system.stock.view_production_lot_form.x_production_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_production_lot_form" priority="50">

  <xpath expr="//group[@name='main_group']/group/div" position="after">
    <field name="x_production_id" readonly="1"/>
  </xpath>

</data>
```
Source: [snippets/stock.view_production_lot_form.x_production_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_production_lot_form.x_production_id.xml)

### X Weight Uom  
ID: `mint_system.stock.view_production_lot_form.x_weight_uom`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_production_lot_form" priority="50">

  <xpath expr="//group[@name='main_group']/group/div" position="after">
    <field name="x_weight_uom" readonly="1"/>
  </xpath>

</data>
```
Source: [snippets/stock.view_production_lot_form.x_weight_uom.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_production_lot_form.x_weight_uom.xml)

## View Production Lot Tree  
### Show Qty  
ID: `mint_system.stock.view_production_lot_tree.show_qty`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_production_lot_tree" priority="50">

  <field name="product_id" position="after">
    <field name="product_qty"/>
  </field>

</data>

```
Source: [snippets/stock.view_production_lot_tree.show_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_production_lot_tree.show_qty.xml)

## View Stock Move Line Operation Tree  
### Edit Reserved Qty  
ID: `mint_system.stock.view_stock_move_line_operation_tree.edit_reserved_qty`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_stock_move_line_operation_tree" priority="50">

  <field name="product_uom_qty" position="attributes">
    <attribute name="readonly">0</attribute>
  </field>

</data>

```
Source: [snippets/stock.view_stock_move_line_operation_tree.edit_reserved_qty.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_stock_move_line_operation_tree.edit_reserved_qty.xml)

## View Stock Quant Package Form  
### Add Estimated Pack Weight Kg  
ID: `mint_system.stock.view_stock_quant_package_form.add_estimated_pack_weight_kg`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_stock_quant_package_form" priority="50">

  <xpath expr="//span[@class='text-muted'][1]" position="replace">
    <span class="text-muted">(computed: <field name="estimated_pack_weight_kg" nolabel="1"/>
    </span>
  </xpath>

</data>

```
Source: [snippets/stock.view_stock_quant_package_form.add_estimated_pack_weight_kg.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_stock_quant_package_form.add_estimated_pack_weight_kg.xml)

## View Stock Quant Tree Editable  
### Show Reserved Quantity  
ID: `mint_system.stock.view_stock_quant_tree_editable.show_reserved_quantity`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_stock_quant_tree_editable" priority="50">

    <field name="inventory_quantity" position="after">
      <field name="reserved_quantity"/>
    </field>

</data>

```
Source: [snippets/stock.view_stock_quant_tree_editable.show_reserved_quantity.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_stock_quant_tree_editable.show_reserved_quantity.xml)

### X Expiration Date  
ID: `mint_system.stock.view_stock_quant_tree_editable.x_expiration_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_stock_quant_tree_editable" priority="50">

    <field name="removal_date" position="after">
      <field name="x_expiration_date" optional="show"/>
    </field>

</data>

```
Source: [snippets/stock.view_stock_quant_tree_editable.x_expiration_date.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_stock_quant_tree_editable.x_expiration_date.xml)

## View Stock Quant Tree  
### Show Reserved Quantity  
ID: `mint_system.stock.view_stock_quant_tree.show_reserved_quantity`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_stock_quant_tree" priority="50">

    <field name="available_quantity" position="after">
      <field name="reserved_quantity"/>
    </field>

</data>

```
Source: [snippets/stock.view_stock_quant_tree.show_reserved_quantity.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_stock_quant_tree.show_reserved_quantity.xml)

## View Warehouse Orderpoint Tree Editable  
### Show Lead Days Date  
ID: `mint_system.stock.view_warehouse_orderpoint_tree_editable.show_lead_days_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.view_warehouse_orderpoint_tree_editable" priority="50">

  <field name="json_lead_days_popover" position="after">
    <field name="lead_days_date"/>
  </field>

</data>

```
Source: [snippets/stock.view_warehouse_orderpoint_tree_editable.show_lead_days_date.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.view_warehouse_orderpoint_tree_editable.show_lead_days_date.xml)

## Vpicktree  
### Add Weight Uom Name  
ID: `mint_system.stock.vpicktree.add_weight_uom_name`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.vpicktree" priority="50">

  <xpath expr="//field[@name='weight']" position="replace">
    <field name="weight"/>
    <field name="weight_uom_name"/>
  </xpath>
</data>

```
Source: [snippets/stock.vpicktree.add_weight_uom_name.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.vpicktree.add_weight_uom_name.xml)

### Default Order Name  
ID: `mint_system.stock.vpicktree.default_order_name`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.vpicktree" priority="50">

  <tree position="attributes">
    <attribute name="default_order">name desc</attribute>
  </tree>

</data>

```
Source: [snippets/stock.vpicktree.default_order_name.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.vpicktree.default_order_name.xml)

### Format Date Deadline  
ID: `mint_system.stock.vpicktree.format_date_deadline`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.vpicktree" priority="50">

  <xpath expr="//field[@name='date_deadline']" position="attributes">
    <attribute name="widget">date</attribute>
  </xpath>

</data>

```
Source: [snippets/stock.vpicktree.format_date_deadline.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.vpicktree.format_date_deadline.xml)

### Format Scheduled Date  
ID: `mint_system.stock.vpicktree.format_scheduled_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.vpicktree" priority="50">

  <xpath expr="//field[@name='scheduled_date']" position="attributes">
    <attribute name="widget">date</attribute>
  </xpath>

</data>

```
Source: [snippets/stock.vpicktree.format_scheduled_date.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.vpicktree.format_scheduled_date.xml)

### Modify Invisible Scheduled Date  
ID: `mint_system.stock.vpicktree.modify_invisible_scheduled_date`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.vpicktree" priority="50">

  <xpath expr="//field[@name='scheduled_date']" position="attributes">
    <attribute name="attrs">{'invisible': [('state', 'in' , 'cancel')]}</attribute>
  </xpath>

</data>
```
Source: [snippets/stock.vpicktree.modify_invisible_scheduled_date.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.vpicktree.modify_invisible_scheduled_date.xml)

### Show Delivery Note  
ID: `mint_system.stock.vpicktree.show_delivery_note`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.vpicktree" priority="50">
  <xpath expr="//field[@name='partner_id']" position="after">
    <field name="delivery_note" optional="show"/>
  </xpath>
</data>

```
Source: [snippets/stock.vpicktree.show_delivery_note.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.vpicktree.show_delivery_note.xml)

### Weight Sum  
ID: `mint_system.stock.vpicktree.weight_sum`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.vpicktree" priority="50">

  <xpath expr="//field[@name='weight']" position="attributes">
    <attribute name="sum"></attribute>
  </xpath>

</data>

```
Source: [snippets/stock.vpicktree.weight_sum.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.vpicktree.weight_sum.xml)

### X Client Order Ref  
ID: `mint_system.stock.vpicktree.x_client_order_ref`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.vpicktree" priority="50">
  <xpath expr="//field[@name='origin']" position="after">
    <field name="client_order_ref" optional="show"/>
  </xpath>
</data>
```
Source: [snippets/stock.vpicktree.x_client_order_ref.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.vpicktree.x_client_order_ref.xml)

### X Date Order  
ID: `mint_system.stock.vpicktree.x_date_order`  
```xml
<?xml version="1.0"?>
<data inherit_id="stock.vpicktree" priority="50">
  <xpath expr="//field[@name='origin']" position="after">
    <field name="x_date_order" optional="show"/>
  </xpath>
</data>
```
Source: [snippets/stock.vpicktree.x_date_order.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/stock.vpicktree.x_date_order.xml)

