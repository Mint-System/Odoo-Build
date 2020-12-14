# -*- coding: utf-8 -*-

from openerp import api, fields, models

class Document(models.Model):
    _name = '{{ name }}.document'
    _description = '{{ name|replace('_',' ')|capitalize }} Document'

    # fields
    name = fields.Char()
    value = fields.Integer()