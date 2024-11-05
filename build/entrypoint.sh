#!/bin/bash

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

ME=$(basename "$0")
 
entrypoint_log() {
    if [ -z "${ODOO_ENTRYPOINT_QUIET_LOGS:-}" ]; then
        echo "$@"
    fi
}

git_clone_addons() {
    if [ -n "$ADDONS_GIT_REPOS" ]; then
        
        # Setup git ssh key
        mkdir -p ~/.ssh
        echo "$GIT_SSH_PRIVATE_KEY" > ~/.ssh/id_ed25519
        chmod 600 ~/.ssh/id_ed25519
        eval "$(ssh-agent -s)" >> /dev/null
        ssh-add ~/.ssh/id_ed25519
        
        # Clone git repo addons into /var/lib/odoo/addons
        for ADDON_GIT_REPO in $(echo "$ADDONS_GIT_REPOS" | tr "," "\n"); do
            
            # Parse git ssh url
            GIT_HOSTNAME=$(echo "$ADDON_GIT_REPO" | cut -d "@" -f 2 | cut -d ":" -f 1)
            GIT_URL=$(echo "$ADDON_GIT_REPO" | cut -d "#" -f 1)
            GIT_BRANCH=$(echo "$ADDON_GIT_REPO" | cut -d "#" -f 2)
            GIT_PATH=$(echo "$ADDON_GIT_REPO" | cut -d "#" -f 1 | cut -d ":" -f 2 | cut -d "." -f 1)
            ADDON_PATH="/var/lib/odoo/addons/$GIT_PATH"

            # Clone git repo and submodules
            if [ ! -d "$ADDON_PATH" ]; then
                ssh-keyscan -t rsa,dsa "$GIT_HOSTNAME" > ~/.ssh/known_hosts 2>/dev/null
                entrypoint_log "$ME: Clone $GIT_URL branch $GIT_BRANCH"
                git clone "$GIT_URL" --depth 1 --single-branch --branch "$GIT_BRANCH" "$ADDON_PATH"
                cd "$ADDON_PATH"
                git submodule update --init --recursive && git submodule update --init --recursive
            fi

            # Add git repo to addons path
            if [ -n "$ODOO_ADDONS_PATH" ]; then
                ODOO_ADDONS_PATH="$ODOO_ADDONS_PATH,$ADDON_PATH"
            else
                ODOO_ADDONS_PATH="$ADDON_PATH"
            fi
        done
    fi
}

git_clone_addons

set_odoo_config_env() {
    if [ -n "$ODOO_ADDONS_PATH" ]; then 

        entrypoint_log "$ME: Resolve addons path: $ODOO_ADDONS_PATH"

        # Search for module manifest files containing "version.+NN.0" and return list of module paths
        ODOO_MODULE_PATH=$(echo "$ODOO_ADDONS_PATH" | tr "," "\n" | xargs -I {} find {} -type f -name "__manifest__.py" | xargs grep -l "version.*${ODOO_VERSION}" | xargs -r dirname | sort -u | tr "\n" ",")
        
        # Set parent folder of module paths as new addons path
        ODOO_MODULE_PATH=$(echo "$ODOO_MODULE_PATH" | tr "," "\n" | xargs -I {} dirname {} | sort -u | tr "\n" "," | sed 's/,$//')
        
        if [ -n "$ODOO_MODULE_PATH" ]; then
            ODOO_ADDONS_PATH="$ODOO_ADDONS_PATH,$ODOO_MODULE_PATH"
        fi
    fi

    : "${LOG_LEVEL:=info}"
    export LOG_LEVEL

    : "${ADMIN_PASSWD:=odoo}"
    export ADMIN_PASSWD

    : "${DBFILTER:=.*}"
    export DBFILTER

    : "${ENVIRONMENT:=development}"
    export ENVIRONMENT

    : "${LIST_DB:=True}"
    export LIST_DB

    : "${PROXY_MODE:=False}"
    export PROXY_MODE

    : "${WORKERS:=0}"
    export WORKERS

    : "${SERVER_WIDE_MODULES:=web}"
    export SERVER_WIDE_MODULES
}

set_odoo_config_env

auto_envsubst() {
    local TEMPLATE_FILE="${ODOO_ENVSUBST_TEMPLATE_FILE:-/etc/odoo/odoo.conf.template}"
    local OUTPUT_FILE="${ODOO_ENVSUBST_OUTPUT_FILE:-/etc/odoo/odoo.conf}"
    local FILTER="${ODOO_ENVSUBST_FILTER:-}"

    DEFINED_ENVS=$(printf '${%s} ' $(awk "END { for (name in ENVIRON) { print ( name ~ /${FILTER}/ ) ? name : \"\" } }" < /dev/null ))

    if [[ -f "$TEMPLATE_FILE" ]]; then 
        entrypoint_log "$ME: Running envsubst on $TEMPLATE_FILE to $OUTPUT_FILE"
        envsubst "$DEFINED_ENVS" < "$TEMPLATE_FILE" > "$OUTPUT_FILE"
    fi
}

auto_envsubst

pip_install() {
    if [ -n "$PIP_INSTALL" ]; then
        entrypoint_log "$ME: Install python packages: $PIP_INSTALL"
        pip install --no-cache-dir $PIP_INSTALL
    fi

    entrypoint_log "$ME: List python packages:" 
    pip list
}

pip_install

entrypoint_log "$ME: Running Odoo $ODOO_VERSION as user: $USER"

# Set the postgres database host, port, user and password according to the environment
# and pass them as arguments to the odoo process if not present in the config file
: ${HOST:=${DB_PORT_5432_TCP_ADDR:='db'}}
: ${PORT:=${DB_PORT_5432_TCP_PORT:=5432}}
: ${USER:=${DB_ENV_POSTGRES_USER:=${POSTGRES_USER:='odoo'}}}
: ${PASSWORD:=${DB_ENV_POSTGRES_PASSWORD:=${POSTGRES_PASSWORD:='odoo'}}}

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
check_config "db_host" "$HOST"
check_config "db_port" "$PORT"
check_config "db_user" "$USER"
check_config "db_password" "$PASSWORD"

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
