# Calendar

## View Calendar Event Calendar

### Default Mode Week

ID: `mint_system.calendar.view_calendar_event_calendar.default_mode_week`

Inherit ID: `calendar.view_calendar_event_calendar`

```xml
<data priority="50">
    <xpath expr="//calendar[1]" position="attributes">
        <attribute name="mode">week</attribute>
    </xpath>
</data>

```
Edit: [snippets/mint_system.calendar.view_calendar_event_calendar.default_mode_week.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.calendar.view_calendar_event_calendar.default_mode_week.xml)

Source: [snippets/mint_system.calendar.view_calendar_event_calendar.default_mode_week.xml](https://odoo.build/snippets/mint_system.calendar.view_calendar_event_calendar.default_mode_week.xml)

### Set Color

ID: `mint_system.calendar.view_calendar_event_calendar.set_color`

Inherit ID: `calendar.view_calendar_event_calendar`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<odoo>
    <xpath expr="//calendar" position="attributes">
        <attribute name="color">user_id</attribute>
    </xpath>
</odoo>

```
Edit: [snippets/mint_system.calendar.view_calendar_event_calendar.set_color.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.calendar.view_calendar_event_calendar.set_color.xml)

Source: [snippets/mint_system.calendar.view_calendar_event_calendar.set_color.xml](https://odoo.build/snippets/mint_system.calendar.view_calendar_event_calendar.set_color.xml)

### Show Location

ID: `mint_system.calendar.view_calendar_event_calendar.show_location`

Inherit ID: `calendar.view_calendar_event_calendar`

```xml
<data priority="50">
    <xpath expr="//field[@name='attendee_status']" position="after">
        <field name="location"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.calendar.view_calendar_event_calendar.show_location.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.calendar.view_calendar_event_calendar.show_location.xml)

Source: [snippets/mint_system.calendar.view_calendar_event_calendar.show_location.xml](https://odoo.build/snippets/mint_system.calendar.view_calendar_event_calendar.show_location.xml)

### X Color

ID: `mint_system.calendar.view_calendar_event_calendar.x_color`

Inherit ID: `calendar.view_calendar_event_calendar`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<odoo>
    <xpath expr="//calendar" position="attributes">
        <attribute name="color">x_color</attribute>
    </xpath>
</odoo>

```
Edit: [snippets/mint_system.calendar.view_calendar_event_calendar.x_color.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.calendar.view_calendar_event_calendar.x_color.xml)

Source: [snippets/mint_system.calendar.view_calendar_event_calendar.x_color.xml](https://odoo.build/snippets/mint_system.calendar.view_calendar_event_calendar.x_color.xml)

## View Calendar Event Calendar Timeline

### View

ID: `mint_system.calendar.view_calendar_event_calendar_timeline.view`

Inherit ID: `calendar.view_calendar_event_calendar_timeline`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<odoo>
    <record id="calendar.view_calendar_event_calendar_timeline.view" model="ir.ui.view">
        <field name="name">mint_system.calendar.view_calendar_event_calendar_timeline.view</field>
        <field name="model">calendar.event</field>
        <field name="type">timeline</field>
        <field name="arch" type="xml">
            <timeline date_start="start" date_stop="stop" default_group_by="partner_id" event_open_popup="true"/>
        </field>
    </record>
</odoo>

```
Edit: [snippets/mint_system.calendar.view_calendar_event_calendar_timeline.view.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.calendar.view_calendar_event_calendar_timeline.view.xml)

Source: [snippets/mint_system.calendar.view_calendar_event_calendar_timeline.view.xml](https://odoo.build/snippets/mint_system.calendar.view_calendar_event_calendar_timeline.view.xml)

## View Calendar Event Form

### Show Res Model And Id

ID: `mint_system.calendar.view_calendar_event_form.show_res_model_and_id`

Inherit ID: `calendar.view_calendar_event_form`

```xml
<data priority="50">
    <xpath expr="//page[@name='page_misc']//field[@name='user_id']" position="after">
        <field name="res_id"/>
        <field name="res_model"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.calendar.view_calendar_event_form.show_res_model_and_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.calendar.view_calendar_event_form.show_res_model_and_id.xml)

Source: [snippets/mint_system.calendar.view_calendar_event_form.show_res_model_and_id.xml](https://odoo.build/snippets/mint_system.calendar.view_calendar_event_form.show_res_model_and_id.xml)

### X Color

ID: `mint_system.calendar.view_calendar_event_form.x_color`

Inherit ID: `calendar.view_calendar_event_form`

```xml
<data priority="50">
    <xpath expr="//field[@name='user_id']" position="after">
        <field name="x_color"/>
    </xpath>
</data>

```
Edit: [snippets/mint_system.calendar.view_calendar_event_form.x_color.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.calendar.view_calendar_event_form.x_color.xml)

Source: [snippets/mint_system.calendar.view_calendar_event_form.x_color.xml](https://odoo.build/snippets/mint_system.calendar.view_calendar_event_form.x_color.xml)

