extends Node2D

func _process(_delta):
	queue_redraw()


func _draw():
	for point in Global.painting_place:
		draw_circle(point, 30, Global.color_blue)
