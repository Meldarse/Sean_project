extends Node

signal scale_up(body: RigidBody2D)
signal scale_down(body: RigidBody2D)
signal change_color(color: Color, area)
signal portal_color(color: Color)
signal activate
signal good_bye(my_color: Color, body: RigidBody2D)
signal paint_color(self_color: Color)
signal mono_hit(body: RigidBody2D)
signal color_hit(body: RigidBody2D, colo: Color)

var painting_place: Array = []
var scale_states: Array = [Vector2(0.5,0.5), Vector2(1.0,1.0), Vector2(1.25,1.25)]
var animations: Array = ["Blue", "Green", "Pink", "Purple", "Red", "Yellow"]

var COLOR_PALETTE: Dictionary = {
   "blue": Color.hex(0x6e7fe9ff),
   "green": Color.hex(0x65c178ff),
   "pink": Color.hex(0xff82c3ff),
   "purple": Color.hex(0x905ae5ff),
   "red": Color.hex(0xd9525eff),
   "yellow": Color.hex(0xfab737ff)
}

var COLOR_ARRAY: Array = COLOR_PALETTE.values()
