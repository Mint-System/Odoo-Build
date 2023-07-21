import logging
from odoo import fields, models, api, _
_logger = logging.getLogger(__name__)


class {{ (name|replace('_',' ')).title() }}(models.Model):
    _name = '{{ name }}.document'
    _description = '{{ (name|replace('_',' ')).title() }} Document'

    name = fields.Char()
    value = fields.Integer()
