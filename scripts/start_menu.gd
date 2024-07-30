extends Control

#For Modifying Button Locations
@onready var start = $StartButton
var resume 
var saved = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if saved:
		#Create resume butom
		resume = Button.new()
		add_child(resume)
		resume.size = Vector2(150, 31)
		resume.global_position = Vector2(405, 270)
		resume.text = "Resume" 
		
		resume.pressed.connect(_on_resume_button_pressed)
		
		#Change start to resume
		start.text = "New Game"	
		start.size = Vector2(150, 31)
		start.global_position = Vector2(405, 310)


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/opening.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
	
#WIll be changed later
func _on_resume_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level.tscn")
