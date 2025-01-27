#!/bin/bash

# Based on: https://github.com/odoo/docker/blob/master/18.0/entrypoint.sh

set -e

echo "  ___      _               ____        _ _     _ "
echo " / _ \  __| | ___   ___   | __ ) _   _(_) | __| |"
echo "| | | |/ _' |/ _ \ / _ \  |  _ \| | | | | |/ _' |"
echo "| |_| | (_| | (_) | (_) | | |_) | |_| | | | (_| |"
echo " \___/ \__,_|\___/ \___/  |____/ \__,_|_|_|\__,_|"
echo
echo "Maintainer: Mint System GmbH <info@mint-system.ch>"

if [ -v PASSWORD_FILE ]; then
    PASSWORD="$(< $PASSWORD_FILE)"
fi

source git-clone-addons

source set-addons-path

export ENVIRONMENT=${ENVIRONMENT:="development"}
if [ -z "$SERVER_WIDE_MODULES" ]; then
    SERVER_WIDE_MODULES="base,web,$SERVER_WIDE_MODULES"
else
    SERVER_WIDE_MODULES="base,web"
fi
export SERVER_WIDE_MODULES
export PROXY_MODE=${PROXY_MODE:=False}
export LOG_LEVEL=${LOG_LEVEL:="info"}

export LIST_DB=${LIST_DB:=True}
export ADMIN_PASSWD=${ADMIN_PASSWD:="odoo"}
export DBFILTER=${DBFILTER:=".*"}

export WORKERS=${WORKERS:=0}
export LIMIT_REQUEST=${LIMIT_REQUEST:=8192}
export LIMIT_TIME_CPU=${LIMIT_TIME_CPU:=60}
export LIMIT_TIME_REAL=${LIMIT_TIME_REAL:=120}

auto-envsubst

python-install

# set the postgres database host, port, user and password according to the environment
# and pass them as arguments to the odoo process if not present in the config file
: ${PGHOST:=${DB_PORT_5432_TCP_ADDR:='db'}}
: ${PGPORT:=${DB_PORT_5432_TCP_PORT:=5432}}
: ${PGUSER:=${DB_ENV_POSTGRES_USER:=${POSTGRES_USER:='odoo'}}}
: ${PGPASSWORD:=${DB_ENV_POSTGRES_PASSWORD:=${POSTGRES_PASSWORD:='odoo'}}}

DB_ARGS=()
function check_config() {
    param="$1"
    value="$2"
    if grep -q -E "^\s*\b${param}\b\s*=" "$ODOO_RC" ; then       
        value=$(grep -E "^\s*\b${param}\b\s*=" "$ODOO_RC" |cut -d " " -f3|sed 's/["\n\r]//g')
    fi;
    DB_ARGS+=("--${param}")
    DB_ARGS+=("${value}")
}
check_config "db_host" "$PGHOST"
check_config "db_port" "$PGPORT"
check_config "db_user" "$PGUSER"
check_config "db_password" "$PGPASSWORD"

entrypoint-log "Waiting for database connection."
wait-for-psql.py ${DB_ARGS[@]} --timeout=30

init-db

setup-mail

odoo-update

entrypoint-log "Running Odoo $ODOO_VERSION as user: $USER"

case "$1" in
    -- | odoo)
        shift
        if [[ "$1" == "scaffold" ]] ; then
            exec odoo "$@"
        else
            wait-for-psql.py ${DB_ARGS[@]} --timeout=30
            exec odoo "$@" "${DB_ARGS[@]}"
        fi
        ;;
    -*)
        wait-for-psql.py ${DB_ARGS[@]} --timeout=30
        exec odoo "$@" "${DB_ARGS[@]}"
        ;;
    *)
        exec "$@"
esac

exit 1
