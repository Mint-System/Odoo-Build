{
    "name": "{{ (name|replace('_',' ')).title() }}",
    "summary": """
        Module summary.
    """,
    "author": "Mint System GmbH",
    "website": "https://www.mint-system.ch",
    "category": "Repository",
    "version": "18.0.1.0.0",
    "license": "AGPL-3,OPL-1",
    "depends": ["base"],
    "data": [
        "security/security.xml",
        "security/ir.model.access.csv",
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
