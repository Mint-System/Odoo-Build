# License AGPL-3.0 or later (https://www.gnu.org/licenses/agpl).

import logging

from odoo import _, api, fields, models

_logger = logging.getLogger(__name__)


class ${MODEL_CAMEL_NAME}(models.Model):
    _inherit = ["$MODEL_DOT_NAME"]