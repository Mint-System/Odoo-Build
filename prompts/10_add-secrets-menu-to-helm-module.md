---
title: Add secrets menu to helm module
---

# Run 10

Replace the `==` marked instructions in this file while you work on the task.

## Context

Read the `AGENTS.md` and `README.md` to get understanding of the project.

## Task

Similar to `prompts/05_create-new-menu-for-helm-values.md` I would like to see a menu entry "Secrets". It lists all secrets by name, chart and release. Place the menu entry next to "Values".

Add a smart button "Releases" to the chart form view. Click on it shows all releases that are connected to this chart.

## Worklog

1. Created list view for helm.chart.secret model showing name, chart_id, and release_id fields
2. Created window action for helm.chart.secret model with list and form views
3. Added "Secrets" menu item under Helm menu with sequence 16 (after Values at 15)
4. Added smart button "Releases" to chart form view header that opens releases filtered by current chart
5. Enhanced release search view with chart_id field and "By Chart" filter
6. Updated manifest to ensure proper loading order of views

## Summary

Successfully implemented all requested changes:

1. **Secrets Menu**: Added "Secrets" menu under Helm > Secrets (sequence 16, positioned after Values as requested)
2. **Secrets List View**: Created list view showing all secrets by name, chart, and release
3. **Smart Button**: Added "Releases" smart button to chart form view that shows all releases connected to the current chart
4. **Filter Enhancement**: Added chart_id field and "By Chart" filter to release search view for better filtering

The changes ensure that:
- All Helm secrets can be viewed through the new menu navigation (Helm > Secrets)
- Secrets are listed with their name, associated chart, and release
- Users can easily navigate from a chart to all its related releases via the smart button
- The release view properly filters by chart when accessed from the chart form
