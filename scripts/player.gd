extends CharacterBody2D
class_name Player

@onready var animation = $AnimatedSprite2D

#Player Settings
var player_name:String 
var active = true
@onready var camera = $Camera2D

#Constants for Moving
const SPEED = 300.0
const JUMP_VELOCITY = -200.0
# Get the gravity from the project settings to be synced with RigidBody nodes, currently set to 500
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") 

func _physics_process(delta):
	
	#Player only moves when active
	if active:
		# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta
			
		# Jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			jump(JUMP_VELOCITY)
			#Set a cap to fall velocity
			if velocity.y> 50:
				velocity.y = 50
		
		#Move left and right with deceleration and flipping of sprite
		var direction = Input.get_axis("left", "right")
		if direction != 0:#Only flips sprite when it is moving
			animation.flip_h = (direction== -1) #flips sprite when moving left
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
		move_and_slide()
		
		update_animations(direction)
	
#updating animations
func update_animations(direction):
	if is_on_floor():
		if direction == 0:
			animation.play("idle")
		else:
			animation.play("walk")
	else:
		if velocity.y < 0:
			animation.play("jump")
		else:
			animation.play("fall")
			
#Jumping with jump pad
func jump(v):
	velocity.y = v
	
