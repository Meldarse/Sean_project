extends Area2D

var projectile_scene: PackedScene = preload("res://Scenes/Objects/bullet.tscn")
var self_color: Color = Color.WHITE
const THRESHOLD = 300
@onready var projectile_spawn = $Marker2D
@onready var timer = $Timer


func _ready():
	timer.start()
	timer.wait_time = 1.5
	$AnimationPlayer.play("Idle")
	if global_position.x > THRESHOLD:
		pass
	elif global_position.x < THRESHOLD:
		rotation = PI * 3
	Global.change_color.connect(change_my_color)


func _process(_delta):
	modulate = self_color


func _on_timer_timeout():
	shoot()

func shoot():
	var projectile = projectile_scene.instantiate()
	projectile.set_color(self_color)
	add_child(projectile)
	projectile.global_position = projectile_spawn.global_position


func change_my_color(color_emit: Color, area: Area2D):
	if self == area:
		self_color = color_emit
		modulate = color_emit
