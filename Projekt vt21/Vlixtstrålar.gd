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
		xspawn = position.x+2
		yspawn = randi()%5 - 2
		position.x = xspawn
		position.y += yspawn
	if dir == 2:
		xspawn = position.x+3
		yspawn = randi()%5 - 2
		position.x = xspawn
		position.y -= yspawn
	if dir == 3:
		xspawn = position.x+4
		yspawn = randi()%5 - 2
		position.x = xspawn
		position.y = yspawn
