extends Node2D

var riktning = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	choose_direction()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	spawn_blixt(riktning)
#	pass
func choose_direction():
	riktning = randi()%4
	
	
func spawn_blixt(dir):
	var xspawn = 0
	var yspawn = 0
	if dir == 0:
		xspawn = position.x+1
		yspawn = randi()%5 - 2
		position.x = xspawn
		position.y += yspawn
	if dir == 1:
		xspawn = randi()%5 - 2
		yspawn = position.y - 1
		position.x += xspawn
		position.y = yspawn
	if dir == 2:
		xspawn = position.x - 1
		yspawn = randi()%5 - 2
		position.x = xspawn
		position.y += yspawn
	if dir == 3:
		xspawn = randi()%5 - 2
		yspawn = position.y + 1
		position.x += xspawn
		position.y = yspawn
	var shot = load("res://Blixt.tscn").instance()
	#var spawn = get_node("pew/Position2D")
	shot.position = position
	get_parent().add_child(shot)


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
