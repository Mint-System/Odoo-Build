import logging

from odoo import _, api, fields, models

_logger = logging.getLogger(__name__)


class {{ (name|replace('_',' ')).title() }}(models.Model):
    _name = '{{ name }}'
    _description = '{{ (name|replace('_',' ')).title() }}'

    name = fields.Char()
    value = fields.Integer()
