extends Button

var first_activation: bool = false
var color_emit: Color
@onready var object_change = "res://Scenes/Objects/portal.tscn"

func _ready():
	$AnimatedSprite2D.play("Off")


func _on_pressed():
	$touch.play()
	if first_activation:
		var color_copy = Global.COLOR_ARRAY.duplicate()
		color_copy.erase(color_emit)
		color_copy.shuffle()
		color_emit = color_copy.pop_front()
		Global.portal_color.emit(color_emit)
	elif first_activation == false:
		Global.activate.emit()
		first_activation = true
		$AnimatedSprite2D.play("On")
