extends Trap

@onready var animation = $AnimatedSprite2D

#Wakes up
func _on_outside_body_entered(body):
	animation.play("wake")

		
#Starts barking once done waking up
func _on_animated_sprite_2d_animation_finished():
	animation.play("bark")

#Reset to idle
func _on_outside_body_exited(body):
	animation.play("idle")
