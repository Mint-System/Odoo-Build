# Hr Attendance

## View Attendance Overtime Tree

### Enable Edit

ID: `mint_system.hr_attendance.view_attendance_overtime_tree.enable_edit`

```xml
<data inherit_id="hr_attendance.view_attendance_overtime_tree" priority="50" groups="hr_attendance.group_hr_attendance_manager">
    <tree position="attributes">
        <attribute name="create">1</attribute>
        <attribute name="edit">1</attribute>
        <attribute name="editable">top</attribute>
    </tree>
</data>

```

Source: [snippets/hr_attendance.view_attendance_overtime_tree.enable_edit.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/hr_attendance.view_attendance_overtime_tree.enable_edit.xml)

### Remove Float Time Widget

ID: `mint_system.hr_attendance.view_attendance_overtime_tree.remove_float_time_widget`

```xml
<data inherit_id="hr_attendance.view_attendance_overtime_tree" priority="50">
    <field name="duration" position="attributes">
        <attribute name="widget"/>
    </field>
</data>

```

Source: [snippets/hr_attendance.view_attendance_overtime_tree.remove_float_time_widget.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/hr_attendance.view_attendance_overtime_tree.remove_float_time_widget.xml)

## View Attendance Tree

### Enable Edit

ID: `mint_system.hr_attendance.view_attendance_tree.enable_edit`

```xml
<data inherit_id="hr_attendance.view_attendance_tree" priority="50">
    <tree position="attributes">
        <attribute name="edit">1</attribute>
    </tree>
</data>

```

Source: [snippets/hr_attendance.view_attendance_tree.enable_edit.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/hr_attendance.view_attendance_tree.enable_edit.xml)
