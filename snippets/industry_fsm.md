# Industry Fsm

## Project Task View List Fsm

### Show Id

ID: `mint_system.industry_fsm.project_task_view_list_fsm.show_id`

```xml
<data inherit_id="industry_fsm.project_task_view_list_fsm" priority="50">
    <xpath expr="//field[@name='progress']" position="after">
        <field name="id" string="ID" optional="hide"/>
    </xpath>
</data>

```
Source: [snippets/industry_fsm.project_task_view_list_fsm.show_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/industry_fsm.project_task_view_list_fsm.show_id.xml)

## Worksheet Custom

### Add Info

ID: `mint_system.industry_fsm.worksheet_custom.add_info`

```xml
<data inherit_id="industry_fsm.worksheet_custom" priority="50">
    <xpath expr="//div[1]" position="before">
        <h1>Arbeitsrapport</h1>
        <span id="title">
            <strong t-field="doc.name"/>
        </span>
        <table>
            <tr>
                <td style="width:120px">
                      Kunde:
        </td>
                <td style="width:700px">
                    <span t-field="doc.partner_id"/>
                    <t t-if="doc.partner_id.ref">
                      /
            <span t-field="doc.partner_id.ref"/>
          </t>
                </td>
            </tr>
            <tr>
                <td>Benutzer:</td>
                <td>
                    <span t-field="doc.x_user_text"/>
                </td>
            </tr>
            <tr>
                <td>Systemname:</td>
                <td>
                    <span t-field="doc.x_systemname"/>
                </td>
            </tr>
        </table>
    </xpath>
</data>

```
Source: [snippets/industry_fsm.worksheet_custom.add_info.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/industry_fsm.worksheet_custom.add_info.xml)

### Replace Layout

ID: `mint_system.industry_fsm.worksheet_custom.replace_layout`

```xml
<data inherit_id="industry_fsm.worksheet_custom" priority="50">
    <xpath expr="//t[@t-call='web.external_layout']" position="replace">
        <t t-call="web.external_layout_worksheet">
            <t t-call="industry_fsm.worksheet_custom_page" t-lang="doc.partner_id.lang"/>
        </t>
    </xpath>
</data>

```
Source: [snippets/industry_fsm.worksheet_custom.replace_layout.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/industry_fsm.worksheet_custom.replace_layout.xml)

## Worksheet Custom Page

### Remove Address

ID: `mint_system.industry_fsm.worksheet_custom_page.remove_address`

```xml
<data inherit_id="industry_fsm.worksheet_custom_page" priority="50">
    <xpath expr="//div/div[1]" position="replace"/>
</data>

```
Source: [snippets/industry_fsm.worksheet_custom_page.remove_address.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/industry_fsm.worksheet_custom_page.remove_address.xml)

### Replace Display Name

ID: `mint_system.industry_fsm.worksheet_custom_page.replace_display_name`

```xml
<data inherit_id="industry_fsm.worksheet_custom_page" priority="50">
    <xpath expr="//span[@t-field='line.display_name']" position="replace">
        <span t-field="line.name"/>
    </xpath>
</data>

```
Source: [snippets/industry_fsm.worksheet_custom_page.replace_display_name.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/industry_fsm.worksheet_custom_page.replace_display_name.xml)

### Style Moser

ID: `mint_system.industry_fsm.worksheet_custom_page.style_moser`

```xml
<data inherit_id="industry_fsm.worksheet_custom_page" priority="60">
    <xpath expr="//div[hasclass('page')]" position="before">
        <style>
              h1 {
            font-size: 1.8rem;
            margin-top: 60px;
            }
            h2 {
            font-size: 1.4rem;
            margin-top: 60px;
            }   
              #title {
             font-size: 1.2rem;
              }
        </style>
    </xpath>
</data>

```
Source: [snippets/industry_fsm.worksheet_custom_page.style_moser.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/industry_fsm.worksheet_custom_page.style_moser.xml)

