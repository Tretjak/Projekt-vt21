extends Area2D

const speed = 500
var target

var velocity =Vector2()

func _ready():
	target = Transform2D (global_rotation, global_position)
	global_rotation = get_parent().get_node("Player/KinematicBody2D").global_rotation
	#velocity = -(position - target).normalized()
	pass
	
func _process(delta):
	position += transform.x * speed * delta
	
