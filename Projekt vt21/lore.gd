extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_just_pressed("ui_e"):
# warning-ignore:return_value_discarded
		assert(get_tree().change_scene("res://main.tscn") == OK)
		
