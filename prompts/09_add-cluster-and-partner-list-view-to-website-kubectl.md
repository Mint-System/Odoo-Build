---
title: Add cluster and partner list view to website kubectl
---

# Run 09

Replace the `==` marked instructions in this file while you work on the task.

## Context

Read the `AGENTS.md` and `README.md` to get understanding of the project.

## Task

The `addons/kubernetes/website_kubectl/views/website_kubectl_cluster_templates.xml` defines a details view of the a cluster.
And `odoo/addons/website_partner/views/website_partner_templates.xml` defines the details view for partners.

Please add a website page that lists the `name` and `website_short_description`. Create website page under `/clusters` for clusters and `/partners` for partners.

For the `/partners` and `/clusters` paths add a new controller route.

Make these new definitions in the `website_kubectl` module.

Finally, the partner detail page shows contact details. On the cluster page I would like to see the details of the `kubectl.cluster:partner_id`. Update the definition in `website_kubectl_cluster_templates.xml` as shown in `website_partner_templates.xml`.

## Worklog

==Fill this in as you work on the task==

## Summary

==Fill this once you completed the task==
