---
title: Replace snippets lint with python script
---

# Run 17

Replace the `==` marked instructions in this file while you work on the task.

## Context

Read the `AGENTS.md` and `README.md` to get understanding of the project.

## Task

Replace the task `lint-snippets` function with a Python `bin/lint-snippets` script.

Currently when the linting fails it is often case that the inherit definition does not match the filename. Here is example:

```
*[main][~/Odoo-Build]$ task lint-snippets
Lint snippets files...
Linting failed for snippets/mint_system.web.address_layout.style_allnet.xml
 Inherit: sale.report_saleorder_document
Filename: web.address_layout
```

In this case the inherit attribute is `web.address_layout` and can be upated in the file.

## Worklog

==Fill this in as you work on the task==

## Summary

==Fill this once you completed the task==
