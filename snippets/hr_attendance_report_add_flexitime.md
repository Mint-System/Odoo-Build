# Hr Attendance Report Add Flexitime

## Hr Attendance Report View Pivot

### Remove Diff Hours

ID: `mint_system.hr_attendance_report_add_flexitime.hr_attendance_report_view_pivot.remove_diff_hours`\
Inherit ID: `hr_attendance_report_add_flexitime.hr_attendance_report_view_pivot`

```xml
<data priority="50">
   <xpath expr="//field[@name='diff_hours']" position="replace"/>
</data>
```
Edit: [snippets/mint_system.hr_attendance_report_add_flexitime.hr_attendance_report_view_pivot.remove_diff_hours.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_attendance_report_add_flexitime.hr_attendance_report_view_pivot.remove_diff_hours.xml)\
Source: [snippets/mint_system.hr_attendance_report_add_flexitime.hr_attendance_report_view_pivot.remove_diff_hours.xml](https://odoo.build/snippets/mint_system.hr_attendance_report_add_flexitime.hr_attendance_report_view_pivot.remove_diff_hours.xml)

### Remove Widget

ID: `mint_system.hr_attendance_report_add_flexitime.hr_attendance_report_view_pivot.remove_widget`\
Inherit ID: `hr_attendance_report_add_flexitime.hr_attendance_report_view_pivot`

```xml
<data priority="50">
  <xpath expr="//field[@name='planned_hours']" position="attributes">
      <attribute name="widget"/>
  </xpath>
  <xpath expr="//field[@name='diff_hours']" position="attributes">
      <attribute name="widget"/>
  </xpath>
</data>
```
Edit: [snippets/mint_system.hr_attendance_report_add_flexitime.hr_attendance_report_view_pivot.remove_widget.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_attendance_report_add_flexitime.hr_attendance_report_view_pivot.remove_widget.xml)\
Source: [snippets/mint_system.hr_attendance_report_add_flexitime.hr_attendance_report_view_pivot.remove_widget.xml](https://odoo.build/snippets/mint_system.hr_attendance_report_add_flexitime.hr_attendance_report_view_pivot.remove_widget.xml)

