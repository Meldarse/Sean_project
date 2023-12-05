extends Node

signal scale_up(body: RigidBody2D)
signal scale_down(body: RigidBody2D)

var painting_place: Array = []
var scale_states: Array = [Vector2(0.5,0.5), Vector2(1.0,1.0), Vector2(1.5,1.5)]

var color_blue: Color = Color.hex(0x6e7fe9ff)
var color_green: Color = Color.hex(0x5eb867ff)
var color_pink: Color = Color.hex(0xff82c3ff)
var color_purple: Color = Color.hex(0x905ae5ff)
var color_red: Color = Color.hex(0x905ae5ff)
var color_yellow: Color = Color.hex(0xfab737ff)
