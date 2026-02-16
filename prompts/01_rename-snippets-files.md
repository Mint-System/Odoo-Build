---
title: Rename snippets files
---

Read the `AGENTS.md` to get an understanding of the project.

The `snippets` folder contains files like `account.portal_invoice_page.convert_html_note.xml`. I want add the `mint_system.` prefix to all files. The resulting name would be `mint_system.account.portal_invoice_page.convert_html_note.xml`.

This also requires updating the `./bin/update-snippets-doc` script.

The `task` script has already been updated.