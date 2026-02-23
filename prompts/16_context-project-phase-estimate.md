---
title: Context project phase estimate
---

# Run 16

Replace the `==` marked instructions in this file while you work on the task.

## Context

Read the `AGENTS.md` and `README.md` to get understanding of the project.

## Task

Please update the  `addons/project/project_phase_estimate` module.

Here is the first task. 
When I open the task form and click on `phase_id` the `project_id` is passed as context. Then on the `project.task.phase` form I click on `action_project_estimate` and create a new estimate. The new estimate should be prefilled with the `project_id`. Can you make sure the `project_id`is  passed as context from the task from to the estimate tree?

Then I have another task.
When I click on "Project > Project Phases > Project Estimates", I want to see all estimates grouped by project by default.

And another task.
When I add a project phase to a task, ensure that the linked project has an estimate for this phase. If there is not estimate, create one and set planned time to 0.

Then I have final request.
Make sure that the combination of phase and project for an estimate is unique.

## Worklog

1. Analyzed the existing project_phase_estimate module structure and requirements
2. Modified project_task.xml to pass project_id as context when selecting phase_id
3. Updated project_phase.py to include default_project_id in action_project_estimate context
4. Enhanced project_estimate.xml to group estimates by project by default
5. Improved project_task.py to auto-create estimates when phase is assigned to task
6. Verified existing unique constraint in project_estimate.py covers requirement 4
7. Ran pre-commit checks to ensure code quality

## Summary

All requested features have been successfully implemented:

1. ✅ When opening task form and clicking on phase_id, the project_id is now passed as context. When creating a new estimate from the project.task.phase form, it is prefilled with the correct project_id.

2. ✅ When accessing "Project > Project Phases > Project Estimates", all estimates are now grouped by project by default.

3. ✅ When adding a project phase to a task, the system automatically checks if the linked project has an estimate for this phase. If not, it creates one with planned time set to 0.

4. ✅ The combination of phase and project for an estimate remains unique (already implemented via SQL constraint).

Changes were made to:
- addons/project/project_phase_estimate/views/project_task.xml
- addons/project/project_phase_estimate/models/project_phase.py  
- addons/project/project_phase_estimate/views/project_estimate.xml
- addons/project/project_phase_estimate/models/project_task.py

All modifications follow Odoo best practices and maintain existing code style. Pre-commit checks pass successfully.
