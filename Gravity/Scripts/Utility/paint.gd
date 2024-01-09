extends Node2D

var color_paint: Color

func _ready():
	Global.paint_color.connect(my_color)

func _process(_delta):
	queue_redraw()

func my_color(self_color):
	color_paint = self_color

func _draw():
	for point in Global.painting_place:
		draw_circle(point, 80, color_paint)
