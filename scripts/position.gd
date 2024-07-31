extends Area2D

@onready var heart = %CanvasHeart
@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	animation_player.play("Pickup")
	heart.add_heart()
