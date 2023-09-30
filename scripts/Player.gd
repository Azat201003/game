extends Node2D

var speed = 75
@onready var _animation_player = $player/Sprite2D/AnimatedSprite2D

var phrases = ["hello have you seen anyone this night?", "have you seen anyone suspicious here?", "hello, a cake was stolen in the museum last night.\n Did you notice something strange today?"]
var phrases2 = ["No I went to bed early today", "yes there were a few raccoons running through here", "Yes I saw two raccoons rummaging through trash cans"]
var tOrF = [false, true, true]
var numText = 0
var rand = 0
var end = false
var end2 = false

var radius_paper = false

var right = true
var radius = false
var last = false
var isOpen = false
var pos_x = 0
var pos_y = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func PlayerMovement(speed, delta):
	if Input.is_action_just_pressed("moveRight"):
		_animation_player.play("walk")
		if !right:
			_animation_player.get_parent().scale.x *= -1
		right = true
		pos_x = 1
	if Input.is_action_just_released("moveRight"):
		pos_x = 0
	
	if Input.is_action_just_pressed("moveLeft"):
		_animation_player.play("walk")
		if right:
			_animation_player.get_parent().scale.x *= -1
		right = false
		pos_x = -1
	if Input.is_action_just_released("moveLeft"):
		pos_x = 0
	if Input.is_action_just_pressed("moveUp"):
		_animation_player.play("walk")
		pos_y = -1
	if Input.is_action_just_released("moveUp"):
		pos_y = 0
	
	if Input.is_action_just_pressed("moveDown"):
		_animation_player.play("walk")
		pos_y = 1
	if Input.is_action_just_released("moveDown"):
		pos_y = 0
	
	if pos_x == 0 and pos_y == 0:
		_animation_player.play("idle")
	
	position.x += speed * delta * pos_x
	position.y += speed * delta * pos_y
		
	if Input.is_action_just_pressed("pressE"):
		var jk = get_parent().get_parent().get_node("CanvasLayer/TextureRect")
		if numText == 0:
			if radius:
				jk.get_node("chat").text = phrases[rand]
				jk.visible = true
			if end2:
				jk.visible = false
				end2 = false
			else:
				if radius:
					numText += 1
		else:
			if radius:
				numText = 0
				jk.get_node("chat").text = phrases2[rand]
				end2 = true
				if !end:
					end = tOrF[rand]
		if isOpen:
			get_parent().get_node("CanvasLayer/TextureRect").visible = false
			isOpen = false
		else:
			if radius_paper:
				get_parent().get_node("CanvasLayer/TextureRect").visible = true
				isOpen = true
				last = true
	
	if Input.is_action_just_released("esc"):
		get_parent().get_parent().get_node("CanvasLayer/menu").visible = true
		
		get_tree().paused = true
			
				

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	PlayerMovement(speed, delta)


func _on_area_2d_body_entered(body):
	if body.get_name() == "door_to_musem":
		if end == true:
			get_tree().change_scene_to_file('res://scenes/musem.tscn')
	if body.get_name() == "door_to_parkur" and last:
		get_tree().change_scene_to_file('res://scenes/паркур.tscn')


func _on_area_2d_area_entered(area):
	if area.get_name() == "bear":
		radius = true
		get_parent().get_parent().get_node("CanvasLayer/Label").visible = true
		rand = 0
	if area.get_name() == "bear2":
		radius = true
		get_parent().get_parent().get_node("CanvasLayer/Label").visible = true
		rand = 1
	if area.get_name() == "bear3":
		radius = true
		get_parent().get_parent().get_node("CanvasLayer/Label").visible = true
		rand = 2
	if area.get_name() == "бумажка":
		radius_paper = true
		get_parent().get_node("CanvasLayer/Label").visible = true


func _on_area_2d_area_exited(area):
	if area.get_name() == "bear":
		radius = false
		get_parent().get_parent().get_node("CanvasLayer/Label").visible = false
	if area.get_name() == "bear2":
		radius = false
		get_parent().get_parent().get_node("CanvasLayer/Label").visible = false
	if area.get_name() == "bear3":
		radius = false
		get_parent().get_parent().get_node("CanvasLayer/Label").visible = false
	if area.get_name() == "бумажка":
		radius_paper = false
		get_parent().get_node("CanvasLayer/Label").visible = false
