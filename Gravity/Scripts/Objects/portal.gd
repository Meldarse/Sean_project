extends Area2D


func _ready():
	$CollisionShape2D.disabled = true
	$AnimationPlayer.play("Appear")


func _process(delta):
	pass

func _on_timer_timeout():
		$CollisionShape2D.disabled = false
		$AnimationPlayer.play("Idle")

func _on_body_entered(_body):
	get_tree().queue_delete(_body)
	print("AaA")
