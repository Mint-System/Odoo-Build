# Mail Activity Board
## Mail Activity View Form Board  
### Enable Edit And Create  
ID: `mint_system.mail_activity_board.mail_activity_view_form_board.enable_edit_and_create`  
```xml
<data inherit_id="mail_activity_board.mail_activity_view_form_board" priority="50">
    <form position="attributes">
        <attribute name="create">1</attribute>
        <attribute name="edit">1</attribute>
    </form>
</data>

```
Source: [snippets/mail_activity_board.mail_activity_view_form_board.enable_edit_and_create.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail_activity_board.mail_activity_view_form_board.enable_edit_and_create.xml)

### Show Done Button  
ID: `mint_system.mail_activity_board.mail_activity_view_form_board.show_done_button`  
```xml
<data inherit_id="mail_activity_board.mail_activity_view_form_board" priority="50">
    <xpath expr="//form/sheet" position="before">
        <header>
            <button string="Mark as Done" name="action_done" type="object" class="btn-secondary"/>
        </header>
    </xpath>
</data>

```
Source: [snippets/mail_activity_board.mail_activity_view_form_board.show_done_button.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail_activity_board.mail_activity_view_form_board.show_done_button.xml)

## Mail Activity View Search  
### My Activities Filter  
ID: `mint_system.mail_activity_board.mail_activity_view_search.my_activities_filter`  
```xml
<data inherit_id="mail_activity_board.mail_activity_view_search" priority="50">
    <filter name="activities_month" position="before">
        <filter string="Mir zugewiesen" name="my_activities" domain="[('user_id', '=', uid)]"/>
    </filter>
</data>

```
Source: [snippets/mail_activity_board.mail_activity_view_search.my_activities_filter.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail_activity_board.mail_activity_view_search.my_activities_filter.xml)

## Open Boards Activities  
### My Activities Filter  
ID: `mint_system.mail_activity_board.open_boards_activities.my_activities_filter`  
```xml
<odoo>
    <record model="ir.actions.act_window" id="open_boards_activities">
        <field name="context">{'search_default_my_activities': 1}</field>
    </record>
</odoo>

```
Source: [snippets/mail_activity_board.open_boards_activities.my_activities_filter.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail_activity_board.open_boards_activities.my_activities_filter.xml)

