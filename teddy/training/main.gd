extends Node

export (PackedScene) var Mob
var score
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func game_over():
	$scoreTimer.stop()
	$mobTimer.stop()

func new_game():
	score = 0
	$player.start($startposition.position)
	$startTimer.start()
	





func _on_mobTimer_timeout():
	
	$mobpath/mobspawnlocation.offset = randi()
	
	var mob = Mob.instance()
	add_child(mob)
	
	var direction = $mobpath/mobspawnlocation.rotation + PI / 2
	mob.position = $mobpath/mobspawnlocation.position
	direction += rand_range( -PI / 4, PI / 4)
	mob.rotation = direction
	
	mob.linear_velocity = Vector2(rand_range(mob.min_speed, mob.max_speed), 0)
	mob.linear_velocity = mob.linear_velocity.rotated(direction)


func _on_scoreTimer_timeout():
	score += 1


func _on_startTimer_timeout():
	$mobTimer.start()
	$scoreTimer.start()
