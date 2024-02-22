# Mail
## Activity  
### X Reference  
ID: `mint_system.mail.activity.x_reference`  
```xml
<?xml version="1.0" encoding="UTF-8"?>
<odoo>
    <record id="x_reference" model="ir.model.fields">
        <field name="field_description">Reference</field>
        <field name="model">mail.activity</field>
        <field name="model_id" ref="mail.model_mail_activity"/>
        <field name="name">x_reference</field>
        <field name="store" eval="True"/>
        <field name="readonly" eval="True"/>
        <field name="copied" eval="False"/>
        <field name="ttype">char</field>
        <field name="depends">res_model,res_id</field>
        <field name="compute">for record in self:
  record['x_reference'] = "%s,%s" % (record.res_model, record.res_id)</field>
    </record>
</odoo>

```
Source: [snippets/mail.activity.x_reference.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.activity.x_reference.xml)

## Mail Activity View Form Popup  
### X Reference  
ID: `mint_system.mail.mail_activity_view_form_popup.x_reference`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.mail_activity_view_form_popup" priority="50">
    <field name="summary" position="before">
        <field name="x_reference" widget="reference"/>
    </field>
</data>

```
Source: [snippets/mail.mail_activity_view_form_popup.x_reference.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.mail_activity_view_form_popup.x_reference.xml)

## Mail Activity View Tree  
### Activity View  
ID: `mint_system.mail.mail_activity_view_tree.activity_view`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.mail_activity_view_tree" priority="50">
    <tree position="replace">
        <tree string="Next Activities" expand="1" decoration-danger="date_deadline &lt; current_date" decoration-success="date_deadline == current_date" default_order="date_deadline" create="false">
            <field name="date_deadline_time"/>
            <field string="Verantwortlich" name="user_id"/>
            <field name="activity_type_id"/>
            <field name="res_model_id"/>
            <field name="res_name"/>
            <field name="summary"/>
            <field name="note"/>
            <field name="date_deadline" invisible="1"/>
        </tree>
    </tree>
</data>

```
Source: [snippets/mail.mail_activity_view_tree.activity_view.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.mail_activity_view_tree.activity_view.xml)

## Mail Notification Borders  
### Reduce To Content  
ID: `mint_system.mail.mail_notification_borders.reduce_to_content`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.mail_notification_borders" priority="50">
    <xpath expr="//tbody" position="replace">
        <tbody>
            <!-- CONTENT -->
            <tr>
                <td align="center" style="min-width: 590px;">
                    <table width="590" border="0" cellpadding="0" bgcolor="#ffffff" style="min-width: 590px; background-color: rgb(255, 255, 255); padding: 20px; border-collapse:separate;">
                        <tbody>
                            <td valign="top" style="font-family:Arial,Helvetica,sans-serif; color: #555; font-size: 14px;">
                                <t t-raw="message.body"/>
                            </td>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" style="padding: 8px; font-size:11px;">
                    <a/>
                </td>
            </tr>
        </tbody>
    </xpath>
</data>

```
Source: [snippets/mail.mail_notification_borders.reduce_to_content.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.mail_notification_borders.reduce_to_content.xml)

### Remove Logo  
ID: `mint_system.mail.mail_notification_borders.remove_logo`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.mail_notification_borders" priority="50">
    <xpath expr="//table[@summary='o_mail_notification']//table/tr/td[2]/img" position="replace">
  </xpath>
</data>

```
Source: [snippets/mail.mail_notification_borders.remove_logo.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.mail_notification_borders.remove_logo.xml)

### White Background  
ID: `mint_system.mail.mail_notification_borders.white_background`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.mail_notification_borders" priority="50">
    <xpath expr="//table" position="attributes">
        <attribute name="style" separator=";" add="background-color: #fff"/>
    </xpath>
</data>

```
Source: [snippets/mail.mail_notification_borders.white_background.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.mail_notification_borders.white_background.xml)

## Mail Notification Email  
### Remove Logo  
ID: `mint_system.mail.mail_notification_email.remove_logo`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.mail_notification_email" priority="50">
    <xpath expr="//div[@summary='o_mail_notification']/table/tbody/tr/td[2]/img" position="replace">
  </xpath>
</data>

```
Source: [snippets/mail.mail_notification_email.remove_logo.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.mail_notification_email.remove_logo.xml)

## Mail Notification Layout  
### Debrand  
ID: `mint_system.mail.mail_notification_layout.debrand`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.mail_notification_layout" priority="50">
    <xpath expr="//div[1]/p[1]" position="replace"/>
</data>

```
Source: [snippets/mail.mail_notification_layout.debrand.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.mail_notification_layout.debrand.xml)

### Remove Access Link  
ID: `mint_system.mail.mail_notification_layout.remove_access_link`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.mail_notification_layout" priority="60">
    <xpath expr="//td[@t-if='has_button_access']" position="replace"/>
    <!-- <xpath expr="//body[1]/t[1]" position="after">
    <t t-set="has_button_access" t-value="False"/>
  </xpath> -->
</data>

```
Source: [snippets/mail.mail_notification_layout.remove_access_link.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.mail_notification_layout.remove_access_link.xml)

## Mail Notification Light  
### Align Left  
ID: `mint_system.mail.mail_notification_light.align_left`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.mail_notification_light" priority="60">
    <xpath expr="//td[@align='center']" position="attributes">
        <attribute name="align">left</attribute>
    </xpath>
</data>

```
Source: [snippets/mail.mail_notification_light.align_left.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.mail_notification_light.align_left.xml)

### Debrand  
ID: `mint_system.mail.mail_notification_light.debrand`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.mail_notification_light" priority="50">
    <xpath expr="//body[1]/table[1]/tr[2]/td[1]" position="replace"/>
</data>

```
Source: [snippets/mail.mail_notification_light.debrand.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.mail_notification_light.debrand.xml)

### Reduce To Content  
ID: `mint_system.mail.mail_notification_light.reduce_to_content`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.mail_notification_light" priority="50">
    <xpath expr="//t/table" position="replace">
        <table border="0" cellpadding="0" cellspacing="0" style="padding-top: 16px; background-color: #F1F1F1; font-family:Verdana, Arial,sans-serif; color: #454748; width: 100%; border-collapse:separate;">
            <tr>
                <td align="center">
                    <table border="0" cellpadding="0" cellspacing="0" width="590" style="padding: 24px; background-color: white; color: #454748; border-collapse:separate;">
                        <tbody>
                            <!-- CONTENT -->
                            <tr>
                                <td style="min-width: 590px;">
                                    <t t-raw="message.body"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <!-- POWERED BY -->
            <tr>
                <td align="center" style="min-width: 590px;">
                    <a/>
                </td>
            </tr>
        </table>
    </xpath>
</data>

```
Source: [snippets/mail.mail_notification_light.reduce_to_content.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.mail_notification_light.reduce_to_content.xml)

### Remove Logo  
ID: `mint_system.mail.mail_notification_light.remove_logo`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.mail_notification_light" priority="50">
    <xpath expr="//tbody/tr/td/table/tr/td[2]/img" position="replace">
  </xpath>
</data>

```
Source: [snippets/mail.mail_notification_light.remove_logo.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.mail_notification_light.remove_logo.xml)

### Remove Model Name  
ID: `mint_system.mail.mail_notification_light.remove_model_name`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.mail_notification_light" priority="60">
    <xpath expr="//span[1]" position="replace"/>
</data>

```
Source: [snippets/mail.mail_notification_light.remove_model_name.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.mail_notification_light.remove_model_name.xml)

### Replace Footer  
ID: `mint_system.mail.mail_notification_light.replace_footer`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.mail_notification_light" priority="50">
    <xpath expr="//tbody/tr[3]/td/div" position="replace">
        <div style="color: #999999">
            <a t-att-href="'%s' % company.website" style="text-decoration:none; color: #999999;">
                example.ch
            </a>
        </div>
    </xpath>
</data>

```
Source: [snippets/mail.mail_notification_light.replace_footer.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.mail_notification_light.replace_footer.xml)

### Set Model Name  
ID: `mint_system.mail.mail_notification_light.set_model_name`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.mail_notification_light" priority="60">
    <xpath expr="//span[1]" position="replace">
        <span style="font-size: 10px;">
            <t t-esc="model_description or 'document'"/>
        </span>
        <br/>
    </xpath>
</data>

```
Source: [snippets/mail.mail_notification_light.set_model_name.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.mail_notification_light.set_model_name.xml)

### White Background  
ID: `mint_system.mail.mail_notification_light.white_background`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.mail_notification_light" priority="60">
    <xpath expr="//t/table" position="attributes">
        <attribute name="style" separator=";" add="background-color: #fff"/>
    </xpath>
</data>

```
Source: [snippets/mail.mail_notification_light.white_background.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.mail_notification_light.white_background.xml)

## Mail Notification Paynow  
### Align Left  
ID: `mint_system.mail.mail_notification_paynow.align_left`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.mail_notification_paynow" priority="60">
    <xpath expr="//td[@align='center']" position="attributes">
        <attribute name="align">left</attribute>
    </xpath>
</data>

```
Source: [snippets/mail.mail_notification_paynow.align_left.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.mail_notification_paynow.align_left.xml)

### Reduce To Content  
ID: `mint_system.mail.mail_notification_paynow.reduce_to_content`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.mail_notification_paynow" priority="50">
    <xpath expr="//t/table" position="replace">
        <table border="0" cellpadding="0" cellspacing="0" style="padding-top: 16px; background-color: #F1F1F1; font-family:Verdana, Arial,sans-serif; color: #454748; width: 100%; border-collapse:separate;">
            <tr>
                <td align="center">
                    <table border="0" cellpadding="0" cellspacing="0" width="590" style="padding: 24px; background-color: white; color: #454748; border-collapse:separate;">
                        <tbody>
                            <!-- CONTENT -->
                            <tr>
                                <td style="padding: 0">
                                    <t t-raw="message.body"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <!-- POWERED BY -->
            <tr>
                <td align="center" style="min-width: 590px; padding: 8px; font-size:11px;">
                    <a/>
                </td>
            </tr>
        </table>
    </xpath>
</data>

```
Source: [snippets/mail.mail_notification_paynow.reduce_to_content.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.mail_notification_paynow.reduce_to_content.xml)

### Remove Access Link  
ID: `mint_system.mail.mail_notification_paynow.remove_access_link`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.mail_notification_paynow" priority="60">
    <t t-if="record._name == 'sale.order'" position="replace"/>
</data>

```
Source: [snippets/mail.mail_notification_paynow.remove_access_link.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.mail_notification_paynow.remove_access_link.xml)

### Remove Logo  
ID: `mint_system.mail.mail_notification_paynow.remove_logo`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.mail_notification_paynow" priority="50">
    <xpath expr="//tbody/tr/td/table/tr/td[2]/img" position="replace">
  </xpath>
</data>

```
Source: [snippets/mail.mail_notification_paynow.remove_logo.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.mail_notification_paynow.remove_logo.xml)

### Remove Signature  
ID: `mint_system.mail.mail_notification_paynow.remove_signature`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.mail_notification_paynow" priority="50">
    <xpath expr="//tbody/tr[2]/td/t[2]" position="replace">
  </xpath>
</data>

```
Source: [snippets/mail.mail_notification_paynow.remove_signature.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.mail_notification_paynow.remove_signature.xml)

### Replace Footer  
ID: `mint_system.mail.mail_notification_paynow.replace_footer`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.mail_notification_paynow" priority="50">
    <xpath expr="//tbody/tr[3]/td/div" position="replace">
        <div style="color: #999999">
            <a t-att-href="'%s' % company.website" style="text-decoration:none; color: #999999;">
                example.ch
            </a>
        </div>
    </xpath>
</data>

```
Source: [snippets/mail.mail_notification_paynow.replace_footer.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.mail_notification_paynow.replace_footer.xml)

### Set Model Name  
ID: `mint_system.mail.mail_notification_paynow.set_model_name`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.mail_notification_paynow" priority="60">
    <xpath expr="//td[1]/span[1]" position="replace">
        <span style="font-size: 10px;">
            <t t-esc="model_description or 'document'"/>
        </span>
        <br/>
    </xpath>
</data>

```
Source: [snippets/mail.mail_notification_paynow.set_model_name.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.mail_notification_paynow.set_model_name.xml)

### White Background  
ID: `mint_system.mail.mail_notification_paynow.white_background`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.mail_notification_paynow" priority="60">
    <xpath expr="//t/table" position="attributes">
        <attribute name="style" separator=";" add="background-color: #fff"/>
    </xpath>
</data>

```
Source: [snippets/mail.mail_notification_paynow.white_background.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.mail_notification_paynow.white_background.xml)

## Message Activity Assigned  
### Redirect Access Link  
ID: `mint_system.mail.message_activity_assigned.redirect_access_link`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.message_activity_assigned" priority="50">
    <xpath expr="//p[1]" position="replace">
        <p style="margin: 16px 0px 16px 0px;">
            <span t-esc="activity._name"/>
            <span t-esc="activity.id"/>
            <a t-att-href="access_link" t-att-data-oe-model="activity._name" t-att-data-oe-id="activity.id" style="background-color:#875A7B; padding: 8px 16px 8px 16px; text-decoration: none; color: #fff; border-radius: 5px;">
        View Activity
      </a>
            <a href="#" t-att-data-oe-model="activity._name" t-att-data-oe-id="activity.id">
        View Activity
      </a>
        </p>
    </xpath>
</data>

```
Source: [snippets/mail.message_activity_assigned.redirect_access_link.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.message_activity_assigned.redirect_access_link.xml)

### Remove Access Link  
ID: `mint_system.mail.message_activity_assigned.remove_access_link`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.message_activity_assigned" priority="50">
    <xpath expr="//p[1]" position="replace"/>
</data>

```
Source: [snippets/mail.message_activity_assigned.remove_access_link.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.message_activity_assigned.remove_access_link.xml)

### Set Access Link My Activities  
ID: `mint_system.mail.message_activity_assigned.set_access_link_my_activities`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.message_activity_assigned" priority="50">
    <xpath expr="//p[1]" position="replace">
        <p style="margin: 16px 0px 16px 0px;">
            <t t-if="activity.res_model == 'hr.employee'">
                <a href="/web?debug=1#action=365&amp;model=mail.activity&amp;view_type=kanban&amp;cids=1&amp;menu_id=1" style="background-color:#875A7B; padding: 8px 16px 8px 16px; text-decoration: none; color: #fff; border-radius: 5px;">
          My Activities
        </a>
            </t>
            <t t-else="">
                <a t-att-href="access_link" t-att-data-oe-model="activity.res_model" t-att-data-oe-id="activity.res_id" style="background-color:#875A7B; padding: 8px 16px 8px 16px; text-decoration: none; color: #fff; border-radius: 5px;">
          View <t t-esc="model_description or 'document'"/>
        </a>
            </t>
        </p>
    </xpath>
</data>

```
Source: [snippets/mail.message_activity_assigned.set_access_link_my_activities.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.message_activity_assigned.set_access_link_my_activities.xml)

## View Mail Tree  
### Editable  
ID: `mint_system.mail.view_mail_tree.editable`  
```xml
<?xml version="1.0"?>
<data inherit_id="mail.view_mail_tree" priority="50">
    <tree position="attributes">
        <attribute name="editable"/>
    </tree>
    <field name="subject" position="after">
        <field name="email_from"/>
    </field>
</data>

```
Source: [snippets/mail.view_mail_tree.editable.xml](https://github.com/Mint-System/Odoo-Build/tree/16.0/snippets/mail.view_mail_tree.editable.xml)

