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

Show the new field in the list and form view.

Finally, implement a `test_product_filter_value` test in `addons/kubernetes/helm/tests/test_helm_release.py`.

## Worklog

1. Added `filter_product_ids` field to `helm_chart_value.py` model with proper Many2many relationship to product.template
2. Added `downloadOdooEnterprise` helm chart value with value "True" in `data.xml`
3. Added product filter field to helm_chart_value list and form views with many2many_tags widget
4. Added product filter field to helm_chart form view to show filters on linked values
5. Added domain restriction to product_ids field to only allow service-type products
6. Added domain restriction to filter_product_ids field to only allow service-type product templates
7. Implemented `test_product_filter_value` test to verify the product filtering functionality
8. Removed post-init hook as requested to keep implementation clean

## Summary

Successfully implemented product filtering for Helm chart values. The implementation includes:

1. **New Field**: Added `filter_product_ids` Many2many field to HelmChartValue model to filter values by product template
2. **Data Configuration**: Created `downloadOdooEnterprise` helm value with value "True" in data.xml
3. **User Interface**: Added product filter field to helm_chart_value views and helm_chart form view for comprehensive visibility
4. **Domain Restrictions**: Added domains to both product_ids and filter_product_ids fields to only allow service-type products/templates
5. **Testing**: Implemented `test_product_filter_value` test to verify the product filtering functionality
6. **Clean Implementation**: Removed complex hook logic to keep the implementation simple and maintainable

The feature enables Helm chart values to be applied only to specific products, providing granular control over Helm chart configurations. Users can now:
- Filter helm chart values by product in the helm_chart_value views
- See product filters directly in the helm_chart form view when managing linked values
- Only select service-type products for Helm charts (via domain restriction)
- Only select service-type product templates for value filtering (via domain restriction)
- The `downloadOdooEnterprise` value demonstrates this capability and can be extended to other product-specific configurations
