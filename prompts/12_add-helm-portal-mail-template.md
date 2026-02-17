---
title: Add Helm Portal mail template
---

# Run 12

Replace the `==` marked instructions in this file while you work on the task.

## Context

Read the `AGENTS.md` and `README.md` to get understanding of the project.

## Task

Mail template for helm_portal:

```markdown
Hello {doc.partner_id.firstname},

Thank you for ordering **{doc.order_line[0].product_id.name}**. The service is being deployed right now.

Check the status for the your service on the [release]({'/my/releases/' + doc.release_id.id}) page. Once it is deployed, login with the following credentials:


Url: {doc.release_id.ingress_url}
Username: {doc.release_id.get_value('init.login')}
Password: {doc.release_id.get_value('init.password')}

Checkout the PRODUCT_DOCUMENT_URL for your service.

If you have any problem, create a ticket on the SUPPORT_PAGE. 

Kind regards,

Mint System
```

Send automatically when bought with sale.order.



## Worklog

==Fill this in as you work on the task==

## Summary

==Fill this once you completed the task==
