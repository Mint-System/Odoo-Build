Migrate model fields state definitions.
Replace this kind of conditions:

READONLY_STATES = {
	"draft": [("readonly", False)],
	"initialized": [("readonly", True)],
	"connected": [("readonly", True)],
	"deleted": [("readonly", False)],
}
name = fields.Char(states=READONLY_STATES)
key = fields.Char(
	readonly=True
	states={"draft": [("readonly", False)], "assigned": [("deleted", False)]},
)

With a form view definitions of the respective model:

<field name="name" readonly="state in ['initialized', 'connected']"/>
<field name="key" readonly="state not in ['draft', 'deleted']"/>
