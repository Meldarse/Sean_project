extends Area2D


func _ready():
	hide()
	$CollisionShape2D.disabled = true


func _process(delta):
	pass

func _on_timer_timeout():
		show()
		$AnimationPlayer.play("Appear")
		$CollisionShape2D.disabled = false
		await $AnimationPlayer.animation_finished
		$AnimationPlayer.play("Idle")

func _on_body_entered(_body):
	get_tree().queue_delete(_body)
	print("AaA")
