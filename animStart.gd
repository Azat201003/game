extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var _animation_player = $AnimatedSprite2D
	_animation_player.play("idle")
