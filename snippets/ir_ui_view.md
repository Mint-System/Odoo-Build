# Ir Ui View
## Calendar  
### View Calendar Event Calendar Timeline  
ID: `mint_system.ir_ui_view.calendar.view_calendar_event_calendar_timeline`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>
  <record id="ir_ui_view.calendar.view_calendar_event_calendar_timeline" model="ir.ui.view">
    <field name="name">calendar.event.calendar.timeline</field>
    <field name="model">calendar.event</field>
    <field name="type">timeline</field>
    <field name="arch" type="xml">
      <timeline date_start="start" date_stop="stop" default_group_by="partner_id" event_open_popup="true" />
    </field>
  </record>
</odoo>

```
Source: [snippets/ir_ui_view.calendar.view_calendar_event_calendar_timeline.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/ir_ui_view.calendar.view_calendar_event_calendar_timeline.xml)

## Hr Holidays Calendar  
### Hr Leave Report Calendar Timeline  
ID: `mint_system.ir_ui_view.hr_holidays_calendar.hr_leave_report_calendar_timeline`  
```xml
<?xml version='1.0' encoding='UTF-8' ?>
<odoo>
  <record id="ir_ui_view.hr_holidays_calendar.hr_leave_report_calendar_timeline" model="ir.ui.view">
    <field name="name">hr.leave.report.calendar.timeline</field>
    <field name="model">hr.leave.report.calendar</field>
    <field name="type">timeline</field>
    <field name="arch" type="xml">
      <timeline date_start="start_datetime" date_stop="stop_datetime" default_group_by="employee_id" event_open_popup="true">
        <field name="employee_id" />
        <field name="holiday_status_id" />
        <templates>
          <t t-name="timeline-item">
            <t t-if="record.holiday_status_id == '1,Ferien'">
      
              <div class="o_leave_timeline_item" style="background-color: #f9ec6d;">
                <span name="employee_id">
                  <t t-esc="record.display_name" />
                </span>
              </div>
      
            </t>
      
            <t t-elif="record.holiday_status_id == '2,Krankheit'">
      
              <div class="o_leave_timeline_item" style="background-color: #ff9ad7;">
                <span name="employee_id">
                  <t t-esc="record.display_name" />
                </span>
              </div>
      
            </t>
      
            <t t-else="">
      
              <div class="o_leave_timeline_item">
                <span name="employee_id">
                  <t t-esc="record.display_name" />
                </span>
              </div>
      
            </t>
          </t>
        </templates>
      </timeline>
    </field>
  </record>
</odoo>

```
Source: [snippets/ir_ui_view.hr_holidays_calendar.hr_leave_report_calendar_timeline.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/ir_ui_view.hr_holidays_calendar.hr_leave_report_calendar_timeline.xml)

