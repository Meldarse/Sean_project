extends Area2D


func _ready():
	Global.change_color.connect(change_my_color)
	Global.portal_color.connect(portal_color)
	Global.activate.connect(portal_activate)
	$CollisionShape2D.disabled = true
	$AnimationPlayer.play("RESET")


func portal_activate():
	$CollisionShape2D.disabled = false
	$AnimationPlayer.play("Idle")


func change_my_color(color_emit: Color, area: Area2D):
	if self == area:
		modulate = color_emit

func portal_color(color: Color):
	modulate = color

func _on_body_entered(body):
	Global.good_bye.emit(modulate, body)
