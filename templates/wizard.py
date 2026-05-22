# License AGPL-3.0 or later (https://www.gnu.org/licenses/agpl).

import logging

from odoo import _, api, fields, models

_logger = logging.getLogger(__name__)


class ${MODEL_CAMEL_NAME}(models.TransientModel):
    _name = "$MODEL_DOT_NAME"
    _description = "$MODEL_DESCRIPTION"

    document_id = fields.Many2one('$MODEL_DOT_NAME', required=True, ondelete='cascade')
    wizard_line_ids = fields.One2many('$MODEL_DOT_NAME.line', 'wizard_id')