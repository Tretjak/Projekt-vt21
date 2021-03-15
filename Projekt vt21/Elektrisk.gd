extends Area2D

const speed = 6
var target

var velocity =Vector2()

func _ready():
	target = get_global_mouse_position()
	velocity = -(position - target).normalized()
	var shot = load("res://Blixtspawner.tscn").instance()
	add_child(shot)
	pass
	
func _process(delta):
	#position += velocity * speed
	pass
