extends Control

var pos = 1
var cadrs
# Called when the node enters the scene tree for the first time.
func _ready():
	cadrs = [load("res://cutscenes/beginning/beginning2.png"), load("res://cutscenes/beginning/beginning3.png"), load("res://cutscenes/beginning/beginning4.png"), load("res://cutscenes/beginning/beginning5.png"), load("res://cutscenes/beginning/beginning6.png")]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("pressE"):
		if pos != 5:
			$TextureRect.texture = cadrs[pos]
			pos+=1
		else:
			get_tree().change_scene_to_file('res://scenes/street.tscn')
