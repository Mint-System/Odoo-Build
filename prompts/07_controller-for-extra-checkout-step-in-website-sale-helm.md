---
title: Controller for extra checkout step in website sale helm
---

# Run 07

Replace the `==` marked instructions in this file while you work on the task.

## Context

Read the `AGENTS.md` and `README.md` to get understanding of the project.

## Task

I want you to extend the functionality of the `addons/kubernetes/website_sale_helm` module.

The extra checkout form has hard coded select fields. They should be dynamic.

Add a controller amd update the form definition.

- The `cluster_id` lists the available `kubectl.cluster` records.
- The `consulting_partner_id` shows the selection of `sale.order:consulting_partner_id`.
- The `project_name` must be validated on form submit. This value becomes the namespace on the selected cluster. Ensure is does not exist as `kubectl.namespace` record.
- The `domain` must be renamed to `custom_domain`. The field is defined in `addons/kubernetes/sale_helm/models/sale_order.py`. Update the `addons/kubernetes/sale_helm/data/data.xml` so the value is mapped correctly.

As an example you can read the `addons/website/website_sale_permit_extra_info` module.

Create a todo for every field and start by bootstrapping the controller to validate the form values.

## Worklog

==Agent: Fill this in as you work on the task==

## Summary

==Fill this once you completed the task==
