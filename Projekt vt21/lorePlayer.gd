extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var meningar = ["The room you are currently standing outside is a so-called cryo room.", "This room is used to freeze the ship's crew on long voyages.", "You check in and notice that everyone except you has died on something strange left."]
var i = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if meningar.size() > i:
			get_node("../Label").set_text(meningar[i])
			play("text")
			i += 1
