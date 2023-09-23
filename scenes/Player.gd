extends Node2D

var speed = 75
@onready var _animation_player = $AnimatedSprite2D/AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func PlayerMovement(speed, delta):
	if Input.is_action_pressed("moveRight"):
		position.x += speed * delta
		_animation_player.play("walk")
	else:
		_animation_player.play("idle")
	if Input.is_action_pressed("moveLeft"):
		position.x -= speed * delta
	if Input.is_action_pressed("moveUp"):
		position.y -= speed * delta
	if Input.is_action_pressed("moveDown"):
		position.y += speed * delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	PlayerMovement(speed, delta)
