---
title: Apply product filter to helm value
---

# Run 13

Replace the `==` marked instructions in this file while you work on the task.

## Context

Read the `AGENTS.md` and `README.md` to get understanding of the project.

## Task

Add a new field to `addons/kubernetes/helm/models/helm_chart_value.py`:

`filter_product_ids = fields.Many2many("product.template", help="Apply value to these products only.")`

Then add a new value `downloadOdooEnterprise` with value `true` to `addons/kubernetes/helm/data/data.xml` and set the product filter so this value is only applied to `product_odoo_enterprise_edition`.

## Worklog

==Fill this in as you work on the task==

## Summary

==Fill this once you completed the task==
