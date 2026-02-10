Migrate settings view from Odoo 17.0 to 18.0.
For example:
<div name="integration" position="inside">
	<div class="col-12 col-lg-6 o_setting_box" id="ssh_setting">
		<div class="o_setting_left_pane">
			<field name="module_ssh" />
		</div>
		<div class="o_setting_right_pane">
			<label string="SSH" for="module_ssh" />
			<div class="text-muted">
				Integrate with SSH.
			</div>
			<div attrs="{'invisible': [('module_ssh', '=', False)]}">
				<div class="content-group mt16">
					<label for="ssh_public_key" class="o_light_label" />
					<field name="ssh_public_key" />
				</div>
				<div class="content-group">
					<label for="ssh_private_key" class="o_light_label" />
					<field name="ssh_private_key" />
				</div>
			</div>
		</div>
	</div>
</div>
To:
<block id="integration" position="inside">
	<setting help="Integrate with SSH.">
		<field name="module_ssh"/>
		<div invisible="not module_ssh">
			<div class="content-group mt16">
				<label for="ssh_public_key" class="o_light_label mr8" />
				<field name="ssh_public_key" />
			</div>
			<div class="content-group">
				<label for="ssh_private_key" class="o_light_label mr8" />
				<field name="ssh_private_key" />
			</div>
		</div>
	</setting>
</block>