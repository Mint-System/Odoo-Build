# -*- coding: utf-8 -*-

from odoo import api, fields, models, _

class Document(models.Model):
    _name = '{{ name }}.document'
    _description = '{{ name|replace('_',' ')|capitalize }} Document'

    # fields
    name = fields.Char()
    value = fields.Integer()