extends CharacterBody2D

@onready var animationSprite = $AnimatedSprite2D

func _physics_process(delta):
	var axisX = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if axisX > 0:
		animationSprite.animation = "Run"
		animationSprite.flip_h = false
	if axisX < 0:
		animationSprite.animation = "Run"
		animationSprite.flip_h = true
	else:
		animationSprite.animation = "Idle"
