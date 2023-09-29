extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var _animation_player = $AnimatedSprite2D
	if _animation_player != null:
		_animation_player.play("idle")
	else:
		await get_tree().create_timer(randi() % 20 / 10, false, false, true).timeout
		$g10.play("idle")
