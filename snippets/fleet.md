# Fleet
## Fleet Vehicle View Form  
### Show Reservation  
ID: `mint_system.fleet.fleet_vehicle_view_form.show_reservation`  
```xml
<data inherit_id="fleet.fleet_vehicle_view_form" priority="50">
    <xpath expr="//group/group[5]" position="after">
        <group string="Reservation">
            <field name="reserved_ids">
                <tree>
                    <field name="date_from"/>
                    <field name="date_to"/>
                </tree>
            </field>
        </group>
    </xpath>
</data>

```
Source: [snippets/fleet.fleet_vehicle_view_form.show_reservation.xml](https://github.com/Mint-System/Odoo-Build/tree/main/snippets/fleet.fleet_vehicle_view_form.show_reservation.xml)

