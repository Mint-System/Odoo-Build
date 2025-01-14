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
        if [ -n "$GIT_SSH_PRIVATE_KEY" ]; then
            entrypoint_log "Setup SSH key from env vars."
            echo "$GIT_SSH_PRIVATE_KEY" > ~/.ssh/id_ed25519
            chmod 600 ~/.ssh/id_ed25519
            eval "$(ssh-agent -s)"
            ssh-add ~/.ssh/id_ed25519
        fi

        # Clone git repo addons into /var/lib/odoo/git
        entrypoint_log "Cloning git repos: $ADDONS_GIT_REPOS"
        ADDONS_GIT_REPOS=$(echo "$ADDONS_GIT_REPOS" | tr "," "\n")        
        for ADDON_GIT_REPO in $ADDONS_GIT_REPOS; do
            
            # Supported urls:
            # SSH: git@github.com:OCA/server-tools.git#16.0
            # HTTP: https://github.com/OCA/server-tools.git#16.0

            GIT_URL=$(echo "$ADDON_GIT_REPO" | cut -d# -f1)
            GIT_BRANCH=$(echo "$ADDON_GIT_REPO" | cut -d# -f2)
            GIT_HOSTNAME=$(parse-url "$GIT_URL" hostname)
            GIT_PATH=$(parse-url "$GIT_URL" path | sed 's/.git//g')
            GIT_PATH="/var/lib/odoo/git/$GIT_HOSTNAME/$GIT_PATH"

            if [ ! -d "$GIT_PATH/.git" ]; then
                # Clone git repo and submodules
                mkdir -p "$GIT_PATH"
                ssh-keyscan -t rsa,dsa "$GIT_HOSTNAME" > ~/.ssh/known_hosts 2>/dev/null
                entrypoint_log "$ME: Clone $GIT_URL branch $GIT_BRANCH"
                git clone "$GIT_URL" --depth 1 --single-branch --branch "$GIT_BRANCH" "$GIT_PATH"
            else
                entrypoint_log "$ME: Update $GIT_URL branch $GIT_BRANCH"
                git -C "$GIT_PATH" switch "$GIT_BRANCH"
                git -C "$GIT_PATH" pull
            fi

            if [ -f "$GIT_PATH/.gitmodules" ]; then
                echo "$ME: Init and update git submodules in $GIT_PATH"
                git -C "$GIT_PATH" submodule update --init --recursive --depth 1
            fi
            
            # Add git repo to addons path
            if [ -n "$ODOO_ADDONS_PATH" ]; then
                ODOO_ADDONS_PATH="$ODOO_ADDONS_PATH,$GIT_PATH"
            else
                ODOO_ADDONS_PATH="$GIT_PATH"
            fi
        done

        # Remove git ssh key
        if [ -n "$GIT_SSH_PRIVATE_KEY" ]; then
            ssh-add -d ~/.ssh/id_ed25519
            rm ~/.ssh/id_ed25519
        fi
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

        # Enterprise modules always have version 1.0
        if [[ "$ODOO_ADDONS_PATH" =~ "/mnt/enterprise" ]]; then
            ODOO_ADDONS_PATH="/mnt/enterprise,$ODOO_MODULE_PATH"
        else
            ODOO_ADDONS_PATH="$ODOO_MODULE_PATH"
        fi
    fi
    
    GIT_SSH_PRIVATE_KEY=$(echo -e "$GIT_SSH_PRIVATE_KEY" | base64 -w0)
    export GIT_SSH_PRIVATE_KEY
    export GIT_SSH_PUBLIC_KEY

    : "${ENVIRONMENT:=development}"
    export ENVIRONMENT
    : "${SERVER_WIDE_MODULES:=web}"
    export SERVER_WIDE_MODULES
    : "${PROXY_MODE:=False}"
    export PROXY_MODE
    : "${LOG_LEVEL:=info}"
    export LOG_LEVEL

    : "${LIST_DB:=True}"
    export LIST_DB
    : "${ADMIN_PASSWD:=odoo}"
    export ADMIN_PASSWD
    : "${DBFILTER:=.*}"
    export DBFILTER

    : "${WORKERS:=0}"
    export WORKERS
    : "${LIMIT_REQUEST:=8192}"
    export LIMIT_REQUEST
    : "${LIMIT_TIME_CPU:=60}"
    export LIMIT_TIME_CPU
    : "${LIMIT_TIME_REAL:=120}"
    export LIMIT_TIME_REAL
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

python_install() {
    if [ -n "$PYTHON_INSTALL" ]; then
        entrypoint_log "$ME: Install python packages: $PYTHON_INSTALL"
        uv pip install --no-cache-dir $(echo "$PYTHON_INSTALL" | tr "," " ")
    fi

    entrypoint_log "$ME: List python packages:" 
    uv pip list
}

python_install

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

init_db() {
    if [ -n "$ODOO_DATABASE" ]; then
        : "${ODOO_INIT:=False}"

        entrypoint_log "$ME: Check if database $ODOO_DATABASE exists"
        wait-for-psql.py ${DB_ARGS[@]} --timeout=30
        DATABASE_EXISTS=$(exec psql "postgres://$PGUSER:$PGPASSWORD@$PGHOST:$PGPORT/postgres" -tAc "SELECT COUNT(*) FROM pg_database WHERE datname = '$ODOO_DATABASE'")

        # If it does not exist, create it
        if [ "$DATABASE_EXISTS" = "0" ]; then
            entrypoint_log "$ME: Create database $ODOO_DATABASE"
            (exec psql "postgres://$PGUSER:$PGPASSWORD@$PGHOST:$PGPORT/postgres" -tAc "CREATE DATABASE $ODOO_DATABASE;") || true
        fi

        entrypoint_log "$ME: Check if database $ODOO_DATABASE is initialized"
        DATABASE_INITIALIZED=$(exec psql "postgres://$PGUSER:$PGPASSWORD@$PGHOST:$PGPORT/$ODOO_DATABASE" -tAc "SELECT COUNT(*) FROM information_schema.tables WHERE table_name = 'ir_module_module'")
        
        if [ "$ODOO_INIT" = "True" ] && [ "$DATABASE_INITIALIZED" = "0" ]; then
            : "${ODOO_INIT_LANG:=en_US}"
            : "${ODOO_INIT_ADDONS:=web}"
            entrypoint_log "$ME: Initialize database $ODOO_DATABASE with modules: $ODOO_INIT_ADDONS"
            (exec odoo "${DB_ARGS[@]}" --database "$ODOO_DATABASE" --init "$ODOO_INIT_ADDONS" --config "$ODOO_RC" --stop-after-init --no-http --load-language "$ODOO_INIT_LANG" --without-demo=all) || true
        fi
    fi
}

init_db

setup_mail() {
    
    if [ -n "$ODOO_MAIL_SMTP_HOST" ]; then
        ODOO_MAIL_SMTP_PORT=${ODOO_MAIL_SMTP_PORT:="587"}
        ODOO_MAIL_SMTP_ENCRYPTION=${ODOO_MAIL_SMTP_ENCRYPTION:="starttls"}
        ODOO_MAIL_SMTP_FROM_FILTER=${ODOO_MAIL_SMTP_FROM_FILTER:=""}

        IR_MAIL_SERVER_ID=$(psql "postgres://$PGUSER:$PGPASSWORD@$PGHOST:$PGPORT/$DATABASE" -tAc "SELECT id FROM ir_mail_server WHERE name = '$ODOO_MAIL_SMTP_HOST' LIMIT 1")
        if [ -z "$IR_MAIL_SERVER_ID" ]; then
            entrypoint_log "$ME: Setup outgoing mail server $ODOO_MAIL_SMTP_HOST for database $DATABASE."
            psql "postgres://$PGUSER:$PGPASSWORD@$PGHOST:$PGPORT/$DATABASE" -c "INSERT INTO ir_mail_server (name, smtp_host, smtp_port, smtp_user, smtp_pass, smtp_encryption, from_filter) VALUES ('$ODOO_MAIL_SMTP_HOST', '$ODOO_MAIL_SMTP_HOST', $ODOO_MAIL_SMTP_PORT, '$ODOO_MAIL_USERNAME', '$ODOO_MAIL_PASSWORD', '$ODOO_MAIL_SMTP_ENCRYPTION', '$ODOO_MAIL_SMTP_FROM_FILTER')"
        fi
    fi

    if [ -n "$ODOO_MAIL_IMAP_HOST" ]; then
        ODOO_MAIL_IMAP_PORT=${ODOO_MAIL_IMAP_PORT:="993"}
        ODOO_MAIL_IMAP_SSL=${ODOO_MAIL_IMAP_SSL:="True"}

        FETCHMAIL_SERVER_ID=$(psql "postgres://$PGUSER:$PGPASSWORD@$PGHOST:$PGPORT/$DATABASE" -tAc "SELECT id FROM fetchmail_server WHERE name = '$ODOO_MAIL_SMTP_HOST' LIMIT 1")
        if [ -z "$FETCHMAIL_SERVER_ID" ]; then
            entrypoint_log "$ME: Setup incoming mail server $ODOO_MAIL_IMAP_HOST for database $DATABASE."
            psql "postgres://$PGUSER:$PGPASSWORD@$PGHOST:$PGPORT/$DATABASE" -c "INSERT INTO fetchmail_server (name, server, port, user, password, is_ssl) VALUES ('$ODOO_MAIL_SMTP_HOST', '$ODOO_MAIL_IMAP_HOST', $ODOO_MAIL_IMAP_PORT, '$ODOO_MAIL_USERNAME', '$ODOO_MAIL_PASSWORD', $ODOO_MAIL_IMAP_SSL)"
        fi
    fi

    if [ -n "$MAIL_CATCHALL_ALIAS" ]; then
        MAIL_CATCHALL_ALIAS_VALUE=$(psql "postgres://$PGUSER:$PGPASSWORD@$PGHOST:$PGPORT/$DATABASE" -tAc "SELECT value FROM ir_config_parameter WHERE key = 'mail.catchall.alias'")
        if [ "$MAIL_CATCHALL_ALIAS_VALUE" != "$MAIL_CATCHALL_ALIAS" ]; then
            entrypoint_log "$ME: Update system parameter mail.catchall.alias with value $MAIL_CATCHALL_ALIAS."
            psql "postgres://$PGUSER:$PGPASSWORD@$PGHOST:$PGPORT/$DATABASE" -c "UPDATE ir_config_parameter SET value = '$MAIL_CATCHALL_ALIAS' WHERE key = 'mail.catchall.alias'"
        fi
    fi

    if [ -n "$MAIL_DEFAULT_FROM" ]; then
        MAIL_DEFAULT_FROM_VALUE=$(psql "postgres://$PGUSER:$PGPASSWORD@$PGHOST:$PGPORT/$DATABASE" -tAc "SELECT value FROM ir_config_parameter WHERE key = 'mail.default.from'")
        if [ "$MAIL_DEFAULT_FROM_VALUE" != "$MAIL_DEFAULT_FROM" ]; then
            entrypoint_log "$ME: Update system parameter mail.default.from with value $MAIL_DEFAULT_FROM."
            psql "postgres://$PGUSER:$PGPASSWORD@$PGHOST:$PGPORT/$DATABASE" -c "UPDATE ir_config_parameter SET value = '$MAIL_DEFAULT_FROM' WHERE key = 'mail.default.from'"
        fi
    fi

    if [ -n "$MAIL_CATCHALL_DOMAIN" ]; then
        MAIL_CATCHALL_DOMAIN_VALUE=$(psql "postgres://$PGUSER:$PGPASSWORD@$PGHOST:$PGPORT/$DATABASE" -tAc "SELECT value FROM ir_config_parameter WHERE key = 'mail.catchall.domain'")
        if [ "$MAIL_CATCHALL_DOMAIN_VALUE" != "$MAIL_CATCHALL_DOMAIN" ]; then
            entrypoint_log "$ME: Update system parameter mail.catchall.domain with value $MAIL_CATCHALL_DOMAIN."
            psql "postgres://$PGUSER:$PGPASSWORD@$PGHOST:$PGPORT/$DATABASE" -c "UPDATE ir_config_parameter SET value = '$MAIL_CATCHALL_DOMAIN' WHERE key = 'mail.catchall.domain'"
        fi
    fi
}

setup_mail

click_odoo_update() {
    if [ -n "$ODOO_DATABASE" ]; then
        : "${CLICK_ODOO_UPDATE:=False}"

        if [ "$CLICK_ODOO_UPDATE" = "True" ] && [ -n "$ODOO_ADDONS_PATH" ]; then
            entrypoint_log "$ME: Run click-odoo-update"
            (exec click-odoo-update --addons-path="${ODOO_ADDONS_PATH},${ADDONS_PATH}" -d "$ODOO_DATABASE" ) || true
        fi
    fi
}

click_odoo_update

entrypoint_log "$ME: Running Odoo $ODOO_VERSION as user: $USER"

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
