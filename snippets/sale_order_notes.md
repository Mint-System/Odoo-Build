# Sale Order Notes

## Report Saleorder Document

### Add Line Break After Header Note

ID: `mint_system.sale_order_notes.report_saleorder_document.add_line_break_after_header_note`\
Inherit ID: `sale_order_notes.report_saleorder_document`

```xml
<data priority="50">
    <span t-field="doc.note_header" position="after">
        <div style="page-break-after: always;"></div>
    </span>
</data>

```
Edit: [snippets/mint_system.sale_order_notes.report_saleorder_document.add_line_break_after_header_note.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale_order_notes.report_saleorder_document.add_line_break_after_header_note.xml)\
Source: [snippets/mint_system.sale_order_notes.report_saleorder_document.add_line_break_after_header_note.xml](https://odoo.build/snippets/mint_system.sale_order_notes.report_saleorder_document.add_line_break_after_header_note.xml)

### Format Notes

ID: `mint_system.sale_order_notes.report_saleorder_document.format_notes`\
Inherit ID: `sale_order_notes.report_saleorder_document`

```xml
<data priority="50">
    <div id="informations" position="before">
        <style>
            ul p {
              margin-bottom: 0;
            }
        </style>
    </div>
</data>

```
Edit: [snippets/mint_system.sale_order_notes.report_saleorder_document.format_notes.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/mint_system.sale_order_notes.report_saleorder_document.format_notes.xml)\
Source: [snippets/mint_system.sale_order_notes.report_saleorder_document.format_notes.xml](https://odoo.build/snippets/mint_system.sale_order_notes.report_saleorder_document.format_notes.xml)

