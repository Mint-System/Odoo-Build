# Certificate Planer

## Document Form

### Hide View Report Button

ID: `mint_system.certificate_planer.document_form.hide_view_report_button`

```xml
<data inherit_id="certificate_planer.document_form" priority="50">
    <button name="view_document_report" position="attributes">
        <attribute name="invisible">1</attribute>
    </button>
</data>

```
Edit: [snippets/mint_system.certificate_planer.document_form.hide_view_report_button.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.certificate_planer.document_form.hide_view_report_button.xml)

Source: [snippets/mint_system.certificate_planer.document_form.hide_view_report_button.xml](https://odoo.build/snippets/mint_system.certificate_planer.document_form.hide_view_report_button.xml)

## Mcr Report View

### Hide Mcr Planning Columns

ID: `mint_system.certificate_planer.mcr_report_view.hide_mcr_planning_columns`

```xml
<data inherit_id="certificate_planer.mcr_report_view" priority="50">
    <xpath expr="//table[@name='mcr_planning']//th[2]" position="replace"/>
    <xpath expr="//table[@name='mcr_planning']//th[3]" position="replace"/>
    <xpath expr="//table[@name='mcr_planning']//td[2]" position="replace"/>
    <xpath expr="//table[@name='mcr_planning']//td[3]" position="replace"/>
</data>

```
Edit: [snippets/mint_system.certificate_planer.mcr_report_view.hide_mcr_planning_columns.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.certificate_planer.mcr_report_view.hide_mcr_planning_columns.xml)

Source: [snippets/mint_system.certificate_planer.mcr_report_view.hide_mcr_planning_columns.xml](https://odoo.build/snippets/mint_system.certificate_planer.mcr_report_view.hide_mcr_planning_columns.xml)

