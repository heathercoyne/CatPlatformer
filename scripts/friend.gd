extends Node2D

@onready var text = $Text
@onready var exclaim = $Exclaim
@onready var animation = $AnimationPlayer
@onready var friend = $AnimatedSprite2D2

#For Control purposes
#For speaking withint range
var response = false
#For which speech
var speech
#For Spawning item
var spawn = false


# Called when the node enters the scene tree for the first time.
func _ready():
	speech = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if response and Input.is_action_just_pressed("action"):
		if text.visible == false:
			friend.play("talking")
			text.visible = true
			if speech == 1:
				animation.play("speech")
			elif speech == 2:
				animation.play("speech2")
		elif animation.is_playing():
			if speech == 1:
				animation.play("end")
			elif speech ==2:
				animation.play("end2")
		else:
			_reset_speech()
			
func _reset_speech():
	text.visible = false
	friend.play("default")
	animation.play("RESET")


func _on_outside_body_entered(body):
	exclaim.visible = true
	response = true


func _on_outside_body_exited(body):
	exclaim.visible = false
	response = false
	_reset_speech()

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "speech2" or anim_name == "end2":
		spawn = true
