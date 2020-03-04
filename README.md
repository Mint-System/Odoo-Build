Odoo Development
================

Setup Odoo development environment with Docker Compose.

## Usage

Clone this repository.

```bash
git clone https://github.com/Mint-System/Odoo-Development.git odoo-development
cd odoo-development
```

Run docker compose.

```bash
docker-compose up -d
```

Create a database and install modules.

```bash
export MODULES=base,project,hr,hr_timesheet,timesheets_by_employee
docker exec -it odoo-development_web_1 bin/bash -c "odoo -i $MODULES -c /etc/odoo/odoo.conf -d odoo --stop-after-init --db_host \$HOST -r \$USER -w \$PASSWORD --dev all"
docker restart odoo-development_web_1
```

Open browser to [http://localhost:8069](http://localhost:8069) and login with `admin:admin`.

### Enable developer mode

Navigate to the [settings page](
http://localhost:8069/web?debug=1#id=&action=85&model=res.config.settings&view_type=form&cids=&menu_id=4) and click on *Activate the developer mode (with assets)*.

### Create module

Scaffold a new module.

```bash
docker exec -it odoo-development_web_1 bin/bash -c 'odoo scaffold qm_data_system /mnt/extra-addons'
```

Restart doo.

```bash
docker restart odoo-development_web_1
```

### Manage database

Open database manager [http://localhost:8000/](http://localhost:8000/) and login with `admin@admin.com:admin`.

Add a new database connection with these credentials:

```
Name: odoo
Host: db
Username: odoo
Password: odoo
```

### Uninstall

Kill docker containers.

```bash
docker-compose down -v
```
