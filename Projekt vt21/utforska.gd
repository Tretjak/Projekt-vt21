extends Node
#connect(_on_utforska_body_entered, Node2D)
var knapp = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_utforska_body_entered(area):
	if area.get_class() == "KinematicBody2D":
		knapp = true
		print("enter")
#	if Input.is_action_pressed("ui_e"):
#		print("you found the holy hand grenade of enoch")


func _on_utforska_body_exited(body):
	knapp = false
