extends Area2D

const speed = 100
var target

var velocity =Vector2()

func _ready():
	target = Transform2D (global_rotation, global_position)
	global_rotation = get_parent().get_node("Player/KinematicBody2D").global_rotation
	#velocity = -(position - target).normalized()
	pass
	
func _process(delta):
	position += transform.x * speed * delta
	var shot = load("res://Blixtstrålar.tscn").instance()
	#var spawn = get_node("pew/Position2D")
	#shot.position = get_global_position()
	add_child(shot)


func _on_Elskott_body_entered(body):
	queue_free()
	pass # Replace with function body.
