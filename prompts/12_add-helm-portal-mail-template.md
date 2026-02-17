---
title: Add Helm Portal mail template
---

# Run 12

Replace the `==` marked instructions in this file while you work on the task.

## Context

Read the `AGENTS.md` and `README.md` to get understanding of the project.

## Task

Mail template for `helm_portal`:

```markdown
Hello {doc.partner_id.firstname},

Thank you for ordering **{doc.order_line[0].product_id.name}**. The service is being deployed right now.

Check the status for the your service on the [release]({'/my/releases/' + doc.release_id.id}) page. Once it is deployed, login with the following credentials:

{if doc.order_line[0].product_id.name == "Odoo Community Edition"}
Url: {doc.release_id.ingress_url}
Username: {doc.release_id.get_value('init.login')}
Password: {doc.release_id.get_value('init.password')}

We highly recommend to read our [Getting Started Guide]{doc.order_line[0].product_id.wiki_url}.
{endif}

If you have any problems, create a ticket on the [support](https://erp.mint-system.ch/helpdesk) page. 

Kind regards,

Mint System
```

Send automatically when bought with `sale.order`.

## Worklog

==Fill this in as you work on the task==

## Summary

==Fill this once you completed the task==
