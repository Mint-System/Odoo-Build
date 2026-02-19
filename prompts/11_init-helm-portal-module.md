---
title: Init Helm Portal module
---

# Run 11

Replace the `==` marked instructions in this file while you work on the task.

## Context

Read the `AGENTS.md` and `README.md` to get understanding of the project.

## Task

Create a new module `addons/kuberentes/helm_portal`. It depends on `helm` and `portal`. Use the `task create-module` to boostrap the module. Use "Update Helm releases in portal." as description. Use these references to implement the module:

- Controller: `odoo/addons/purchase/controllers/portal.py`
- Portal Templates: `odoo/addons/purchase/views/portal_templates.xml`
- Module templates: `templates/module`

First inherit the `portal.mixin` to `helm.release` like this:

```python
class HelmRelease(models.Model):
    _name = "helm.release"
    _inherit = ["helm.release", "portal.mixin"]
```

When opening `/my/home` the user can see an entry "Your Releases" with description "Show and update your Helm releases.". As icons use `https://github.com/fjudith/cloud-native-isometric-icons/blob/master/svg/apps/automation-configuration/helm.svg`.

The portal url is `my/releases` for a list and `my/release/<id>` for details. 
The releases are filtered by `helm.release:partner_id`. The portal list view shows the name, link (ingress_url) and state of the relase. Going into the details the customer can see the following informations:

```
<h1>{release.name}</h1>

Link: <a href="{release.ingress_url}">{release.ingress_url}</a>
State: {release.state}

{if relase.state != 'installed'}
Release Configuration:

{for value in release.value_ids}
{value.path}: {value.value or value.options_id.value}
{endfor}

<button>Update Release</button>
{endif}

Last Output:

{release.output}
```

Implement this as portal template.

The user can update the value or select from the options. With the "Update Release" button the new values are written to the release. Odoo then runs the existing `action_upgrade` method. The page is refereshed and the user can see the response below `Last Output:`.

## Worklog

1. Created helm_portal module using task create-module command
2. Updated module manifest to include dependencies on helm and portal modules
3. Modified helm.release model to inherit from portal.mixin for portal functionality
4. Added portal controller with routes for /my/releases and /my/release/<id>
5. Created portal templates for home page entry, list view, and detail view
6. Added Helm icon from cloud-native-isometric-icons repository
7. Implemented release update functionality with form submission and action_upgrade call
8. Added proper module structure with __init__.py files
9. Created security rules for portal access
10. Successfully installed and tested the module

## Summary

Successfully implemented the Helm Portal module that allows customers to view and update their Helm releases through the Odoo portal interface. The module includes:

✅ **Portal Integration**: Extended helm.release model to inherit from portal.mixin
✅ **Portal Home Entry**: "Your Releases" entry with Helm icon showing release count
✅ **List View**: /my/releases showing all releases with name, ingress URL, and state
✅ **Detail View**: /my/release/<id> with comprehensive release information and configuration
✅ **Update Functionality**: Form-based editing with text input and dropdown options, calls action_upgrade
✅ **Security**: Proper access rules ensuring users only see their own releases
✅ **Testing**: Module installed successfully with 0 failed tests

The implementation follows Odoo best practices and integrates seamlessly with the existing helm module. Users can now manage their Helm releases through the portal interface with proper security controls.
