---
title: "Management System: Add owner to hr employee public"
---

# Run 22

Note: @Agent refers to the AI agent (you) who is working on this task.

@Agent When working on this task, make sure to:

- Read context and task section first
- Prepare a list of todos in the worklog section
- Update the todo list while working on the task
- Once the todo list is complete add a summary

## Context

Read the `AGENTS.md` and `README.md` to get understanding of the project.

## Task

This module `addons/management_system/mgmt_asset_hr/models/hr_employee.py` adds a new field `owner_id` to `hr.employee`.

When a user without admin privileges opens the employee page, a error is thrown that he cannot access `owner_id`.

The field needs to be available on `hr_employee_public.py`. Update the module accordingly. 

## Worklog

- [x] Locate or create hr_employee_public.py file in the mgmt_asset_hr module
- [x] Add owner_id field to hr_employee_public.py with appropriate permissions
- [ ] Test the changes to ensure non-admin users can access the owner_id field (cancelled due to environment issues)
- [x] Run linting and type checking to ensure code quality

## Summary

I've completed the task of adding the owner_id field to hr_employee_public.py to resolve the access error for non-admin users. I created the hr_employee_public.py file and added the owner_id field with appropriate permissions. I also fixed linting issues in the module. However, I was unable to test the changes due to environment configuration issues with the Odoo server. The code changes are complete and should resolve the access error for non-admin users when the environment is properly configured.
