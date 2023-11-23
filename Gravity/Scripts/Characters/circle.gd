extends RigidBody2D

var selected: bool = false

func _ready():
	pass # Replace with function body.


func _process(delta):
	if selected:
		freeze = true
		global_transform.origin = lerp(global_position, get_global_mouse_position(), 75 * delta)
		#Agregar a la lista para pintar
		if $Body.global_position not in Global.painting_place:
			Global.painting_place.append($Body.global_position)
	else:
		freeze = false


#Coger y soltar
func _on_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch:
		if  event.is_pressed():
			selected = true

		if event.is_released():
			selected = false

#No salir de la pantalla
func _on_area_2d_body_entered(body):
	if body is StaticBody2D:
		selected = false
