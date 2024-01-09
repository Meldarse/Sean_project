extends RigidBody2D

var selected: bool = false
var current_scale = Global.scale_states[1]
var self_color: Color
var random_animation: String = Global.animations[randi_range(0, 5)]

func _ready():
	contact_monitor = true
	max_contacts_reported = 5
	$Body.play(random_animation)
	match random_animation:
		"Blue":
			self_color = Global.COLOR_PALETTE["blue"]
		"Green":
			self_color = Global.COLOR_PALETTE["green"]
		"Pink":
			self_color = Global.COLOR_PALETTE["pink"]
		"Purple":
			self_color = Global.COLOR_PALETTE["purple"]
		"Red":
			self_color = Global.COLOR_PALETTE["red"]
		"Yellow":
			self_color = Global.COLOR_PALETTE["yellow"]
	Global.good_bye.connect(delete_child)
	Global.scale_up.connect(increases_scale)
	Global.scale_down.connect(reduces_scale)
	Global.mono_hit.connect(hit_mono)
	Global.color_hit.connect(hit_color)


func _process(delta):
	$Body.scale = current_scale
	$Shape.scale = current_scale
	$Internal_security.scale = current_scale
	if selected:
		sleeping = true
		global_transform.origin = lerp(global_position, get_global_mouse_position(), 60 * delta)
		current_scale =  Global.scale_states[2]

	else:
		sleeping = false


func _on_input_event(_viewport, event, _shape_idx):
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
			Global.scale_up.emit(body)
		else:
			pass

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


#Borrar nodo hijo
func delete_child(my_color: Color, body: RigidBody2D):
	if self == body and my_color == self_color:
			gravity_scale = 0
			$AnimationPlayer.play("Bye")
			await $AnimationPlayer.animation_finished
			if body.get_parent() != null:
				body.get_parent().remove_child(body)
				body.queue_free()


#Para movimiento por elemento blanco
func hit_mono(body: RigidBody2D):
	if self == body:
		selected = false


#Para movimiento por elemento de color
func hit_color(body: RigidBody2D, color: Color):
	if self == body and color == self_color:
		selected = false
