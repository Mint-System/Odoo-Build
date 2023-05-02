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

## Report Invoice With Timesheets  
### Print With Payments  
ID: `mint_system.account_sale_timesheet_report.report_invoice_with_timesheets.print_with_payments`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_sale_timesheet_report.report_invoice_with_timesheets" priority="50">

    <xpath expr="/t[1]/t[1]/t[1]/t[1]" position="after">
        <t t-set="print_with_payments" t-value="True"/>
    </xpath>

</data>
```
Source: [snippets/account_sale_timesheet_report.report_invoice_with_timesheets.print_with_payments.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account_sale_timesheet_report.report_invoice_with_timesheets.print_with_payments.xml)

## Timesheet Report  
### Add Title Space  
ID: `mint_system.account_sale_timesheet_report.timesheet_report.add_title_space`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_sale_timesheet_report.timesheet_report" priority="50">

    <h2 position="attributes">
        <attribute name="style">padding-bottom: 25px</attribute>
    </h2>

</data>
```
Source: [snippets/account_sale_timesheet_report.timesheet_report.add_title_space.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account_sale_timesheet_report.timesheet_report.add_title_space.xml)

### Set Page Font Size  
ID: `mint_system.account_sale_timesheet_report.timesheet_report.set_page_font_size`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_sale_timesheet_report.timesheet_report" priority="50">

    <xpath expr="//div[hasclass('page')]" position="inside">
        <style>
            body {
                font-size: 0.9rem;
            }
        </style>
    </xpath>

</data>
```
Source: [snippets/account_sale_timesheet_report.timesheet_report.set_page_font_size.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account_sale_timesheet_report.timesheet_report.set_page_font_size.xml)

### Set Title Font Size  
ID: `mint_system.account_sale_timesheet_report.timesheet_report.set_title_font_size`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_sale_timesheet_report.timesheet_report" priority="50">

    <xpath expr="//div[hasclass('page')]" position="inside">
        <style>
            h2 {
                font-size: 1.5rem;
            }
        </style>
    </xpath>

</data>
```
Source: [snippets/account_sale_timesheet_report.timesheet_report.set_title_font_size.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account_sale_timesheet_report.timesheet_report.set_title_font_size.xml)

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

### Format Table Border  
ID: `mint_system.account_sale_timesheet_report.timesheet_table.format_table_border`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_sale_timesheet_report.timesheet_table" priority="50">

  <xpath expr="//table[hasclass('table-timesheet-entries')]" position="before">
    <style>
      .border-solid-black td {
      border-top: 1px solid black !important;
      border-bottom: 1px solid black !important;
      }
      thead th {
      color: #5c516e;
      }
    </style>
  </xpath>

  <xpath expr="//thead[1]/tr[1]" position="attributes">
    <attribute name="class" separator=" " add="border-black" />
  </xpath>

  <xpath expr="//td[@id='line_sum_amount']/.." position="attributes">
    <attribute name="class" separator=" " add="border-solid-black" />
  </xpath>

</data>
```
Source: [snippets/account_sale_timesheet_report.timesheet_table.format_table_border.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account_sale_timesheet_report.timesheet_table.format_table_border.xml)

### Set Table Font Size  
ID: `mint_system.account_sale_timesheet_report.timesheet_table.set_table_font_size`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_sale_timesheet_report.timesheet_table" priority="50">

    <xpath expr="//table[hasclass('table-timesheet-entries')]" position="before">
        <style>
            table.table-timesheet-entries {
                font-size: 0.8rem;
            }
        </style>
    </xpath>
    
</data>
```
Source: [snippets/account_sale_timesheet_report.timesheet_table.set_table_font_size.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account_sale_timesheet_report.timesheet_table.set_table_font_size.xml)

### Show From Until Times  
ID: `mint_system.account_sale_timesheet_report.timesheet_table.show_from_until_times`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_sale_timesheet_report.timesheet_table" priority="50">

  <xpath expr="//th[@id='date']" position="after">
    <th id="from_until" style="white-space: nowrap;">Zeit</th>
  </xpath>

</data>
```
Source: [snippets/account_sale_timesheet_report.timesheet_table.show_from_until_times.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account_sale_timesheet_report.timesheet_table.show_from_until_times.xml)

## Timesheet Table Lines  
### Show From Until Times  
ID: `mint_system.account_sale_timesheet_report.timesheet_table_lines.show_from_until_times`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_sale_timesheet_report.timesheet_table_lines" priority="50">

  <xpath expr="//td[@id='line_date']" position="after">
    <td id="line_from_until" style="white-space: nowrap;">
      <span t-field="line.from_time"
        t-options="{'widget': 'duration', 'digital': True, 'unit': 'hour', 'round': 'minute'}" /> - <span
        t-field="line.until_time"
        t-options="{'widget': 'duration', 'digital': True, 'unit': 'hour', 'round': 'minute'}" />
    </td>
  </xpath>

</data>
```
Source: [snippets/account_sale_timesheet_report.timesheet_table_lines.show_from_until_times.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account_sale_timesheet_report.timesheet_table_lines.show_from_until_times.xml)

### Sort Lines By Time  
ID: `mint_system.account_sale_timesheet_report.timesheet_table_lines.sort_lines_by_time`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_sale_timesheet_report.timesheet_table_lines" priority="50">

    <xpath expr="//tr[1]" position="before">
        <t t-set="lines" t-value="lines.sorted(lambda l: l.from_time)" />
        <t t-set="lines" t-value="lines.sorted(lambda l: l.date)" />
    </xpath>

</data>
```
Source: [snippets/account_sale_timesheet_report.timesheet_table_lines.sort_lines_by_time.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account_sale_timesheet_report.timesheet_table_lines.sort_lines_by_time.xml)

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

### Format Table Border  
ID: `mint_system.account_sale_timesheet_report.timesheet_table.format_table_border`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_sale_timesheet_report.timesheet_table" priority="50">

  <xpath expr="//table[hasclass('table-timesheet-entries')]" position="before">
    <style>
      .border-solid-black td {
      border-top: 1px solid black !important;
      border-bottom: 1px solid black !important;
      }
      thead th {
      color: #5c516e;
      }
    </style>
  </xpath>

  <xpath expr="//thead[1]/tr[1]" position="attributes">
    <attribute name="class" separator=" " add="border-black" />
  </xpath>

  <xpath expr="//td[@id='line_sum_amount']/.." position="attributes">
    <attribute name="class" separator=" " add="border-solid-black" />
  </xpath>

</data>
```
Source: [snippets/account_sale_timesheet_report.timesheet_table.format_table_border.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account_sale_timesheet_report.timesheet_table.format_table_border.xml)

### Set Table Font Size  
ID: `mint_system.account_sale_timesheet_report.timesheet_table.set_table_font_size`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_sale_timesheet_report.timesheet_table" priority="50">

    <xpath expr="//table[hasclass('table-timesheet-entries')]" position="before">
        <style>
            table.table-timesheet-entries {
                font-size: 0.8rem;
            }
        </style>
    </xpath>
    
</data>
```
Source: [snippets/account_sale_timesheet_report.timesheet_table.set_table_font_size.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account_sale_timesheet_report.timesheet_table.set_table_font_size.xml)

### Show From Until Times  
ID: `mint_system.account_sale_timesheet_report.timesheet_table.show_from_until_times`  
```xml
<?xml version="1.0"?>
<data inherit_id="account_sale_timesheet_report.timesheet_table" priority="50">

  <xpath expr="//th[@id='date']" position="after">
    <th id="from_until" style="white-space: nowrap;">Zeit</th>
  </xpath>

</data>
```
Source: [snippets/account_sale_timesheet_report.timesheet_table.show_from_until_times.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/account_sale_timesheet_report.timesheet_table.show_from_until_times.xml)

