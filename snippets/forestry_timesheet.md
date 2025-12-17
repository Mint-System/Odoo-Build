# Forestry Timesheet

## Report Project Task Deliveryslip

### Show Has Trailer

ID: `mint_system.forestry_timesheet.report_project_task_deliveryslip.show_has_trailer`

```xml
<data inherit_id="forestry_timesheet.report_project_task_deliveryslip" priority="50">
    <t t-if="doc.vehicle_id" position="after">
        <br/>
        <t t-if="doc.vehicle_id">
            <strong>Anh&#xE4;nger: </strong>
            <span t-esc="'Ja' if doc.trailer else 'Nein'"/>
        </t>
    </t>
</data>

```
Edit: [snippets/mint_system.forestry_timesheet.report_project_task_deliveryslip.show_has_trailer.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.forestry_timesheet.report_project_task_deliveryslip.show_has_trailer.xml)

Source: [snippets/mint_system.forestry_timesheet.report_project_task_deliveryslip.show_has_trailer.xml](https://odoo.build/snippets/mint_system.forestry_timesheet.report_project_task_deliveryslip.show_has_trailer.xml)

