extends StaticBody2D

@onready var spawn_position = $SpawnPosition

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
#Returns global position of spawn position 

func get_spawn_position():
	return spawn_position.global_position
