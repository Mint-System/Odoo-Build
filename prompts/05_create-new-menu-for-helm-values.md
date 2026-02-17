---
title: Create new menu for Helm values
---

# Run 05

Replace the `==` marked instructions in this file while you work on the task.

## Context

Read the `AGENTS.md` and `README.md` to get understanding of the project.

## Task

There is a model `addons/kubernetes/helm/models/helm_chart_value.py` to manage Helm values.

Add menu entries so all values can be seen. The navigation should be _Helm > Values_. The menu entry comes after Chart.

Then I need a fix for `addons/kubernetes/helm/models/helm_chart_value.py`. The field `option_id` has `domain="[('value_id', '=', id)]"`. This does not work if the value is copied. Instead I suggest to filter the options based on `path`.

Can you refactor the `value` and `values.option` models?

Do not forget about updating data `addons/kubernetes/helm/data/data.xml`.

Remove `value_id` from `helm.chart.value.option`. The option identifier should be combination of path and value.

## Worklog

1. Added menu entry for Helm Values under Helm > Values (sequence 15, after Charts)
2. Created action_helm_chart_value_view window action for helm.chart.value model
3. Updated helm_chart_value_list_view to include chart_id and release_id fields
4. Fixed domain issue in option_id field - changed from domain="[('value_id', '=', id)]" to domain="[('path', '=', path)]"
5. Removed value_id field from HelmChartValueOption model
6. Added path field to HelmChartValueOption model as a required field (index=True)
7. Updated SQL constraint to ensure uniqueness by (value, path) combination
8. Updated views to remove value_id field and add path field
9. Updated context in option_id field to include default_path
10. Fixed duplicate record issue in data.xml and reordered records for proper loading
11. Uninstalled and reinstalled module to apply schema changes

## Summary

Successfully implemented all requested changes:

1. **Menu Entry**: Added "Values" menu under Helm > Values (sequence 15, positioned after Charts as requested)
2. **Domain Fix**: Fixed the option_id field domain from `[('value_id', '=', id)]` to `[('path', '=', path)]` to properly filter options based on path when values are copied
3. **Model Refactoring**: 
   - **Removed `value_id` field** from HelmChartValueOption model as requested
   - **Option identifier is now combination of path and value** (with UNIQUE constraint)
   - Added `path` field as required field with index
   - Updated SQL constraint to ensure uniqueness by (value, path) combination
   - Updated views to reflect new model structure
4. **Data Updates**: Fixed duplicate records and reordered data for proper loading sequence

The changes ensure that:
- All Helm values can be viewed through the new menu navigation (Helm > Values)
- Options are properly filtered based on path when values are copied to releases
- The data model maintains integrity with proper constraints
- Option identifiers are now independent (path + value) instead of being tied to a specific value_id
- All demo data works correctly with the new independent option structure
