# Maintenance

## Hr Equipment Request View Form

### X Calibrated Until

ID: `mint_system.maintenance.hr_equipment_request_view_form.x_calibrated_until`

Inherit ID: `maintenance.hr_equipment_request_view_form`

```xml
<data priority="50">
    <xpath expr="//field[@name='maintenance_type']" position="after">
        <field name="x_calibrated_until"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.maintenance.hr_equipment_request_view_form.x_calibrated_until.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.maintenance.hr_equipment_request_view_form.x_calibrated_until.xml)

Source: [snippets/mint_system.maintenance.hr_equipment_request_view_form.x_calibrated_until.xml](https://odoo.build/snippets/mint_system.maintenance.hr_equipment_request_view_form.x_calibrated_until.xml)

## Hr Equipment Request View Tree

### Show Schedule Date

ID: `mint_system.maintenance.hr_equipment_request_view_tree.show_schedule_date`

Inherit ID: `maintenance.hr_equipment_request_view_tree`

```xml
<data priority="50">
    <xpath expr="//field[@name='name']" position="after">
        <field name="schedule_date"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.maintenance.hr_equipment_request_view_tree.show_schedule_date.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.maintenance.hr_equipment_request_view_tree.show_schedule_date.xml)

Source: [snippets/mint_system.maintenance.hr_equipment_request_view_tree.show_schedule_date.xml](https://odoo.build/snippets/mint_system.maintenance.hr_equipment_request_view_tree.show_schedule_date.xml)

### X Calibrated Until

ID: `mint_system.maintenance.hr_equipment_request_view_tree.x_calibrated_until`

Inherit ID: `maintenance.hr_equipment_request_view_tree`

```xml
<data priority="50">
    <xpath expr="//field[@name='request_date']" position="after">
        <field name="x_calibrated_until"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.maintenance.hr_equipment_request_view_tree.x_calibrated_until.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.maintenance.hr_equipment_request_view_tree.x_calibrated_until.xml)

Source: [snippets/mint_system.maintenance.hr_equipment_request_view_tree.x_calibrated_until.xml](https://odoo.build/snippets/mint_system.maintenance.hr_equipment_request_view_tree.x_calibrated_until.xml)

## Hr Equipment View Form

### X Calibrated Until

ID: `mint_system.maintenance.hr_equipment_view_form.x_calibrated_until`

Inherit ID: `maintenance.hr_equipment_view_form`

```xml
<data priority="50">
    <xpath expr="//field[@name='workcenter_id']" position="after">
        <field name="x_calibrated_until"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.maintenance.hr_equipment_view_form.x_calibrated_until.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.maintenance.hr_equipment_view_form.x_calibrated_until.xml)

Source: [snippets/mint_system.maintenance.hr_equipment_view_form.x_calibrated_until.xml](https://odoo.build/snippets/mint_system.maintenance.hr_equipment_view_form.x_calibrated_until.xml)

### X Date Action Required

ID: `mint_system.maintenance.hr_equipment_view_form.x_date_action_required`

Inherit ID: `maintenance.hr_equipment_view_form`

```xml
<data priority="50">
    <xpath expr="//field[@name='workcenter_id']" position="after">
        <field name="x_date_action_required"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.maintenance.hr_equipment_view_form.x_date_action_required.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.maintenance.hr_equipment_view_form.x_date_action_required.xml)

Source: [snippets/mint_system.maintenance.hr_equipment_view_form.x_date_action_required.xml](https://odoo.build/snippets/mint_system.maintenance.hr_equipment_view_form.x_date_action_required.xml)

### X Lead Time Recovery Work

ID: `mint_system.maintenance.hr_equipment_view_form.x_lead_time_recovery_work`

Inherit ID: `maintenance.hr_equipment_view_form`

```xml
<data priority="50">
    <xpath expr="//field[@name='workcenter_id']" position="after">
        <field name="x_lead_time_recovery_work"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.maintenance.hr_equipment_view_form.x_lead_time_recovery_work.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.maintenance.hr_equipment_view_form.x_lead_time_recovery_work.xml)

Source: [snippets/mint_system.maintenance.hr_equipment_view_form.x_lead_time_recovery_work.xml](https://odoo.build/snippets/mint_system.maintenance.hr_equipment_view_form.x_lead_time_recovery_work.xml)

### X Location

ID: `mint_system.maintenance.hr_equipment_view_form.x_location`

Inherit ID: `maintenance.hr_equipment_view_form`

```xml
<data priority="50">
    <xpath expr="//field[@name='scrap_date']" position="after">
        <field name="x_location"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.maintenance.hr_equipment_view_form.x_location.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.maintenance.hr_equipment_view_form.x_location.xml)

Source: [snippets/mint_system.maintenance.hr_equipment_view_form.x_location.xml](https://odoo.build/snippets/mint_system.maintenance.hr_equipment_view_form.x_location.xml)

## Hr Equipment View Search

### Calibration

ID: `mint_system.maintenance.hr_equipment_view_search.calibration`

Inherit ID: `maintenance.hr_equipment_view_search`

```xml
<data priority="50">
    <xpath expr="//field[@name='owner_user_id']" position="after">
        <filter string="Not calibrated" name="not_calibrated" domain="['|', ('x_calibrated_until', '&lt;', context_today().strftime('%Y-%m-%d')), ('x_calibrated_until', '=', False)]"/>
        <filter string="Need for action" name="need_for_action" domain="[('x_date_action_required', '&lt;', context_today().strftime('%Y-%m-%d'))]"/>
    </xpath>
</data>
```
Edit: [snippets/mint_system.maintenance.hr_equipment_view_search.calibration.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.maintenance.hr_equipment_view_search.calibration.xml)

Source: [snippets/mint_system.maintenance.hr_equipment_view_search.calibration.xml](https://odoo.build/snippets/mint_system.maintenance.hr_equipment_view_search.calibration.xml)

