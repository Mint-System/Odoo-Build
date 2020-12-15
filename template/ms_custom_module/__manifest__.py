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
    'version': '13.0.0.0.0',

    'depends': ['base'],

    'data': [
        # 'security/ir.model.access.csv',
        'views/views.xml',
    ],

    'demo': [
        'demo/demo.xml',
    ],

    'installable': True,
    'application': False,
}