extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var _animation_player = $AnimatedSprite2D
	await get_tree().create_timer(randi() % 10, false, false, true).timeout
	if _animation_player != null:
		_animation_player.play("idle")
	else:
		$g10.play("idle")
