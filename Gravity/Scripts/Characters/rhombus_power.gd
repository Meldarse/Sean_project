extends RigidBody2D

var selected: bool = false


func _ready():
	pass


func _process(delta):
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
