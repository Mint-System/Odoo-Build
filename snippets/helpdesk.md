# Helpdesk
## Helpdesk Ticket View Form  
### Domain So Line  
ID: `mint_system.helpdesk.helpdesk_ticket_view_form.domain_so_line`  
```xml
<data inherit_id="helpdesk.helpdesk_ticket_view_form" priority="50">
    <field name="so_line" position="attributes">
        <attribute name="domain">[('is_service', '=', True), ('order_partner_id', 'child_of', parent.commercial_partner_id), ('is_expense', '=', False), ('state', 'in', ['sale'])]</attribute>
    </field>
</data>

```
Source: [snippets/helpdesk.helpdesk_ticket_view_form.domain_so_line.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/helpdesk.helpdesk_ticket_view_form.domain_so_line.xml)

### Remove Properties  
ID: `mint_system.helpdesk.helpdesk_ticket_view_form.remove_properties`  
```xml
<data inherit_id="helpdesk.helpdesk_ticket_view_form" priority="50">
    <field name="properties" position="replace"/>
</data>

```
Source: [snippets/helpdesk.helpdesk_ticket_view_form.remove_properties.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/helpdesk.helpdesk_ticket_view_form.remove_properties.xml)

### X Date Deadline  
ID: `mint_system.helpdesk.helpdesk_ticket_view_form.x_date_deadline`  
```xml
<data inherit_id="helpdesk.helpdesk_ticket_view_form" priority="50">
    <field name="domain_user_ids" position="after">
        <field name="x_date_deadline" widget="date"/>
    </field>
</data>

```
Source: [snippets/helpdesk.helpdesk_ticket_view_form.x_date_deadline.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/helpdesk.helpdesk_ticket_view_form.x_date_deadline.xml)

### X Link With Ids  
ID: `mint_system.helpdesk.helpdesk_ticket_view_form.x_link_with_ids`  
```xml
<data inherit_id="helpdesk.helpdesk_ticket_view_form" priority="50">
    <field name="description" position="replace">
        <notebook>
            <page string="Beschreibung">
                <field name="description" class="oe-bordered-editor field_description" placeholder="Description of the ticket..."/>
            </page>
            <page string="Verwandte Tickets">
                <field name="x_link_with_ids">
                    <tree default_order="create_date desc">
                        <field name="name"/>
                        <field name="user_id"/>
                        <field name="partner_id"/>
                        <field name="create_date"/>
                    </tree>
                </field>
            </page>
        </notebook>
    </field>
</data>

```
Source: [snippets/helpdesk.helpdesk_ticket_view_form.x_link_with_ids.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/helpdesk.helpdesk_ticket_view_form.x_link_with_ids.xml)

## Helpdesk Ticket View Kanban  
### X Date Deadline  
ID: `mint_system.helpdesk.helpdesk_ticket_view_kanban.x_date_deadline`  
```xml
<data inherit_id="helpdesk.helpdesk_ticket_view_kanban" priority="50">
    <xpath expr="//field[@name='commercial_partner_id']/.." position="after">
        <div>
            <field name="x_date_deadline" widget="date"/>
        </div>
    </xpath>
</data>

```
Source: [snippets/helpdesk.helpdesk_ticket_view_kanban.x_date_deadline.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/helpdesk.helpdesk_ticket_view_kanban.x_date_deadline.xml)

## Helpdesk Tickets View Search  
### Advanced Search  
ID: `mint_system.helpdesk.helpdesk_tickets_view_search.advanced_search`  
```xml
<data inherit_id="helpdesk.helpdesk_tickets_view_search" priority="50">
    <field name="name" position="attributes">
        <attribute name="filter_domain">['|',('name','ilike',self),('description','ilike',self)]</attribute>
    </field>
</data>

```
Source: [snippets/helpdesk.helpdesk_tickets_view_search.advanced_search.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/helpdesk.helpdesk_tickets_view_search.advanced_search.xml)

## Helpdesk Tickets View Tree  
### X Date Deadline  
ID: `mint_system.helpdesk.helpdesk_tickets_view_tree.x_date_deadline`  
```xml
<data inherit_id="helpdesk.helpdesk_tickets_view_tree" priority="50">
    <xpath expr="//field[@name='user_id']" position="after">
        <field name="x_date_deadline" widget="date"/>
    </xpath>
</data>

```
Source: [snippets/helpdesk.helpdesk_tickets_view_tree.x_date_deadline.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/helpdesk.helpdesk_tickets_view_tree.x_date_deadline.xml)

