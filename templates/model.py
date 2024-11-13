import logging

from odoo import _, api, fields, models

_logger = logging.getLogger(__name__)


class ${MODEL_CAMEL_NAME}(models.Model):
    _name = "$MODEL_DOT_NAME"
    _description = "$MODEL_DESCRIPTION"

    name = fields.Char()
    value = fields.Integer()
    state = fields.Selection([
        ("draft", "Draft"),
        ("confirm", "Confirmed"),
        ("cancel", "Cancelled"),
    ], string="Status")