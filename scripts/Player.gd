extends Node2D

var speed = 75
@onready var _animation_player = $Sprite2D/AnimatedSprite2D
@onready var s = $Sprite2D/AnimatedSprite2D

var phrases = ["hello have you seen anyone this night?", "have you seen anyone suspicious here?", "hello, a cake was stolen in the museum last night. Did you notice something strange today?"]
var phrases2 = ["No I went to bed early today", "yes there were a few raccoons running through here", "Yes I saw two raccoons rummaging through trash cans"]
var tOrF = [false, true, true]
var numText = 0
var rand
var end = false
var end2 = false

var right = true
var radius = false
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
	if Input.is_action_pressed("moveUp"):
		position.y -= speed * delta
		_animation_player.play("walk")
	if Input.is_action_pressed("moveDown"):
		position.y += speed * delta
		_animation_player.play("walk")
	if !Input.is_action_pressed("moveDown") and !Input.is_action_pressed("moveUp") and !Input.is_action_pressed("moveRight") and !Input.is_action_pressed("moveLeft"):
		_animation_player.play("idle")
	if Input.is_action_just_pressed("pressE"):
		if radius:
			var jk = get_parent().get_parent().get_node("CanvasLayer/chat")
			if numText == 0:
				rand = randi() % 3 - 1
				jk.text = phrases[rand]
				jk.visible = true
				if end2:
					jk.visible = false
					end2 = false
				else:
					numText += 1
			else:
				numText = 0
				jk.text = phrases2[rand]
				end2 = true
				if !end:
					end = tOrF[rand]
			
				

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	PlayerMovement(speed, delta)


func _on_area_2d_body_exited(body):
	if body.get_name() == "bear":
		radius = false


func _on_area_2d_body_entered(body):
	if body.get_name() == "bear":
		radius = true
	if body.get_name() == "door_to_musem":
		if end == true:
			get_tree().change_scene_to_file('res://scenes/musem.tscn')

