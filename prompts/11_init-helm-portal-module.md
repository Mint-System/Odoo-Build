---
title: Init Helm Portal module
---

# Run 11

Replace the `==` marked instructions in this file while you work on the task.

## Context

Read the `AGENTS.md` and `README.md` to get understanding of the project.

## Task

Create a new module `addons/kuberentes/helm_portal`. Use the `task create-module` command to do so.

Add a portal view for `helm.release` unter `/releases` and `release/<id>`.

The customer `helm.release:partner_id` can see his releases.

The portal list view shows the name, link (ingress_url) and state of the relase.

Going into the details the customer can see the following:

```
# Name

Link: {release_id.ingress_url}
State: {ingress_url.state}

Updateable config:

{for value in release_id.value_ids}
{value.path}: {value.value or value.options_id.value}
{endfor}

[Update Release]

Last Output:

{release_id.output}
```

The user can update the value or select from options. With the "Update Release" button the new values are written to the release. Odoo then runs the `action_upgrade` method.

These options are only available if the release is in state `installed`.

## Worklog

==Fill this in as you work on the task==

## Summary

==Fill this once you completed the task==
