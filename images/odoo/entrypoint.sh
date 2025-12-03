#!/usr/bin/env bash
set -e

echo '  ___      _               ____        _ _     _ '
echo ' / _ \  __| | ___   ___   | __ ) _   _(_) | __| |'
echo '| | | |/ _'"'"' |/ _ \ / _ \  |  _ \| | | | | |/ _'"'"' |'
echo '| |_| | (_| | (_) | (_) | | |_) | |_| | | | (_| |'
echo ' \___/ \__,_|\___/ \___/  |____/ \__,_|_|_|\__,_|'
echo
echo 'Maintainer: Mint System GmbH <info@mint-system.ch>'

log-entrypoint "Run as user with id: $(id)"

aggregate-git-repos
template-odoo-rc
install-python-packages

# Set the postgres database host, port, user and password according to the environment
# and pass them as arguments to the odoo process if not present in the config file
PGHOST=${PGHOST:='db'}
PGPORT=${PGPORT:=5432}
PGUSER=${PGUSER:='odoo'}
PGPASSWORD=${PGPASSWORD:='odoo'}
PGSSLMODE=${PGSSLMODE:="prefer"}
export PGSSLROOTCERT

if [[ "$PGSSLMODE" = "verify-ca" ]] && [[ ! -f "$PGSSLROOTCERT" ]]; then
    log-entrypoint "Error: $PGSSLROOTCERT file not found."
    exit 1
fi

DB_ARGS=()
check_config() {
    local param="$1"
    local value="$2"
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

log-entrypoint "Resolve database hostname: $PGHOST"
getent hosts "$PGHOST"
wait-for-pg

AUTO_UPDATE_MODULES="${AUTO_UPDATE_MODULES:=False}"
if [[ "$AUTO_UPDATE_MODULES" = "True" ]]; then
    update-modules
fi

AUTO_UPDATE_MODULES_LIST="${AUTO_UPDATE_MODULES_LIST:=False}"
if [[ "$AUTO_UPDATE_MODULES_LIST" = "True" ]]; then
    update-modules-list
fi

AUTO_UPDATE_TRANSLATIONS="${AUTO_UPDATE_TRANSLATIONS:=False}"
if [[ "$AUTO_UPDATE_TRANSLATIONS" = "True" ]]; then
    update-translations
fi

case "$1" in
    -- | memray)
        shift
        log-entrypoint 'Start Odoo with memray.'
        rm -f /var/lib/odoo/memray-capture.bin
        exec python3 -m memray run -o /var/lib/odoo/memray-capture.bin $(which odoo) "$@" "${DB_ARGS[@]}"
        ;;
    -- | odoo)
        shift
        if [[ "$1" == "scaffold" ]] ; then
            exec odoo "$@"
        else
            wait-for-pg
            exec odoo "$@" "${DB_ARGS[@]}"
        fi
        ;;
    -- | odoo-nginx)
        shift
        log-entrypoint 'Start Odoo with nginx.'
        wait-for-pg
        nginx -c /etc/nginx/nginx.conf &
        exec odoo "$@" "${DB_ARGS[@]}"
        ;;
    -*)
        wait-for-pg
        exec odoo "$@" "${DB_ARGS[@]}"
        ;;
    *)
        exec "$@"
esac

exit 1
