# Account Asset

## View Account Asset Form

### Account Ids Optional

ID: `mint_system.account_asset.view_account_asset_form.account_ids_optional`

```xml
<data inherit_id="account_asset.view_account_asset_form" priority="50">
    <field name="account_asset_id" position="attributes">
        <attribute name="attrs">{'invisible': ['|', ('display_account_asset_id', '=', False), ('asset_type', '!=', 'purchase')]}</attribute>
    </field>
    <field name="account_depreciation_expense_id" position="attributes">
        <attribute name="required">0</attribute>
    </field>
    <field name="account_depreciation_id" position="attributes">
        <attribute name="required">0</attribute>
    </field>
</data>

```
Edit: [snippets/mint_system.account_asset.view_account_asset_form.account_ids_optional.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.account_asset.view_account_asset_form.account_ids_optional.xml)

Source: [snippets/mint_system.account_asset.view_account_asset_form.account_ids_optional.xml](https://odoo.build/snippets/mint_system.account_asset.view_account_asset_form.account_ids_optional.xml)

