# Calendar
## View Calendar Event Calendar  
### Default Mode Week  
ID: `mint_system.calendar.view_calendar_event_calendar.default_mode_week`  
```xml
<?xml version="1.0"?>
<data inherit_id="calendar.view_calendar_event_calendar" priority="50">

  <xpath expr="//calendar[1]" position="attributes">
    <attribute name="mode">week</attribute>
  </xpath>

</data>

```
Source: [snippets/calendar.view_calendar_event_calendar.default_mode_week.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/calendar.view_calendar_event_calendar.default_mode_week.xml)

### Set Color  
ID: `mint_system.calendar.view_calendar_event_calendar.set_color`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <xpath expr="//calendar" position="attributes">
    <attribute name="color">user_id</attribute>
  </xpath>

</odoo>

```
Source: [snippets/calendar.view_calendar_event_calendar.set_color.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/calendar.view_calendar_event_calendar.set_color.xml)

### Show Location  
ID: `mint_system.calendar.view_calendar_event_calendar.show_location`  
```xml
<?xml version="1.0"?>
<data inherit_id="calendar.view_calendar_event_calendar" priority="50">

  <xpath expr="//field[@name='attendee_status']" position="after">
    <field name="location" />
  </xpath>

</data>

```
Source: [snippets/calendar.view_calendar_event_calendar.show_location.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/calendar.view_calendar_event_calendar.show_location.xml)

### X Color  
ID: `mint_system.calendar.view_calendar_event_calendar.x_color`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <xpath expr="//calendar" position="attributes">
    <attribute name="color">x_color</attribute>
  </xpath>

</odoo>

```
Source: [snippets/calendar.view_calendar_event_calendar.x_color.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/calendar.view_calendar_event_calendar.x_color.xml)

## View Calendar Event Calendar Timeline  
### View  
ID: `mint_system.calendar.view_calendar_event_calendar_timeline.view`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <record id="calendar.view_calendar_event_calendar_timeline.view" model="ir.ui.view">
    <field name="name">mint_system.calendar.view_calendar_event_calendar_timeline.view</field>
    <field name="model">calendar.event</field>
    <field name="type">timeline</field>
    <field name="arch" type="xml">
      <timeline date_start="start" date_stop="stop" default_group_by="partner_id" event_open_popup="true" />
    </field>
  </record>

</odoo>

```
Source: [snippets/calendar.view_calendar_event_calendar_timeline.view.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/calendar.view_calendar_event_calendar_timeline.view.xml)

## View Calendar Event Calendar  
### Default Mode Week  
ID: `mint_system.calendar.view_calendar_event_calendar.default_mode_week`  
```xml
<?xml version="1.0"?>
<data inherit_id="calendar.view_calendar_event_calendar" priority="50">

  <xpath expr="//calendar[1]" position="attributes">
    <attribute name="mode">week</attribute>
  </xpath>

</data>

```
Source: [snippets/calendar.view_calendar_event_calendar.default_mode_week.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/calendar.view_calendar_event_calendar.default_mode_week.xml)

### Set Color  
ID: `mint_system.calendar.view_calendar_event_calendar.set_color`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <xpath expr="//calendar" position="attributes">
    <attribute name="color">user_id</attribute>
  </xpath>

</odoo>

```
Source: [snippets/calendar.view_calendar_event_calendar.set_color.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/calendar.view_calendar_event_calendar.set_color.xml)

### Show Location  
ID: `mint_system.calendar.view_calendar_event_calendar.show_location`  
```xml
<?xml version="1.0"?>
<data inherit_id="calendar.view_calendar_event_calendar" priority="50">

  <xpath expr="//field[@name='attendee_status']" position="after">
    <field name="location" />
  </xpath>

</data>

```
Source: [snippets/calendar.view_calendar_event_calendar.show_location.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/calendar.view_calendar_event_calendar.show_location.xml)

### X Color  
ID: `mint_system.calendar.view_calendar_event_calendar.x_color`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>

  <xpath expr="//calendar" position="attributes">
    <attribute name="color">x_color</attribute>
  </xpath>

</odoo>

```
Source: [snippets/calendar.view_calendar_event_calendar.x_color.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/calendar.view_calendar_event_calendar.x_color.xml)

## View Calendar Event Form  
### Show Res Model And Id  
ID: `mint_system.calendar.view_calendar_event_form.show_res_model_and_id`  
```xml
<?xml version="1.0"?>
<data inherit_id="calendar.view_calendar_event_form" priority="50">

  <xpath expr="//page[@name='page_misc']//field[@name='user_id']" position="after">
    <field name="res_id"/>
    <field name="res_model"/>
  </xpath>

</data>
```
Source: [snippets/calendar.view_calendar_event_form.show_res_model_and_id.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/calendar.view_calendar_event_form.show_res_model_and_id.xml)

### X Color  
ID: `mint_system.calendar.view_calendar_event_form.x_color`  
```xml
<?xml version="1.0"?>
<data inherit_id="calendar.view_calendar_event_form" priority="50">

  <xpath expr="//field[@name='user_id']" position="after">
    <field name="x_color" />
  </xpath>

</data>
```
Source: [snippets/calendar.view_calendar_event_form.x_color.xml](https://github.com/Mint-System/Odoo-Build/tree/14.0/snippets/calendar.view_calendar_event_form.x_color.xml)

