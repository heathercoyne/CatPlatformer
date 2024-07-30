extends "res://scripts/level.gd"

#Timer variables
@onready var timer = $Timer
@export var level_time = 5
var time_left

#Displayer
@onready var hud = $UILayer/HUD

func _ready():
	super._ready()
	hud.show_time_label(true)
	time_left = level_time
	hud.set_time_label(time_left)
	timer.timeout.connect(_on_timer_timeout)
	
func _on_timer_timeout():
	print(time_left)
	time_left -= 1
	hud.set_time_label(time_left)
	if time_left <= 0:
		time_left = level_time
		hud.set_time_label(time_left)
		reset_player()
		
