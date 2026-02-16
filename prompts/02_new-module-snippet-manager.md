---
title: New module snippet manager
---

Read the `AGENTS.md` to get an understanding of the project.

Your task is create new module: `snippet_manager`.

The module repo is `./addons/server_tools`.

Use the `task` script command to create the module.

Check the `Create a new module from source` in `README.md` for details.

Add a new `data.xml` that creates a system parameter `snippet_manager.source_url` with value `https://odoo.build/snippets/`.

The module adds a method `update_from_source()` to `ir.ui.view` model. The function does not take any parameter.

This method takes the name of the view and checks if a view definition is available at: `{source_url}/{self.name}.xml`.

For example if the view name is `mint_system.base.view_partner_tree.show_type` it checks `https://odoo.build/snippets/mint_system.base.view_partner_tree.show_type.xml`

The content of this view is:

```xml
<data inherit_id="base.view_partner_tree" priority="50">
    <field name="complete_name" position="before">
        <field name="type" optional="show"/>
    </field>
</data>
```

This can be copied to the `arch` field.

Once the module and the files are created, remove any unecessary files. For example the `security` of the module is not required. Double-check the `__manifest__.py`.

Use the `task generate-module-docs`  command to generate the module readme.

If the documentation is updated, step into the repo folder. Execute the `task all` commands.