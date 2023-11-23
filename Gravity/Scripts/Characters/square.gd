extends RigidBody2D

var selected: bool = false


func _ready():
	pass # Replace with function body.


func _process(delta):
	if selected:
		freeze = true
		global_transform.origin = lerp(global_position, get_global_mouse_position(), 30 * delta)
		scale = Vector2(0.75, 0.75)
	else:
		freeze = false
		

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch:
		if  event.is_pressed():
			selected = true

		if event.is_released():
			selected = false


func _on_area_2d_body_entered(body):
	if body is StaticBody2D:
		selected = false
