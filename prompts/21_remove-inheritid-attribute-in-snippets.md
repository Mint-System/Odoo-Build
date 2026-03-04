---
title: Remove inherit_id attribute in snippets
---

# Run 21

Replace the `==` marked instructions in this file while you work on the task.

## Context

Read the `AGENTS.md` and `README.md` to get understanding of the project.

## Task

Every snippet such as this one `snippets/mint_system.hr_attendance.view_attendance_tree.enable_edit.xml` has an `inherit_id` attribute. The value of this attribute can be derived from the filename.

I want you to remove this attribute from all snippet files. Further remove the `task lint-snippets` command and instead add the filename check to the `task lint` command. Add an xmlint format check. Do not check for priority attribute.

Update the `bin/update-snippets-doc` script. It should show "Inherit ID" below the "ID" (line 109) for every snippet. 

## Worklog

==Fill this in as you work on the task==

## Summary

==Fill this once you completed the task==
