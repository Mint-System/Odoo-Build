---
title: Add Helm Sale mail template
---

# Run 12

Replace the `==` marked instructions in this file while you work on the task.

## Context

Read the `AGENTS.md` and `README.md` to get understanding of the project.

## Task

And a new html field `user_notice_template` to `helm.chart` in `addons/kubernetes/helm`.

Then add a new method `get_value(self, path)` that returns a value from path. The `release_id.chart_id.value_ids` and the `release_id.value_ids` are checked.

In the `data.xml` add this `user_notice_template` to `product_odoo_community_edition` and `product_odoo_enterprise_edition`:

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

Update the template so it can be evaluated given `release` as context.

Then add a new computed html field `user_notice` to `helm.release`. This field evaluates the `release_id.chart_id.user_notice_template` in the context of the release. Show the field in the release form.

Now you can add a `sale.order` mail template with subject `{doc.order_line[0].product_id.name} - Access Information`:

It has the following content:

```txt
Hello {doc.partner_id.firstname},

Thank you for ordering **{doc.order_line[0].product_id.name}**. The service is being deployed right now.

Check the status for the your service on the [release]({'/my/releases/' + doc.release_id.id}) page. Once it is deployed, login with the following info:

{release_id.user_notice}

If you have any problems, create a ticket on the [support](https://erp.mint-system.ch/helpdesk) page. 

Kind regards,

Mint System
```

Adapt to the Odoo mail template xml. Ensure this mail is sent when a release is installed successfully.

## Worklog

==Fill this in as you work on the task==

## Summary

==Fill this once you completed the task==
