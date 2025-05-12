#!/usr/bin/env python3

import optparse
import sys
import traceback
import xmlrpc.client as xmlrpclib

def main():
    op = optparse.OptionParser(usage='usage: %prog [options]', version="%prog v1.2")
    op.add_option("-l", "--url", dest="url", help="Odoo server url (default: %default)", default='http://odoo:8069')
    op.add_option("-d", "--database", dest="database", help="Odoo database name (default: %default)", default='odoo')
    op.add_option("-u", "--username", dest="username", help="Odoo user id to connect with (default: %default)", default='admin')
    op.add_option("-p", "--password", dest="password", help="Odoo user password (default: %default)", default='admin')
    (o, args) = op.parse_args()

    try:
        msg = sys.stdin.buffer.read()
        common = xmlrpclib.ServerProxy(f"{o.url}/xmlrpc/2/common")
        uid = common.authenticate(o.database, o.username, o.password, {})
        models = xmlrpclib.ServerProxy(f"{o.url}/xmlrpc/2/object", allow_none=True)
        models.execute_kw(o.database, uid, o.password, "mail.thread", "message_process", [False, xmlrpclib.Binary(msg)], {})
    except xmlrpclib.Fault as e:
        print(f"XML-RPC Fault: {e.faultCode} - {e.faultString}")
        sys.exit(1)
    except Exception as e:
        print(f"Error: {str(e)}")
        traceback.print_exc()
        sys.exit(2)


if __name__ == "__main__":
    main()
