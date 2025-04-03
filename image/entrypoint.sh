#!/bin/bash

set -e

entrypoint_log() {
    echo "$@"
}

echo "  ___      _               ____        _ _     _ "
echo " / _ \  __| | ___   ___   | __ ) _   _(_) | __| |"
echo "| | | |/ _' |/ _ \ / _ \  |  _ \| | | | | |/ _' |"
echo "| |_| | (_| | (_) | (_) | | |_) | |_| | | | (_| |"
echo " \___/ \__,_|\___/ \___/  |____/ \__,_|_|_|\__,_|"
echo
echo "Maintainer: Mint System GmbH <info@mint-system.ch>"

entrypoint-log "Run as user with id: $(id)"

source set-addons-path

export ENVIRONMENT=${ENVIRONMENT:="development"}
export SERVER_WIDE_MODULES="base,web,$SERVER_WIDE_MODULES"
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

# Set the postgres database host, port, user and password according to the environment
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
pg_isready -h "$PGHOST" -p "$PGPORT"

setup-mail
odoo-update

case "$1" in
    memray)
        shift
        entrypoint_log "Start Odoo with memray."
        rm -f /var/lib/odoo/memray-capture.bin
        exec python3 -m memray run -o /var/lib/odoo/memray-capture.bin $(which odoo) "$@" "${DB_ARGS[@]}"
        ;;
    -- | odoo)
        shift
        if [[ "$1" == "scaffold" ]] ; then
            exec odoo "$@"
        else
            pg_isready -h "$PGHOST" -p "$PGPORT"
            exec odoo "$@" "${DB_ARGS[@]}"
        fi
        ;;
    -*)
        pg_isready -h "$PGHOST" -p "$PGPORT"
        exec odoo "$@" "${DB_ARGS[@]}"
        ;;
    *)
        exec "$@"
esac

exit 1
