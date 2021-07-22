import logging

from odoo import api, fields, models, _

_logger = logging.getLogger(__name__)

class Document(models.Model):
    _name = '{{ name }}.document'
    _description = '{{ name|replace('_',' ')|capitalize }} Document'

    # fields
    name = fields.Char()
    value = fields.Integer()