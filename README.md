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

Initialize database and install modules.

```bash
./docker-install-odoo
```

Open browser to [http://localhost:8069](http://localhost:8069) and login with `admin:admin`.

### Enable developer mode

Navigate to the [settings page](
http://localhost:8069/web?debug=1#id=&action=85&model=res.config.settings&view_type=form&cids=&menu_id=4) and click on *Activate the developer mode (with assets)*.

### Create new module

Scaffold a new module.

```bash
docker exec -it odoo bin/bash -c 'odoo scaffold qm_data_system /mnt/extra-addons'
```

Restart Odoo.

```bash
docker restart odoo
```

### Manage database

Open database manager [http://localhost:8000/](http://localhost:8000/) and login with `admin:admin`.

Add a new database connection with these credentials:

```conf
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

### Install custom module

```bash
./docker-odoo-install -m show_db_name
```

### Create new db

```bash
docker exec -it odoo bin/bash
createdb -h $HOST -U $USER Test
# Enter password
psql -h $HOST -U $USER -l
# Enter password
odoo -i base -c /etc/odoo/odoo.conf -d Test --db_host $HOST -r $USER -w $PASSWORD --stop-after-init
```

Open [http://localhost:8069/?db=Test](http://localhost:8069/?db=Test) in your browser.

### Delete db

```bash
docker exec -it odoo bin/bash
psql -h $HOST -U $USER -l
# Enter password
dropdb -h $HOST -U $USER Test
# Enter password

```

### Save config

```bash
docker exec -it odoo bin/bash -c "odoo -s -d Test --db_host \$HOST -r \$USER -w \$PASSWORD"
```