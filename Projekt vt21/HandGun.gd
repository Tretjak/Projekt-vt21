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
	


func _on_Handgun_body_entered(body):
	if not body.get("health") == null:
		body.health -= 2
		print(body.health)
	queue_free()
	pass # Replace with function body.
