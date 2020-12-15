{{ '=' * name|length }}
{{ name|replace('_',' ')|capitalize }}
{{ '=' * name|length }}

.. image:: ./static/description/icon.png
  :width: 100
  :alt: Icon

Module summary.

Usage
~~~~~

Clone module into Odoo addon directory.

.. code-block:: bash

    git clone git@github.com:mint-system/odoo-app-{{ name|replace('_', '-') }}.git ./addons/{{ name }}
