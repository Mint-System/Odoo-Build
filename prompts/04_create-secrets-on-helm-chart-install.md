---
title: create-secrets-on-helm-chart-install
---

# Run 04

Replace the `==` marked instructions in this file while you work on the task.

## Context

Read the `AGENTS.md` and `README.md` to get understanding of the project.

## Task

The helm secret model `addons/kubernetes/helm/models/helm_chart_secret.py` has been implemented.

But the actual creation of the secrets is missing.

When a chart is installed the `action_install` runs the helm commands. Extend this method to create the secrets.

Removing a secret from a release should delete the secret. Also when a chart is uninstalled the secret should be removed.

## Worklog

1. Analyzed existing helm_chart_secret.py and helm_release.py models
2. Extended action_install() method to call _create_secrets() BEFORE chart installation (as per Helm best practices)
3. Extended action_upgrade() method to recreate secrets (delete old, create new)
4. Extended action_uninstall() method to call _delete_secrets() before chart uninstallation
5. Added _create_secrets() method to create Kubernetes secrets using kubectl commands
6. Added _delete_secrets() method to delete Kubernetes secrets using kubectl commands
7. Fixed namespace_id reference issue in _inverse_namespace_id method
8. Removed write() method override as it's not needed for proper secret management
9. Updated module to apply changes
10. Moved secret creation before helm install command to follow Helm best practices
11. CRITICAL FIX: Changed secret naming to use exact Odoo secret name (e.g., "odoo-creds") instead of release-prefix pattern

## Summary

Successfully implemented secret creation and deletion for Helm chart installations following Helm best practices:

### Secret Creation (Before Install)

- Extended `action_install()` to call `_create_secrets()` BEFORE helm install command
- **CRITICAL FIX**: Secrets use exact Odoo secret name (e.g., "odoo-creds") as required by Helm charts
- Secret data supports dynamic evaluation using Python expressions
- Secrets are created in the release's namespace
- Follows the pattern from Helm Chart README example exactly

### Secret Updates

- Extended `action_upgrade()` to recreate secrets (delete old, create new)
- Ensures secrets match the current configuration after upgrade

### Secret Deletion

- Extended `action_uninstall()` to call `_delete_secrets()` before chart uninstallation
- Uses `--ignore-not-found=true` flag to prevent failures if secret doesn't exist

### Implementation Details

- Uses kubectl context's `run()` method to execute kubectl commands
- Supports dynamic secret values using Python expressions
- Proper error handling and logging
- **Secrets use exact Odoo names** (not release-prefixed) so Helm charts can find them
- All secret operations are performed in the release's namespace
- Follows the exact kubectl command pattern from the provided example:
  ```bash
  kubectl create secret generic odoo-creds \
    --from-literal=GITHUB_USERNAME="<username>" \
    --from-literal=GITHUB_PAT="*******" \
    -n <namespace>
  ```

The implementation ensures that:

- Secrets are automatically created BEFORE charts are installed (Helm best practice)
- **Secrets have exact names as defined in Odoo** so Helm charts can find them
- Secrets are updated when charts are upgraded
- Secrets are deleted when charts are uninstalled
- Secret data supports dynamic evaluation like other Helm values
- Clean separation of concerns without unnecessary method overrides
- Follows Helm best practices as shown in the README example
