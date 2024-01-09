extends Node2D

var advance: bool = true
@export var speed: float = 0.75
@onready var path: PathFollow2D = $Path2D/PathFollow2D

func _process(delta):
	if advance:
		path.progress_ratio += speed * delta
		if path.progress_ratio >= 0.99:
			advance = false
	else:
		path.progress_ratio -= speed * delta
		if path.progress_ratio <= 0.01:
			advance = true


func _on_area_2d_body_entered(body):
	if body is RigidBody2D:
		Global.mono_hit.emit(body)
	else:
		return
