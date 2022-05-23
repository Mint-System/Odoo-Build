from odoo import _, api, fields, models
import logging
_logger = logging.getLogger(__name__)


class Document(models.Model):
    _name = '{{ name }}.document'
    _description = '{{ name|replace('_',' ')|capitalize }} Document'

    # fields
    name = fields.Char()
    value = fields.Integer()
