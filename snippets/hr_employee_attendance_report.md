# Hr Employee Attendance Report

## Hr Employee Template

### Add Weekday

ID: `mint_system.hr_employee_attendance_report.hr_employee_template.add_weekday`

Inherit ID: `hr_employee_attendance_report.hr_employee_template`

```xml
<xpath expr="//td[@id='date']" position="inside">
    <t t-out="attendance['date']" t-options="{'widget': 'date', 'format': 'EEE'}"/>
</xpath>
```
Edit: [snippets/mint_system.hr_employee_attendance_report.hr_employee_template.add_weekday.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_employee_attendance_report.hr_employee_template.add_weekday.xml)

Source: [snippets/mint_system.hr_employee_attendance_report.hr_employee_template.add_weekday.xml](https://odoo.build/snippets/mint_system.hr_employee_attendance_report.hr_employee_template.add_weekday.xml)

### Attendance Table Attributes

ID: `mint_system.hr_employee_attendance_report.hr_employee_template.attendance_table_attributes`

Inherit ID: `hr_employee_attendance_report.hr_employee_template`

```xml
<data priority="50">
    <xpath expr="//table[@name='table_attendance']" position="attributes">
         <attribute name="class">table table-sm attendances-table</attribute>
         <attribute name="style">width: 100%; font-size: 7pt</attribute>
     </xpath>
</data>
```
Edit: [snippets/mint_system.hr_employee_attendance_report.hr_employee_template.attendance_table_attributes.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_employee_attendance_report.hr_employee_template.attendance_table_attributes.xml)

Source: [snippets/mint_system.hr_employee_attendance_report.hr_employee_template.attendance_table_attributes.xml](https://odoo.build/snippets/mint_system.hr_employee_attendance_report.hr_employee_template.attendance_table_attributes.xml)

### Change Column Order

ID: `mint_system.hr_employee_attendance_report.hr_employee_template.change_column_order`

Inherit ID: `hr_employee_attendance_report.hr_employee_template`

```xml
<data priority="50">
    <xpath expr="//th[@name='th_leave_hours']" position="before">
       <xpath expr="//th[@name='th_worked_hours']" position="move"/>
   </xpath>

   <!-- move worked_hours td before leave_hours td -->
   <xpath expr="//td[@id='leave_hours']" position="before">
       <xpath expr="//td[@id='worked_hours']" position="move"/>
   </xpath>
</data>
```
Edit: [snippets/mint_system.hr_employee_attendance_report.hr_employee_template.change_column_order.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_employee_attendance_report.hr_employee_template.change_column_order.xml)

Source: [snippets/mint_system.hr_employee_attendance_report.hr_employee_template.change_column_order.xml](https://odoo.build/snippets/mint_system.hr_employee_attendance_report.hr_employee_template.change_column_order.xml)

### Replace Overtime

ID: `mint_system.hr_employee_attendance_report.hr_employee_template.replace_overtime`

Inherit ID: `hr_employee_attendance_report.hr_employee_template`

```xml
<data priority="50">
    <xpath expr="//th[@name='th_overtime']" position="replace">
    <th class="text-end" name="th_overtime" t-if="fixed_work_hours">
        Flexitime
    </th>
    </xpath>

    <xpath expr="//th[@name='th_overtime_sum']" position="replace">
    <th class="text-end" name="th_overtime_sum">
       Flexitime
    </th>
    </xpath>

    <xpath expr="//th[@name='th_overtime_total']" position="replace">
    <th class="text-end" name="th_overtime_total">
       Flexitime Total
    </th>
    </xpath>
</data>
```
Edit: [snippets/mint_system.hr_employee_attendance_report.hr_employee_template.replace_overtime.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_employee_attendance_report.hr_employee_template.replace_overtime.xml)

Source: [snippets/mint_system.hr_employee_attendance_report.hr_employee_template.replace_overtime.xml](https://odoo.build/snippets/mint_system.hr_employee_attendance_report.hr_employee_template.replace_overtime.xml)

### Replace Report Head

ID: `mint_system.hr_employee_attendance_report.hr_employee_template.replace_report_head`

Inherit ID: `hr_employee_attendance_report.hr_employee_template`

```xml
<data priority="50">
    <xpath expr="//div[@name='report_head']" position="replace">
         <div name="report_head">
             <h5 class="attendance-report">Attendance Report</h5>
             <p><span class="light-text">Employee:</span> <span
                     t-out="doc.name"
                 />
             </p>
             <p><span class="light-text">From:</span> <span
                     t-out="dates[doc.id]['start_date']"
                     t-options="{'widget': 'date'}"
                 />
                 <span class="light-text">Until: </span><span
                     t-out="dates[doc.id]['end_date']"
                     t-options="{'widget': 'date'}"
                 />
             </p>

         </div>           
     </xpath> 
</data>
```
Edit: [snippets/mint_system.hr_employee_attendance_report.hr_employee_template.replace_report_head.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_employee_attendance_report.hr_employee_template.replace_report_head.xml)

Source: [snippets/mint_system.hr_employee_attendance_report.hr_employee_template.replace_report_head.xml](https://odoo.build/snippets/mint_system.hr_employee_attendance_report.hr_employee_template.replace_report_head.xml)

