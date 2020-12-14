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
    'website': "https://www.mint-sytem.ch",
    'category': 'Uncategorized',
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