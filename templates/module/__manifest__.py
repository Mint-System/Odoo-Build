{
    "name": "{{ (name|replace('_',' ')).title() }}",
    "summary": """
        Module summary.
    """,
    "author": "Mint System GmbH, Odoo Community Association (OCA)",
    "website": "https://www.mint-system.ch",
    "category": "Purchase,Technical,Accounting,Invoicing,Sales,Human Resources,Services,Helpdesk,Manufacturing,Website,Inventory,Administration,Productivity",
    "version": "16.0.1.0.0",
    "license": "AGPL-3,OPL-1",
    "depends": ["base"],
    "data": [
        "security/ir.model.access.csv",
        "security/security.xml",
        "report/invoice_document.xml",
        "data/ir_sequence_data.xml",
        "views/sale_order_views.xml"
    ],
    "installable": True,
    "application": False,
    "auto_install": False,
    "images": ["images/screen.png"],
    "demo": ["demo/demo.xml"],
    "qweb": ["static/src/xml/board.xml"],
    "assets": {
        "web.assets_backend": [
            "{{ name }}/static/src/css/style.css",
        ]
    },
}
