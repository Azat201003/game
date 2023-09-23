extends Node2D

var speed = 75
@onready var _animation_player = $AnimatedSprite2D/AnimationPlayer
@onready var s = $AnimatedSprite2D

var right = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func PlayerMovement(speed, delta):
	if Input.is_action_pressed("moveRight"):
		position.x += speed * delta
		_animation_player.play("walk")
		if !right:
			s.scale.x *= -1
		right = true
	if Input.is_action_pressed("moveLeft"):
		position.x -= speed * delta
		_animation_player.play("walk")
		if right:
			s.scale.x *= -1
		right = false
	if Input.is_action_pressed("moveUp"):
		position.y -= speed * delta
		_animation_player.play("walk")
	if Input.is_action_pressed("moveDown"):
		position.y += speed * delta
		_animation_player.play("walk")
	if !Input.is_action_pressed("moveDown") and !Input.is_action_pressed("moveUp") and !Input.is_action_pressed("moveRight") and !Input.is_action_pressed("moveLeft"):
		_animation_player.play("idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	PlayerMovement(speed, delta)
