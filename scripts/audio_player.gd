extends Node

#Background Music
@onready var background = $BackgroundMusic
var happy = preload("res://assets/audio/happy.wav")
var opening = preload("res://assets/audio/opening.wav")
#Sounds to be imported later
var hurt
var jump
var bark

#Control Variales
var change: bool = false

func play_sfx(name: String):
	var stream = null
	if name == "hurt":
		stream = hurt
	elif name == "jump":
		stream = jump
	elif name == "bark":
		stream = bark
	else:
		print("Error: Invalid SFX Name")
		return
	#If stream isn't null creates stream player
	var sfx = AudioStreamPlayer.new()
	sfx.stream = stream
	sfx.name = "SFX"
	add_child(sfx)
	sfx.play()
	
	await sfx.finished
	sfx.queue_free()
	
func play_music(name: String):
	if name == "happy":
		background.stream = happy
	elif name == "opening":
		background.stream =  opening
	background.play()


func _on_background_music_finished():
	if change and background.stream == opening:
		background.stream = happy
		get_tree().change_scene_to_file("res://scenes/level.tscn")
		change = false
	background.play()
