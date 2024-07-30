extends ParallaxBackground

@onready var sprite = $ParallaxLayer/Sprite2D
@export var scroll_speed  = 60
#Easily change background 
@export var bg_texture: CompressedTexture2D = preload("res://assets/textures/world/background.png")

func _process(delta):
	sprite.region_rect.position += delta*Vector2(-scroll_speed, -scroll_speed)
#Stop position from becoming too large
	if sprite.region_rect.position >= Vector2(256, 256):
		sprite.region_rect.position = Vector2.ZERO
