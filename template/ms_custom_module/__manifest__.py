{
    "name": "{{ (name|replace('_',' ')).title() }}",
    "summary": """
        Module summary.
    """,
    "author": "Mint System GmbH, Odoo Community Association (OCA)",
    "website": "https://www.mint-system.ch",
    "category": "Purchase,Technical,Accounting,Invoicing,Sales,Human Resources,Manufacturing,Website,Inventory,Administration,Tools",
    "version": "14.0.1.0.0",
    "license": "AGPL-3",
    "depends": ["base"],
    "data": [
        "security/ir.model.access.csv",
        "report/invoice_document.xml",
        "data/ir_sequence.xml",
        "views/assets.xml",
        "views/sale_order.xml"
    ],
    "installable": True,
    "application": False,
    "auto_install": False,
    "images": ["images/screen.png"],
    "qweb": ["static/src/xml/board.xml"],
    "demo": ["demo/demo.xml"],
    "assets": {
        "web.assets_backend": [
            "{{ name }}/static/src/js/action_refresh.js",
        ],
        "web.assets_qweb": [
            "{{ name }}/static/src/xml/listview_refresh.xml",
        ],
    },
}
