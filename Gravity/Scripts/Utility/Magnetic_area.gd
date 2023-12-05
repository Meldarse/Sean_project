extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$attraction.emitting = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_rhombus_power_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if  event.is_pressed():
			gravity_space_override = Area2D.SPACE_OVERRIDE_REPLACE
			gravity_point = true
			gravity = 4000
			$attraction.emitting = true

		if event.is_released():
			gravity_space_override
			gravity_point = false
			gravity = 980
			$attraction.emitting = false
