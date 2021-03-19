extends Area2D

const speed = 6
var target

var velocity =Vector2()

func _ready():
	target = get_global_mouse_position()
	velocity = -(position - target).normalized()
	pass
	
func _process(delta):
	position += velocity * speed
