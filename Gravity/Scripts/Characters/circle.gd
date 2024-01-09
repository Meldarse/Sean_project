extends RigidBody2D

var selected: bool = false
var self_color: Color
var random_animation: String = Global.animations[randi_range(0, 5)]
const BOUNCE_THRESHOLD_Y = -150
const BOUNCE_THRESHOLD_X = 50

func _ready():
	contact_monitor = true
	max_contacts_reported = 1
	$Body.play(random_animation)
	$Face.play("face_happy")
	$AnimationPlayer.play("Idle")
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
	Global.mono_hit.connect(hit_mono)
	Global.color_hit.connect(hit_color)


func _process(delta):
	if selected:
		sleeping = true
		global_transform.origin = lerp(global_position, get_global_mouse_position(), 75 * delta)
	else:
		sleeping = false
		$Face.play("face_happy")


	if get_colliding_bodies() and (linear_velocity.y < BOUNCE_THRESHOLD_Y or linear_velocity.x > BOUNCE_THRESHOLD_X):
		if not $Bounce.playing:
			$Bounce.play()


#Coger y soltar
func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if  event.is_pressed():
			selected = true
			$select.play()
			$Face.play("face_curious")

		if event.is_released():
			selected = false


#No salir de la pantalla
func _on_internal_security_body_entered(body):
	if body is StaticBody2D:
		$Negative.play()
		selected = false



#Borrar nodo hijo
func delete_child(my_color: Color, body: RigidBody2D):
	if self == body and my_color == self_color:
		$Positive.play()
		gravity_scale = 0
		$AnimationPlayer.play("Bye")
		await $AnimationPlayer.animation_finished
		if body.get_parent() != null:
			body.get_parent().remove_child(body)
			body.queue_free()
	elif self == body and my_color != self_color:
		$Negative.play()
		$Face.play("face_negative")



#Para movimiento por elemento blanco
func hit_mono(body: RigidBody2D):
	if self == body:
		selected = false

#Para movimiento por elemento de color
func hit_color(body: RigidBody2D, color: Color):
	if self == body and color == self_color:
		selected = false
