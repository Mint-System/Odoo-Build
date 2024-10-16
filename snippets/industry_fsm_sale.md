# Industry Fsm Sale
## Project Task View Search Fsm  
### Add Description  
ID: `mint_system.industry_fsm_sale.project_task_view_search_fsm.add_description`  
```xml
<?xml version="1.0"?>
<data inherit_id="industry_fsm_sale.project_task_view_search_fsm" priority="50">
    <xpath expr="//field[@name='active']" position="after">
        <field name="description" filter_domain="[('description', 'ilike', self)]"/>
    </xpath>
</data>

```
Source: [snippets/industry_fsm_sale.project_task_view_search_fsm.add_description.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/industry_fsm_sale.project_task_view_search_fsm.add_description.xml)

### X Systemname  
ID: `mint_system.industry_fsm_sale.project_task_view_search_fsm.x_systemname`  
```xml
<?xml version="1.0"?>
<data inherit_id="industry_fsm_sale.project_task_view_search_fsm" priority="50">
    <xpath expr="//field[@name='active']" position="after">
        <field name="x_systemname" filter_domain="[('x_systemname', 'ilike', self)]"/>
    </xpath>
</data>

```
Source: [snippets/industry_fsm_sale.project_task_view_search_fsm.x_systemname.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/industry_fsm_sale.project_task_view_search_fsm.x_systemname.xml)

### X User Text  
ID: `mint_system.industry_fsm_sale.project_task_view_search_fsm.x_user_text`  
```xml
<?xml version="1.0"?>
<data inherit_id="industry_fsm_sale.project_task_view_search_fsm" priority="50">
    <xpath expr="//field[@name='active']" position="after">
        <field name="x_user_text" filter_domain="[('x_user_text', 'ilike', self)]"/>
    </xpath>
</data>

```
Source: [snippets/industry_fsm_sale.project_task_view_search_fsm.x_user_text.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/industry_fsm_sale.project_task_view_search_fsm.x_user_text.xml)

## Worksheet Time And Material  
### Add Taxes  
ID: `mint_system.industry_fsm_sale.worksheet_time_and_material.add_taxes`  
```xml
<?xml version="1.0"?>
<data inherit_id="industry_fsm_sale.worksheet_time_and_material" priority="60">
    <xpath expr="//th[@class='text-end'][4]" position="after">
        <th id="final_tax" t-if="final_tax" class="text-end">Taxes</th>
    </xpath>
    <xpath expr="//td[@class='text-end o_price_total'][1]" position="after">
        <td id="final_tax" t-if="final_tax" class="text-end">
            <span t-esc="', '.join(map(lambda x: (x.description or x.name), line.tax_id))"/>
        </td>
    </xpath>
</data>

```
Source: [snippets/industry_fsm_sale.worksheet_time_and_material.add_taxes.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/industry_fsm_sale.worksheet_time_and_material.add_taxes.xml)

### Remove Taxes  
ID: `mint_system.industry_fsm_sale.worksheet_time_and_material.remove_taxes`  
```xml
<?xml version="1.0"?>
<data inherit_id="industry_fsm_sale.worksheet_time_and_material" priority="60">
    <xpath expr="//th[@class='text-end'][3]" position="replace"/>
    <xpath expr="//td[@class='text-end'][3]" position="replace"/>
</data>

```
Source: [snippets/industry_fsm_sale.worksheet_time_and_material.remove_taxes.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/industry_fsm_sale.worksheet_time_and_material.remove_taxes.xml)

### Replace Product Description  
ID: `mint_system.industry_fsm_sale.worksheet_time_and_material.replace_product_description`  
```xml
<?xml version="1.0"?>
<data inherit_id="industry_fsm_sale.worksheet_time_and_material" priority="50">
    <xpath expr="//tr[1]/t[1]/td[1]" position="replace">
        <td>
            <span class="o_bold" t-field="line.product_id.name"/>
            <br/>
            <span t-field="line.name"/>
        </td>
    </xpath>
</data>

```
Source: [snippets/industry_fsm_sale.worksheet_time_and_material.replace_product_description.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/industry_fsm_sale.worksheet_time_and_material.replace_product_description.xml)

### Round Final Total  
ID: `mint_system.industry_fsm_sale.worksheet_time_and_material.round_final_total`  
```xml
<?xml version="1.0"?>
<data inherit_id="industry_fsm_sale.worksheet_time_and_material" priority="60">
    <xpath expr="//span[@t-esc='final_total']" position="replace">
        <span t-esc="round(float(final_total) * 20) / 20" t-options="{&quot;widget&quot;: &quot;monetary&quot;, &quot;display_currency&quot;: doc.sale_order_id.pricelist_id.currency_id}"/>
    </xpath>
</data>

```
Source: [snippets/industry_fsm_sale.worksheet_time_and_material.round_final_total.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/industry_fsm_sale.worksheet_time_and_material.round_final_total.xml)

### Style Moser  
ID: `mint_system.industry_fsm_sale.worksheet_time_and_material.style_moser`  
```xml
<?xml version="1.0"?>
<data inherit_id="industry_fsm_sale.worksheet_time_and_material" priority="60">
    <xpath expr="//div[1]" position="before">
        <style>
              .text-start {
            padding: 0.25rem 0rem !important;
              }
        </style>
    </xpath>
    <xpath expr="//div[@id='total']/div" position="attributes">
        <attribute name="t-attf-class">#{'col-6' if report_type != 'html' else 'col-sm-7 col-md-6'} ms-auto</attribute>
    </xpath>
</data>

```
Source: [snippets/industry_fsm_sale.worksheet_time_and_material.style_moser.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/industry_fsm_sale.worksheet_time_and_material.style_moser.xml)

