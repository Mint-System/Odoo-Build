# Account Reports

## Pdf Export Main Customer Report

### Change Report Title

ID: `mint_system.account_reports.pdf_export_main_customer_report.change_report_title`\
Inherit ID: `account_reports.pdf_export_main_customer_report`

```xml
<data priority="50">
    <xpath expr="//t[@t-out='report_title']" position="replace">
        <t t-if="report.id == report.env.ref('account_reports.followup_report').id">
                <span>Ausstehende Rechnungen</span>
        </t>
        <t t-else="">
            <t t-out="report_title"/>
        </t>
    </xpath>
</data>

```

Edit: [snippets/mint_system.account_reports.pdf_export_main_customer_report.change_report_title.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.account_reports.pdf_export_main_customer_report.change_report_title.xml)\
Source: [snippets/mint_system.account_reports.pdf_export_main_customer_report.change_report_title.xml](https://odoo.build/snippets/mint_system.account_reports.pdf_export_main_customer_report.change_report_title.xml)

### Resize Grid

ID: `mint_system.account_reports.pdf_export_main_customer_report.resize_grid`\
Inherit ID: `account_reports.pdf_export_main_customer_report`

```xml
<data priority="50">
    <xpath expr="//div[hasclass('col-8')]" position="attributes">
        <attribute name="class">col-7</attribute>
    </xpath>
    <xpath expr="//div[hasclass('col-4')]" position="attributes">
        <attribute name="class">col-5</attribute>
    </xpath>
    <xpath expr="//div[hasclass('row')]" position="attributes">
        <attribute name="class">row mt-2</attribute>
    </xpath>
</data>

```

Edit: [snippets/mint_system.account_reports.pdf_export_main_customer_report.resize_grid.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.account_reports.pdf_export_main_customer_report.resize_grid.xml)\
Source: [snippets/mint_system.account_reports.pdf_export_main_customer_report.resize_grid.xml](https://odoo.build/snippets/mint_system.account_reports.pdf_export_main_customer_report.resize_grid.xml)

## View Archived Tag Move Tree

### Vat

ID: `mint_system.account_reports.view_archived_tag_move_tree.vat`\
Inherit ID: `account_reports.view_archived_tag_move_tree`

```xml
<data priority="50">
    <xpath expr="//tree/field[@name='partner_id']" position="after">
        <field name="partner_vat" string="USt-IdNr"/>
    </xpath>
</data>

```

Edit: [snippets/mint_system.account_reports.view_archived_tag_move_tree.vat.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.account_reports.view_archived_tag_move_tree.vat.xml)\
Source: [snippets/mint_system.account_reports.view_archived_tag_move_tree.vat.xml](https://odoo.build/snippets/mint_system.account_reports.view_archived_tag_move_tree.vat.xml)
