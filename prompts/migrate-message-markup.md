Migrate message links to markup safe definition. The following example:

license_msg = _("This license has been created from: %s (%s)") % (
	line.order_id._get_html_link(),
	line.product_id.name,
)
license.message_post(body=license_msg)

Become this:

from markupsafe import Markup
...
license_msg = Markup(_("This license has been created from: %s (%s)")) % (
	line.order_id._get_html_link(),
	line.product_id.name,
)
license.message_post(body=license_msg)
