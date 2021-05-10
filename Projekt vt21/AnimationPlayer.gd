extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var meningar = ["långt långt borta.", "så grävde dvargarna"]
var i = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
			if meningar.size() > i:
				get_node("../Label").set_text(meningar[i])
				play("text")
				i += 1
		#else:
			#get_tree().change_scene("res://main.tscn")


