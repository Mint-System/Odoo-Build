---
title: "Kubernetes: Add Odoo product variants"
---

# Run 24

Note: @Agent refers to the AI agent (you) who is working on this task.

@Agent when working on this task, make sure to:

- Read context and task section first
- Prepare a list of todos
- Update the todo list while working on the task

## Context

Read the `AGENTS.md` and `README.md` to get an understanding of the project.

## Task

I want you to update the product definition in `addons/kubernetes/helm/data/helm_chart_odoo_data.xml`.

Setup major versions 17.0, 18.0 and 19.0 as product attribute "Version".

For each version and Odoo edition create a `product.product`:

- product_odoo_community_edition_19_0
- product_odoo_community_edition_18_0
- product_odoo_community_edition_17_0
- product_odoo_enterprise_edition_19_0
- product_odoo_enterprise_edition_18_0
- product_odoo_enterprise_edition_17_0

See `odoo/addons/product/data/product_attribute_demo.xml` and `odoo/addons/product/data/product_demo.xml` for examples.

Then I want you setup mutltiple helm chart values in `addons/kubernetes/helm/data/helm_chart_odoo_data.xml`.

For each major version add a release with path "image" with two option_ids:

filter_product_ids: product_odoo_community_edition_19_0, product_odoo_enterprise_edition_19_0
mintsystem/odoo:19.0.20260305
mintsystem/odoo:19.0.20260409

filter_product_ids: product_odoo_community_edition_18_0, product_odoo_enterprise_edition_18_0
mintsystem/odoo:18.0.20260305
mintsystem/odoo:18.0.20260409

filter_product_ids: product_odoo_community_edition_17_0, product_odoo_enterprise_edition_17_0
mintsystem/odoo:17.0.20260305
mintsystem/odoo:17.0.20260409
