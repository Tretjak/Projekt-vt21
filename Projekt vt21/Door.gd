extends StaticBody2D

var block = true
#var knapp = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_e") and get_node("../Collisions").knapp:
		$"Coll-DoorWMR".set_rotation_degrees(90)


#func _on_Area2D_body_entered(body):
#	if body.get_class() == "KinematicBody2D":
#		knapp = true
#		print("öppna")



#func _on_Area2D_body_exited(body):
#	knapp = false
