# Account Accountant

## View Bank Statement Line Kanban Bank Rec Widget

### Hide Payment Ref

ID: `mint_system.account_accountant.view_bank_statement_line_kanban_bank_rec_widget.hide_payment_ref`

```xml
<data inherit_id="account_accountant.view_bank_statement_line_kanban_bank_rec_widget" priority="50">
    <xpath expr="//div[@id='payment_ref']/.." position="replace">
    </xpath>
</data>

```

Source: [snippets/account_accountant.view_bank_statement_line_kanban_bank_rec_widget.hide_payment_ref.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/account_accountant.view_bank_statement_line_kanban_bank_rec_widget.hide_payment_ref.xml)

### Hide Statement Id

ID: `mint_system.account_accountant.view_bank_statement_line_kanban_bank_rec_widget.hide_statement_id`

```xml
<data inherit_id="account_accountant.view_bank_statement_line_kanban_bank_rec_widget" priority="50">
    <xpath expr="//templates//field[@name='statement_id']/.." position="replace">
    </xpath>
</data>

```

Source: [snippets/account_accountant.view_bank_statement_line_kanban_bank_rec_widget.hide_statement_id.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/account_accountant.view_bank_statement_line_kanban_bank_rec_widget.hide_statement_id.xml)

### Show Narration

ID: `mint_system.account_accountant.view_bank_statement_line_kanban_bank_rec_widget.show_narration`

```xml
<data inherit_id="account_accountant.view_bank_statement_line_kanban_bank_rec_widget" priority="50">
    <xpath expr="//div[@id='row2_col1']/.." position="after">
        <!-- Row 3 -->
        <div class="flex_row">
            <div id="row3_col1">
                <field name="narration"/>
            </div>
        </div>
    </xpath>
</data>

```

Source: [snippets/account_accountant.view_bank_statement_line_kanban_bank_rec_widget.show_narration.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/account_accountant.view_bank_statement_line_kanban_bank_rec_widget.show_narration.xml)

## View Bank Statement Line Tree Bank Rec Widget

### Show Partner Name

ID: `mint_system.account_accountant.view_bank_statement_line_tree_bank_rec_widget.show_partner_name`

```xml
<data inherit_id="account_accountant.view_bank_statement_line_tree_bank_rec_widget" priority="50">
    <field name="partner_id" position="after">
        <field name="partner_name"/>
    </field>
</data>

```

Source: [snippets/account_accountant.view_bank_statement_line_tree_bank_rec_widget.show_partner_name.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/account_accountant.view_bank_statement_line_tree_bank_rec_widget.show_partner_name.xml)
