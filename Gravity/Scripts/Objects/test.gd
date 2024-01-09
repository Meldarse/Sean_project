extends Node

var squircle_scene = preload("res://Scenes/Characters/circle.tscn")

func _ready():
	$AudioStreamPlayer.play()
	for i in range(5):
		var squircle = squircle_scene.instantiate()
		add_child(squircle)
		squircle.position = Vector2(100,100)
		
