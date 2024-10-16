# L10n Ch
## Isr Invoice Form  
### Disable Print Buttons  
ID: `mint_system.l10n_ch.isr_invoice_form.disable_print_buttons`  
```xml
<?xml version="1.0"?>
<data inherit_id="l10n_ch.isr_invoice_form" priority="50">
    <button name="print_ch_qr_bill" position="replace"/>
    <button id="l10n_ch_btn_isr_print_highlight" position="replace"/>
    <button id="btn_isr_print_normal" position="replace"/>
</data>

```
Source: [snippets/l10n_ch.isr_invoice_form.disable_print_buttons.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/l10n_ch.isr_invoice_form.disable_print_buttons.xml)

## L10n Ch Swissqr Template  
### Add Title Padding  
ID: `mint_system.l10n_ch.l10n_ch_swissqr_template.add_title_padding`  
```xml
<?xml version="1.0"?>
<data inherit_id="l10n_ch.l10n_ch_swissqr_template" priority="50">
    <xpath expr="//div[@class='swissqr_page_title']" position="before">
        <style>
          .swissqr_page_title {
            padding-top: 200px;
          }
          </style>
    </xpath>
</data>

```
Source: [snippets/l10n_ch.l10n_ch_swissqr_template.add_title_padding.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/l10n_ch.l10n_ch_swissqr_template.add_title_padding.xml)

### Format Country Code  
ID: `mint_system.l10n_ch.l10n_ch_swissqr_template.format_country_code`  
```xml
<data inherit_id="l10n_ch.l10n_ch_swissqr_template" priority="50">
    <xpath expr="//div[@id='receipt_indication_zone']//span[@t-field='o.company_id.country_id.code']" position="replace">
        <span if="o.company_id.country_id.code != 'CH'" t-field="o.company_id.country_id.code"/>
    </xpath>
    <xpath expr="//div[@id='receipt_indication_zone']//span[@t-field='o.partner_id.country_id.code']" position="replace">
        <span if="o.partner_id.country_id.code != 'CH'" t-field="o.partner_id.country_id.code"/>
    </xpath>
    <xpath expr="//div[@id='indications_zone']//span[@t-field='o.company_id.country_id.code']" position="replace">
        <span if="o.company_id.country_id.code != 'CH'" t-field="o.company_id.country_id.code"/>
    </xpath>
    <xpath expr="//div[@id='indications_zone']//span[@t-field='o.partner_id.country_id.code']" position="replace">
        <span if="o.partner_id.country_id.code != 'CH'" t-field="o.partner_id.country_id.code"/>
    </xpath>
</data>

```
Source: [snippets/l10n_ch.l10n_ch_swissqr_template.format_country_code.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/l10n_ch.l10n_ch_swissqr_template.format_country_code.xml)

### Format Street  
ID: `mint_system.l10n_ch.l10n_ch_swissqr_template.format_street`  
```xml
<?xml version="1.0"?>
<data inherit_id="l10n_ch.l10n_ch_swissqr_template" priority="50">

    <xpath expr="//div[@id='indications_zone']//span[@t-field='o.partner_id.street']" position="replace" />
    <xpath expr="//div[@id='indications_zone']//span[@t-field='o.partner_id.street2']" position="replace">
        <span t-field="o.partner_id.street2" /><br t-if="o.partner_id.street2" />
        <span t-if="o.partner_id.street3" t-field="o.partner_id.street3" /><br t-if="o.partner_id.street3" />
        <span t-if="o.partner_id.street" t-field="o.partner_id.street" />
    </xpath>

    <xpath expr="//div[@id='receipt_indication_zone']//span[@t-field='o.partner_id.street']" position="replace" />
    <xpath expr="//div[@id='receipt_indication_zone']//span[@t-field='o.partner_id.street2']" position="replace">
        <span t-if="o.partner_id.street2" t-field="o.partner_id.street2" /><br t-if="o.partner_id.street2" />
        <span t-if="o.partner_id.street3" t-field="o.partner_id.street3" /><br t-if="o.partner_id.street3" />
        <span t-if="o.partner_id.street" t-field="o.partner_id.street" />
    </xpath>

</data>

```
Source: [snippets/l10n_ch.l10n_ch_swissqr_template.format_street.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/l10n_ch.l10n_ch_swissqr_template.format_street.xml)

### Modify Header Style  
ID: `mint_system.l10n_ch.l10n_ch_swissqr_template.modify_header_style`  
```xml
<?xml version="1.0"?>
<data inherit_id="l10n_ch.l10n_ch_swissqr_template" priority="50">
    <xpath expr="//t[@t-set='report_header_style']" position="replace">
        <t t-set="report_header_style">padding-top:6.2mm; padding-left:23mm; padding-right:8.2mm;</t>
    </xpath>
</data>

```
Source: [snippets/l10n_ch.l10n_ch_swissqr_template.modify_header_style.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/l10n_ch.l10n_ch_swissqr_template.modify_header_style.xml)

### Remove Title Prefix  
ID: `mint_system.l10n_ch.l10n_ch_swissqr_template.remove_title_prefix`  
```xml
<?xml version="1.0"?>
<data inherit_id="l10n_ch.l10n_ch_swissqr_template" priority="50">
    <xpath expr="//h1" position="replace">
        <h1 style="padding-left:8.2mm;" t-esc="o.name"/>
    </xpath>
</data>

```
Source: [snippets/l10n_ch.l10n_ch_swissqr_template.remove_title_prefix.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/l10n_ch.l10n_ch_swissqr_template.remove_title_prefix.xml)

### Replace Commercial Partner  
ID: `mint_system.l10n_ch.l10n_ch_swissqr_template.replace_commercial_partner`  
```xml
<data inherit_id="l10n_ch.l10n_ch_swissqr_template" priority="50">
    <xpath expr="//div[@id='receipt_indication_zone']//span[@t-field='o.partner_id.commercial_partner_id.name']" position="replace">
        <span t-esc="o.partner_id.name or o.partner_id.parent_id.name"/>
    </xpath>
    <xpath expr="//div[@id='indications_zone']//span[@t-field='o.partner_id.commercial_partner_id.name']" position="replace">
        <span t-esc="o.partner_id.name or o.partner_id.parent_id.name"/>
    </xpath>
</data>
```
Source: [snippets/l10n_ch.l10n_ch_swissqr_template.replace_commercial_partner.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/l10n_ch.l10n_ch_swissqr_template.replace_commercial_partner.xml)

### Replace Title  
ID: `mint_system.l10n_ch.l10n_ch_swissqr_template.replace_title`  
```xml
<?xml version="1.0"?>
<data inherit_id="l10n_ch.l10n_ch_swissqr_template" priority="50">
    <xpath expr="//h1" position="replace">
        <style>
          .trimada {
               font-size: 9pt;
               font-family: arial;
               color: black;
               margin-left: 25mm;
               width: 200mm;
          }
          .name {
               font-size: 13pt;
          }
     </style>
        <div class="trimada" t-field="o.partner_invoice_id" t-options="{&quot;widget&quot;: &quot;contact&quot;, &quot;fields&quot;: [&quot;address&quot;, &quot;name&quot;], &quot;no_marker&quot;: True}"/>
        <br/>
        <br/>
        <br/>
        <span class="trimada name">Rechnung <t t-esc="o.name"/></span>
        <br/>
        <span class="trimada">Rechnungsdatum: <t t-options="{&quot;widget&quot;: &quot;date&quot;}" t-esc="o.invoice_date"/></span>
        <br/>
    </xpath>
</data>

```
Source: [snippets/l10n_ch.l10n_ch_swissqr_template.replace_title.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/l10n_ch.l10n_ch_swissqr_template.replace_title.xml)

### Set Additional Information  
ID: `mint_system.l10n_ch.l10n_ch_swissqr_template.set_additional_information`  
```xml
<?xml version="1.0"?>
<data inherit_id="l10n_ch.l10n_ch_swissqr_template" priority="50">
    <t t-set="additional_info" position="replace">
        <t t-set="additional_info" t-value="o.name"/>
    </t>
</data>

```
Source: [snippets/l10n_ch.l10n_ch_swissqr_template.set_additional_information.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/l10n_ch.l10n_ch_swissqr_template.set_additional_information.xml)

### Style Moser  
ID: `mint_system.l10n_ch.l10n_ch_swissqr_template.style_moser`  
```xml
<?xml version="1.0"?>
<data inherit_id="l10n_ch.l10n_ch_swissqr_template" priority="60">
    <xpath expr="//div[hasclass('swissqr_page_title')]" position="before">
        <style>
      .swissqr_receipt {
      border-top-style: none !important;
      }
      .swissqr_body {
      border-top-style: none !important;
      border-left-style: none !important;
      }
    </style>
    </xpath>
    <xpath expr="//img[@class='scissors vertical_scissors']" position="replace"/>
    <xpath expr="//img[@class='scissors horizontal_scissors']" position="replace"/>
</data>

```
Source: [snippets/l10n_ch.l10n_ch_swissqr_template.style_moser.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/l10n_ch.l10n_ch_swissqr_template.style_moser.xml)

