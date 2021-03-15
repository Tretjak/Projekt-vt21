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
func _process(delta):
	spawn_blixt(riktning)
	pass
func choose_direction():
	riktning = 0

func spawn_blixt(dir):
	var xspawn = 0
	var yspawn = 0
	if dir == 0:
		xspawn = position.x+2
		yspawn = randi()%5 - 2 
		var blixt = load("res://blixt.tscn").instance()
		blixt.position.x = xspawn
		blixt.position.y = yspawn
		get_parent().add_child(blixt)
		#spawna blixt 
	position.x = xspawn
	position.y = yspawn
