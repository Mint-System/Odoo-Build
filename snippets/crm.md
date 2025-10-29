# Crm

## Crm Case Calendar View Leads

### Enable Create

ID: `mint_system.crm.crm_case_calendar_view_leads.enable_create`

```xml
<data inherit_id="crm.crm_case_calendar_view_leads" priority="50">
    <calendar position="attributes">
        <attribute name="create">1</attribute>
    </calendar>
</data>

```

Source: [snippets/crm.crm_case_calendar_view_leads.enable_create.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/crm.crm_case_calendar_view_leads.enable_create.xml)

### Hide Revenue

ID: `mint_system.crm.crm_case_calendar_view_leads.hide_revenue`

```xml
<data inherit_id="crm.crm_case_calendar_view_leads" priority="50">
    <field name="expected_revenue" position="replace"/>
</data>

```

Source: [snippets/crm.crm_case_calendar_view_leads.hide_revenue.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/crm.crm_case_calendar_view_leads.hide_revenue.xml)

### Mode Week

ID: `mint_system.crm.crm_case_calendar_view_leads.mode_week`

```xml
<data inherit_id="crm.crm_case_calendar_view_leads" priority="50">
    <calendar position="attributes">
        <attribute name="mode">week</attribute>
    </calendar>
</data>

```

Source: [snippets/crm.crm_case_calendar_view_leads.mode_week.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/crm.crm_case_calendar_view_leads.mode_week.xml)

### Use Date Deadline

ID: `mint_system.crm.crm_case_calendar_view_leads.use_date_deadline`

```xml
<data inherit_id="crm.crm_case_calendar_view_leads" priority="50">
    <calendar position="attributes">
        <attribute name="date_start">date_deadline</attribute>
    </calendar>
</data>

```

Source: [snippets/crm.crm_case_calendar_view_leads.use_date_deadline.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/crm.crm_case_calendar_view_leads.use_date_deadline.xml)

### Use Date Start

ID: `mint_system.crm.crm_case_calendar_view_leads.use_date_start`

```xml
<data inherit_id="crm.crm_case_calendar_view_leads" priority="50">
    <calendar position="attributes">
        <attribute name="date_start">x_date_start</attribute>
    </calendar>
</data>

```

Source: [snippets/crm.crm_case_calendar_view_leads.use_date_start.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/crm.crm_case_calendar_view_leads.use_date_start.xml)

### X Date Stop

ID: `mint_system.crm.crm_case_calendar_view_leads.x_date_stop`

```xml
<data inherit_id="crm.crm_case_calendar_view_leads" priority="50">
    <calendar position="attributes">
        <attribute name="date_stop">x_date_stop</attribute>
    </calendar>
</data>

```

Source: [snippets/crm.crm_case_calendar_view_leads.x_date_stop.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/crm.crm_case_calendar_view_leads.x_date_stop.xml)

## Crm Lead View Form

### Date Deadline Required

ID: `mint_system.crm.crm_lead_view_form.date_deadline_required`

```xml
<data inherit_id="crm.crm_lead_view_form" priority="50">
    <field name="date_deadline" position="attributes">
        <attribute name="required">1</attribute>
    </field>
</data>

```

Source: [snippets/crm.crm_lead_view_form.date_deadline_required.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/crm.crm_lead_view_form.date_deadline_required.xml)

### Hide Date Deadline

ID: `mint_system.crm.crm_lead_view_form.hide_date_deadline`

```xml
<data inherit_id="crm.crm_lead_view_form" priority="50">
    <field name="date_deadline" position="attributes">
        <attribute name="invisible">1</attribute>
    </field>
</data>

```

Source: [snippets/crm.crm_lead_view_form.hide_date_deadline.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/crm.crm_lead_view_form.hide_date_deadline.xml)

### Hide Expected Revenue

ID: `mint_system.crm.crm_lead_view_form.hide_expected_revenue`

```xml
<data inherit_id="crm.crm_lead_view_form" priority="50">
    <xpath expr="//label[@for='expected_revenue']/../.." position="attributes">
        <attribute name="invisible">1</attribute>
    </xpath>
</data>

```

Source: [snippets/crm.crm_lead_view_form.hide_expected_revenue.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/crm.crm_lead_view_form.hide_expected_revenue.xml)

### Hide Lost Won Buttons

ID: `mint_system.crm.crm_lead_view_form.hide_lost_won_buttons`

```xml
<data inherit_id="crm.crm_lead_view_form" priority="50">
    <button name="action_set_won_rainbowman" position="replace">
  </button>
    <button name="action_set_lost" position="replace">
  </button>
    <button name="624" position="replace">
  </button>
    <button name="625" position="replace">
  </button>
</data>

```

Source: [snippets/crm.crm_lead_view_form.hide_lost_won_buttons.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/crm.crm_lead_view_form.hide_lost_won_buttons.xml)

### X Date Start

ID: `mint_system.crm.crm_lead_view_form.x_date_start`

```xml
<data inherit_id="crm.crm_lead_view_form" priority="50">
    <field name="date_deadline" position="replace">
        <field name="x_date_start" required="1" widget="datetime"/>
    </field>
</data>

```

Source: [snippets/crm.crm_lead_view_form.x_date_start.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/crm.crm_lead_view_form.x_date_start.xml)

### X Date Stop

ID: `mint_system.crm.crm_lead_view_form.x_date_stop`

```xml
<data inherit_id="crm.crm_lead_view_form" priority="50">
    <field name="x_date_start" position="after">
        <field name="x_date_stop" readonly="1" widget="datetime"/>
    </field>
</data>

```

Source: [snippets/crm.crm_lead_view_form.x_date_stop.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/crm.crm_lead_view_form.x_date_stop.xml)

### X Mobile

ID: `mint_system.crm.crm_lead_view_form.x_mobile`

```xml
<data inherit_id="crm.crm_lead_view_form" priority="50">
    <xpath expr="//field[@name='phone']/.." position="after">
        <label for="x_mobile" class="oe_inline"/>
        <div class="o_row">
            <field name="x_mobile" id="x_mobile" widget="phone"/>
        </div>
    </xpath>
</data>

```

Source: [snippets/crm.crm_lead_view_form.x_mobile.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/crm.crm_lead_view_form.x_mobile.xml)

### X Task Id

ID: `mint_system.crm.crm_lead_view_form.x_task_id`

```xml
<data inherit_id="crm.crm_lead_view_form" priority="50">
    <xpath expr="//field[@name='phone']/.." position="after">
        <label for="x_task_id" class="oe_inline"/>
        <div class="o_row">
            <field name="x_task_id" id="x_task_id"/>
        </div>
    </xpath>
</data>

```

Source: [snippets/crm.crm_lead_view_form.x_task_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/crm.crm_lead_view_form.x_task_id.xml)
