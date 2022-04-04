{
    "name": "{{ name|replace('_',' ')|capitalize }}",
    "summary": """
        Module summary.
    """,
    "author": "Mint System GmbH, Odoo Community Association (OCA)",
    "website": "https://www.mint-system.ch",
    "category": "Technical,Accounting,Invoicing,Sales,Human Resources,Manufacturing,Website,InventoryAdministration",
    "version": "14.0.0.0.0",
    "license": "AGPL-3",
    "depends": ["base"],
    "data": [
        # 'security/ir.model.access.csv',
        # 'views/report_invoice_document.xml',
        # 'data/ir_sequence.xml',
        # 'views/assets.xml',
        "views/views.xml",
    ],
    "qweb": ["static/src/xml/board.xml"],
    "demo": ["demo/demo.xml"],
    "installable": True,
    "application": False,
    "auto_install": False,
    "images": ["images/screen.png"],
}
