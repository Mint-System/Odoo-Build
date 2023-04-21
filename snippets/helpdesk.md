# Helpdesk
## Helpdesk Tickets View Search  
### Advanced Search  
ID: `mint_system.helpdesk.helpdesk_tickets_view_search.advanced_search`  
```xml
<?xml version="1.0"?>
<data inherit_id="helpdesk.helpdesk_tickets_view_search" priority="50">

  <field name="name" position="attributes">
    <attribute name="filter_domain">['|',('name','ilike',self),('description','ilike',self)]</attribute>
  </field>

</data>
```
Source: [snippets/helpdesk.helpdesk_tickets_view_search.advanced_search.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/helpdesk.helpdesk_tickets_view_search.advanced_search.xml)

## Helpdesk Tickets View Tree  
### X Date Deadline  
ID: `mint_system.helpdesk.helpdesk_tickets_view_tree.x_date_deadline`  
```xml
<?xml version="1.0"?>
<data inherit_id="helpdesk.helpdesk_tickets_view_tree" priority="50">

  <xpath expr="//field[@name='user_id']" position="after">
    <field name="x_date_deadline" widget="date" />
  </xpath>

</data>
```
Source: [snippets/helpdesk.helpdesk_tickets_view_tree.x_date_deadline.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/helpdesk.helpdesk_tickets_view_tree.x_date_deadline.xml)

## Helpdesk Ticket View Form  
### X Date Deadline  
ID: `mint_system.helpdesk.helpdesk_ticket_view_form.x_date_deadline`  
```xml
<?xml version="1.0"?>
<data inherit_id="helpdesk.helpdesk_ticket_view_form" priority="50">

  <field name="domain_user_ids"  position="after">
    <field name="x_date_deadline" widget="date"/>
  </field>

</data>

```
Source: [snippets/helpdesk.helpdesk_ticket_view_form.x_date_deadline.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/helpdesk.helpdesk_ticket_view_form.x_date_deadline.xml)

## Helpdesk Ticket View Kanban  
### X Date Deadline  
ID: `mint_system.helpdesk.helpdesk_ticket_view_kanban.x_date_deadline`  
```xml
<?xml version="1.0"?>
<data inherit_id="helpdesk.helpdesk_ticket_view_kanban" priority="50">

  <xpath expr="//field[@name='commercial_partner_id']/.." position="after">
    <div>
      <field name="x_date_deadline" widget="date"/>
    </div>
  </xpath>

</data>
```
Source: [snippets/helpdesk.helpdesk_ticket_view_kanban.x_date_deadline.xml](https://github.com/Mint-System/Odoo-Development/tree/14.0/snippets/helpdesk.helpdesk_ticket_view_kanban.x_date_deadline.xml)

