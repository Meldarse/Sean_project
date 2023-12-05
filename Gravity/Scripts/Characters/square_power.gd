extends RigidBody2D

var selected: bool = false
var current_scale = Global.scale_states[1]

func _ready():
	contact_monitor = true
	max_contacts_reported = 5
	Global.scale_up.connect(increases_scale)
	Global.scale_down.connect(reduces_scale)

func _process(delta):
	$Body.scale = current_scale
	$Shape.scale = current_scale
	$Internal_security.scale = current_scale
	if selected:
		sleeping = true
		global_transform.origin = lerp(global_position, get_global_mouse_position(), 30 * delta)
		current_scale =  Global.scale_states[0]

	else:
		sleeping = false


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if  event.is_pressed():
			selected = true

		if event.is_released():
			selected = false
			current_scale =  Global.scale_states[1]


#No salir de la pantalla
func _on_internal_security_body_entered(body):
	if body is StaticBody2D:
		selected = false


func _on_body_entered(body):
	if selected:
		if body is RigidBody2D:
			Global.scale_down.emit(body)
		else:
			pass


func increases_scale(body: RigidBody2D):
	if self == body:
		if Global.scale_states.find(current_scale) > 1:
			pass
		else:
			current_scale = Global.scale_states[Global.scale_states.find(current_scale) + 1]
	else:
		pass


func reduces_scale(body: RigidBody2D):
	if self == body:
		if Global.scale_states.find(current_scale) < 1:
			pass
		else:
			current_scale = Global.scale_states[Global.scale_states.find(current_scale) - 1]
	else:
		pass
