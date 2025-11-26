from odoo.upgrade import util


def migrate(cr, version):
    util.rename_model(cr, "sale.temporal.period_discount", "sale.subscription.period_discount")

    util.rename_field(cr, "sale.subscription.period_discount", "recurrence_id", "plan_id")

    util.rename_xmlid(
        cr,
        "sale_subscription.sale_temporal_recurrence_view_form",
        "sale_subscription.sale_subscription_plan_view_form"
    )
