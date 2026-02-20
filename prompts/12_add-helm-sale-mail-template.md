---
title: Add Helm Sale mail template
---

# Run 12

Replace the `==` marked instructions in this file while you work on the task.

## Context

Read the `AGENTS.md` and `README.md` to get understanding of the project.

## Task

And a new html field `customer_notice_template` to `helm.chart` in `addons/kubernetes/helm`.

Then add a new method `get_value(self, path)` to `helm.release` that returns a value from path. The `release_id.chart_id.value_ids` and the `release_id.value_ids` are checked.

In the `data.xml` add this `customer_notice_template` to the odoo chart. Here is the pseudo markup:

```
<p>
Anleitung: <a ref="https://wiki.mint-system.ch/mint-cloud-odoo-erste-schritte.html">Mint Cloud Odoo - Erste Schritte</a>
</p>
<ul>
<li>Url: <a href="{release.ingress_url}">{release.ingress_url}</li>
<li>Username: {release.get_value('init.login')}</li>
<li>Password: {release.get_value('init.password')}</li>
<ul>
```

Convert this markup into a proper mail template. See `odoo/addons/sale/data/mail_template_data.xml` for references.

Then add a new computed html field `customer_notice` to `helm.release`. This field evaluates the `release_id.chart_id.customer_notice_template`. See `odoo/addons/mail/models/mail_mail.py` on how to render the body.

Show the field in the release form.

Now you can add a `sale.order` mail template with subject `{doc.order_line[0].product_id.name} - Access Information` to the `sale_helm` module:

It has the following content:

```txt
Hello {doc.partner_id.firstname},

Thank you for your order.
{for line in doc.order_line}

The service **{line.product_id.name}** is being deployed right now.
Check the status for the service on the [release]({'/my/releases/' + line.release_id.id}) page. Once it is ready, proceed with this info:

{release_id.customer_notice}
---
{endfor}

If you have any problems, create a ticket on our [support](https://erp.mint-system.ch/helpdesk) page. 

Kind regards,

Mint System
```

Adapt to the Odoo mail template xml. Here is a template `addons/vertical_saas/license_ocad_mail/data/mail_templates.xml`. 

If the release is installed and is linked with a `sale_order_line_id`, then send this email in the context of the sale order. Here is an example: `addons/vertical_saas/license_ocad_mail/models/sale_order.py`.

## Worklog

- Added `customer_notice_template` HTML field to `helm.chart` model in `addons/kubernetes/helm/models/helm_chart.py`
- Added `get_value(self, path)` method to `helm.release` model to retrieve values from chart and release
- Added `customer_notice` computed HTML field to `helm.release` model in `addons/kubernetes/helm/models/helm_release.py`
- Implemented `_compute_customer_notice` method to render the template using Odoo's mail rendering mechanism
- Updated `addons/kubernetes/helm/data/data.xml` to add `customer_notice_template` to the odoo chart with proper markup
- Added new mail template `email_template_sale_order_helm_release` to `addons/kubernetes/sale_helm/data/data.xml`
- Updated `addons/kubernetes/helm/views/helm_release_views.xml` to show the `customer_notice` field in the release form
- Ensured all templates use proper Odoo mail template formatting with QWeb expressions

## Summary

Successfully implemented the Helm sale mail template feature. Added a customer notice template field to helm charts and a computed customer notice field to helm releases. Created a mail template in the sale_helm module that sends access information to customers when their Helm releases are installed. The template includes links to the release page and displays the customer-specific access information.
