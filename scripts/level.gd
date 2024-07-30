extends Node2D

#For managing players
@onready var player = $Player

#Game Elements
@onready var start_position = $Start
@onready var exit = $Exit
@onready var death = $DeathZone
@export var next_level: PackedScene = null
func _ready():
	player.camera.enabled = true
	reset_player()
	var traps = get_tree().get_nodes_in_group("Traps")
	print(traps)
	for trap in traps:
		trap.connect("touched_player", _on_trap_touched_player)
	
	#signal connections
	exit.body_entered.connect(_on_exit_entered)
	death.body_entered.connect(_on_death_zone_body_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Game Options
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func _on_death_zone_body_entered(body):
	reset_player()

func _on_trap_touched_player(body):
	reset_player()
	
func reset_player():
	player.velocity = Vector2.ZERO
	player.global_position = start_position.get_spawn_position()

func _on_exit_entered(body):
	if body is Player:
		if next_level != null:
			exit.animate()
			body.active = false
			await get_tree().create_timer(1).timeout
			get_tree().change_scene_to_packed(next_level)
