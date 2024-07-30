extends "res://scripts/level.gd"

@onready var friend = $NPCs/Friend
@onready var friend_pos = $Manage/Marker2D
var jump_pad = preload("res://scenes/jump_pad.tscn")
var not_spawned = true

func _process(delta):
	super._process(delta)
	if friend.spawn and not_spawned:
		var jump_instance = jump_pad.instantiate()
		jump_instance.global_position = $Manage/JumpMarker.global_position
		jump_instance.jump_force = -1000
		add_child(jump_instance)
		not_spawned = false
	
func _on_area_2d_body_entered(body):
	friend.global_position = friend_pos.global_position
	friend.speech = 2

