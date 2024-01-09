extends Area2D

const SPEED = 400.0
const THRESHOLD = 300
const SCALE_FACTOR = 0.75
const SCALE_SPEED = 0.5
enum Side { LEFT, RIGHT }
var side = Side.LEFT
var my_color: Color


func _ready():
	modulate = my_color
	scale = Vector2(0.25, 0.25) 
	if global_position.x > THRESHOLD:
		side = Side.RIGHT
		rotation = PI * 3
	elif global_position.x < THRESHOLD:
		side = Side.LEFT
		rotation = PI


func _process(delta):
	match side:
		Side.RIGHT:
			global_position.x -= SPEED * delta
			scale += Vector2(SCALE_FACTOR, SCALE_FACTOR) * SCALE_SPEED * delta
		Side.LEFT:
			global_position.x += SPEED * delta
			scale += Vector2(SCALE_FACTOR, SCALE_FACTOR) * SCALE_SPEED * delta

func set_color(color_change):
	my_color = color_change

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	if body is RigidBody2D:
		if my_color == Color.WHITE:
			Global.mono_hit.emit(body)
		elif my_color != Color.WHITE:
			Global.color_hit.emit(body, my_color)
	else:
		return
