#!/usr/bin/env python3

import sys
import os
from odoo_rpc_client import Client

args = sys.argv[1:]
print(f"Arguments of the script : {args}")

model,id,field,value,*other = args

url = os.environ.get('ODOO_URL') or 'localhost'
db = os.environ.get('ODOO_DATABASE') or 'odoo'
username = os.getenv('ODOO_USERNAME') or 'admin'
password = os.environ.get('ODOO_PASSWORD') or 'admin'
print(url,db,username,password)

# Setup client
client = Client(url,db,username,password)

# Execute query
Model = client[model]
records = Model.search([('id', '=', id)])
Model.write(records, { field: value })
