---
prev: ./snippets
---
# Account Sale Timesheet Report
## Report Invoice Document  
### Add Linebreak  
ID: `mint_system.account_sale_timesheet_report.report_invoice_document.add_linebreak`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_sale_timesheet_report.report_invoice_document" priority="50">

<xpath expr="//h3[1]" position="before">
  <p style="page-break-before:always;"> </p>
</xpath>

</data>
```
Source: [snippets/account_sale_timesheet_report.report_invoice_document.add_linebreak.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account_sale_timesheet_report.report_invoice_document.add_linebreak.xml)

### Add Pagebreak  
ID: `mint_system.account_sale_timesheet_report.report_invoice_document.add_pagebreak`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_sale_timesheet_report.report_invoice_document" priority="50">

  <xpath expr="//div[@id='qrcode']" position="after">
    <t t-if="print_with_timesheets">
      <p style="page-break-before:always;" />
    </t>
  </xpath>

</data>
```
Source: [snippets/account_sale_timesheet_report.report_invoice_document.add_pagebreak.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account_sale_timesheet_report.report_invoice_document.add_pagebreak.xml)

## Timesheet Table  
### Add Start And End Hour  
ID: `mint_system.account_sale_timesheet_report.timesheet_table.add_start_and_end_hour`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_sale_timesheet_report.timesheet_table" priority="50">

  <xpath expr="//th[@id='date']" position="replace">
    <th id="date" class="align-middle"><span>Datum und Uhrzeit</span></th>
  </xpath>

  <xpath expr="//td[@id='line_date']" position="replace">
    <td id="line_date">
      <span t-field="line.date"/><br/>
      <span t-field="line.from_time" t-options="{'widget': 'duration', 'digital': True, 'unit': 'hour', 'round': 'minute'}"/>
      <span> - </span> 
      <span t-field="line.until_time" t-options="{'widget': 'duration', 'digital': True, 'unit': 'hour', 'round': 'minute'}"/>
   </td>
  </xpath>

</data>
```
Source: [snippets/account_sale_timesheet_report.timesheet_table.add_start_and_end_hour.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account_sale_timesheet_report.timesheet_table.add_start_and_end_hour.xml)

### Show From Until Times  
ID: `mint_system.account_sale_timesheet_report.timesheet_table.show_from_until_times`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_sale_timesheet_report.timesheet_table" priority="50">

<xpath expr="//th[@id='date']" position="replace">
  <th id="date" class="align-middle"><span>Datum<br/>Von - Bis</span></th>
</xpath>

<xpath expr="//td[@id='line_date']" position="replace">
  <td id="line_date">
    <span t-field="line.date"/><br/>
    <span t-field="line.from_time" t-options="{'widget': 'duration', 'digital': True, 'unit': 'hour', 'round': 'minute'}" /> - <span t-field="line.until_time" t-options="{'widget': 'duration', 'digital': True, 'unit': 'hour', 'round': 'minute'}" />
 </td>
</xpath>

</data>
```
Source: [snippets/account_sale_timesheet_report.timesheet_table.show_from_until_times.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account_sale_timesheet_report.timesheet_table.show_from_until_times.xml)

