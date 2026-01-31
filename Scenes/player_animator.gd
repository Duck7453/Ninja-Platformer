extends Node2D

@export var player : PlayerScript
@export var animation : AnimationPlayer
@export var idle : Sprite2D
@export var walk : Sprite2D

func _process(_delta):
	
	if player.direction == -1:
		idle.flip_h = true
		walk.flip_h = true
	elif player.direction == 1:
		idle.flip_h = false
		walk.flip_h = false
		
	if player.velocity.x > 0.0 or player.velocity.x < 0.0:
		idle.hide()
		walk.show()
		animation.play("walk")
	else:
		idle.show()
		walk.hide()
		animation.play("idle")
