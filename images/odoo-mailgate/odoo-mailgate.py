#!/usr/bin/env python3

import optparse
import sys
import traceback
import xmlrpc.client as xmlrpclib

def main():
    op = optparse.OptionParser(usage='usage: %prog [options]', version='%prog v1.2')
    op.add_option("-d", "--database", dest="database", help="Odoo database name (default: %default)", default='odoo')
    op.add_option("-u", "--userid", dest="userid", help="Odoo user id to connect with (default: %default)", default=2, type=int)
    op.add_option("-p", "--password", dest="password", help="Odoo user password (default: %default)", default='admin')
    op.add_option("--host", dest="host", help="Odoo host (default: %default)", default='localhost')
    op.add_option("--port", dest="port", help="Odoo port (default: %default)", default=8069, type=int)
    (o, args) = op.parse_args()

    try:
        msg = sys.stdin.buffer.read()
        models = xmlrpclib.ServerProxy('http://%s:%s/xmlrpc/2/object' % (o.host, o.port), allow_none=True)
        models.execute_kw(o.database, o.userid, o.password, 'mail.thread', 'message_process', [False, xmlrpclib.Binary(msg)], {})
    except xmlrpclib.Fault as e:
        print(f"XML-RPC Fault: {e.faultCode} - {e.faultString}")
        sys.exit(1)
    except Exception as e:
        print(f"Error: {str(e)}")
        traceback.print_exc()
        sys.exit(2)


if __name__ == '__main__':
    main()
