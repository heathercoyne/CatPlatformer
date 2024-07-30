extends Area2D

@onready var animation = $AnimatedSprite2D
@export var jump_force = -300

func _on_body_entered(body):
	if body is Player:
		animation.play("jump") 
		body.jump(jump_force)
