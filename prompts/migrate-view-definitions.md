Migrate view definitions from Odoo 16.0 to 17.0.
For example:
<field name="test_field_1" attrs="{'invisible': [('active', '=', True)]}"/>
<field name="test_field_2" attrs="{'invisible': [('zip', '!=', 123)]}"/>
<field name="test_field_3" attrs="{'readonly': [('zip', '!=', False)]}"/>
<field name="test_field_4" context="{'default_zip_id': active_id}" />
<button name="test_button_1" states="draft" />
<button name="test_button_2" states="assigned" />
To:
<field name="test_field_1" invisible="active"/>
<field name="test_field_2" invisible="zip != 123"/>
<field name="test_field_3" readonly="zip"/>
<field name="test_field_4" context="{'default_zip_id': id}" />
<button name="test_button_1" invisible="state != 'draft'" />
<button name="test_button_2" invisible="state != 'assigned'" />
Or for example:
<div class="oe_chatter">
	<field name="message_follower_ids"/>
	<field name="activity_ids"/>
	<field name="message_ids"/>
</div>
To:
<chatter/>