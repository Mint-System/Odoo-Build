#!/bin/bash
set -e

entrypoint-log() {
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

auto-envsubst
python-install

# Set the postgres database host, port, user and password according to the environment
# and pass them as arguments to the odoo process if not present in the config file
PGHOST=${PGHOST:='db'}
PGPORT=${PGPORT:=5432}
PGUSER=${PGUSER:='odoo'}
PGPASSWORD=${PGPASSWORD:='odoo'}
PGSSLMODE=${PGSSLMODE:="prefer"}
export PGSSLROOTCERT

if [ "$PGSSLMODE" = "verify-ca" ] && [ ! -f "$PGSSLROOTCERT" ]; then
    echo "Error: $PGSSLROOTCERT file not found."
    exit 1
fi

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
check_config "db_sslmode" "$PGSSLMODE"

entrypoint-log "Resolve database hostname: $PGHOST"
getent hosts "$PGHOST"

entrypoint-log "Waiting for database connection."
pg_isready -h "$PGHOST" -p "$PGPORT"

AUTO_UPDATE_MODULES="${AUTO_UPDATE_MODULES:=False}"
if [ "$AUTO_UPDATE_MODULES" = True ]; then
    update-modules
fi

AUTO_UPDATE_TRANSLATIONS="${AUTO_UPDATE_TRANSLATIONS:=False}"
if [ "$AUTO_UPDATE_TRANSLATIONS" = True ]; then
    update-translations
fi

case "$1" in
    memray)
        shift
        entrypoint-log "Start Odoo with memray."
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
