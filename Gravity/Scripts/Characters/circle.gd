extends RigidBody2D

var selected: bool = false

func _ready():
	pass # Replace with function body.


func _process(delta):
	if selected:
		freeze = true
		global_transform.origin = lerp(global_position, get_global_mouse_position(), 75 * delta)

	else:
		freeze = false


#Coger y soltar
func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if  event.is_pressed():
			selected = true
			Global.painting_place.clear()

		if event.is_released():
			selected = false

#No salir de la pantalla
func _on_internal_security_body_entered(body):
	if body is StaticBody2D:
		selected = false
