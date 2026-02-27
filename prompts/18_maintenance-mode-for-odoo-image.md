---
title: Maintenance mode for Odoo image
---

# Run 18

Replace the `==` marked instructions in this file while you work on the task.

## Context

Read the `AGENTS.md` and `README.md` to get understanding of the project.

## Task

I want to run the Odoo container in a maintenance mode. Similar to `odoo-nignx` I want to have a `odoo-maintenance` in `images/odoo/entrypoint.sh`.

This case should launnch a python webserver on port 8069. This webserver shows a simple maintenance page.

The page `images/odoo/maintenance/index.html` must be copied to `/var/www/maintenance/index.html`.

All requests must be 302 redicted to `/var/www/maintenance/index.html`

I assume new script is reuiqred `bin/run-redirect`:

```python
from http.server import HTTPServer, BaseHTTPRequestHandler
import urllib.parse

class RedirectHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        # Redirect everything to /index.html
        target = "/index.html"
        self.send_response(302)
        self.send_header('Location', target)
        self.end_headers()

    def do_POST(self):
        self.do_GET()

    def do_PUT(self):
        self.do_GET()

    def do_DELETE(self):
        self.do_GET()

    def do_HEAD(self):
        self.do_GET()

# Start server
if __name__ == '__main__':
    server = HTTPServer(('0.0.0.0', 8069), RedirectHandler)
    print("Redirect server running on http://0.0.0.0:8069")
    server.serve_forever()	
```

Document the feature in the `### Execute` section of `images/odoo/README.md`.

## Worklog

==Fill this in as you work on the task==

## Summary

==Fill this once you completed the task==
