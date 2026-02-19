---
title: Init Helm Portal module
---

# Run 11

Replace the `==` marked instructions in this file while you work on the task.

## Context

Read the `AGENTS.md` and `README.md` to get understanding of the project.

## Task

Create a new module `addons/kuberentes/helm_portal`. It depends on `helm` and `portal`. Use the `task create-module` to boostrap the module.

Add the portal mixin and a view for `helm.release`. The portal url is `my/releases` for a list and `my/release/<id>` for details.

The releases are filtered by `helm.release:partner_id`.

The portal list view shows the name, link (ingress_url) and state of the relase.

Going into the details the customer can see the following informations

```
<h1>{release.name}</h1>

Link: <a href="{release.ingress_url}">{release.ingress_url}</a>
State: {release.state}

Release Configuration:

{for value in release.value_ids}
{value.path}: {value.value or value.options_id.value}
{endfor}

<button>Update Release</button>

Last Output:

{release.output}
```

The user can update the value or select from the options. With the "Update Release" button the new values are written to the release. Odoo then runs the `action_upgrade` method. The page is refereshed and the user can see under `Last Output:` the last response. Format the output with terminal-screen css.

Not that the Configuration options are only available if the release is in state `installed`.

## Worklog

==Fill this in as you work on the task==

## Summary

==Fill this once you completed the task==
