extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var meningar = ["As soon as you leave the cafeteria room,you see the two bloody corpses of two peopele.", "You go on and investigate and find out that it is the captain and the second in command.", "You pick up their weapons and ammunition and head on your way,obviusly shaken by the experience"]
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


