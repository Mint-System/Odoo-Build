# Certificate Planer
## Document Form  
### Hide View Report Button  
ID: `mint_system.certificate_planer.document_form.hide_view_report_button`  
```xml
<?xml version="1.0"?>
<data inherit_id="certificate_planer.document_form" priority="50">

  <button name="view_document_report" position="attributes">
    <attribute name="invisible">1</attribute>
  </button>

</data>

```
Source: [snippets/certificate_planer.document_form.hide_view_report_button.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/certificate_planer.document_form.hide_view_report_button.xml)

## Mcr Report View  
### Hide Mcr Planning Columns  
ID: `mint_system.certificate_planer.mcr_report_view.hide_mcr_planning_columns`  
```xml
<?xml version="1.0"?>
<data inherit_id="certificate_planer.mcr_report_view" priority="50">

  <xpath expr="//table[@name='mcr_planning']//th[2]" position="replace" />
  <xpath expr="//table[@name='mcr_planning']//th[3]" position="replace" />


  <xpath expr="//table[@name='mcr_planning']//td[2]" position="replace" />
  <xpath expr="//table[@name='mcr_planning']//td[3]" position="replace" />

</data>

```
Source: [snippets/certificate_planer.mcr_report_view.hide_mcr_planning_columns.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/certificate_planer.mcr_report_view.hide_mcr_planning_columns.xml)

