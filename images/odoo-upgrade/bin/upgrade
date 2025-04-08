#!/usr/bin/env python
import argparse
import getpass
import gzip
import json
import logging
import re
import socket
import ssl
import subprocess
import sys
import tempfile
import zipfile

try:
    import urllib.request as urlrequest
except ImportError:
    import urllib2 as urlrequest

import hashlib
import os
import shutil
import time
from datetime import datetime, timedelta
from operator import itemgetter

try:
    from shutil import which
except ImportError:
    from distutils.spawn import find_executable as which

if sys.version_info[0] == 2:
    input = raw_input  # noqa: A001, F821

# Mapping each subcommand to its required external dependencies
COMMAND_DEPENDENCIES = {
    "log": {"ssh-keygen"},
    "status": {"ssh-keygen"},
    "restore": {"ssh-keygen", "rsync", "createdb", "pg_restore"},
    "test": {"ssh-keygen", "rsync", "psql", "createdb", "pg_restore", "pg_dump"},
    "production": {"ssh-keygen", "rsync", "psql", "createdb", "pg_restore", "pg_dump"},
}

# Mapping subcommand arguments to the dependencies they make unnecessary
EXCLUDED_DEPENDENCIES = {
    "no_restore": {"createdb", "pg_restore"},
    "dump": {"pg_dump"},
}

UID = os.getuid()
DEFAULT_SSH_KEY_NAME = os.path.join(tempfile.gettempdir(), "%s_upgrade_ssh_key" % UID)
KNOWN_HOSTS_NAME = os.path.join(tempfile.gettempdir(), "%s_upgrade_known_hosts" % UID)

UPGRADE_SERVER_NAME = os.environ.get("UPGRADE_SERVER_NAME", "https://upgrade.odoo.com")
DATA_SERVER_NAME = os.environ.get("DATA_SERVER_NAME", "upgrade.odoo.com")
DATA_SERVER_USER = "odoo"
DATA_SERVER_PATH = "/data"
SSH_KEY_NAME = os.environ.get("SSH_KEY_NAME", DEFAULT_SSH_KEY_NAME)
SSL_VERIFICATION = os.environ.get("SSL_VERIFICATION", "1").strip().lower() not in {
    "0",
    "off",
    "no",
}

ORIGIN_DUMP_BASE_NAME = "origin"
ORIGIN_DUMP_NAME = "origin.dump"
EXPECTED_DUMP_EXTENSIONS = [".sql", ".dump", ".zip", ".sql.gz"]
POSTGRES_TABLE_OF_CONTENTS = "toc.dat"
FILESTORE_NAME = "filestore"
FILESTORE_PATH = os.path.expanduser("~/.local/share/Odoo/filestore")

DB_TIMESTAMP_FORMAT = "%Y_%m_%d_%H_%M"

REQUEST_TIMEOUT = 60
STATUS_MONITORING_PERIOD = 5
LOG_REFRESH_PERIOD = 5
CORE_COUNT = 4

ssl_context = ssl.create_default_context() if SSL_VERIFICATION else ssl._create_unverified_context()


class UpgradeError(Exception):
    """Generic exception to handled any kind of upgrade errors in a same way"""


class StateMachine:
    """
    Simple state machine with states and handlers.
    * A state machine has a specific context (internal data) which may be updated with `update_context`.
    Each handler may access to the context using the `get_context_data` method.
    * States are defined using the `set_states` method, with a name and a handler.
    * A handler executes all the processing for a specific state and returns the next state to execute or "terminal" if
    it's a terminal state.
    * The `run` method starts the state machine execution from a specific state with an optional additional context,
    until a terminal state.
    """

    class Error(Exception):
        pass

    def __init__(self):
        self.handlers = {}
        self.current_state = None
        self.context = {}

    def update_context(self, data):
        self.context.update(data)

    def get_context_data(self, keys):
        """
        check if all `keys` identify a data in the FSM context and return them
        """
        if any(k not in self.context for k in keys):
            raise StateMachine.Error(
                "The following data are missing for the state '%s': %s"
                % (
                    self.current_state,
                    ", ".join([k for k in keys if k not in self.context]),
                )
            )

        return itemgetter(*keys)(self.context)

    def set_states(self, handlers):
        """
        Define the states of the state machine
        Each `handler` shall return the next state.
        """
        self.handlers = handlers

    def run(self, from_state, additional_context=None):
        """
        Execute the state machine from `from_state` with an optional additional context.
        If an additional context is specified, the current context will be updated.
        """
        if from_state not in self.handlers:
            raise StateMachine.Error("The state '%s' is not a valid state." % from_state)

        if additional_context is not None:
            self.update_context(additional_context)

        self.current_state = from_state

        while self.current_state in self.handlers:
            handler = self.handlers[self.current_state]
            self.current_state = handler(self)


# ---------------------------------------------------------------------------------
# Common functions
# ---------------------------------------------------------------------------------


def user_confirm(negative_answer="n"):
    return not input().lower().lstrip().startswith(negative_answer)


def check_binaries_exist(args):
    skip = set().union(
        *(to_skip for arg_name, to_skip in EXCLUDED_DEPENDENCIES.items() if getattr(args, arg_name, False))
    )
    not_found = [cmd for cmd in COMMAND_DEPENDENCIES[args.command] - skip if not which(cmd)]
    if not_found:
        logging.error(
            "It seems we cannot find some binaries needed for the requested action:\n"
            "- %s\n\n"
            "Please ensure they are present in your system, perhaps you need to install some packages.\n"
            "If you wish you can continue, even though something may fail later. "
            "Do you want to proceed? [y/N]",
            "\n- ".join(not_found),
        )
        if user_confirm(negative_answer="y"):
            sys.exit(1)


def run_command(command, stream_output=False):
    """
    Run a Linux command.
    Here, check_output is used to retrieve the command output when
    an exception is raised.
    """
    try:
        if stream_output:
            subprocess.check_call(command, stderr=subprocess.STDOUT)
        else:
            subprocess.check_output(command, stderr=subprocess.STDOUT)
        return
    except subprocess.CalledProcessError as e:
        error_msg = "The '%s' command has failed" % e.cmd[0]
        if not stream_output:
            error_msg += " with the following output:\n %s" % e.output.decode("utf-8", "replace").rstrip("\n")
    raise UpgradeError(error_msg)


# This is an advanced version of os.path.basename in python 2, which can get both dir and file basename from path
def get_path_basename(path):
    return os.path.basename(path if not path.endswith(os.sep) else path[:-1])


def get_path_nth_parent(path, n=1):
    return os.path.abspath(path + n * "/..")


# ---------------------------------------------------------------------------------
# Data transfer functions
# ---------------------------------------------------------------------------------


def clean_default_ssh_keys():
    if os.path.isfile(DEFAULT_SSH_KEY_NAME):
        os.remove(DEFAULT_SSH_KEY_NAME)

    if os.path.isfile(DEFAULT_SSH_KEY_NAME + ".pub"):
        os.remove(DEFAULT_SSH_KEY_NAME + ".pub")


def generate_default_ssh_keys():
    """
    Generate public/private SSH key pair in the current working directory
    """
    if not os.path.isfile(DEFAULT_SSH_KEY_NAME) or not os.path.isfile("%s.pub" % DEFAULT_SSH_KEY_NAME):
        logging.info("Generating temporary public/private SSH key pair")
        clean_default_ssh_keys()
        run_command(["ssh-keygen", "-t", "rsa", "-N", "", "-f", DEFAULT_SSH_KEY_NAME])


def upload_dump(dump_path, server, port, user, path, ssh_key, dest_dump_name=None):
    """
    Upload the database dump to the server through SSH.
    """
    server_string = "%s@%s:%s" % (
        user,
        server,
        "%s/%s" % (path, dest_dump_name) if dest_dump_name else path,
    )
    ssh = "ssh -p %s -o IdentitiesOnly=yes -o StrictHostKeyChecking=yes -o UserKnownHostsFile=%s -i %s" % (
        port,
        KNOWN_HOSTS_NAME,
        ssh_key,
    )
    # if the --dump dir is passed, then transfer only the content of the dir, and not the directory itself
    if os.path.isdir(dump_path) and not dump_path.endswith(os.sep):
        dump_path += os.sep

    logging.info("Upload the database dump.")
    try:
        run_command(
            [
                "rsync",
                "--chmod=u+rwx,g+rwx,o+r",
                "--info=progress2",
                "--delete-after",
                "-are",
                ssh,
                dump_path,
                server_string,
            ],
            stream_output=True,
        )
    except Exception:
        logging.error(
            "The connection may have been been closed because you reached the 5 minutes timeout. Please, re-run the script and resume."
        )
        raise


def download_dump(server, port, user, dump_path, dump_name, ssh_key, dump_dest_path="."):
    """
    Download a database dump and its filestore from the server through SSH
    """
    ssh = "ssh -p %s -o IdentitiesOnly=yes -o StrictHostKeyChecking=yes -o UserKnownHostsFile=%s -i %s" % (
        port,
        KNOWN_HOSTS_NAME,
        ssh_key,
    )
    server = "%s@%s:%s" % (user, server, dump_path)
    server_dump_path = os.path.join(server, dump_name)
    server_fs_path = os.path.join(server, FILESTORE_NAME)
    reports_path = os.path.join(server, "upgrade-report.html")
    logs_path = os.path.join(server, "upgrade.log")

    logging.info(
        "Downloading the database dump and its filestore from %s.",
        server,
    )
    try:
        run_command(
            [
                "rsync",
                "--info=progress2",
                "-are",
                ssh,
                "--ignore-missing-args",
                server_dump_path,
                server_fs_path,
                reports_path,
                logs_path,
                dump_dest_path,
            ],
            stream_output=True,
        )
    except Exception:
        logging.error(
            "The connection may have been been closed because you reached the 5 minutes timeout. Please, re-run the script and resume."
        )
        raise


# ---------------------------------------------------------------------------------
# DB management functions
# ---------------------------------------------------------------------------------


def get_dump_name(dbname):
    return ORIGIN_DUMP_NAME


def get_upgraded_db_name(dbname, target, aim):
    timestamp = datetime.now().strftime(DB_TIMESTAMP_FORMAT)

    if aim == "production":
        return "%s_backup_%s" % (dbname, timestamp)

    return "%s_test_%s_%s" % (dbname, target, timestamp)


def dump_database(db_name, dump_name, core_count):
    """
    Dump the database as dump_name using 'core_count' CPU to reduce the dumping time.
    """
    logging.info("Dump the database '%s' as '%s'", db_name, dump_name)

    clean_dump(dump_name)

    try:
        run_command(
            [
                "pg_dump",
                "--no-owner",
                "--format",
                "d",
                "--jobs",
                str(core_count),
                "--file",
                dump_name,
                db_name,
            ]
        )
    except Exception as e:
        logging.error(
            "Generating the dump of your database has failed. %s\n"
            "\nHint: ensure this script is run by the same system user running the Odoo process "
            "(by default user 'odoo'), to avoid permission and operational issues. "
            "The current user should have at least the necessary permissions to access "
            "the Postgres database you are aiming to upgrade.",
            e,
        )
        sys.exit(1)


def restore_database(db_name, dump_name, core_count):
    """
    Restore the upgraded database locally using 'core_count' CPU to reduce the restoring time.
    """
    logging.info("Restore the dump file '%s' as the database '%s'", dump_name, db_name)

    try:
        run_command(["createdb", db_name])
        run_command(
            [
                "pg_restore",
                "--no-owner",
                "--format",
                "d",
                dump_name,
                "--dbname",
                db_name,
                "--jobs",
                str(core_count),
            ]
        )
    except Exception as e:
        logging.error(
            "Restoring the upgraded database has failed:\n %s \n\n"
            "You can run the following command to retry restoring the upgraded database yourself:\n"
            "pg_restore --no-owner --format d --jobs %s --dbname %s %s",
            e,
            core_count,
            db_name,
            dump_name,
        )
        sys.exit(1)


def restore_filestore(origin_db_name, upgraded_db_name):
    """
    Restore the new filestore by merging it with the old one, in a folder named
    as the upgraded database.
    If the previous filestore is not found, the new filestore should be restored manually.
    """
    if not origin_db_name:
        logging.warning(
            "The original filestore location could not be determined."
            " The filestore of the upgrade database should be restored manually."
        )
        return

    origin_fs_path = os.path.join(FILESTORE_PATH, origin_db_name)

    if os.path.exists(origin_fs_path):
        new_fs_path = os.path.join(FILESTORE_PATH, upgraded_db_name)

        logging.info("Merging the new filestore with the old one in %s ...", new_fs_path)
        shutil.copytree(origin_fs_path, new_fs_path)
        if os.path.isdir(FILESTORE_NAME):
            run_command(["rsync", "-a", FILESTORE_NAME + os.sep, new_fs_path])
            shutil.rmtree(FILESTORE_NAME)
    else:
        logging.warning(
            "The original filestore of '%s' has not been found in %s. "
            "The filestore of the upgrade database should be restored manually.",
            origin_db_name,
            FILESTORE_PATH,
        )


def clean_dump(dump_name):
    try:
        if os.path.isdir(dump_name):
            shutil.rmtree(dump_name)

        if os.path.isfile(dump_name):
            os.remove(dump_name)
    except PermissionError:
        logging.error(
            "Cleaning leftover dump has failed: the user executing the script does not have "
            "enough permissions to remove the old dump, likely used for another upgrade request in the past. "
            "Check ownership of '%s'.",
            dump_name,
        )
        sys.exit(1)


def get_db_contract(dbname, fallback_contract=None):
    try:
        output = subprocess.check_output(
            [
                "psql",
                dbname,
                "--no-psqlrc",
                "--tuples-only",
                "--command",
                "SELECT value FROM ir_config_parameter WHERE key = 'database.enterprise_code'",
            ]
        )
        contract = output.decode().strip()
        if contract:
            return contract
    except Exception:
        pass

    if fallback_contract:
        logging.info("No subscription code found in the database. Fallback to the one given on CLI")
        return fallback_contract

    raise UpgradeError(
        "Unable to get the subscription code of your database. Your database must be registered to be "
        "eligible for an upgrade. See https://www.odoo.com/documentation/user/administration/maintain/on_premise.html for more info. "
        "Alternatively, you can specify the subscription code using the `--contract` argument."
    )


def get_dump_basename_and_format(dump):
    """
    Return the basename and the extension of the dump.
    """
    dump_ext = next((ext for ext in EXPECTED_DUMP_EXTENSIONS if dump.endswith(ext)), None)
    if dump_ext:
        return os.path.basename(dump)[: -len(dump_ext)], dump_ext
    elif os.path.isdir(dump):
        return get_path_basename(dump), ".dump"

    return None, None


def is_zip_dump_valid(dump_file):
    def check_zip_integrity(f):
        try:
            if f.testzip() is not None:
                raise Exception
        except Exception:
            return False

    try:
        if zipfile.is_zipfile(dump_file):
            with zipfile.ZipFile(dump_file) as zipf:
                check_zip_integrity(zipf)

                # check that the archive contains at least the mandatory content
                if "dump.sql" not in zipf.namelist():
                    return False
    except Exception:
        return False
    return True


def is_gz_dump_valid(dump_path):
    try:
        with gzip.open(dump_path) as f:
            f.read(2)
    except IOError:
        return False
    return True


# ---------------------------------------------------------------------------------
# API management functions
# ---------------------------------------------------------------------------------


def send_json_request(request, params):
    """
    Send a JSONRPC request to the upgrade server and return its response as a dictionary
    """
    request_url = "%s/%s" % (UPGRADE_SERVER_NAME, request)

    # build the JSONRPC request
    jsonrpc_payload = {
        "jsonrpc": "2.0",
        "method": "not_used",
        "params": params,
        "id": "not_used",
    }

    request_payload = json.dumps(jsonrpc_payload).encode("utf-8")

    # build the HTTP request
    req = urlrequest.Request(request_url, request_payload, headers={"Content-type": "application/json"})

    # send it and parse the response content
    try:
        response = urlrequest.urlopen(req, timeout=REQUEST_TIMEOUT, context=ssl_context)
        info = response.info()

        if "Content-Length" in info and int(info["Content-Length"]) > 0:
            response_data = response.read().decode("utf-8")

            # JSONRPC response
            if "application/json" in info["Content-Type"]:
                resp_payload = json.loads(response_data)

                if "result" in resp_payload:
                    if "error" in resp_payload["result"]:
                        raise UpgradeError(resp_payload["result"]["error"])
                    return resp_payload["result"]
                else:
                    error = resp_payload.get("error", {}).get("data", {}).get("message")
                    error = error or "Upgrade server bad JSONRPC response"
                    raise UpgradeError("Error: %s" % error)

            # static file response
            if "text/html" in info["Content-Type"]:
                return response_data

        # empty response
        return []

    except (urlrequest.HTTPError, urlrequest.URLError) as e:
        raise UpgradeError("Upgrade server communication error: '%s'" % e)

    except socket.timeout:
        raise UpgradeError("Upgrade server communication timeout")


def check_response_format(response, keys):
    """
    Check that a response follows the expected format (keys)
    """
    if any(k not in response for k in keys):
        raise UpgradeError(
            "The response received from the upgrade server has not the expected format (missing data: %s)"
            % ",".join([k for k in keys if k not in response])
        )


def create_upgrade_request(contract, target, aim, env_vars, ssh_key):
    """
    Create a new upgrade request using the upgrade API
    """
    logging.info("Creating new upgrade request")

    with open(ssh_key) as fd:
        response = send_json_request(
            "upgrade/request/create",
            {
                "contract": contract,
                "target": target,
                "aim": aim,
                "actuator": "cli",
                "env_vars": env_vars,
                "ssh_key": fd.read(),
                "api_version": "0.2",
            },
        )

    check_response_format(response, ("request_id", "token", "assigned_host_uri"))
    if response.get("info"):
        logging.warning(response["info"])
    logging.info("Assigned host's server uri '%s'", response["assigned_host_uri"])
    logging.info("The secret token is '%s'", response["token"])
    return response


def process_upgrade_request(token):
    """
    Start the upgrade request processing using the upgrade API
    """
    logging.info("Processing the upgrade request")
    response = send_json_request("upgrade/request/process", {"token": token})

    check_response_format(response, ("is_pg_version_compatible",))

    return response["is_pg_version_compatible"]


def start_transfer(token, ssh_key, transfer_type):
    if not os.path.isfile(ssh_key):
        raise UpgradeError("The SSH key '%s' does not exist." % ssh_key)

    response = send_json_request(
        "upgrade/request/transfer/start",
        {
            "token": token,
            "transfer_type": transfer_type,
        },
    )
    check_response_format(response, ("ssh_port", "known_hosts"))

    if transfer_type == "download":
        check_response_format(response, ("dump_name",))

    return response


def stop_transfer(token):
    send_json_request("upgrade/request/transfer/stop", {"token": token})


def store_known_hosts(known_hosts):
    """
    Create a known_hosts file to be able to authenticate the rsync SSH server
    """
    known_hosts = known_hosts or ""
    try:
        with open(KNOWN_HOSTS_NAME, "w") as f:
            f.write(known_hosts)
    except PermissionError:
        logging.error(
            "The current user is not the owner of the file '%s'.\n"
            "Hint: in your next attempt, answer N when asked if you want to resume.",
            KNOWN_HOSTS_NAME,
        )
        sys.exit(1)


def get_logs(token, from_byte=0):
    """
    Request the actual log file
    """
    request_url = "%s/%s?token=%s" % (
        UPGRADE_SERVER_NAME,
        "upgrade/request/logs",
        token,
    )
    req = urlrequest.Request(request_url, headers={"Range": "bytes=%d-" % from_byte})
    response = urlrequest.urlopen(req, timeout=REQUEST_TIMEOUT, context=ssl_context).read().decode("utf-8", "replace")
    return response


def get_request_status(token):
    """
    Request the request processing status and an optional reason
    """
    response = send_json_request("upgrade/request/status", {"token": token})
    check_response_format(
        response,
        (
            "status",
            "host_uri",
        ),
    )

    return response["status"], response["host_uri"], response.get("reason"), response.get("archived")


# ---------------------------------------------------------------------------------
# State machine handlers
# ---------------------------------------------------------------------------------


def init_handler(fsm):
    """
    Processing done in the 'init' state.
    """
    input_source, target, aim, core_count, env_vars, ssh_key = fsm.get_context_data(
        ("input_source", "target", "aim", "core_count", "env_vars", "ssh_key")
    )

    if input_source == "db":
        dbname, token_name, cli_contract = fsm.get_context_data(("dbname", "token_name", "contract"))
        contract = get_db_contract(dbname, cli_contract)
        if cli_contract and contract != cli_contract:
            logging.warning(
                "The subscription code found in the database differs from the one provided as `--contract` parameter. "
                "Continuing with the contract found in the database."
            )
    else:
        contract, token_name = fsm.get_context_data(("contract", "token_name"))

    if ssh_key == DEFAULT_SSH_KEY_NAME:
        generate_default_ssh_keys()

    response = create_upgrade_request(contract, target, aim, env_vars, "%s.pub" % ssh_key)

    if input_source == "db":
        dump_database(dbname, get_dump_name(dbname), core_count)

    # store the token in a file to be able to resume the request in case of interruption
    save_token(token_name, target, aim, response["token"])

    # make sure that the request is resumed from the correct node
    set_upgrade_and_data_server_names(response["assigned_host_uri"])
    fsm.update_context({"data_server_name": DATA_SERVER_NAME})

    fsm.update_context(response)
    return "new"


def new_handler(fsm):
    """
    Processing done in the 'new' state.
    """
    input_source, token, ssh_key = fsm.get_context_data(("input_source", "token", "ssh_key"))
    data_server_name, data_server_user, data_server_path = fsm.get_context_data(
        ("data_server_name", "data_server_user", "data_server_path")
    )

    if input_source == "db":
        dbname = fsm.get_context_data(("dbname",))
        dump_path = get_dump_name(dbname)
        dest_dump_name = ORIGIN_DUMP_NAME
    else:
        dump_path, dump_ext = fsm.get_context_data(("host_dump_upload_path", "dump_ext"))
        dest_dump_name = "%s%s" % (ORIGIN_DUMP_BASE_NAME, dump_ext)

    info = start_transfer(token, "%s.pub" % ssh_key, "upload")
    store_known_hosts(info["known_hosts"])
    upload_dump(
        dump_path,
        data_server_name,
        info["ssh_port"],
        data_server_user,
        data_server_path,
        ssh_key,
        dest_dump_name,
    )
    stop_transfer(token)

    return "pending"


def pending_handler(fsm):
    """
    Processing done in the 'pending' state.
    """
    token = fsm.get_context_data(("token",))
    restore_db = not fsm.get_context_data(("no_restore",))
    is_pg_version_compatible = process_upgrade_request(token)

    # if the postgres version used for the upgrade is not compatible with the client postgres
    # version used to dump the database, deactivate the upgraded database restoring.
    if not is_pg_version_compatible:
        log_message = (
            "Your postgres version is lower than the minimal required version to restore your upgraded database."
        )

        if restore_db:
            log_message += " The upgraded dump will be downloaded but not restored."

        logging.warning(log_message)

        fsm.update_context({"no_restore": True})

    return "progress"


def progress_handler(fsm):
    """
    Processing done in the 'progress' state.
    """
    token = fsm.get_context_data(("token",))

    status, reason = monitor_request_processing(token)

    fsm.update_context({"reason": reason})
    return status


def failed_handler(fsm):
    input_source, reason = fsm.get_context_data(("input_source", "reason"))

    if input_source == "db":
        dbname = fsm.get_context_data(("dbname",))
        clean_dump(get_dump_name(dbname))

    logging.error("The upgrade request has failed%s", ": %s" % reason if reason else "")

    return "terminal"


def cancelled_handler(fsm):
    logging.info("The upgrade request has been cancelled")
    return "terminal"


def done_handler(fsm):
    (
        input_source,
        token,
        ssh_key,
        core_count,
        aim,
        data_server_name,
        data_server_user,
        data_server_path,
        no_restore,
        dump_dest_path,
    ) = fsm.get_context_data(
        (
            "input_source",
            "token",
            "ssh_key",
            "core_count",
            "aim",
            "data_server_name",
            "data_server_user",
            "data_server_path",
            "no_restore",
            "host_dump_download_path",
        )
    )

    info = start_transfer(token, "%s.pub" % ssh_key, "download")
    store_known_hosts(info["known_hosts"])
    download_dump(
        data_server_name,
        info["ssh_port"],
        data_server_user,
        data_server_path,
        info["dump_name"],
        ssh_key,
        dump_dest_path,
    )
    stop_transfer(token)

    if no_restore:
        logging.info(
            "The upgraded database and filestore have been downloaded as %s.\n"
            "Skipping the restore of the upgraded dump and the merge of the filestore.",
            info["dump_name"],
        )
    else:
        upgraded_db_name = fsm.get_context_data(("upgraded_db_name",))
        db_name = fsm.get_context_data(("dbname",)) if input_source == "db" else None

        restore_database(upgraded_db_name, info["dump_name"], core_count)
        restore_filestore(db_name, upgraded_db_name)
        clean_dump(info["dump_name"])

    return "terminal"


# ---------------------------------------------------------------------------------
# Token functions (for recovering)
# ---------------------------------------------------------------------------------


def get_token_file(token_name, target, aim):
    return os.path.join(
        tempfile.gettempdir(),
        "odoo-upgrade-%s-%s-%s" % (aim, token_name, target),
    )


def save_token(token_name, target, aim, token):
    """
    Save the request token in a temporary file.
    """
    filename = get_token_file(token_name, target, aim)

    with open(filename, "w") as f:
        f.write(token)


def get_saved_token(token_name, target, aim):
    """
    Get the token of the upgrade request if it has been saved previously
    """
    filename = get_token_file(token_name, target, aim)

    try:
        with open(filename, "r") as f:
            token = f.readline()
            return token
    except Exception:
        return None


def remove_saved_token(token_name, target, aim):
    filename = get_token_file(token_name, target, aim)
    if os.path.isfile(filename):
        os.remove(filename)


# ---------------------------------------------------------------------------------
# Main functions
# ---------------------------------------------------------------------------------

fsm = StateMachine()


def monitor_request_processing(token):
    """
    Monitor the request processing status and display logs at the same time
    """
    status, _, reason = get_request_status(token)[:3]
    displayed_log_bytes = 0
    last_check_time = datetime.now()

    while status in ("progress", "pending"):
        # status monitoring
        if datetime.now() > last_check_time + timedelta(seconds=STATUS_MONITORING_PERIOD):
            status, _, reason = get_request_status(token)[:3]
            last_check_time = datetime.now()

        # logs streaming
        if status == "progress":
            logs = get_logs(token, displayed_log_bytes)
            if logs.strip():
                logging.info(logs.strip())
                displayed_log_bytes += len(logs) - 1

        time.sleep(LOG_REFRESH_PERIOD)

    return status, reason


def parse_command_line():
    """
    Parse command-line arguments and return them
    """

    def add_upgrade_arguments(subparser):
        dbname_or_dump = subparser.add_mutually_exclusive_group(required=True)
        dbname_or_dump.add_argument(
            "-d",
            "--dbname",
            help="The name of a database to dump and upgrade",
        )
        dbname_or_dump.add_argument(
            "-i",
            "--dump",
            help="The database dump to upgrade (.sql, .dump, .sql.gz, .zip or a psql dump directory with %s file)"
            % POSTGRES_TABLE_OF_CONTENTS,
        )

        subparser.add_argument(
            "-r",
            "--restore-name",
            help="The new name of the local database into which the upgraded dump will be restored. Do not create it manually, it will be done automatically.",
        )
        subparser.add_argument(
            "-c",
            "--contract",
            help="The contract number associated to the database (by default taken from the DB if it already has one, mandatory when sending a dump file with --dump)",
        )
        subparser.add_argument("-t", "--target", required=True, help="The upgraded database version")
        subparser.add_argument(
            "-e",
            "--env",
            action="append",
            help="Set an environment variable, in the format VAR=VAL",
        )
        subparser.add_argument(
            "--env-file",
            type=argparse.FileType("r"),
            help="Read in a file of environment variables, one per line, in the format VAR=VAL",
        )

    def add_pg_arguments(subparser):
        subparser.add_argument(
            "-x",
            "--no-restore",
            action="store_true",
            help="Download the upgraded database dump without restoring it",
        )

    def add_common_arguments(subparser):
        subparser.add_argument(
            "-s",
            "--ssh-key",
            help="The ssh key to use for data transfer (default: %(default)s)",
            default=SSH_KEY_NAME,
        )
        subparser.add_argument(
            "-j",
            "--core-count",
            help="The number of core to use to dump/restore a database (default: %(default)s)",
            default=CORE_COUNT,
        )
        subparser.add_argument(
            "-n",
            "--data-server-name",
            help="The server name where to download/upload dumps (default: %(default)s)",
            default=DATA_SERVER_NAME,
        )
        subparser.add_argument(
            "-u",
            "--data-server-user",
            help="The server user where to download/upload dumps (default: %(default)s)",
            default=DATA_SERVER_USER,
        )
        subparser.add_argument(
            "-p",
            "--data-server-path",
            help="The path on the server where to download/upload dumps (default: %(default)s)",
            default=DATA_SERVER_PATH,
        )

    def add_token_argument(subparser):
        subparser.add_argument("-t", "--token", required=True, help="The token ID of the request")

    prog = "python <(curl -s https://upgrade.odoo.com/upgrade)" if not os.path.isfile(sys.argv[0]) else None

    parser = argparse.ArgumentParser(
        prog=prog,
        epilog=(
            "Some options require access rights to connect to a database and generate a dump.\n"
            "Make sure that you are running this script with the correct user.\n"
            "Running as root is not advised."
        ),
    )
    parser.add_argument("--debug", action="store_true", help="activate debug traces")

    subparsers = parser.add_subparsers(dest="command")
    subparsers.required = True

    # sub-parser for the 'test' command
    parser_test = subparsers.add_parser("test", help="upgrade a database for test purpose")
    add_upgrade_arguments(parser_test)
    add_pg_arguments(parser_test)
    add_common_arguments(parser_test)

    # sub-parser for the 'production' command
    parser_prod = subparsers.add_parser("production", help="upgrade a database for production purpose")
    add_upgrade_arguments(parser_prod)
    add_pg_arguments(parser_prod)
    add_common_arguments(parser_prod)

    # sub-parser for the 'restore' command
    parser_restore = subparsers.add_parser("restore", help="download and restore the upgraded database")
    add_pg_arguments(parser_restore)
    add_token_argument(parser_restore)
    parser_restore.add_argument(
        "-d",
        "--dbname",
        required=True,
        help="The local database name to retrieve the original filestore",
    )
    parser_restore.add_argument(
        "-r",
        "--restored-name",
        required=True,
        help="The database name to restore the upgraded dump",
    )
    parser_restore.add_argument(
        "--production",
        action="store_true",
        help="Indicates that it's not a test database but a production database",
    )
    add_common_arguments(parser_restore)

    # sub-parser for the 'status' command
    parser_status = subparsers.add_parser("status", help="show the upgrade request status")
    add_token_argument(parser_status)

    # sub-parser for the 'log' command
    parser_log = subparsers.add_parser("log", help="show the upgrade request log")
    add_token_argument(parser_log)
    parser_log.add_argument(
        "-f",
        "--from-byte",
        type=int,
        default=0,
        help="From which line start retrieving the log (0=from the beginning)",
    )

    args = parser.parse_args()

    if args.command in ("test", "production") and args.dump and not args.contract:
        parser.error("A contract number must be provided when the --dump argument is used")

    return args


def get_env_vars(env_vars, env_file):
    if env_vars is None:
        env_vars = []
    if env_file is not None:
        # Lines that start with # are treated as comments
        env_vars.extend(line.strip() for line in env_file if line and line[0] != "#")
    # Check that args are correctly formatted in the form VAR=VAL
    for var in env_vars:
        if not re.match(r"^\w+=", var):
            raise ValueError("The following environment variable option is badly formatted: %s" % var)
    return env_vars


def set_upgrade_and_data_server_names(host_uri):
    global UPGRADE_SERVER_NAME, DATA_SERVER_NAME  # noqa: PLW0603
    UPGRADE_SERVER_NAME = "https://" + host_uri
    DATA_SERVER_NAME = host_uri


def process_upgrade_command(dbname, upgraded_db_name, dump, contract, target, aim, env_vars):
    start_state = "init"
    additional_context = {
        "target": target,
        "aim": aim,
        "contract": contract,
        "env_vars": env_vars,
    }

    # update the context when a database is upgraded
    if dbname:
        token_name = "db_%s" % dbname
        additional_context.update(
            {
                "input_source": "db",
                "dbname": dbname,
                "upgraded_db_name": upgraded_db_name if upgraded_db_name else get_upgraded_db_name(dbname, target, aim),
                "token_name": token_name,
            }
        )

    # update the context when a dump is upgraded
    if dump:
        if not os.path.exists(dump):
            raise UpgradeError("Dump %r not found." % dump)

        dump_absolute_path = os.path.abspath(dump)
        dump_basename, dump_ext = get_dump_basename_and_format(dump)
        if dump_ext is None or (
            os.path.isdir(dump_absolute_path)
            and not os.path.isfile(os.path.join(dump_absolute_path, POSTGRES_TABLE_OF_CONTENTS))
        ):
            raise UpgradeError(
                "The database dump must be in one of the following formats: %s. "
                "It can also be a directory dump (containing the file %s)."
                % (", ".join(EXPECTED_DUMP_EXTENSIONS), POSTGRES_TABLE_OF_CONTENTS)
            )

        if dump_ext == ".zip" and not is_zip_dump_valid(dump):
            raise UpgradeError(
                "The zip dump archive is not valid (either corrupted or does not contain, at least, a dump.sql file)"
            )
        if dump_ext == ".sql.gz" and not is_gz_dump_valid(dump):
            raise UpgradeError("The dump %r is not valid (either corrupted or has the wrong extension)" % dump)

        token_name = get_token_name(dump_absolute_path)
        additional_context.update(
            {
                "input_source": "dump",
                "token_name": token_name,
                "dump_basename": dump_basename,
                "dump_ext": dump_ext,
                "no_restore": True,
            }
        )

    # if this upgrade request has been interrupted, try to resume it
    saved_token = get_saved_token(token_name, target, aim)

    if saved_token is not None:
        req_state, host_uri, reason, archived = get_request_status(saved_token)
        if not archived:
            logging.info("This upgrade request seems to have been interrupted. Do you want to resume it? [Y/n]")
            if user_confirm():
                logging.info("Resuming the upgrade request")

                start_state = req_state
                additional_context.update({"token": saved_token, "reason": reason})

                # make sure that the request is resumed from the correct node
                set_upgrade_and_data_server_names(host_uri)
                fsm.update_context({"data_server_name": DATA_SERVER_NAME})
            else:
                logging.info("Restarting the upgrade request from the beginning")

    # run the upgrade
    fsm.run(start_state, additional_context)

    # cleaning
    if dbname:
        clean_dump(get_dump_name(dbname))
    remove_saved_token(token_name, target, aim)


def get_token_name(dump_absolute_path):
    input_file = (
        os.path.join(dump_absolute_path, POSTGRES_TABLE_OF_CONTENTS)
        if os.path.isdir(dump_absolute_path)
        else dump_absolute_path
    )

    try:
        uname = getpass.getuser()
    except Exception:
        uname = ""

    heuristics = (
        input_file,
        os.path.getsize(input_file),
        os.path.getctime(input_file),
        uname,
    )
    sha = hashlib.sha256()
    for heuristic in heuristics:
        sha.update(str(heuristic).encode() + b"\x1e")
    return "dump_%s" % sha.hexdigest()


def process_restore_command(token, dbname, aim, restored_name):
    status, host_uri = get_request_status(token)[:2]
    set_upgrade_and_data_server_names(host_uri)
    fsm.update_context({"data_server_name": DATA_SERVER_NAME})
    if status == "done":
        fsm.run(
            "done",
            {
                "token": token,
                "aim": aim,
                "dbname": dbname,
                "upgraded_db_name": restored_name,
                "input_source": None,
            },
        )


def process_status_command(token):
    status, _, reason = get_request_status(token)[:3]
    logging.info("Request status: %s%s", status.upper(), " (%s)" % reason if reason else "")


def process_log_command(token, from_byte):
    host_uri = get_request_status(token)[1]
    set_upgrade_and_data_server_names(host_uri)
    fsm.update_context({"data_server_name": DATA_SERVER_NAME})
    logs = get_logs(token, from_byte)
    for log in logs.split("\n")[:-1]:
        logging.info(log)


def main():
    args = parse_command_line()

    # configure loggers
    log_level = logging.DEBUG if args.debug else logging.INFO
    logging.basicConfig(
        format="%(asctime)s %(levelname)s: %(message)s",
        datefmt="%Y-%m-%d %I:%M:%S",
        level=log_level,
    )

    check_binaries_exist(args)

    if "restore_name" in args and args.restore_name:
        output = subprocess.check_output(
            [
                "psql",
                "postgres",
                "--no-psqlrc",
                "--tuples-only",
                "--csv",
                "--command",
                "SELECT datname FROM pg_database",
            ],
        )
        if any(localdb == args.restore_name for localdb in output.decode("utf-8", "ignore").splitlines()):
            logging.error(
                "Refusing to restore the dump into DB '%s' since it already exists.\n"
                "This script will only restore the upgraded dump into a new DB.\n"
                "You can rerun it providing a name that doesn't collide with an already existing DB. This script will create the DB for you.\n",
                args.restore_name,
            )
            sys.exit(1)

    if "dump" in args and args.dump:
        dump_absolute_path = os.path.abspath(args.dump)

        """
        If the table of contents path is passed, change the directory and path to the parent of the table of
        contents so that rsync can send the whole directory without any issues
        """
        if get_path_basename(dump_absolute_path) == POSTGRES_TABLE_OF_CONTENTS:
            host_dump_upload_path = get_path_nth_parent(dump_absolute_path, 1)
            host_dump_download_path = get_path_nth_parent(dump_absolute_path, 2)
            args.dump = host_dump_upload_path
        else:
            host_dump_upload_path = dump_absolute_path
            host_dump_download_path = get_path_nth_parent(dump_absolute_path, 1)
    else:
        host_dump_upload_path = "."
        host_dump_download_path = "."

    # define state machine and internal context
    fsm.set_states(
        {
            "init": init_handler,
            "new": new_handler,
            "pending": pending_handler,
            "progress": progress_handler,
            "done": done_handler,
            "failed": failed_handler,
            "cancelled": cancelled_handler,
        }
    )

    # handle parameters specific to some commands
    if args.command in ("test", "production", "restore"):
        if os.path.isfile(args.ssh_key):
            try:
                run_command(["ssh-keygen", "-y", "-f", args.ssh_key])
            except UpgradeError as e:
                logging.error(
                    "The current user is not able to use the SSH key file '%s'.\nError: %s\n"
                    "Hint: each upgrade request is associated with a SSH key. If the key is lost, this\n"
                    "script will create another one, but you will have to request a new upgrade.\n"
                    "In such case, if asked to resume the upgrade, answer 'n'.",
                    args.ssh_key,
                    e,
                )
                sys.exit(1)

        fsm.update_context(
            {
                "ssh_key": args.ssh_key,
                "core_count": args.core_count,
                "data_server_name": args.data_server_name,
                "data_server_user": args.data_server_user,
                "data_server_path": args.data_server_path,
                "host_dump_upload_path": host_dump_upload_path,
                "host_dump_download_path": host_dump_download_path,
                "no_restore": args.no_restore,
            }
        )

    try:
        if args.command in ("test", "production"):
            env_vars = get_env_vars(args.env, args.env_file)
            process_upgrade_command(
                args.dbname,
                args.restore_name,
                args.dump,
                args.contract,
                args.target,
                args.command,
                env_vars,
            )

        elif args.command == "restore":
            aim = "production" if args.production else "test"
            process_restore_command(args.token, args.dbname, aim, args.restored_name)

        elif args.command == "status":
            process_status_command(args.token)

        elif args.command == "log":
            process_log_command(args.token, args.from_byte)

    except (UpgradeError, StateMachine.Error) as e:
        logging.error("Error: %s", e)

    except KeyboardInterrupt:
        pass


if __name__ == "__main__":
    main()
