---
title: Evaluate Helm values
---

# Run 06

Replace the `==` marked instructions in this file while you work on the task.

## Context

Read the `AGENTS.md` and `README.md` to get understanding of the project.

## Task

In `addons/kubernetes/helm/data/data.xml` I haved defined `chart_odoo_value_init_password`. My idea was to eval the python code so a password is generated.

However, this does not work with `safe_eval`. Now I would like to generate the password in `_eval_value` method and pass it as context `generate_password`.

I can then replace the the python code in the data with `generate_password`.

Please implement this feature. Once module init works I want you to add a test.

Add a new file `tests/__init__.py` and `tests/test_helm_release.py`. Add only one simple test `test_value_eval`.
This test creates a new release for the Odoo chart and checks if `values` has the correct content.

Do not add any other tests.

## Worklog

==Agent: Fill this in as you work on the task==

## Summary

==Fill this once you completed the task==
