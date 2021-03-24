extends Node2D

var riktning = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	choose_direction()
	spawn_blixt(riktning)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func choose_direction():
	riktning = randi()%4
	
	
func spawn_blixt(dir):
	var xspawn = 0
	var yspawn = 0
	if dir == 0:
		xspawn = position.x+1
		yspawn = randi()%5 - 2
	position.x += xspawn
	position.y += yspawn
