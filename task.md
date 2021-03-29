command|option|description
-|-|-
start| |Start docker container.
stop| |Stop docker container.
kill| |Remove docker container and volumes.
logs| |Tail Odoo Docker container logs.
start-db| |Start database container only.
disable-auto-install| |Disable auto install for enterprise modules.
venv-init| |Initialize python virtual env.
active-venv| |Activate python virtual env.
install-src| |Install Odoo requirements in source folder.
init-db| |Initialize the Odoo database.
start-src| |Start Odoo from source folder.
start-shell|[db]|Start Odoo shell from source folder.
create-module|[name]|Create new Odoo module from template.
install-module|[db] [name]|Install target Odoo module.
update-module|[db] [name]|Update target Odoo module.
remove-module|[db] [name]|Remove target Odoo module.
zip-module|[path]|Create zip file for module.
release-module|[path]|Create GitHub release for module.
drop-db|[db]|Drop target Odoo database.
clear-assets|[db]|Clear Odoo assets.
clear-filestore|[db]|Clear local filestore folder. Pass not param to clear all filestores.
convert-database|[db]|Convert database backup file from postgres 9.5 to latest.
