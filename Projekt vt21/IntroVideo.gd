extends Node2D

func _ready():
	get_node("VideoPlayer").play()
	pass

# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		assert(get_tree().change_scene("res://startskärm.tscn") == OK)
	pass

func _on_VideoPlayer_finished():
	assert(get_tree().change_scene("res://startskärm.tscn") == OK)
	print("test")
	pass 
