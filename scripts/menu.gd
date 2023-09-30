extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_button_up():
	if get_tree().paused == false:
		get_tree().change_scene_to_file('res://scenes/cat_scene_1.tscn')
	else:
		get_tree().paused = false
		visible = false


func _on_button_3_button_up():
	get_tree().quit()
