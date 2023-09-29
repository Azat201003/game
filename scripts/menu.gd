extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_button_up():
	#if get_tree().paused == false:
	#	get_tree().change_scene_to_file('res://scenes/street.tscn')
	#else:
	print(0)
	get_tree().paused = false
	visible = false


func _on_button_3_button_up():
	get_tree().quit()
	print(0)


func _on_button_3_pressed():
	#if get_tree().paused == false:
	#	get_tree().change_scene_to_file('res://scenes/street.tscn')
	#else:
	get_tree().paused = false
	visible = false


func _on_button_pressed():
	get_tree().quit()
