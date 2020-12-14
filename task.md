command|option|description
-|-|-
disable-auto-install| |Disable auto install for enterprise modules.
start| |Start docker container.
stop| |Stop docker container.
kill| |Remove docker container and volumes.
logs| |Tail Odoo Docker container logs.
start-db| |Start database container only.
install-src| |Install Odoo requirements in source folder.
init-db| |Initialize the Odoo database.
start-src| |Start Odoo from source folder.
start-shell|[db]|Start Odoo shell from source folder.
update-module|[db] [name]|Update target Odoo module.
scaffold-src|[name]|Scaffold new Odoo module from template.
drop-db|[db]|Drop target Odoo database.
compile-managed-modules| |Package managed Odoo modules.
copy-managed-modules| |Copy managed Odoo modules to addon folder.
remove-managed-modules| |Remove managed Odoo modules from addon folder.
clear-assets|[db]|Clear Odoo assets.
venv-init| |Initialize python virtual env.
convert-database|[db]|Convert database backup file from postgres 9.5 to latest.
