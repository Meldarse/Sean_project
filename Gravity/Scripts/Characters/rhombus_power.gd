extends RigidBody2D

var selected: bool = false
var current_scale = Global.scale_states[1]

func _ready():
	Global.scale_up.connect(increases_scale)
	Global.scale_down.connect(reduces_scale)


func _process(delta):
	$Body.scale = current_scale
	$Shape.scale = current_scale
	$Internal_security.scale = current_scale
	$Magnetic_area.scale = current_scale
	if selected:
		sleeping = true
		global_transform.origin = lerp(global_position, get_global_mouse_position(), 45 * delta)
	else:
		sleeping = false


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if  event.is_pressed():
			selected = true

		if event.is_released():
			selected = false


#No salir de la pantalla
func _on_internal_security_body_entered(body): 
	if body is StaticBody2D:
		selected = false


func increases_scale(body: RigidBody2D):
	var index = Global.scale_states.find(current_scale)
	if self == body:
		if index > 1:
			return
		else:
			current_scale = Global.scale_states[index + 1]


func reduces_scale(body: RigidBody2D):
	var index = Global.scale_states.find(current_scale)
	if self == body:
		if index < 1:
			return
		else:
			current_scale = Global.scale_states[index - 1]
