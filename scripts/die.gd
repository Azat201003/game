extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.get_name() == "player":
		var p = get_parent().get_node("player")
		var pS = preload("res://scenes/player.tscn")
		var j = pS.instantiate()
		get_parent().remove_child(p)
		get_parent().add_child(pS.instantiate())
