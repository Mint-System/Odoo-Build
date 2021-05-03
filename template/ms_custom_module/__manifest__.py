# -*- coding: utf-8 -*-
{
    'name': "{{ name|replace('_',' ')|capitalize }}",

    'summary': """
        Module summary.
    """,

    'description': """
        Module desciption.
    """,

    'author': "Mint System GmbH",
    'website': "https://www.mint-system.ch",
    'category': 'Uncategorized', # See odoo/addons/base/data/ir_module_category_data.xml
    'version': '14.0.0.0.0',

    'depends': ['base'],

    'data': [
        # 'security/ir.model.access.csv',
        # 'views/report_invoice_document.xml',
        # 'data/ir_sequence_data.xml',
        # 'views/assets.xml',
        'views/views.xml',
    ],

    'demo': [
        'demo/demo.xml',
    ],

    'installable': True,
    'application': False,
}
