# Hr Attendance

## View Attendance Overtime Tree

### Enable Edit

ID: `mint_system.hr_attendance.view_attendance_overtime_tree.enable_edit`

Inherit ID: `hr_attendance.view_attendance_overtime_tree`

```xml
<data priority="50" groups="hr_attendance.group_hr_attendance_manager">
    <list position="attributes">
        <attribute name="create">1</attribute>
        <attribute name="edit">1</attribute>
        <attribute name="editable">top</attribute>
    </list>
</data>

```
Edit: [snippets/mint_system.hr_attendance.view_attendance_overtime_tree.enable_edit.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_attendance.view_attendance_overtime_tree.enable_edit.xml)

Source: [snippets/mint_system.hr_attendance.view_attendance_overtime_tree.enable_edit.xml](https://odoo.build/snippets/mint_system.hr_attendance.view_attendance_overtime_tree.enable_edit.xml)

### Remove Float Time Widget

ID: `mint_system.hr_attendance.view_attendance_overtime_tree.remove_float_time_widget`

Inherit ID: `hr_attendance.view_attendance_overtime_tree`

```xml
<data priority="50">
    <field name="duration" position="attributes">
        <attribute name="widget"/>
    </field>
</data>

```
Edit: [snippets/mint_system.hr_attendance.view_attendance_overtime_tree.remove_float_time_widget.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_attendance.view_attendance_overtime_tree.remove_float_time_widget.xml)

Source: [snippets/mint_system.hr_attendance.view_attendance_overtime_tree.remove_float_time_widget.xml](https://odoo.build/snippets/mint_system.hr_attendance.view_attendance_overtime_tree.remove_float_time_widget.xml)

## View Attendance Tree

### Enable Edit

ID: `mint_system.hr_attendance.view_attendance_tree.enable_edit`

Inherit ID: `hr_attendance.view_attendance_tree`

```xml
<data priority="50">
    <tree position="attributes">
        <attribute name="edit">1</attribute>
    </tree>
</data>

```
Edit: [snippets/mint_system.hr_attendance.view_attendance_tree.enable_edit.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.hr_attendance.view_attendance_tree.enable_edit.xml)

Source: [snippets/mint_system.hr_attendance.view_attendance_tree.enable_edit.xml](https://odoo.build/snippets/mint_system.hr_attendance.view_attendance_tree.enable_edit.xml)

