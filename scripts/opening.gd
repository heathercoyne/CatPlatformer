extends Node2D

var char_limit = 26
var input_text = ""

@onready var user_text = $ColorRect/LineEdit 
@onready var player = $Scene2/Player

func _ready():
	pass
	
func _physics_process(delta):
	pass

func _on_animation_player_animation_finished(anim_name):
	await get_tree().create_timer(3.0).timeout
	$Scene2/AnimationPlayer2.play("movement")
	AudioPlayer.play_music("opening")
	
func _on_animation_player_2_animation_finished(anim_name):
	player.global_position = $Scene2/Spawn.global_position
	player.visible = true
	
	await get_tree().create_timer(5.0).timeout
	$ColorRect.visible = true
	

	

func _on_button_pressed():
	AudioPlayer.change = true
	player.player_name = input_text
	print(player.player_name)
	$ColorRect.visible = false


#For Getting Player Name
func _on_line_edit_text_changed(new_text):
	#Displays how many chars the player has left
	$ColorRect/WordLimit.text = str(char_limit-new_text.length())
	
	if new_text.length()==char_limit:
		user_text.text = input_text
	input_text = user_text.text # Replace with function body.
