# Web
## Address Layout  
### Format Address Block  
ID: `mint_system.web.address_layout.format_address_block`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.address_layout" priority="50">
    <xpath expr="//t[@t-if='address']" position="replace">
        <t t-if="address">
            <div class="address row">
                <t t-if="information_block">
                    <t t-set="colclass" t-value="'col-5 offset-1'"/>
                    <div name="information_block" class="col-5 offset-1">
                        <t t-raw="information_block"/>
                    </div>
                </t>
            </div>
            <div class="row">
                <div name="address" t-att-class="'col-5 offset-1'">
                    <t t-raw="address"/>
                </div>
            </div>
        </t>
    </xpath>
</data>

```
Source: [snippets/web.address_layout.format_address_block.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.address_layout.format_address_block.xml)

### Repositioning Address Blocks  
ID: `mint_system.web.address_layout.repositioning_address_blocks`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.address_layout" priority="50">
    <xpath expr="//t[@t-if='address']" position="replace">
        <t t-if="address">
            <div class="address row">
                <t t-if="address">
                    <t t-set="colclass" t-value="'col-5 offset-1'"/>
                    <div name="address" class="col-6">
                        <t t-raw="address"/>
                    </div>
                </t>
                <div name="information_block" t-att-class="colclass">
                    <t t-raw="information_block"/>
                </div>
            </div>
        </t>
    </xpath>
</data>

```
Source: [snippets/web.address_layout.repositioning_address_blocks.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.address_layout.repositioning_address_blocks.xml)

## Assets Common  
### Pivot Measure White Space  
ID: `mint_system.web.assets_common.pivot_measure_white_space`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.assets_common" priority="50">
    <xpath expr="." position="inside">
        <style>
            .o_pivot table thead th:not(.o_pivot_header_cell_closed):not(.o_pivot_header_cell_opened):not(.o_pivot_header_cell) {
              white-space: pre-wrap;
            }
        </style>
    </xpath>
</data>

```
Source: [snippets/web.assets_common.pivot_measure_white_space.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.assets_common.pivot_measure_white_space.xml)

### Set Chatter Width  
ID: `mint_system.web.assets_common.set_chatter_width`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.assets_common" priority="50">
    <xpath expr="." position="inside">
        <style>
          @media (min-width: 1534px) {
            .o_FormRenderer_chatterContainer {
              max-width: 600px !important;
            }
          }
        </style>
    </xpath>
</data>

```
Source: [snippets/web.assets_common.set_chatter_width.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.assets_common.set_chatter_width.xml)

### Set Form Width  
ID: `mint_system.web.assets_common.set_form_width`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.assets_common" priority="50">
    <xpath expr="." position="inside">
        <style>
          @media (min-width: 992px) {
          .o_form_view .o_form_sheet_bg &gt; .o_form_sheet {
               max-width: 1450px !important;
            }
          }
    </style>
    </xpath>
</data>

```
Source: [snippets/web.assets_common.set_form_width.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.assets_common.set_form_width.xml)

## Brand Promotion Message  
### Remove  
ID: `mint_system.web.brand_promotion_message.remove`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.brand_promotion_message" priority="50">
    <xpath expr="//t[@name='Brand Promotion Message']" position="replace">
        <t name="Brand Promotion Message" t-name="web.brand_promotion_message"/>
    </xpath>
</data>

```
Source: [snippets/web.brand_promotion_message.remove.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.brand_promotion_message.remove.xml)

## External Layout Bold  
### Add Bank  
ID: `mint_system.web.external_layout_bold.add_bank`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout_bold" priority="50">
    <xpath expr="//span[@t-field='company.report_footer']/../../div[1]" position="attributes">
        <attribute name="class">col-3</attribute>
    </xpath>
    <xpath expr="//span[@t-field='company.report_footer']/../../div[3]" position="replace"/>
    <xpath expr="//span[@t-field='company.report_footer']/../../div[2]" position="after">
        <div class="col-4">
            <div>
                        IBAN: <span t-field="company.partner_id.bank_ids[0].acc_number"/>
      </div>
            <div>
                        BIC: <span t-field="company.partner_id.bank_ids[0].bank_id.bic"/>
      </div>
        </div>
    </xpath>
</data>

```
Source: [snippets/web.external_layout_bold.add_bank.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_bold.add_bank.xml)

### Remove Background Image  
ID: `mint_system.web.external_layout_bold.remove_background_image`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout_bold" priority="50">
    <xpath expr="/t/div[2]" position="replace">
        <div t-attf-class="article o_report_layout_bold o_company_#{company.id}_layout {{  'o_layout_background' if company.layout_background in ['Geometric', 'Custom']  else  '' }}" t-attf-style="background-image: url({{ 'data:image/png;base64,%s' % company.layout_background_image.decode('utf-8') if company.layout_background_image and company.layout_background == 'Custom' else '' }});" t-att-data-oe-model="o and o._name" t-att-data-oe-id="o and o.id" t-att-data-oe-lang="o and o.env.context.get('lang')">
            <t t-call="web.address_layout"/>
            <t t-out="0"/>
        </div>
    </xpath>
</data>

```
Source: [snippets/web.external_layout_bold.remove_background_image.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_bold.remove_background_image.xml)

### Set Header Footer Font Size  
ID: `mint_system.web.external_layout_bold.set_header_footer_font_size`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout_bold" priority="50">
    <xpath expr="/t/div[1]" position="before">
        <style>
      div.footer,
      div.header {
        font-size: 0.9rem;
      }
    </style>
    </xpath>
</data>

```
Source: [snippets/web.external_layout_bold.set_header_footer_font_size.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_bold.set_header_footer_font_size.xml)

## External Layout Boxed  
### Footer Airwork  
ID: `mint_system.web.external_layout_boxed.footer_airwork`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout_boxed" priority="50">
    <xpath expr="//div[@t-attf-class='footer o_boxed_footer o_company_#{company.id}_layout']" position="replace">

        <div t-attf-class="footer o_boxed_footer o_company_#{company.id}_layout">

            <table style="font-size: 11px">
                <tr>
                    <td style="padding-top:7px; width: 200px; text-align: left">AirWork &amp; Heliseilerei GmbH (A&amp;H)</td>
                    <td style="width: 180px; text-align: left">FON +41 41 420 49 64</td>
                    <td style="width: 200px; text-align: left">Bankverbindung: Raiffeisenbank Luzern</td>
                    <td style="width: 220px; text-align: left">IBAN CHF: CH12 8080 8008 9455 6909 9</td>
                </tr>
                <tr>
                    <td>Bahnhofweg 1</td>
                    <td>E-Mail: office(at)air-work.com</td>
                    <td>Schulstrasse 1</td>
                    <td>IBAN EUR (€): CH28 8080 8009 7827 3963 0</td>
                </tr>
                <tr>
                    <td>CH-6405 Immensee</td>
                    <td>UID CHE-113.380.391 MWST</td>
                    <td>CH-6037 Root</td>
                    <td></td>
                </tr>
                <tr>
                    <td>www.air-work.swiss</td>
                    <td></td>
                    <td>SWIFT: RAIFCH22</td>
                    <td></td>
                </tr>
            </table>
        </div>
    </xpath>
</data>
```
Source: [snippets/web.external_layout_boxed.footer_airwork.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_boxed.footer_airwork.xml)

### Footer Company Registry  
ID: `mint_system.web.external_layout_boxed.footer_company_registry`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout_boxed" priority="50">
    <xpath expr="//li[@t-if='company.vat']" position="after">
        <t t-if="company._name != 'base.document.layout'">
            <li t-if="company.company_registry" class="list-inline-item d-inline">CRN: <span t-field="company.company_registry"/>
      </li>
        </t>
    </xpath>
</data>

```
Source: [snippets/web.external_layout_boxed.footer_company_registry.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_boxed.footer_company_registry.xml)

### Hide Company Details  
ID: `mint_system.web.external_layout_boxed.hide_company_details`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout_boxed" priority="50">
    <xpath expr="//div[@name='company_address']/.." position="replace"/>
</data>

```
Source: [snippets/web.external_layout_boxed.hide_company_details.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_boxed.hide_company_details.xml)

### Increase Logo Size  
ID: `mint_system.web.external_layout_boxed.increase_logo_size`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout_boxed" priority="50">
    <xpath expr="//img[@t-if='company.logo']" position="attributes">
        <attribute name="style">width: 720px; margin-top: 10px</attribute>
    </xpath>
</data>

```
Source: [snippets/web.external_layout_boxed.increase_logo_size.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_boxed.increase_logo_size.xml)

## External Layout Standard  
### Eksb Layout  
ID: `mint_system.web.external_layout_standard.eksb_layout`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout_standard" priority="50">
    <xpath expr="/t/div" position="replace">
        <div t-attf-class="header o_company_#{company.id}_layout" t-att-style="report_header_style">
            <div class="row">
                <div class="col-3">
                    <img t-if="company.logo" t-att-src="image_data_uri(company.logo)" style="max-height: 150px;" alt="Logo"/>
                </div>
                <div class="col-9" name="company_address">
                    <style>
            #header-info {
                border-top: black 3px solid;
                border-bottom: black 3px solid;
                font-size: 0.9rem;
                margin-right: 15px;
            }
            div.company {
              word-wrap: normal;
              text-transform: uppercase;
            }
          </style>
                    <div class="row" style="height: 50px">
          </div>
                    <div id="header-info" class="row">
                        <div class="col-3 company">
                            <span class="o_bold">Kleinbrauerei<br/>Sti&#xE4;r Bi&#xE4;r AG</span>
                        </div>
                        <div class="col-1"/>
                        <div class="col-4">
                            <span t-field="company.partner_id.street"/>
                            <br/>
                            <span t-field="company.partner_id.zip"/>
                            <span t-field="company.partner_id.city"/>
                        </div>
                        <div class="col-4">
                            <span t-field="company.partner_id.phone"/>
                            <br/>
                            <span t-field="company.partner_id.email"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </xpath>
</data>

```
Source: [snippets/web.external_layout_standard.eksb_layout.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_standard.eksb_layout.xml)

### Footer Company Registry  
ID: `mint_system.web.external_layout_standard.footer_company_registry`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout_standard" priority="50">
    <xpath expr="//li[@t-if='company.vat']" position="after">
        <t t-if="company._name != 'base.document.layout'">
            <li t-if="company.company_registry" class="list-inline-item d-inline">CRN: <span t-field="company.company_registry"/>
      </li>
        </t>
    </xpath>
</data>

```
Source: [snippets/web.external_layout_standard.footer_company_registry.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_standard.footer_company_registry.xml)

### Format Header Slogan  
ID: `mint_system.web.external_layout_standard.format_header_slogan`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout_standard" priority="50">
    <xpath expr="//div[@name='moto']" position="replace">
        <style>
      h4 {
        /* align-self: center; */
        padding-top: 2rem;
      }
    </style>
        <h4 class="col-9 text-right" t-field="company.report_header" name="moto"/>
    </xpath>
</data>

```
Source: [snippets/web.external_layout_standard.format_header_slogan.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_standard.format_header_slogan.xml)

### Header Styles  
ID: `mint_system.web.external_layout_standard.header_styles`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout_standard" priority="50">
    <xpath expr="/t/div" position="before">
        <style>
        h2 {
          font-size: 18px;
        }                              
    </style>
    </xpath>
</data>

```
Source: [snippets/web.external_layout_standard.header_styles.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_standard.header_styles.xml)

### Hide Header  
ID: `mint_system.web.external_layout_standard.hide_header`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout_standard" priority="50">
    <xpath expr="/t/div" position="replace"/>
</data>

```
Source: [snippets/web.external_layout_standard.hide_header.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_standard.hide_header.xml)

### Increase Logo Size  
ID: `mint_system.web.external_layout_standard.increase_logo_size`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout_standard" priority="50">
    <xpath expr="//img[@t-if='company.logo']" position="attributes">
        <!-- <attribute name="style">max-height: 90px;</attribute> -->
        <attribute name="style">max-width: 250px; margin-top: 10px</attribute>
    </xpath>
</data>

```
Source: [snippets/web.external_layout_standard.increase_logo_size.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_standard.increase_logo_size.xml)

### Move Company Details  
ID: `mint_system.web.external_layout_standard.move_company_details`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout_standard" priority="50">
    <xpath expr="//div[@class='row'][2]" position="replace"/>
    <xpath expr="//div[@name='moto']" position="replace">
        <div class="col-6 text-right" style="margin-top:22px;" t-field="company.report_header" name="moto"/>
        <div class="col-3" name="company_address">
            <span t-if="company.company_details" t-field="company.company_details"/>
        </div>
    </xpath>
</data>

```
Source: [snippets/web.external_layout_standard.move_company_details.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_standard.move_company_details.xml)

### Remove Company Info Footer  
ID: `mint_system.web.external_layout_standard.remove_company_info_footer`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout_standard" priority="50">
    <xpath expr="//div[@name='financial_infos']/../ul[1]" position="replace">
  </xpath>
</data>

```
Source: [snippets/web.external_layout_standard.remove_company_info_footer.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_standard.remove_company_info_footer.xml)

### Remove Contact  
ID: `mint_system.web.external_layout_standard.remove_contact`  
```xml
<?xml version="1.0"?>
<!-- Remove contact info in footer -->
<data inherit_id="web.external_layout_standard" priority="50">
    <!-- Works until Odoo 14.0 -->
    <xpath expr="//li[@t-if='company.phone']" position="replace">
  </xpath>
    <xpath expr="//li[@t-if='company.email']" position="replace">
  </xpath>
</data>

```
Source: [snippets/web.external_layout_standard.remove_contact.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_standard.remove_contact.xml)

### Remove Footer Line  
ID: `mint_system.web.external_layout_standard.remove_footer_line`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout_standard" priority="50">
    <div style="border-top: 1px solid black;" position="attributes">
        <attribute name="style"/>
    </div>
</data>

```
Source: [snippets/web.external_layout_standard.remove_footer_line.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_standard.remove_footer_line.xml)

### Remove Header Address  
ID: `mint_system.web.external_layout_standard.remove_header_address`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout_standard" priority="50">
    <xpath expr="//div[@name='company_address']" position="replace">
  </xpath>
</data>

```
Source: [snippets/web.external_layout_standard.remove_header_address.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_standard.remove_header_address.xml)

### Remove Header Space  
ID: `mint_system.web.external_layout_standard.remove_header_space`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout_standard" priority="50">
    <xpath expr="//div[hasclass('pt-5')]" position="attributes">
        <attribute name="class"/>
    </xpath>
</data>

```
Source: [snippets/web.external_layout_standard.remove_header_space.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_standard.remove_header_space.xml)

### Remove Paging  
ID: `mint_system.web.external_layout_standard.remove_paging`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout_standard" priority="50">
    <div t-if="report_type == 'pdf'" position="replace"/>
</data>

```
Source: [snippets/web.external_layout_standard.remove_paging.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_standard.remove_paging.xml)

### Replace Footer  
ID: `mint_system.web.external_layout_standard.replace_footer`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout_standard" priority="50">
    <xpath expr="/t/div[3]" position="replace">
        <div t-attf-class="footer o_standard_footer o_company_#{company.id}_layout">
            <div align="right" style="color:black; font-size:9pt">
         Page: <span class="page"/>
 /      <span class="topage"/>
    </div>
        </div>
        <!--
    <div t-attf-class="footer o_standard_footer o_company_#{company.id}_layout">
      <div align="right">
         Seite: <span class="page"/>
 /      <span class="topage"/>
      </div>
    </div>
    -->
    </xpath>
</data>
<!--
<data inherit_id="web.external_layout_standard" priority="50">

<xpath expr="/t/div[3]" position="replace">

  <div t-attf-class="footer o_standard_footer o_company_#{company.id}_layout">

    <style>
        
       .footer_table {
            width: 80%;
            font-size: 9pt;
            white-space: nowrap;
            margin: 0 auto;
            }
        .footer_table span {
            margin-right: 0px;
            }
       .footer_table th {
            font-weight: bold;
            }
    </style>

    <table class="footer_table" style="width: 85%;">
      <tr>
        <td>
          <span style="font-weight: bold" t-field="company.partner_id"/>
        </td>
        <td>
          <span t-field="company.street"/>,
        </td>
        <td>
          <span t-field="company.zip"/>
        </td>
        <td>
          <span t-field="company.city"/>
        </td>
        <th>Bank: </th>
        <td>
          <span t-field="company.partner_id.bank_ids.bank_name"/>
        </td>
        <th>Account Owner:</th>
        <td>
          <span t-field="company.partner_id.bank_ids.partner_id"/>
        </td>
      </tr>
    </table>
    <table class="footer_table" style="width: 90%;">
      <tr>
        <th>BIC:</th>
        <td>
          <span t-field="company.partner_id.bank_ids.bank_id.bic"/>
        </td>
        <th>IBAN:</th>
        <td>
              CH48 0900 0000 1537 2934 4
        </td>
        <th>VAT no.:</th>
        <td>
          <span t-field="company.company_registry"/>
        </td>
        <th>VAT identification number:</th>
        <td>
              DE355924262
        </td>
      </tr>
    </table>

  </div>

</xpath>

</data>
-->

```
Source: [snippets/web.external_layout_standard.replace_footer.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_standard.replace_footer.xml)

### Replace Header With Image  
ID: `mint_system.web.external_layout_standard.replace_header_with_image`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout_standard" priority="50">
    <xpath expr="/t/div" position="replace">
        <div t-attf-class="header o_company_#{company.id}_layout" t-att-style="report_header_style">
            <div class="row">
                <div class="col-12">
                    <img t-if="company.logo" t-att-src="'/web/image/1107'" style="width: 100%;" alt="Logo"/>
                </div>
                <div class="col-9 text-end" style="margin-top:22px;" t-field="company.report_header" name="moto"/>
            </div>
            <!-- <div class="row zero_min_height">
                <div class="col-12">
                    <div style="border-bottom: 1px solid black;" />
                </div>
            </div> -->
        </div>
    </xpath>
</data>

```
Source: [snippets/web.external_layout_standard.replace_header_with_image.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_standard.replace_header_with_image.xml)

### Replace Header  
ID: `mint_system.web.external_layout_standard.replace_header`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout_standard" priority="50">
    <xpath expr="/t/div" position="replace">
        <div t-attf-class="header o_company_#{company.id}_layout" t-att-style="report_header_style">
            <table style="width:100%; font-size: 9pt; color:rgb(102,102,102); border-color: white; font-family:arial;">
                <tr height="27px;">
                    <td style="width:19%; border-left: 1px solid rgb(102,102,102);"/>
                    <td style="width:18%; border-left: 1px solid rgb(102,102,102);"/>
                    <td style="width:25%; border-left: 1px solid rgb(102,102,102);"/>
                    <td style="width:38%; margin: 0; vertical-align:bottom; padding:0;" rowspan="4">
                        <img t-if="company.logo" t-att-src="image_data_uri(company.logo)" alt="Logo" style="height:61px; float:right"/>
                    </td>
                </tr>
                <tr style="line-height: 1.2;">
                    <td style="border-left: 1px solid rgb(102,102,102); padding-left: 10px;">
                        <span t-field="company.name"/>
                    </td>
                    <td style="border-left: 1px solid rgb(102,102,102);"/>
                    <td style="border-left: 1px solid rgb(102,102,102);"/>
                </tr>
                <tr style="line-height: 1.2;">
                    <td style="border-left: 1px solid rgb(102,102,102); padding-left: 10px;">
                        <span t-field="company.partner_id.street"/>
                    </td>
                    <td style="border-left: 1px solid rgb(102,102,102); padding-left: 10px;">Tel. 056 618 77 00</td>
                    <td style="border-left: 1px solid rgb(102,102,102); padding-left: 10px;">www.trimada.ch</td>
                </tr>
                <tr style="line-height: 1.2;">
                    <td style="border-left: 1px solid rgb(102,102,102); padding-left: 10px;">CH-<span t-field="company.partner_id.zip"/>
                    <span t-field="company.partner_id.city"/>
                </td>
                    <td style="border-left: 1px solid rgb(102,102,102); padding-left: 10px;">Fax 056 618 77 07</td>
                    <td style="border-left: 1px solid rgb(102,102,102); padding-left: 10px;">
                        <span t-field="company.partner_id.email"/>
                    </td>
                </tr>
            </table>
        </div>
    </xpath>
</data>

```
Source: [snippets/web.external_layout_standard.replace_header.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_standard.replace_header.xml)

### Replace Url  
ID: `mint_system.web.external_layout_standard.replace_url`  
```xml
<?xml version="1.0"?>
<!-- Replace website url in document footer -->
<data inherit_id="web.external_layout_standard" priority="50">
    <!-- Works until Odoo 14.0 -->
    <xpath expr="//li[@t-if='company.website']" position="replace">
        <li t-if="company.website" class="list-inline-item d-inline">www.example.ch</li>
    </xpath>
</data>

```
Source: [snippets/web.external_layout_standard.replace_url.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_standard.replace_url.xml)

### Set Header Footer Font Size  
ID: `mint_system.web.external_layout_standard.set_header_footer_font_size`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout_standard" priority="50">
    <!-- <xpath expr="/t/div[1]" position="before">
    <style>
      div.footer,
      div.header {
      font-size: 0.8rem;
      }
    </style>
  </xpath> -->
    <xpath expr="//div[@t-field='company.report_footer']" position="replace">
        <div style="font-size: 0.8rem;" class="mt-1" t-field="company.report_footer"/>
    </xpath>
    <xpath expr="//div[@t-field='company.report_footer']/../../div" position="replace">
        <div t-if="report_type == 'pdf'" style="font-size: 0.8rem;" class="text-muted">
      Page: <span class="page"/> / <span class="topage"/>
    </div>
    </xpath>
    <xpath expr="//span[@t-field='company.company_details']" position="replace">
        <span t-if="company.company_details" style="font-size: 0.8rem;" t-field="company.company_details"/>
    </xpath>
</data>

```
Source: [snippets/web.external_layout_standard.set_header_footer_font_size.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_standard.set_header_footer_font_size.xml)

### Show Sale Order In Footer  
ID: `mint_system.web.external_layout_standard.show_sale_order_in_footer`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout_standard" priority="50">
    <xpath expr="//div[3]/div[1]" position="before">
        <span t-if="xmlid == 'sale.report_saleorder'"/>
    </xpath>
</data>

```
Source: [snippets/web.external_layout_standard.show_sale_order_in_footer.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_standard.show_sale_order_in_footer.xml)

### Style Header  
ID: `mint_system.web.external_layout_standard.style_header`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout_standard" priority="50">
    <xpath expr="//div[@class='col-12'][1]/div[1]" position="attributes">
        <attribute name="style">border-bottom: 0px ;</attribute>
    </xpath>
</data>

```
Source: [snippets/web.external_layout_standard.style_header.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_standard.style_header.xml)

### Tissa Layout  
ID: `mint_system.web.external_layout_standard.tissa_layout`  
```xml
<?xml version="1.0"?>
<t t-name="web.external_layout_standard">
    <div t-attf-class="header o_company_#{company.id}_layout" t-att-style="report_header_style">
        <div class="row">
            <div class="col-3 mb4">
                <img t-if="company.logo" t-att-src="image_data_uri(company.logo)" style="max-height: 45px;" alt="Logo"/>
            </div>
            <div class="col-9 text-right" style="margin-top:22px;" t-field="company.report_header" name="moto"/>
        </div>
        <div t-if="company.logo or company.report_header" class="row zero_min_height">
            <div class="col-12">
                <div style="border-bottom: 1px solid black;"/>
            </div>
        </div>
        <div class="row">
            <div class="col-6" name="company_address">
                <div t-field="company.partner_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: true}"/>
            </div>
        </div>
    </div>
    <div t-attf-class="article o_report_layout_standard o_company_#{company.id}_layout" t-att-data-oe-model="o and o._name" t-att-data-oe-id="o and o.id" t-att-data-oe-lang="o and o.env.context.get('lang')">
        <div class="pt-5">
            <!-- This div ensures that the address is not cropped by the header. -->
            <t t-call="web.address_layout"/>
        </div>
        <t t-raw="0"/>
    </div>
    <div t-attf-class="footer o_standard_footer o_company_#{company.id}_layout">
        <div class="text-center" style="border-top: 1px solid black;">
            <ul class="list-inline mb4">
                <!-- using the list-inline-item class from bootstrap causes weird behaviours in pdf report
                         adding d-inline class fixes the problem-->
                <li t-if="company.phone" class="list-inline-item d-inline">
                    <span class="o_force_ltr" t-field="company.phone"/>
                </li>
                <li t-if="company.email" class="list-inline-item d-inline">
                    <span t-field="company.email"/>
                </li>
                <li t-if="company.website" class="list-inline-item d-inline">
                    <span t-field="company.website"/>
                </li>
                <li t-if="company.vat" class="list-inline-item d-inline"><t t-esc="company.country_id.vat_label or 'Tax ID'"/>: <span t-field="company.vat"/></li>
            </ul>
            <div name="financial_infos">
                <span t-field="company.report_footer"/>
            </div>
            <div t-if="report_type == 'pdf'" class="text-muted">
                    Page: <span class="page"/> / <span class="topage"/>
                </div>
        </div>
    </div>
</t>

```
Source: [snippets/web.external_layout_standard.tissa_layout.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout_standard.tissa_layout.xml)

## External Layout  
### Worksheet  
ID: `mint_system.web.external_layout.worksheet`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.external_layout" priority="50">
    <t t-name="web.external_layout.worksheet">
        <t t-if="not o" t-set="o" t-value="doc"/>
        <t t-if="not company">
            <!-- Multicompany -->
            <t t-if="company_id">
                <t t-set="company" t-value="company_id"/>
            </t>
            <t t-elif="o and 'company_id' in o and o.company_id.sudo()">
                <t t-set="company" t-value="o.company_id.sudo()"/>
            </t>
            <t t-else="else">
                <t t-set="company" t-value="res_company"/>
            </t>
        </t>
        <div t-attf-class="article">
            <t t-out="0"/>
        </div>
        <div t-attf-class="footer o_standard_footer o_company_#{company.id}_layout">
            <div align="right">
         Page: <span class="page"/>
 /            <span class="topage"/>
        </div>
        </div>
    </t>
</data>

```
Source: [snippets/web.external_layout.worksheet.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.external_layout.worksheet.xml)

## Internal Layout  
### Header Styles  
ID: `mint_system.web.internal_layout.header_styles`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.internal_layout" priority="50">
    <xpath expr="/t/div" position="before">
        <style>
        h2 {
          font-size: 18px;
        }                              
    </style>
    </xpath>
</data>

```
Source: [snippets/web.internal_layout.header_styles.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.internal_layout.header_styles.xml)

### Replace Header  
ID: `mint_system.web.internal_layout.replace_header`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.internal_layout" priority="50">
    <xpath expr="//div[@class='header']" position="replace">
        <div class="header">
            <div class="row">
                <div class="col-4">
                </div>
                <div class="col-4 text-center">
                </div>
                <div class="col-4 text-right">
                    <img t-if="company.logo" t-att-src="image_data_uri(company.logo)" alt="Logo" style="height:61px; margin-right: 40px;"/>
                </div>
            </div>
        </div>
    </xpath>
</data>

```
Source: [snippets/web.internal_layout.replace_header.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.internal_layout.replace_header.xml)

### Trimada  
ID: `mint_system.web.internal_layout.trimada`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.internal_layout" priority="16">
    <t t-name="web.internal_layout.trimada">
        <t t-if="not o" t-set="o" t-value="doc"/>
        <t t-if="not company">
            <!-- Multicompany -->
            <t t-if="company_id">
                <t t-set="company" t-value="company_id"/>
            </t>
            <t t-elif="o and 'company_id' in o and o.company_id.sudo()">
                <t t-set="company" t-value="o.company_id.sudo()"/>
            </t>
            <t t-else="else">
                <t t-set="company" t-value="res_company"/>
            </t>
        </t>
        <div class="header trimada">
            <div class="row">
                <div class="col-3">
                    <span t-esc="context_timestamp(datetime.datetime.now()).strftime('%Y-%m-%d %H:%M')"/>
                </div>
                <div class="col-2 offset-2 text-center">
                    <span t-esc="company.name"/>
                </div>
                <div class="col-2 offset-3 text-right">
                    <ul class="list-inline">
                        <li class="list-inline-item">
                            <span class="page"/>
                        </li>
                        <li class="list-inline-item">/</li>
                        <li class="list-inline-item">
                            <span class="topage"/>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="article" t-att-data-oe-model="o and o._name" t-att-data-oe-id="o and o.id" t-att-data-oe-lang="o and o.env.context.get('lang')">
            <t t-raw="0"/>
        </div>
    </t>
</data>

```
Source: [snippets/web.internal_layout.trimada.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.internal_layout.trimada.xml)

## Layout  
### Color Navbar  
ID: `mint_system.web.layout.color_navbar`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.layout" priority="50">
    <!-- The id's of the companies have to be adjusted -->
    <xpath expr="//body" position="inside">
        <t t-if="request.httprequest.cookies.get('cids') and request.httprequest.cookies.get('cids')[0] == '1'">
            <style>.o_main_navbar {background-color: #57596F!important;border-bottom: 0px;}</style>
        </t>
        <t t-if="request.httprequest.cookies.get('cids') and request.httprequest.cookies.get('cids')[0] == '4'">
            <style>.o_main_navbar {background-color: #6B3C3C!important;border-bottom: 0px;}</style>
        </t>
    </xpath>
</data>

```
Source: [snippets/web.layout.color_navbar.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.layout.color_navbar.xml)

## Login Layout  
### Disable Footer  
ID: `mint_system.web.login_layout.disable_footer`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.login_layout" priority="50">
    <xpath expr="//t/div" position="before">
        <t t-set="disable_footer" t-value="True"/>
    </xpath>
</data>

```
Source: [snippets/web.login_layout.disable_footer.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.login_layout.disable_footer.xml)

## Login  
### Remove Login Form  
ID: `mint_system.web.login.remove_login_form`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.login" priority="50">
    <xpath expr="//form/div[1]" position="attributes">
        <attribute name="t-if">'debug=1' in request.httprequest.url</attribute>
    </xpath>
    <xpath expr="//form/div[2]" position="attributes">
        <attribute name="t-if">'debug=1' in request.httprequest.url</attribute>
    </xpath>
    <xpath expr="//form/div[3]" position="attributes">
        <attribute name="t-if">'debug=1' in request.httprequest.url</attribute>
    </xpath>
    <xpath expr="//form/div/button[1]" position="attributes">
        <attribute name="t-if">'debug=1' in request.httprequest.url</attribute>
    </xpath>
    <xpath expr="//button[@type='submit']/../div[1]" position="attributes">
        <attribute name="t-if">'debug=1' in request.httprequest.url</attribute>
    </xpath>
    <xpath expr="//form/div/t/button[1]" position="attributes">
        <attribute name="t-if">'debug=1' in request.httprequest.url</attribute>
    </xpath>
    <xpath expr="//form" position="before">
        <style>
      .d-block {display: none !important;}
    </style>
    </xpath>
</data>

```
Source: [snippets/web.login.remove_login_form.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.login.remove_login_form.xml)

## Styles Company Report  
### Set Font  
ID: `mint_system.web.styles_company_report.set_font`  
```xml
<?xml version="1.0"?>
<data inherit_id="web.styles_company_report" priority="50">
    <xpath expr="//t[@t-set='font']" position="replace">
        <t t-set="font" t-value="'arial'"/>
    </xpath>
</data>

```
Source: [snippets/web.styles_company_report.set_font.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/web.styles_company_report.set_font.xml)

