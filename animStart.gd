extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var _animation_player = $AnimationPlayer
	_animation_player.play("idle")
