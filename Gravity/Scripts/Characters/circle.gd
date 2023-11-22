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

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch:
		if  event.is_pressed():
			selected = true

		if event.is_released():
			selected = false



func _on_area_2d_area_entered(area):
	if area is StaticBody2D:
		selected = false
