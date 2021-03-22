.. image:: https://img.shields.io/badge/licence-GPL--3-blue.svg
    :target: http://www.gnu.org/licenses/gpl-3.0-standalone.html
    :alt: License: GPL-3

{{ '=' * name|length }}
{{ name|replace('_',' ')|capitalize }}
{{ '=' * name|length }}

Module summary.

.. image:: ./static/description/icon.png
  :height: 100
  :width: 100
  :alt: Icon

Usage
~~~~~

Clone module into Odoo addon directory.

.. code-block:: bash

    git clone git@github.com:mint-system/odoo-app-{{ name|replace('_', '-') }}.git ./addons/{{ name }}

Configuration
~~~~~~~~~~~~~

* No additional configurations needed

Maintainer
==========

.. image:: https://www.mint-system.ch/theme_mint_system/static/img/logo.svg
   :target: https://www.mint-system.ch

This module is maintained by Mint System GmbH.

For support and more information, please visit `our Website <https://www.mint-system.ch>`__.
