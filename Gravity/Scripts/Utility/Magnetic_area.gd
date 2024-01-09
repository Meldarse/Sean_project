extends Area2D

const GRAVITY_ACTIVE = 4000
const GRAVITY_INACTIVE = 980


func _ready():
	$attraction.emitting = false


func _on_rhombus_power_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		match event.is_pressed():
			true:
				enable_magnetic()
			false:
				disable_magnetic()


func _on_internal_security_body_entered(body):
	if body is StaticBody2D:
		disable_magnetic()
	else: # Handle other types of bodies
		return


func enable_magnetic():
	gravity_space_override = Area2D.SPACE_OVERRIDE_REPLACE
	gravity_point = true
	GRAVITY_ACTIVE
	$attraction.emitting = true


func disable_magnetic():
	gravity_space_override
	gravity_point = false
	GRAVITY_INACTIVE
	$attraction.emitting = false
	
