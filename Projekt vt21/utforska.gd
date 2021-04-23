extends Node
#connect(_on_utforska_body_entered, Node2D)
var knapp = false
var saga = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#om krånglar byt namn till Player
func _on_utforska_body_entered(area):
	if area.get_class() == "KinematicBody2D":
		knapp = true
		print("enter")
#	if Input.is_action_pressed("ui_e"):
#		print("you found the holy hand grenade of enoch")


func _on_utforska_body_exited(body):
	knapp = false


func _on_trigger_body_entered(area):
	
	var story = load("res://lore.tscn").instance()
	story.position = get_node("../Player/KinematicBody2D/Camera2D").global_position
	get_parent().add_child(story)
		
	saga = 1
		
