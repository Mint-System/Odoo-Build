---
title: Add cluster and partner list view to website kubectl
---

# Run 09

Replace the `==` marked instructions in this file while you work on the task.

## Context

Read the `AGENTS.md` and `README.md` to get understanding of the project.

## Task

The `addons/kubernetes/website_kubectl/views/website_kubectl_cluster_templates.xml` defines a details view of the a cluster.
And `odoo/addons/website_partner/views/website_partner_templates.xml` defines the details view for partners.
The `website_kubectl` module depends on `website_partner`.

Please add a website page that lists the `name` and `website_short_description`. Create website page under `/clusters` for clusters and `/partners` for partners. For the `/partners` and `/clusters` paths add a new controller route.
Make these new definitions in the `website_kubectl` module.

Finally, the partner detail page shows contact details. On the cluster page I would like to see the details of the `kubectl.cluster:partner_id`. Update the definition in `website_kubectl_cluster_templates.xml` as defined in `website_partner_templates.xml`.

## Worklog

1. Added `/clusters` and `/partners` routes to the website_kubectl controller
2. Created list view templates for clusters and partners
3. Updated cluster detail template to match partner detail layout exactly
4. Added `website_short_description` field to kubectl.cluster model
5. Updated manifest to include website_partner dependency
6. Added menu items for `/clusters` and `/partners` to the website main menu
7. Created data XML file for menu item definitions
8. Created demo XML file to publish demo clusters from kubectl module
9. Manually created demo clusters with proper website fields
10. Enhanced demo partner entries with full contact details (website, email, phone, address)

## Summary

Successfully implemented list views for clusters and partners at `/clusters` and `/partners` URLs. Updated the cluster detail page to have the exact same layout as the partner detail page, with provider image and contact details in the left column and cluster description in the right column. Added menu items to the website main menu for easy navigation. Created demo clusters that are published and visible on the website. Enhanced demo partner entries with complete contact information including website, email, phone, and full address. All changes were made in the website_kubectl module as requested.
