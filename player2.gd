extends RigidBody2D

var speed = 75
@onready var _animation_player = $Sprite2D/AnimatedSprite2D
@onready var s = $Sprite2D/AnimatedSprite2D

var right = true
var isGround = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

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
	if !Input.is_action_pressed("moveDown") and !Input.is_action_pressed("moveUp") and !Input.is_action_pressed("moveRight") and !Input.is_action_pressed("moveLeft"):
		_animation_player.play("idle")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var jump = get_linear_velocity().y
	if Input.is_key_pressed(KEY_SPACE) and isGround:
		apply_central_impulse(Vector2(0, -100))
func _process(delta):
	PlayerMovement(speed, delta)




func _on_area_2d_body_entered(body):
	if body.get_name() == "g":
		isGround = true


func _on_area_2d_body_exited(body):
	if body.get_name() == "g":
		isGround = false
