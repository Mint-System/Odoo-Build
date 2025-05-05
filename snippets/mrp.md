# Mrp
## Label Production View  
### Tissa  
ID: `mint_system.mrp.label_production_view.tissa`  
```xml
<t t-name="mrp.label_production_view.tissa">
    <!--<t t-call="web.basic_layout">-->
    <!--<span t-esc="docs"/>-->
    <!--<span t-esc="docs.move_finished_ids"/>-->
    <!--<span t-esc="docs.move_finished_ids.lot_ids"/>-->
    <!--<span t-esc="docs.finished_lot_id"/>-->
    <t t-set="lot_ids" t-value="docs.move_finished_ids.lot_ids or docs.finished_lot_id"/>
    <t t-foreach="lot_ids" t-as="lot_id">
        <t t-set="doc" t-value=""/>
        <t t-set="docs" t-value="lot_id"/>
        <!--<span t-esc="lot_id.product_id.x_product_label.name"/>-->
        <t t-if="lot_id.product_id.x_product_label.name == 'St&#xFC;cketikette Spheretex'">
            <t t-call="studio_customization.studio_report_docume_87f02ec4-1346-4b76-bc5a-41f3abc30448"/>
        </t>
        <t t-if="lot_id.product_id.x_product_label.name == 'St&#xFC;cketikette Standard'">
            <t t-call="studio_customization.studio_report_docume_87f02ec4-1346-4b76-bc5a-41f3abc30448_copy_1"/>
        </t>
        <t t-if="lot_id.product_id.x_product_label.name == 'St&#xFC;cketikette neutral'">
            <t t-call="studio_customization.studio_report_docume_cd2541fa-1502-4c50-8f76-bf2ae39698a1"/>
        </t>
        <t t-if="lot_id.product_id.x_product_label.name == 'St&#xFC;cketikette Sika'">
            <t t-call="studio_customization.studio_report_docume_d6a31795-5d6c-4527-9c76-48ad7356e0ae"/>
        </t>
        <t t-if="lot_id.product_id.x_product_label.name == 'Etikette Ketten'">
            <t t-call="studio_customization.studio_report_docume_e9a56ff9-0143-4e41-ad9d-9817a1f10c4b"/>
        </t>
        <p style="page-break-after: always;"/>
    </t>
    <!--</t>-->
</t>

```
Source: [snippets/mrp.label_production_view.tissa.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.label_production_view.tissa.xml)

### Tissa Etikette Ketten  
ID: `mint_system.mrp.label_production_view.tissa_etikette_ketten`  
```xml
<t t-name="mrp.label_production_view.tissa_etikette_ketten">
    <div class="row">
        <div class="col-2">
            <img class="img-fluid" src="/web/image/2721/230x115mm_1fbg_graustufen_logo%20tissa%20textiles.jpg?access_token=c7d446e2-b48d-438b-afab-eb491dd6fa7a"/>
        </div>
        <div class="col-10" style="font-family: Arial, Helvetica, sans-serif; font-size: 18px">
            <strong t-field="res_company.display_name"/>
            <br/>
            <span t-field="res_company.country_id.code"/>
            <span> - </span>
            <span t-field="res_company.zip"/>
            <span>  </span>
            <span t-field="res_company.city"/>
        </div>
    </div>
    <div class="row">
        <div class="col" style="font-family: Arial, Helvetica, sans-serif; font-size: 84px; font-weight:bold">
            <span t-field="doc.product_id.display_name"/>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <td>
                <img t-if="doc.product_id.display_name" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s' % ('Code128', doc.product_id.display_name, 500, 50)"/>
            </td>
        </div>
    </div>
    <div class="row">
        <div class="col" style="font-family: Arial, Helvetica, sans-serif; font-size: 96px; font-weight:bold">
            <span t-field="doc.name"/>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <td>
                <img t-if="doc.name" t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s' % ('Code128', doc.name, 500, 50)"/>
            </td>
        </div>
    </div>
    <div class="row">
        <div class="col-6" style="font-family: Arial, Helvetica, sans-serif; font-size: 84px; font-weight:bold">
            <span t-field="doc.product_qty"/>
        </div>
        <!--
      <div class="col-6" style="font-family: Arial, Helvetica, sans-serif; font-size: 84px; font-weight:bold">
        <span t-field="doc.product_uom_id.display_name"/>
      </div>
      -->
    </div>
    <div class="row">
        <div class="col-3">
            <span>Einlagerungsdatum: </span>
        </div>
        <div class="col-9">
            <span t-field="doc.create_date"/>
        </div>
    </div>
    <div class="row">
        <div class="col" style="font-family: Arial, Helvetica, sans-serif; font-size: 48px; font-weight:bold">
            <span>kommt an Maschine:</span>
        </div>
    </div>
</t>

```
Source: [snippets/mrp.label_production_view.tissa_etikette_ketten.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.label_production_view.tissa_etikette_ketten.xml)

## Label Production View Pdf  
### Aersolution  
ID: `mint_system.mrp.label_production_view_pdf.aersolution`  
```xml
<t t-name="stock.report_reception_report_label.aersolution">
    <t t-call="web.basic_layout">
        <div class="page">
            <t t-foreach="docs" t-as="production">
                <t t-set="label_qty" t-value="int(production.product_qty)"/>
                <t t-set="company_id" t-value="production.company_id"/>
                <t t-set="lot_id" t-value="production.lot_producing_id"/>
                <t t-set="product_id" t-value="production.product_id"/>
                <t t-call="mint_system.stock.report_label.aersolution"/>
            </t>
        </div>
    </t>
</t>

```
Source: [snippets/mrp.label_production_view_pdf.aersolution.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.label_production_view_pdf.aersolution.xml)

### Basis57  
ID: `mint_system.mrp.label_production_view_pdf.basis57`  
```xml
<t t-name="mrp.label_production_view_pdf.basis57">
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
            }
            .barcode {
                font-size: 6mm;
            }
            .default {
                font-size: 7mm;
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
        <t t-foreach="docs" t-as="production">
            <t t-foreach="production.move_finished_ids.filtered(lambda m: m.quantity_done &gt; 0)" t-as="move">
                <!--Set default values-->
                <t t-set="count_boxes" t-value="0"/>
                <t t-set="count_labels" t-value="0"/>
                <t t-set="temperature" t-value="2"/>
                <t t-set="today" t-value="context_timestamp(datetime.datetime.now())"/>
                <t t-set="print_weight" t-value="False"/>
                <t t-set="packaging" t-value="move.product_id.packaging_ids[0]"/>
                <t t-set="print_header" t-value="True"/>
                <t t-set="print_delivery_date_only" t-value="False"/>
                <!--Print report for each move line-->
                <t t-set="move_lines" t-value="move.move_line_ids.filtered(lambda l: l.qty_done &gt; 0)"/>
                <t t-foreach="move_lines" t-as="move_line">
                    <!--Select loop based product packaing -->
                    <t t-if="move.product_packaging.name == 'Schale Klein'">
                        <t t-set="fix_weight">1'000g</t>
                        <t t-set="count_labels" t-value="move_line.qty_done"/>
                    </t>
                    <t t-if="move.product_packaging.name == 'Schale Gross'">
                        <t t-set="fix_weight">2'500g</t>
                        <t t-set="count_labels" t-value="move_line.qty_done/packaging.qty"/>
                    </t>
                    <t t-if="move.product_packaging.name == 'Kiste'">
                        <t t-set="print_weight" t-value="True"/>
                    </t>
                    <t t-if="move.product_packaging.name == 'Vakuum Klein'">
                        <t t-set="fix_weight">1'000g</t>
                        <t t-set="count_labels" t-value="move_line.qty_done"/>
                    </t>
                    <t t-if="move.product_packaging.name == 'Vakuum Gross'">
                        <t t-set="fix_weight">2'500g</t>
                        <t t-set="count_labels" t-value="move_line.qty_done/packaging.qty"/>
                    </t>
                    <t t-if="move.product_packaging.name == 'Karton'">
                        <t t-set="fix_weight">5'000g</t>
                        <t t-set="count_boxes" t-value="1"/>
                    </t>
                    <!--Compute box count-->
                    <t t-if="count_boxes == 0">
                        <t t-set="count_boxes" t-value="int(((move_line.qty_done + 0.1) / move.quantity_done) * move.x_count_boxes)"/>
                    </t>
                    <t t-set="count_pages" t-value="int(count_labels + count_boxes)"/>
                    <!--Print report for each label and box count-->
                    <t t-foreach="range(0, count_pages)" t-as="page">
                        <!--First print normal labels and then box labels-->
                        <t t-if="page_index &gt;= (count_pages-count_boxes)">
                            <t t-set="fix_weight"/>
                            <t t-if="external_ref">
                                <t t-set="print_header" t-value="False"/>
                                <t t-set="print_delivery_date_only" t-value="True"/>
                            </t>
                        </t>
                        <!--Caclulate default expiration date-->
                        <t t-set="delta" t-value="datetime.timedelta(days=move.product_id.x_expiration_days)"/>
                        <t t-set="consume_until" t-value="today + delta"/>
                        <!--Caclulate expiration date from settings-->
                        <t t-if="move.product_id.use_expiration_date">
                            <t t-set="delta" t-value="datetime.timedelta(days=move.product_id.expiration_time)"/>
                            <t t-set="consume_until" t-value="context_timestamp(move_line.lot_id.removal_date)"/>
                            <t t-set="today" t-value="consume_until - delta"/>
                        </t>
                        <div class="page">
                            <div class="label">
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                                <t t-if="print_header">
                                    <span class="text-uppercase use-font-opensans-medium title">Gotthard-Zander</span>
                                    <br/>
                                    <span class="text-uppercase use-font-opensans-bold title" t-esc="move.product_id.name"/>
                                    <t t-if="move.product_id.x_calibre">
                                        <span class="use-font-opensans-medium default space-left" t-esc="move.product_id.x_calibre"/>
                                    </t>
                                    <br/>
                                    <span class="use-font-opensans-medium default">(Sander lucioperca) in Aquakultur gewonnen</span>
                                    <br/>
                                    <t t-if="fix_weight or print_weight">
                                        <span class="use-font-opensans-medium default">Gewicht: </span>
                                        <span class="use-font-opensans-medium default" t-if="not print_weight" t-esc="fix_weight"/>
                                        <span class="use-font-opensans-medium default" t-if="print_weight" t-esc="move.quantity_done *1000" t-options="{&quot;widget&quot;: &quot;float&quot;, &quot;precision&quot;: 0}"/>
                                        <span class="use-font-opensans-medium default" t-if="print_weight">
                                            g zu
                                            <span t-esc="move.x_count_boxes"/>
                                            Kisten
                                        </span>
                                    </t>
                                </t>
                                <br/>
                                <br/>
                                <t t-if="not print_delivery_date_only">
                                    <span class="use-font-opensans-medium default">Verpackt am: </span>
                                    <span class="use-font-opensans-medium default" t-esc="today.strftime('%d.%m.%Y')"/>
                                    <br/>
                                    <span class="use-font-opensans-medium default">Mindestens haltbar bis: </span>
                                    <span class="use-font-opensans-medium default" t-esc="consume_until.strftime('%d.%m.%Y')"/>
                                    <br/>
                                    <span class="use-font-opensans-medium default">
                                        Aufbewahrung: bei
                                        <span t-esc="move.product_id.x_storage_temperature"/>
                                        &#xB0;C
                                    </span>
                                </t>
                                <t t-if="print_delivery_date_only">
                                    <span class="use-font-opensans-medium address">Lieferdatum: </span>
                                    <span class="use-font-opensans-medium address" t-esc="picking.scheduled_date.strftime('%d.%m.%Y')"/>
                                    <br/>
                                </t>
                                <br/>
                                <br/>
                                <t t-if="move_line.lot_id.name">
                                    <t t-set="barcode" t-value="move.product_packaging.barcode"/>
                                    <img t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s' % ('EAN13', barcode, 600, 50)" alt="Barcode"/>
                                    <br/>
                                    <span class="use-font-opensans-medium barcode" t-esc="'%s %s %s' % (barcode[0], barcode[1:8], barcode[8:])"/>
                                </t>
                                <t t-else="">
                                    <span class="use-font-opensans-medium default text-muted">No barcode available</span>
                                </t>
                                <br/>
                                <br/>
                                <span class="text-uppercase use-font-opensans-bold default">Gotthard-Zander</span>
                                <span class="use-font-opensans-bold default"> by Basis57</span>
                                <br/>
                                <br/>
                                <span class="use-font-opensans-medium footer" t-field="res_company.street"/>
                                <span class="use-font-opensans-medium footer space-right">,</span>
                                <span class="use-font-opensans-medium footer space-right" t-field="res_company.zip"/>
                                <span class="use-font-opensans-medium footer" t-field="res_company.city"/>
                                <br/>
                                <span class="use-font-opensans-medium footer">www.gotthard-zander.ch</span>
                                <svg viewBox="0 0 150 100" width="150" height="100">
                                    <ellipse style="stroke: rgb(0, 0, 0); fill: none; stroke-width: 4px;" cx="75" cy="49.556" rx="70" ry="45" data-bx-origin="-1.166667 -2"/>
                                    <text style="fill: rgb(51, 51, 51); font-family: Arial, sans-serif; font-size: 14px; font-weight: 700; text-anchor: middle; white-space: pre;" data-bx-origin="-1.600941 -3.727571" transform="matrix(1.475051, 0, 0, 1.713593, -78.134323, -123.083534)">
                                        <tspan x="102.8" y="96.183">CH</tspan>
                                        <tspan x="102.8" dy="1em">&#x200B;</tspan>
                                        <tspan>71758556</tspan>
                                    </text>
                                </svg>
                            </div>
                            <p style="page-break-before:always;"/>
                        </div>
                    </t>
                </t>
            </t>
        </t>
    </t>
</t>

```
Source: [snippets/mrp.label_production_view_pdf.basis57.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.label_production_view_pdf.basis57.xml)

### Trimada  
ID: `mint_system.mrp.label_production_view_pdf.trimada`  
```xml
<t t-name="mrp.label_production_view_pdf.trimada">
    <t t-call="web.basic_layout">
        <t t-foreach="docs" t-as="production">
            <t t-foreach="production.move_finished_ids" t-as="move">
                <style>
          .label {
            font-family: arial;
          }
          .box {
              margin: 0 0 2mm 0;
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
              font-size: 13mm;
              margin: 3mm 3mm 0 3mm;
              font-weight: bold;
              text-align: center;
              border-bottom: solid 1px;
              line-height: 1;
          }
          .description {
              font-size: 10mm;
              margin: 0 3mm 0 3mm;
              text-align: center;
              height: 23mm;
              line-height: 10mm;
              display: table;
              width: 98%;
              line-height: 10mm;
          }
          .sub1 {
              display: table-cell ;
              vertical-align: middle;
              text-align: center;
          }
          .sub2 {
              display: table-cell ;
              vertical-align: middle;
              text-align: center;
              border-bottom: solid 1px;
          }
          .order {
              font-size: 8mm;
              margin: 3mm 3mm 0 3mm;
              text-align: left;
              border-bottom: solid 1px;
              line-height: 1;
              height: 34mm;
          }
          .info{
              margin-top: 2mm;
          }
          .comment {
              font-size: 5mm;
              text-align: center;
              height: 8mm;
              line-height: 12mm;
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
                                <span t-field="move.product_id.barcode" t-options-quiet="0" t-options="{'widget': 'barcode', 'img_style': 'float:right; width:250px; height:85px;'}"/>
                            </div>
                        </div>
                        <div class="description">
                            <span class="sub1" t-esc="move.product_id.name"/>
                        </div>
                        <div class="description">
                            <span class="sub2" t-esc="move.product_id.type_description"/>
                        </div>
                        <div class="row order">
                            <div class="col-6 box3">
                                <div class="padding info">
                                    <span t-esc="production.date_planned_finished" t-options="{'widget': 'date'}"/>
                                </div>
                                <div class="padding">
                                    <strong>
                                        <span t-esc="production.name"/>
                                    </strong>
                                </div>
                            </div>
                            <div class="col-6 box">
                                <div t-if="production.name" class="text-right">
                                    <span t-field="production.name" t-options-quiet="0" t-options="{'widget': 'barcode', 'img_style': 'float:right; width:250px; height:80px;'}"/>
                                </div>
                            </div>
                        </div>
                        <div class="comment">
                            <span>Trimada AG, CH-5610 Wohlen &#x2013; www.trimada.ch</span>
                        </div>
                    </div>
                </div>
            </t>
        </t>
    </t>
</t>

```
Source: [snippets/mrp.label_production_view_pdf.trimada.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.label_production_view_pdf.trimada.xml)

## Mrp Bom Form View  
### X Note  
ID: `mint_system.mrp.mrp_bom_form_view.x_note`  
```xml
<data inherit_id="mrp.mrp_bom_form_view" priority="50">
    <xpath expr="//field[@name='picking_type_id']" position="after">
        <field name="x_note"/>
    </xpath>
</data>

```
Source: [snippets/mrp.mrp_bom_form_view.x_note.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.mrp_bom_form_view.x_note.xml)

## Mrp Bom Tree View  
### Sort Id  
ID: `mint_system.mrp.mrp_bom_tree_view.sort_id`  
```xml
<data inherit_id="mrp.mrp_bom_tree_view" priority="50">
    <xpath expr="//tree" position="attributes">
        <attribute name="default_order">id desc</attribute>
    </xpath>
</data>

```
Source: [snippets/mrp.mrp_bom_tree_view.sort_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.mrp_bom_tree_view.sort_id.xml)

## Mrp Production Form View  
### Add Date Deadline  
ID: `mint_system.mrp.mrp_production_form_view.add_date_deadline`  
```xml
<data inherit_id="mrp.mrp_production_form_view" priority="50">
    <field name="user_id" position="before">
        <field name="date_deadline"/>
    </field>
    <data>
        <xpath expr="//field[@name='move_raw_ids']/tree[1]/field[@name='product_id']" position="after">
            <field name="date_deadline" optional="hide"/>
        </xpath>
    </data>
    <data>
        <xpath expr="//field[@name='move_raw_ids']/tree[1]/field[@name='product_id']" position="after">
            <field name="date"/>
        </xpath>
    </data>
</data>

```
Source: [snippets/mrp.mrp_production_form_view.add_date_deadline.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.mrp_production_form_view.add_date_deadline.xml)

### Add Date Deadline2  
ID: `mint_system.mrp.mrp_production_form_view.add_date_deadline2`  
```xml
<data inherit_id="mrp.mrp_production_form_view" priority="50">
    <field name="date_move" position="after">
        <field name="date_deadline" attrs="{'readonly': 0}"/>
    </field>
</data>

```
Source: [snippets/mrp.mrp_production_form_view.add_date_deadline2.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.mrp_production_form_view.add_date_deadline2.xml)

### Add Origin  
ID: `mint_system.mrp.mrp_production_form_view.add_origin`  
```xml
<data inherit_id="mrp.mrp_production_form_view" priority="50">
    <xpath expr="//group[@name='group_extra_info']//field[@name='date_planned_start']/.." position="after">
        <field name="origin"/>
    </xpath>
</data>

```
Source: [snippets/mrp.mrp_production_form_view.add_origin.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.mrp_production_form_view.add_origin.xml)

### Add Procurement Group Id  
ID: `mint_system.mrp.mrp_production_form_view.add_procurement_group_id`  
```xml
<data inherit_id="mrp.mrp_production_form_view" priority="50">
    <xpath expr="//group[@name='group_extra_info']//field[@name='date_planned_start']/.." position="after">
        <field name="procurement_group_id"/>
    </xpath>
</data>

```
Source: [snippets/mrp.mrp_production_form_view.add_procurement_group_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.mrp_production_form_view.add_procurement_group_id.xml)

### Finished Move Line Ids  
ID: `mint_system.mrp.mrp_production_form_view.finished_move_line_ids`  
```xml
<data inherit_id="mrp.mrp_production_form_view" priority="50">
    <xpath expr="//page[@name='miscellaneous']//field[@name='location_dest_id']" position="after">
        <field name="finished_move_line_ids" widget="many2many_tags"/>
    </xpath>
</data>

```
Source: [snippets/mrp.mrp_production_form_view.finished_move_line_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.mrp_production_form_view.finished_move_line_ids.xml)

### Format Sale Id  
ID: `mint_system.mrp.mrp_production_form_view.format_sale_id`  
```xml
<data inherit_id="mrp.mrp_production_form_view" priority="50">
    <xpath expr="//field[@name='sale_id']" position="attributes">
        <attribute name="readonly">False</attribute>
    </xpath>
</data>

```
Source: [snippets/mrp.mrp_production_form_view.format_sale_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.mrp_production_form_view.format_sale_id.xml)

### Hide Date Deadline  
ID: `mint_system.mrp.mrp_production_form_view.hide_date_deadline`  
```xml
<data inherit_id="mrp.mrp_production_form_view" priority="50">
    <xpath expr="//page[@name='miscellaneous']//field[@name='date_deadline']" position="attributes">
        <attribute name="invisible">True</attribute>
    </xpath>
</data>

```
Source: [snippets/mrp.mrp_production_form_view.hide_date_deadline.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.mrp_production_form_view.hide_date_deadline.xml)

### Move Finished Ids  
ID: `mint_system.mrp.mrp_production_form_view.move_finished_ids`  
```xml
<data inherit_id="mrp.mrp_production_form_view" priority="50">
    <xpath expr="//page[@name='miscellaneous']//field[@name='location_dest_id']" position="after">
        <field name="move_finished_ids" widget="many2many_tags"/>
    </xpath>
</data>

```
Source: [snippets/mrp.mrp_production_form_view.move_finished_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.mrp_production_form_view.move_finished_ids.xml)

### Replace Workorder Tree View  
ID: `mint_system.mrp.mrp_production_form_view.replace_workorder_tree_view`  
```xml
<data inherit_id="mrp.mrp_production_form_view" priority="50">
<!-- origin_ref: mrp.mrp_production_workorder_tree_editable_view -->
  <xpath expr="//field[@name='workorder_ids']" position="inside">
    <tree editable="bottom" js_class="tablet_list_view">
      <field name="consumption" invisible="1"/>
      <field name="company_id" invisible="1"/>
      <field name="is_produced" invisible="1"/>
      <field name="is_user_working" invisible="1"/>
      <field name="product_uom_id" invisible="1" readonly="0"/>
      <field name="production_state" invisible="1"/>
      <field name="production_bom_id" invisible="1"/>
      <field name="qty_producing" invisible="1"/>
      <field name="time_ids" invisible="1"/>
      <field name="working_state" invisible="1"/>
      <field name="operation_id" invisible="1" domain="['|', ('bom_id', '=', production_bom_id), ('bom_id', '=', False)]" context="{'default_workcenter_id': workcenter_id, 'default_company_id': company_id}"/>
      <field name="name" string="Operation"/>
      <field name="workcenter_id"/>
      <field name="product_id" optional="hide"/>
      
      <!-- Upgrade 16
      <field name="component_id" optional="hide"/>
      -->
      
      <!-- Upgrade 16
      <field name="lot_id" optional="hide" domain="[('product_id','=', component_id),'|',('company_id','=',False),('company_id','=',company_id)]"/>
      -->
      <field name="lot_id" optional="hide" domain="['|',('company_id','=',False),('company_id','=',company_id)]"/>
      
      <field name="date_planned_start" optional="show"/>
      <field name="date_planned_finished" optional="hide"/>
      <field name="date_start" optional="hide" readonly="1"/>
      <field name="date_finished" optional="hide" readonly="1"/>
      <field name="duration_expected" widget="float_time"/>
      <field name="duration" widget="mrp_time_counter" attrs="{'invisible': [('production_state','=', 'draft')], 'readonly': [('is_user_working', '=', True)]}"/>
      <field name="state" widget="badge" decoration-success="state == 'done'" decoration-info="state not in ('done', 'cancel')" attrs="{'invisible': [('production_state', 'in', ('draft', 'done'))]}"/>
      <field name="production_state" invisible="1"/>
      <button name="button_start" type="object" string="Start" class="btn-success" attrs="{'invisible': ['|', '|', '|', ('production_state','in', ('draft', 'done', 'cancel')), ('working_state', '=', 'blocked'), ('state', '=', 'done'), ('is_user_working', '!=', False)]}"/>
      <button name="button_pending" type="object" string="Pause" class="btn-warning" attrs="{'invisible': ['|', '|', ('production_state', 'in', ('draft', 'done', 'cancel')), ('working_state', '=', 'blocked'), ('is_user_working', '=', False)]}"/>
      <button name="button_finish" type="object" string="Done" class="btn-success" attrs="{'invisible': ['|', '|', ('production_state', 'in', ('draft', 'done', 'cancel')), ('working_state', '=', 'blocked'), ('is_user_working', '=', False)]}"/>
      <button name="433" type="action" string="Block" context="{'default_workcenter_id': workcenter_id}" class="btn-danger" attrs="{'invisible': ['|', ('production_state', 'in', ('draft', 'done', 'cancel')), ('working_state', '=', 'blocked')]}"/>
      <button name="button_unblock" type="object" string="Unblock" context="{'default_workcenter_id': workcenter_id}" class="btn-danger" attrs="{'invisible': ['|', ('production_state', 'in', ('draft', 'done', 'cancel')), ('working_state', '!=', 'blocked')]}"/>
      <button name="action_open_wizard" type="object" icon="fa-external-link" class="oe_edit_only" context="{'default_workcenter_id': workcenter_id}"/>
      <button name="open_tablet_view" type="object" icon="fa-tablet" context="{'from_production_order': True}" attrs="{'invisible': ['|', ('production_state', 'in', ('draft', 'cancel', 'done')), ('state', '=', 'done')]}"/>
      <field name="show_json_popover" invisible="1"/>
      <field name="json_popover" widget="mrp_workorder_popover" string=" " width="0.1" attrs="{'invisible': [('show_json_popover', '=', False)]}"/>
    </tree>
  </xpath>

</data>

```
Source: [snippets/mrp.mrp_production_form_view.replace_workorder_tree_view.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.mrp_production_form_view.replace_workorder_tree_view.xml)

### Show Backorder And Procurement Group  
ID: `mint_system.mrp.mrp_production_form_view.show_backorder_and_procurement_group`  
```xml
<data inherit_id="mrp.mrp_production_form_view" priority="50">
    <xpath expr="//page[@name='miscellaneous']//field[@name='picking_type_id']" position="after">
        <field name="procurement_group_id"/>
        <field name="backorder_sequence"/>
    </xpath>
</data>

```
Source: [snippets/mrp.mrp_production_form_view.show_backorder_and_procurement_group.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.mrp_production_form_view.show_backorder_and_procurement_group.xml)

### Show Date Planned Finished  
ID: `mint_system.mrp.mrp_production_form_view.show_date_planned_finished`  
```xml
<data inherit_id="mrp.mrp_production_form_view" priority="50">
    <field name="user_id" position="before">
        <field name="date_planned_finished" readonly="1"/>
    </field>
</data>

```
Source: [snippets/mrp.mrp_production_form_view.show_date_planned_finished.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.mrp_production_form_view.show_date_planned_finished.xml)

### Show Move Dest Ids  
ID: `mint_system.mrp.mrp_production_form_view.show_move_dest_ids`  
```xml
<data inherit_id="mrp.mrp_production_form_view" priority="50">
    <field name="bom_id" position="before">
        <field name="move_dest_ids"/>
    </field>
</data>

```
Source: [snippets/mrp.mrp_production_form_view.show_move_dest_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.mrp_production_form_view.show_move_dest_ids.xml)

### Show X Date Deadline  
ID: `mint_system.mrp.mrp_production_form_view.show_x_date_deadline`  
```xml
<data inherit_id="mrp.mrp_production_form_view" priority="50">
    <field name="user_id" position="before">
        <field name="x_date_deadline"/>
    </field>
</data>

```
Source: [snippets/mrp.mrp_production_form_view.show_x_date_deadline.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.mrp_production_form_view.show_x_date_deadline.xml)

### X Note  
ID: `mint_system.mrp.mrp_production_form_view.x_note`  
```xml
<data inherit_id="mrp.mrp_production_form_view" priority="50">
    <xpath expr="//page[@name='miscellaneous']//field[@name='origin']" position="after">
        <field name="x_note"/>
    </xpath>
</data>

```
Source: [snippets/mrp.mrp_production_form_view.x_note.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.mrp_production_form_view.x_note.xml)

## Mrp Production Tree View  
### Hide Date Deadline  
ID: `mint_system.mrp.mrp_production_tree_view.hide_date_deadline`  
```xml
<data inherit_id="mrp.mrp_production_tree_view" priority="50">
    <xpath expr="//field[@name='date_deadline']" position="replace">
  </xpath>
</data>

```
Source: [snippets/mrp.mrp_production_tree_view.hide_date_deadline.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.mrp_production_tree_view.hide_date_deadline.xml)

### Show Format Date Planned Start  
ID: `mint_system.mrp.mrp_production_tree_view.show_format_date_planned_start`  
```xml
<data inherit_id="mrp.mrp_production_tree_view" priority="50">
    <xpath expr="//field[@name='date_planned_start']" position="attributes">
        <attribute name="widget">date</attribute>
    </xpath>
</data>

```
Source: [snippets/mrp.mrp_production_tree_view.show_format_date_planned_start.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.mrp_production_tree_view.show_format_date_planned_start.xml)

### Show X Date Deadline  
ID: `mint_system.mrp.mrp_production_tree_view.show_x_date_deadline`  
```xml
<data inherit_id="mrp.mrp_production_tree_view" priority="50">
    <xpath expr="//field[@name='date_planned_start']" position="after">
        <field name="x_date_deadline"/>
    </xpath>
</data>

```
Source: [snippets/mrp.mrp_production_tree_view.show_x_date_deadline.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.mrp_production_tree_view.show_x_date_deadline.xml)

### Sort Date Planned Start  
ID: `mint_system.mrp.mrp_production_tree_view.sort_date_planned_start`  
```xml
<data inherit_id="mrp.mrp_production_tree_view" priority="50">
    <xpath expr="//tree" position="attributes">
        <attribute name="default_order">date_planned_start asc</attribute>
    </xpath>
</data>

```
Source: [snippets/mrp.mrp_production_tree_view.sort_date_planned_start.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.mrp_production_tree_view.sort_date_planned_start.xml)

## Mrp Production Workorder Tree Editable View  
### Add Product Id  
ID: `mint_system.mrp.mrp_production_workorder_tree_editable_view.add_product_id`  
```xml
<data inherit_id="mrp.mrp_production_workorder_tree_editable_view" priority="50">
    <xpath expr="//field[@name='workcenter_id']" position="after">
        <field name="product_id"/>
    </xpath>
</data>

```
Source: [snippets/mrp.mrp_production_workorder_tree_editable_view.add_product_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.mrp_production_workorder_tree_editable_view.add_product_id.xml)

### Add Production Id  
ID: `mint_system.mrp.mrp_production_workorder_tree_editable_view.add_production_id`  
```xml
<data inherit_id="mrp.mrp_production_workorder_tree_editable_view" priority="50">
    <xpath expr="//field[@name='workcenter_id']" position="after">
        <field name="production_id"/>
    </xpath>
</data>

```
Source: [snippets/mrp.mrp_production_workorder_tree_editable_view.add_production_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.mrp_production_workorder_tree_editable_view.add_production_id.xml)

### X Reservation State  
ID: `mint_system.mrp.mrp_production_workorder_tree_editable_view.x_reservation_state`  
```xml
<data inherit_id="mrp.mrp_production_workorder_tree_editable_view" priority="50">
    <xpath expr="//field[@name='date_planned_start']" position="before">
        <field name="x_reservation_state"/>
    </xpath>
</data>

```
Source: [snippets/mrp.mrp_production_workorder_tree_editable_view.x_reservation_state.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.mrp_production_workorder_tree_editable_view.x_reservation_state.xml)

## Mrp Production Workorder Tree View  
### Hide Production Id  
ID: `mint_system.mrp.mrp_production_workorder_tree_view.hide_production_id`  
```xml
<data inherit_id="mrp.mrp_production_workorder_tree_view" priority="50">
    <xpath expr="//field[@name='production_id']" position="replace">
</xpath>
</data>

```
Source: [snippets/mrp.mrp_production_workorder_tree_view.hide_production_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.mrp_production_workorder_tree_view.hide_production_id.xml)

## Oee Search View  
### Filter Wip  
ID: `mint_system.mrp.oee_search_view.filter_wip`  
```xml
<data inherit_id="mrp.oee_tree_view" priority="50">
    <xpath expr="//filter[@name='availability']" position="before">
        <filter name="wip" string="WIP" domain="[('x_production_id_state','=','progress')]"/>
    </xpath>
</data>
```
Source: [snippets/mrp.oee_search_view.filter_wip.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.oee_search_view.filter_wip.xml)

### Wip  
ID: `mint_system.mrp.oee_search_view.wip`  
```xml
<data inherit_id="mrp.oee_search_view" priority="50">
    <xpath expr="//filter[@name='availability']" position="before">
        <filter name="wip" string="WIP" domain="[('x_production_id_state','=','progress')]"/>
    </xpath>
</data>
```
Source: [snippets/mrp.oee_search_view.wip.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.oee_search_view.wip.xml)

## Oee Tree View  
### Total Cost  
ID: `mint_system.mrp.oee_tree_view.total_cost`  
```xml
<data inherit_id="mrp.oee_tree_view" priority="50">
    <xpath expr="//field[@name='loss_id']" position="after">
        <field name="total_cost" optional="show" string="Total Employee Cost"/>
    </xpath>
</data>
```
Source: [snippets/mrp.oee_tree_view.total_cost.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.oee_tree_view.total_cost.xml)

### X Production Id State  
ID: `mint_system.mrp.oee_tree_view.x_production_id_state`  
```xml
<data inherit_id="mrp.oee_tree_view" priority="50">
    <xpath expr="//field[@name='date_end']" position="after">
        <field optional="show" name="x_production_id_state"/>
    </xpath>
</data>
```
Source: [snippets/mrp.oee_tree_view.x_production_id_state.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.oee_tree_view.x_production_id_state.xml)

### X Workcenter Id Costs Hour  
ID: `mint_system.mrp.oee_tree_view.x_workcenter_id_costs_hour`  
```xml
<data inherit_id="mrp.oee_tree_view" priority="50">
    <xpath expr="//field[@name='workcenter_id']" position="after">
        <field optional="show" name="x_workcenter_id_costs_hour"/>
    </xpath>
</data>
```
Source: [snippets/mrp.oee_tree_view.x_workcenter_id_costs_hour.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.oee_tree_view.x_workcenter_id_costs_hour.xml)

## Report Mrp Production Components  
### Modify Section Consumed Products  
ID: `mint_system.mrp.report_mrp_production_components.modify_section_consumed_products`  
```xml
<data inherit_id="mrp.report_mrp_production_components" priority="50">
    <xpath expr="//table" position="replace">
        <style>
    table#section_consumed_products {
      width: 98%;
      margin: 0 0 10px 10px;
      font-size: 10pt;
      border-color: white;
    }
    table#section_consumed_products th {
      font-size: 10pt;
      font-weight: bold;
      vertical-align: left;
      padding-left: 5px;
      padding-bottom: 5px;
    }
    table#section_consumed_products td {
      vertical-align: top;
      padding-left: 5px;
      padding-bottom: 5px;
      padding-top: 5px;
    }
    table#note {
      width: 100%;
      margin-top: 30px;
      font-size: 14pt;
      padding-left:10px;
      text-align: left;
      border-color: white;
    }
    table#note th {
      padding-bottom: 5px;
    }
    </style>
        <table id="section_consumed_products" t-if="o.move_raw_ids">
            <t t-set="has_product_barcode" t-value="any(m.product_id.barcode for m in o.move_raw_ids)"/>
            <thead>
                <tr style="border-bottom: 1px solid rgb(220,220,220);">
                    <th width="10%" style="text-align: left;">Art. Nr.</th>
                    <th width="31%" style="text-align: left;">Bezeichnung</th>
                    <th width="29%" style="text-align: left;">Typenbezeichnung</th>
                    <th width="20%" style="text-align: right; padding-right: 20px" t-attf-class="{{ 'text-right' if not has_product_barcode else '' }}">Menge</th>
                    <th width="10%" t-if="has_product_barcode" class="text-center">Strichcode</th>
                </tr>
            </thead>
            <body>
                <t t-if="o.move_raw_ids">
                    <tr style="border-bottom: 1px solid rgb(220,220,220); vertical-align: top; font-size: 10pt;" t-foreach="o.move_raw_ids" t-as="raw_line">
                        <td>
                            <span t-field="raw_line.product_id.default_code"/>
                        </td>
                        <td>
                            <span t-field="raw_line.product_id.name"/>
                        </td>
                        <td>
                            <span t-field="raw_line.product_id.type_description"/>
                        </td>
                        <td style="text-align: right; padding-right: 20px" t-attf-class="{{ 'text-right' if not has_product_barcode else '' }}">
                            <span t-field="raw_line.product_uom_qty"/>
                            <span t-field="raw_line.product_uom" groups="uom.group_uom"/>
                        </td>
                        <td t-if="has_product_barcode" width="15%" class="text-center">
                            <t t-if="raw_line.product_id.barcode">
                                <div t-field="raw_line.product_id.barcode" t-options-quiet="0" t-options="{'widget': 'barcode', 'img_style': 'float:right; width:100px; height:35px;'}"/>
                            </t>
                        </td>
                    </tr>
                </t>
            </body>
        </table>
        <table id="note">
            <thead>
                <tr style="border-bottom: 1px solid rgb(220,220,220);">
                    <th>Notiz</th>
                </tr>
            </thead>
            <body>
                <tr style="vertical-align: top; font-size: 10pt;">
                    <td>
                        <span t-field="o.x_note"/>
                    </td>
                </tr>
            </body>
        </table>
    </xpath>
</data>

```
Source: [snippets/mrp.report_mrp_production_components.modify_section_consumed_products.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.report_mrp_production_components.modify_section_consumed_products.xml)

### Remove Barcode  
ID: `mint_system.mrp.report_mrp_production_components.remove_barcode`  
```xml
<data inherit_id="mrp.report_mrp_production_components" priority="50">
    <xpath expr="//th[@t-if='has_product_barcode']" position="replace"/>
    <xpath expr="//td[@t-if='has_product_barcode']" position="replace"/>
</data>

```
Source: [snippets/mrp.report_mrp_production_components.remove_barcode.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.report_mrp_production_components.remove_barcode.xml)

### Replace Title Section To Consume Products  
ID: `mint_system.mrp.report_mrp_production_components.replace_title_section_to_consume_products`  
```xml
<data inherit_id="mrp.report_mrp_production_components" priority="50">
    <xpath expr="//h3" position="replace">
        <style>
      table#consumed_products {
        width:98%;
        margin: 20px 0 10px 10px;
        font-size: 14pt;
        font-weight: bold;
        padding-left: 5px;
        border-color: white;
      }
    </style>
        <table id="consumed_products">
            <tr style="border-bottom: 1px solid rgb(220,220,220);">
                <td style="padding-bottom: 5px">Ben&#xF6;tigte Produkte
        </td>
            </tr>
        </table>
    </xpath>
</data>

```
Source: [snippets/mrp.report_mrp_production_components.replace_title_section_to_consume_products.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.report_mrp_production_components.replace_title_section_to_consume_products.xml)

### Show Expected  
ID: `mint_system.mrp.report_mrp_production_components.show_expected`  
```xml
<data inherit_id="mrp.report_mrp_production_components" priority="50">
    <xpath expr="//span[@t-field='raw_line.product_id']" position="after">
        <t t-if="raw_line.forecast_expected_date">
            <br/>
            <span>Expected date: </span>
            <span t-field="raw_line.forecast_expected_date" t-options="{&quot;widget&quot;: &quot;date&quot;}"/>
            <br/>
        </t>
    </xpath>
</data>

```
Source: [snippets/mrp.report_mrp_production_components.show_expected.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.report_mrp_production_components.show_expected.xml)

### Show Stock  
ID: `mint_system.mrp.report_mrp_production_components.show_stock`  
```xml
<data inherit_id="mrp.report_mrp_production_components" priority="60">
    <xpath expr="//table//tr/th[2]" position="after">
        <th>
            <span>Lagerort (Los) Menge</span>
        </th>
    </xpath>
    <xpath expr="//table//tr/td[2]" position="after">
        <td>
            <span t-foreach="raw_line.move_line_ids" t-as="move_line">
                <span t-field="move_line.location_id.display_name"/>
                <t t-if="move_line.lot_id"> (<span t-field="move_line.lot_id"/>) </t>
                <!-- <span t-field="move_line.reserved_uom_qty"/> -->
                <span t-field="move_line.quantity"/>
                <br/>
            </span>
        </td>
    </xpath>
</data>

```
Source: [snippets/mrp.report_mrp_production_components.show_stock.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.report_mrp_production_components.show_stock.xml)

## Report Mrporder  
### Add Padding  
ID: `mint_system.mrp.report_mrporder.add_padding`  
```xml
<data inherit_id="mrp.report_mrporder" priority="50">
    <xpath expr="/t/t/t/t/div/div[2]" position="attributes">
        <attribute name="style" add="padding-bottom: 2rem"/>
    </xpath>
    <xpath expr="//h3" position="attributes">
        <attribute name="style">padding-top: 2rem</attribute>
    </xpath>
</data>

```
Source: [snippets/mrp.report_mrporder.add_padding.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.report_mrporder.add_padding.xml)

### List Quality Points  
ID: `mint_system.mrp.report_mrporder.list_quality_points`  
```xml
<!-- List quality points in mrp order -->
<data inherit_id="mrp.report_mrporder" priority="50">
    <xpath expr="/t/t/t/t/div/div[5]/table/tr[2]/td[1]/span" position="after">
        <ul>
            <li t-foreach="line2.operation_id.quality_point_ids" t-as="quality_point">
                <span t-field="quality_point.title"/>
            </li>
        </ul>
    </xpath>
</data>

```
Source: [snippets/mrp.report_mrporder.list_quality_points.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.report_mrporder.list_quality_points.xml)

### Modify Section Consumed Products  
ID: `mint_system.mrp.report_mrporder.modify_section_consumed_products`  
```xml
<data inherit_id="mrp.report_mrporder" priority="50">
    <xpath expr="//span[@t-field='o.product_id']/../.." position="after">
        <style>
      table#to_produce {
        width: 100%;
        margin-top: 20px;
        font-size: 10pt;
      }
      table#to_produce th, td {
        padding-left: 5px;
        padding-right: 5px;
      }
    </style>
        <table id="to_produce">
            <tr style="border-bottom: 1px solid rgb(220,220,220);">
                <th width="40%;">
                    <strong>Menge</strong>
                </th>
                <th width="30%;">
                    <strong>Datum</strong>
                </th>
                <th width="30%;"/>
            </tr>
            <tr>
                <td>
                    <strong>
                        <span t-field="o.product_qty"/>
                        <span t-field="o.product_uom_id.name" groups="uom.group_uom"/>
                    </strong>
                </td>
                <td>Start: <span t-field="o.date_planned_start" t-options="{&quot;widget&quot;: &quot;date&quot;}"/></td>
                <td style="text-align: right">
                    <strong>Termin: <span t-field="o.date_planned_finished" t-options="{&quot;widget&quot;: &quot;date&quot;}"/></strong>
                </td>
            </tr>
        </table>
    </xpath>
</data>

```
Source: [snippets/mrp.report_mrporder.modify_section_consumed_products.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.report_mrporder.modify_section_consumed_products.xml)

### Modify Section Operations  
ID: `mint_system.mrp.report_mrporder.modify_section_operations`  
```xml
<data inherit_id="mrp.report_mrporder" priority="50">
    <xpath expr="//div[@t-if='o.workorder_ids']" position="replace">
        <style>
       h3 {
       font-size: 14pt;
       font-weight: bold;
       margin: 20px 0 0 10px;
       }
      .table {
        margin: 0 0 0 10px;
        width: 98%;
      }
      .th {
      border-bottom: 1px solid rgb(220,220,220);
      font-weight: bold;
      padding: 10px 0 5px 0;
      font-size: 11pt;
    }
    .tdline {
      border-bottom: 1px solid rgb(220,220,220);
      font-size: 10pt;
    }
    
    </style>
        <h3>
            <span t-if="o.state == 'done'">Operations Done</span>
            <span t-else="">Operations Planned</span>
        </h3>
        <div t-if="o.workorder_ids" groups="mrp.group_mrp_routings">
            <div>
                <div class="row table th">
                    <div class="col-6">
                        <strong>Operation</strong>
                    </div>
                    <div class="col-2">
                        <strong>WorkCenter</strong>
                    </div>
                    <div class="col-2 text-right">
                        <strong>No. Of Minutes</strong>
                    </div>
                    <div class="col-1 text-center">
                        <strong>IST</strong>
                    </div>
                    <div class="col-1 text-center">
                        <strong>Vis</strong>
                    </div>
                </div>
                <div class="row table tdline" t-foreach="o.workorder_ids" t-as="line2">
                    <div class="col-6">
                        <span t-field="line2.name"/>
                    </div>
                    <div class="col-2">
                        <span t-field="line2.workcenter_id.name"/>
                    </div>
                    <div class="col-2 text-right">
                        <span t-if="o.state != 'done'" t-field="line2.duration_expected"/>
                        <span t-if="o.state == 'done'" t-field="line2.duration"/>
                    </div>
                    <div class="col-1"/>
                    <div class="col-1"/>
                </div>
            </div>
        </div>
    </xpath>
</data>

```
Source: [snippets/mrp.report_mrporder.modify_section_operations.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.report_mrporder.modify_section_operations.xml)

### Modify Section Order Definition  
ID: `mint_system.mrp.report_mrporder.modify_section_order_definition`  
```xml
<data inherit_id="mrp.report_mrporder" priority="50">
    <xpath expr="//span[@t-field='o.product_id']/../.." position="replace">
        <style>
     .table &gt; :not(:first-child) {
      border-top: none;
    }
    .table {
      margin: 0 0 0 10px;
      width: 98%;
    }
    .th {
      border-bottom: 1px solid rgb(220,220,220);
      font-weight: bold;
      padding: 10px 0 5px 0;
      font-size: 11pt;
    }
    .td {
      font-size: 10pt;
    }
    .col-2 {
      padding: 0 0 0 0;
    }
    .col-4 {
      padding: 0 0 0 0;
    }
     .col-6 {
      padding: 0 0 0 0;
    }
    </style>
        <div class="row table th">
            <div class="col-2">
                <span>Produkt</span>
            </div>
            <div class="col-4">
                <span t-field="o.product_id.default_code"/>
            </div>
            <div class="col-6">
                <span>Typenbezeichnung</span>
            </div>
        </div>
        <div class="row table td">
            <div class="col-6">
                <span t-field="o.product_id.name"/>
            </div>
            <div class="col-6">
                <span t-field="o.product_id.type_description"/>
            </div>
        </div>
        <div class="col-3" t-if="o.product_description_variants">
            <strong>Description:</strong>
            <br/>
            <span t-field="o.product_description_variants"/>
        </div>
        <div class="row table th">
            <div class="col-2">
                <span>Menge</span>
            </div>
            <div class="col-4">
      </div>
            <div class="col-6">
                <span>Datum</span>
            </div>
        </div>
        <div class="row table td">
            <div class="col-6">
                <strong>
                    <span t-field="o.product_qty"/>
                </strong>
                <strong>
                    <span t-field="o.product_uom_id.name" groups="uom.group_uom"/>
                </strong>
            </div>
            <div class="col-3">
        Start: <span t-field="o.date_planned_start" t-options="{&quot;widget&quot;: &quot;date&quot;}"/>
      </div>
            <div class="col-3 text-end">
                <strong>Termin: <span t-field="o.date_planned_finished" t-options="{&quot;widget&quot;: &quot;date&quot;}"/>
        </strong>
            </div>
        </div>
    </xpath>
</data>

```
Source: [snippets/mrp.report_mrporder.modify_section_order_definition.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.report_mrporder.modify_section_order_definition.xml)

### Modify Section To Consume Products  
ID: `mint_system.mrp.report_mrporder.modify_section_to_consume_products`  
```xml
<data inherit_id="mrp.report_mrporder" priority="50">
    <xpath expr="//table[@t-if='o.move_raw_ids']" position="replace">
        <style>
    table#section_consumed_products {
      width: 98%;
      margin: 0 0 10px 10px;
      font-size: 10pt;
    }
    table#section_consumed_products th {
      font-size: 10pt;
      font-weight: bold;
      vertical-align: middle;
      padding-left: 5px;
      padding-bottom: 5px;
    }
    table#section_consumed_products td {
      vertical-align: top;
      padding-left: 5px;
      padding-bottom: 5px;
      padding-top: 5px;
    }
    table#note {
      width: 100%;
      margin-top: 30px;
      font-size: 14pt;
      padding-left:10px;
    }
    </style>
        <table id="section_consumed_products" t-if="o.move_raw_ids">
            <t t-set="has_product_barcode" t-value="any(m.product_id.barcode for m in o.move_raw_ids)"/>
            <thead>
                <tr style="border-bottom: 1px solid rgb(220,220,220);">
                    <th width="10%">Art. Nr.</th>
                    <th width="31%">Bezeichnung</th>
                    <th width="29%">Typenbezeichnung</th>
                    <th width="20%" style="text-align: right; padding-right: 20px" t-attf-class="{{ 'text-right' if not has_product_barcode else '' }}">Menge</th>
                    <th width="10%" t-if="has_product_barcode" class="text-center">Strichcode</th>
                </tr>
            </thead>
            <body>
                <t t-if="o.move_raw_ids">
                    <tr style="border-bottom: 1px solid rgb(220,220,220); vertical-align: top; font-size: 10pt;" t-foreach="o.move_raw_ids" t-as="raw_line">
                        <td>
                            <span t-field="raw_line.product_id.default_code"/>
                        </td>
                        <td>
                            <span t-field="raw_line.product_id.name"/>
                        </td>
                        <td>
                            <span t-field="raw_line.product_id.type_description"/>
                        </td>
                        <td style="text-align: right; padding-right: 20px" t-attf-class="{{ 'text-right' if not has_product_barcode else '' }}">
                            <span t-field="raw_line.product_uom_qty"/>
                            <span t-field="raw_line.product_uom" groups="uom.group_uom"/>
                        </td>
                        <td t-if="has_product_barcode" width="15%" class="text-center">
                            <t t-if="raw_line.product_id.barcode">
                                <img t-att-src="'/report/barcode/?type=%s&amp;value=%s&amp;width=%s&amp;height=%s&amp;quiet=0' % ('Code128', raw_line.product_id.barcode, 600, 100)" style="width:100px;height:35px; float:right;" alt="Barcode"/>
                            </t>
                        </td>
                    </tr>
                </t>
            </body>
        </table>
        <table id="note">
            <thead>
                <tr style="border-bottom: 1px solid rgb(220,220,220);">
                    <th>Notiz</th>
                </tr>
            </thead>
            <body>
                <tr style="vertical-align: top; font-size: 10pt;">
                    <td>
                        <span t-field="o.x_note"/>
                    </td>
                </tr>
            </body>
        </table>
    </xpath>
</data>

```
Source: [snippets/mrp.report_mrporder.modify_section_to_consume_products.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.report_mrporder.modify_section_to_consume_products.xml)

### Quality Points  
ID: `mint_system.mrp.report_mrporder.quality_points`  
```xml
<data inherit_id="mrp.report_mrporder" priority="50">

	<xpath expr="//tr[@t-foreach='o.workorder_ids']/td[1]/span" position="after">
		<ul style="list-style-type:none;">
		  <li t-foreach="line2.operation_id.quality_point_ids" t-as="quality_point" style="whitespace: nowrap;">- <span t-field="quality_point.title"/></li>
	  </ul>
    </xpath>

</data>

```
Source: [snippets/mrp.report_mrporder.quality_points.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.report_mrporder.quality_points.xml)

### Remove Barcode  
ID: `mint_system.mrp.report_mrporder.remove_barcode`  
```xml
<data inherit_id="mrp.report_mrporder" priority="50">
    <xpath expr="//span/div[@t-field='o.name']" position="replace"/>
</data>

```
Source: [snippets/mrp.report_mrporder.remove_barcode.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.report_mrporder.remove_barcode.xml)

### Remove Responsible  
ID: `mint_system.mrp.report_mrporder.remove_responsible`  
```xml
<data inherit_id="mrp.report_mrporder" priority="50">
    <xpath expr="//span[@t-field='o.user_id']/../.." position="replace">
</xpath>
</data>

```
Source: [snippets/mrp.report_mrporder.remove_responsible.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.report_mrporder.remove_responsible.xml)

### Replace Title Section To Consume Products  
ID: `mint_system.mrp.report_mrporder.replace_title_section_to_consume_products`  
```xml
<data inherit_id="mrp.report_mrporder" priority="50">
    <xpath expr="//h3[@t-if='o.move_raw_ids']" position="replace">
        <style>
      table#consumed_products {
        width:98%;
        margin: 20px 0 10px 10px;
        font-size: 14pt;
        font-weight: bold;
        padding-left: 5px;
      }
    </style>
        <table id="consumed_products">
            <tr style="border-bottom: 1px solid rgb(220,220,220);">
                <td>Ben&#xF6;tigte Produkte
        </td>
            </tr>
        </table>
    </xpath>
</data>

```
Source: [snippets/mrp.report_mrporder.replace_title_section_to_consume_products.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.report_mrporder.replace_title_section_to_consume_products.xml)

### Show Dest Location  
ID: `mint_system.mrp.report_mrporder.show_dest_location`  
```xml
<data inherit_id="mrp.report_mrporder" priority="50">
    <xpath expr="//div[@class='row mt32 mb32'][1]" position="inside">
        <t t-if="o.finished_move_line_ids">
            <div class="col-3">
                <strong>Destination:</strong>
                <br/>
                <span t-field="o.finished_move_line_ids.location_dest_id.name"/>
            </div>
        </t>
        <t t-elif="o.move_finished_ids">
            <div class="col-3">
                <strong>Destination:</strong>
                <br/>
                <span t-field="o.move_finished_ids.location_dest_id.name"/>
            </div>
        </t>
    </xpath>
</data>

```
Source: [snippets/mrp.report_mrporder.show_dest_location.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.report_mrporder.show_dest_location.xml)

### Show Expected  
ID: `mint_system.mrp.report_mrporder.show_expected`  
```xml
<data inherit_id="mrp.report_mrporder" priority="50">
    <xpath expr="//tr[1]/td[1]/span[1]" position="after">
        <t t-if="raw_line.forecast_expected_date">
            <br/>
            <span>Expected date: </span>
            <span t-field="raw_line.forecast_expected_date" t-options="{&quot;widget&quot;: &quot;date&quot;}"/>
            <br/>
        </t>
    </xpath>
</data>

```
Source: [snippets/mrp.report_mrporder.show_expected.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.report_mrporder.show_expected.xml)

### Show Lot  
ID: `mint_system.mrp.report_mrporder.show_lot`  
```xml
<!-- If lot is not available show forecasted days. -->
<data inherit_id="mrp.report_mrporder" priority="50">
    <xpath expr="/t/t/t/t/div/table/tbody/t/tr/td[1]/span" position="after">
        <t t-if="raw_line.forecast_expected_date">
            <br/>
            <span>Expected date: </span>
            <span t-field="raw_line.forecast_expected_date" t-options="{&quot;widget&quot;: &quot;date&quot;}"/>
            <br/>
        </t>
        <!--
        <span>Qty: </span><span t-field="raw_line.product_uom_qty"/><br/>
        <span>Forecast: </span><span t-field="raw_line.forecast_availability"/><br/>
        <span>Available: </span><span t-field="raw_line.availability"/><br/>
        -->
        <t t-if="len(raw_line.move_line_ids) &gt; 0 and raw_line.move_line_ids[0].lot_id">
            <br/>
            <span>Lot(s): </span>
            <span t-foreach="raw_line.move_line_ids" t-as="move_line">
                <span t-field="move_line.lot_id"/>
            </span>
        </t>
    </xpath>
</data>

```
Source: [snippets/mrp.report_mrporder.show_lot.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.report_mrporder.show_lot.xml)

### Show Lot Producing  
ID: `mint_system.mrp.report_mrporder.show_lot_producing`  
```xml
<data inherit_id="mrp.report_mrporder" priority="60">
    <xpath expr="//div/div[4]/div[1]/span" position="after">
        <span t-if="o.lot_producing_id"><br/>Los: <span t-field="o.lot_producing_id.name"/></span>
    </xpath>
</data>

```
Source: [snippets/mrp.report_mrporder.show_lot_producing.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.report_mrporder.show_lot_producing.xml)

### Show Planned  
ID: `mint_system.mrp.report_mrporder.show_planned`  
```xml
<data inherit_id="mrp.report_mrporder" priority="50">
    <xpath expr="//table/tr[1]/th[2]" position="after">
        <th>
            <strong>Start Date</strong>
        </th>
    </xpath>
    <xpath expr="//table/tr[2]/td[2]" position="after">
        <td>
            <span t-field="line2.date_planned_start"/>
        </td>
    </xpath>
    <xpath expr="//table[1]/tr[2]/td[3]/span[1]" position="attributes">
        <attribute name="t-options-widget">"date"</attribute>
    </xpath>
    <xpath expr="//table/tr[1]/th[3]" position="after">
        <th>
            <strong>End Date</strong>
        </th>
    </xpath>
    <xpath expr="//table/tr[2]/td[3]" position="after">
        <td>
            <span t-field="line2.date_planned_finished"/>
        </td>
    </xpath>
    <xpath expr="//table[1]/tr[2]/td[4]/span[1]" position="attributes">
        <attribute name="t-options-widget">"date"</attribute>
    </xpath>
</data>

```
Source: [snippets/mrp.report_mrporder.show_planned.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.report_mrporder.show_planned.xml)

### Show Put Away Rule Out Location  
ID: `mint_system.mrp.report_mrporder.show_put_away_rule_out_location`  
```xml
<data inherit_id="mrp.report_mrporder" priority="50">
    <xpath expr="//div[@class='row mt32 mb32'][1]" position="inside">
        <t t-set="putaway_rule_id" t-value="o.location_dest_id.putaway_rule_ids.filtered(lambda p: p.product_id == o.product_id)[:1]"/>
        <t t-if="putaway_rule_id">
            <div class="col-3">
                <strong>Einlagerungsort:</strong>
                <br/>
                <span t-field="putaway_rule_id.location_out_id.name"/>
            </div>
        </t>
    </xpath>
</data>

```
Source: [snippets/mrp.report_mrporder.show_put_away_rule_out_location.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.report_mrporder.show_put_away_rule_out_location.xml)

### Show Stock  
ID: `mint_system.mrp.report_mrporder.show_stock`  
```xml
<data inherit_id="mrp.report_mrporder" priority="60">
    <xpath expr="//table/thead/tr/th[2]" position="after">
        <th>
            <span>Lagerort (Los) Menge</span>
        </th>
    </xpath>
    <xpath expr="//table/tbody/t/tr/td[2]" position="after">
        <td>
            <span t-foreach="raw_line.move_line_ids" t-as="move_line">
                <span t-field="move_line.location_id.display_name"/>
                <t t-if="move_line.lot_id"> (<span t-field="move_line.lot_id"/>) </t>
                <!-- <span t-field="move_line.reserved_uom_qty"/> -->
                <span t-field="move_line.quantity"/>
                <br/>
            </span>
        </td>
    </xpath>
</data>

```
Source: [snippets/mrp.report_mrporder.show_stock.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.report_mrporder.show_stock.xml)

### Title With Border  
ID: `mint_system.mrp.report_mrporder.title_with_border`  
```xml
<data inherit_id="mrp.report_mrporder" priority="50">
    <xpath expr="//h2/../.." position="attributes">
        <attribute name="id">title-with-border</attribute>
    </xpath>
    <xpath expr="//h2/../..//div[2]" position="replace">
        <div class="col-5">
            <span t-field="o.name" t-options-quiet="0" t-options="{'widget': 'barcode', 'img_style': 'float:right; width:210px; height:60px;'}"/>
        </div>
    </xpath>
    <xpath expr="//h2/../.." position="before">
        <style>
	    #title-with-border {
	      border: solid 1px;
	      margin-left: 5px;
	      margin-right: 5px;
	    }	    
	      #title-with-border h2 {
	      margin-bottom: 0;
	      padding-top: 15px;
	      padding-left: 15px;
	    }
	    #title-with-border .col-7 {

	    }
       #title-with-border span.text-right {
	      float: right;
	    }
       #title-with-border img {
	      padding-top: 5px;
        padding-bottom: 5px;
	    }
      #title-with-border .col-5 {
	      padding-right: 5px;
	    }
    </style>
    </xpath>
</data>

```
Source: [snippets/mrp.report_mrporder.title_with_border.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.report_mrporder.title_with_border.xml)

## Stock Report Delivery Kit Sections  
### Expand Section Heading  
ID: `mint_system.mrp.stock_report_delivery_kit_sections.expand_section_heading`  
```xml
<data inherit_id="mrp.stock_report_delivery_kit_sections" priority="50">
    <xpath expr="//span[@t-esc='kit.display_name']" position="after"><br/>bestehend aus:       
    </xpath>
</data>

```
Source: [snippets/mrp.stock_report_delivery_kit_sections.expand_section_heading.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.stock_report_delivery_kit_sections.expand_section_heading.xml)

## View Mrp Bom Filter  
### Add Operation Ids  
ID: `mint_system.mrp.view_mrp_bom_filter.add_operation_ids`  
```xml
<data inherit_id="mrp.view_mrp_bom_filter" priority="50">
    <xpath expr="//field[@name='bom_line_ids']" position="after">
        <filter string="Mit Vorg&#xE4;ngen" name="operation" domain="[('operation_ids', '!=', False)]"/>
        <filter string="Ohne Vorg&#xE4;nge" name="operation" domain="[('operation_ids', '=', False)]"/>
    </xpath>
</data>

```
Source: [snippets/mrp.view_mrp_bom_filter.add_operation_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.view_mrp_bom_filter.add_operation_ids.xml)

### Add X Type Description  
ID: `mint_system.mrp.view_mrp_bom_filter.add_x_type_description`  
```xml
<data inherit_id="mrp.view_mrp_bom_filter" priority="50">
    <xpath expr="//field[@name='bom_line_ids']" position="after">
        <field name="x_type_description" string="Typenbezeichnung" filter_domain="[('x_type_description', 'ilike', self)]"/>
    </xpath>
</data>

```
Source: [snippets/mrp.view_mrp_bom_filter.add_x_type_description.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.view_mrp_bom_filter.add_x_type_description.xml)

## View Mrp Document Form  
### Show Public  
ID: `mint_system.mrp.view_mrp_document_form.show_public`  
```xml
<data inherit_id="mrp.view_mrp_document_form" priority="50">
    <field name="url" position="after">
        <field name="public"/>
    </field>
</data>

```
Source: [snippets/mrp.view_mrp_document_form.show_public.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.view_mrp_document_form.show_public.xml)

## View Mrp Production Filter  
### Add Not Planned  
ID: `mint_system.mrp.view_mrp_production_filter.add_not_planned`  
```xml
<data inherit_id="mrp.view_mrp_production_filter" priority="50">
    <xpath expr="//filter[@name='filter_planned']" position="after">
        <filter string="Nicht geplant" name="filter_not_planned" domain="[('is_planned', '!=', True)]" groups="mrp.group_mrp_routings"/>
    </xpath>
</data>

```
Source: [snippets/mrp.view_mrp_production_filter.add_not_planned.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.view_mrp_production_filter.add_not_planned.xml)

### Add Sale Id  
ID: `mint_system.mrp.view_mrp_production_filter.add_sale_id`  
```xml
<data inherit_id="mrp.view_mrp_production_filter" priority="50">
    <xpath expr="//field[@name='name']" position="replace">
        <field name="name" string="Manufacturing Order" filter_domain="['|', '|', ('name', 'ilike', self), ('origin', 'ilike', self), ('sale_id', 'ilike', self)]"/>
        <field name="sale_id"/>
    </xpath>
</data>

```
Source: [snippets/mrp.view_mrp_production_filter.add_sale_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.view_mrp_production_filter.add_sale_id.xml)

## View Mrp Production Work Order Search  
### Add Date Planned Start Set  
ID: `mint_system.mrp.view_mrp_production_work_order_search.add_date_planned_start_set`  
```xml
<data inherit_id="mrp.view_mrp_production_work_order_search" priority="50">
    <xpath expr="//filter[@name='date_start_filter']" position="after">
        <separator/>
        <filter string="Start Date Set" name="start_date_set" domain="[('date_planned_start', '!=', False)]"/>
    </xpath>
</data>

```
Source: [snippets/mrp.view_mrp_production_work_order_search.add_date_planned_start_set.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.view_mrp_production_work_order_search.add_date_planned_start_set.xml)

### Add Material Is Available  
ID: `mint_system.mrp.view_mrp_production_work_order_search.add_material_is_available`  
```xml
<data inherit_id="mrp.view_mrp_production_work_order_search" priority="50">
    <xpath expr="//filter[@name='date_start_filter']" position="after">
        <separator/>
        <filter string="Material is available" name="material_is_available" domain="[('x_reservation_state', '=', 'assigned')]"/>
    </xpath>
</data>

```
Source: [snippets/mrp.view_mrp_production_work_order_search.add_material_is_available.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.view_mrp_production_work_order_search.add_material_is_available.xml)

### Add Product Id  
ID: `mint_system.mrp.view_mrp_production_work_order_search.add_product_id`  
```xml
<data inherit_id="mrp.view_mrp_production_work_order_search" priority="50">
    <xpath expr="//field[@name='workcenter_id']" position="after">
        <field string="Produkt" name="product_id" filter_domain="['|', '|', '|', ('product_id.name', 'like', self), ('product_id.default_code', 'like', self), ('product_id.type_description', 'like', self), ('product_id.type_description2', 'like', self)]"/>
    </xpath>
</data>

```
Source: [snippets/mrp.view_mrp_production_work_order_search.add_product_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.view_mrp_production_work_order_search.add_product_id.xml)

## View Mrp Production Workorder Form View Filter  
### Add Date Planned Start Set  
ID: `mint_system.mrp.view_mrp_production_workorder_form_view_filter.add_date_planned_start_set`  
```xml
<data inherit_id="mrp.view_mrp_production_workorder_form_view_filter" priority="50">
    <xpath expr="//filter[@name='late']" position="after">
        <filter string="Start Date Set" name="start_date_set" domain="[('date_planned_start', '!=', False)]"/>
    </xpath>
</data>

```
Source: [snippets/mrp.view_mrp_production_workorder_form_view_filter.add_date_planned_start_set.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.view_mrp_production_workorder_form_view_filter.add_date_planned_start_set.xml)

### Add Planned  
ID: `mint_system.mrp.view_mrp_production_workorder_form_view_filter.add_planned`  
```xml
<data inherit_id="mrp.view_mrp_production_workorder_form_view_filter" priority="50">
    <xpath expr="//filter[@name='progress']" position="before">
        <filter string="Geplant" name="planned" domain="[('date_planned_start', '!=', False)]" context="{'search_default_planned': 1}"/>
        <filter string="Nicht geplant" name="not_planned" domain="[('date_planned_start', '=', False)]"/>
    </xpath>
</data>

```
Source: [snippets/mrp.view_mrp_production_workorder_form_view_filter.add_planned.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.view_mrp_production_workorder_form_view_filter.add_planned.xml)

### Add Product Id  
ID: `mint_system.mrp.view_mrp_production_workorder_form_view_filter.add_product_id`  
```xml
<data inherit_id="mrp.view_mrp_production_workorder_form_view_filter" priority="50">
    <xpath expr="//field[@name='production_id']" position="after">
        <field string="Produkt" name="product_id" filter_domain="['|', '|', '|', ('product_id.name', 'like', self), ('product_id.default_code', 'like', self), ('product_id.type_description', 'like', self), ('product_id.type_description2', 'like', self)]"/>
    </xpath>
</data>

```
Source: [snippets/mrp.view_mrp_production_workorder_form_view_filter.add_product_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.view_mrp_production_workorder_form_view_filter.add_product_id.xml)

### X Finished Lot Id  
ID: `mint_system.mrp.view_mrp_production_workorder_form_view_filter.x_finished_lot_id`  
```xml
<data inherit_id="mrp.view_mrp_production_workorder_form_view_filter" priority="50">
    <xpath expr="//field[@name='name']" position="before">
        <field name="x_finished_lot_id"/>
    </xpath>
</data>

```
Source: [snippets/mrp.view_mrp_production_workorder_form_view_filter.x_finished_lot_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.view_mrp_production_workorder_form_view_filter.x_finished_lot_id.xml)

## Workcenter Line Kanban  
### Add Date Planned Start  
ID: `mint_system.mrp.workcenter_line_kanban.add_date_planned_start`  
```xml
<data inherit_id="mrp.workcenter_line_kanban" priority="50">
    <xpath expr="//div[@class='o_kanban_workorder_date']/h5" position="replace"/>
    <xpath expr="//div[@class='o_kanban_record_bottom']/h5" position="replace">
        <h5 class="oe_kanban_bottom_left">
            <table>
                <tr>
                    <td>
           Start Datum: <field name="date_planned_start" type="date"/>
        </td>
                </tr>
                <tr style="font-weight: normal;">
                    <td>
                        <span><t t-esc="record.product_id.value"/>, </span>
                        <span>
                            <t t-esc="record.qty_production.value"/>
                            <t t-esc="record.product_uom_id.value"/>
                        </span>
                    </td>
                </tr>
            </table>
        </h5>
    </xpath>
</data>

```
Source: [snippets/mrp.workcenter_line_kanban.add_date_planned_start.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.workcenter_line_kanban.add_date_planned_start.xml)

### Default Order Date Planned Start  
ID: `mint_system.mrp.workcenter_line_kanban.default_order_date_planned_start`  
```xml
<data inherit_id="mrp.workcenter_line_kanban" priority="50">
    <xpath expr="//kanban" position="attributes">
        <attribute name="default_order">date_planned_start</attribute>
    </xpath>
</data>

```
Source: [snippets/mrp.workcenter_line_kanban.default_order_date_planned_start.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mrp.workcenter_line_kanban.default_order_date_planned_start.xml)

