extends KinematicBody2D

var motion = Vector2()

var state = 0
#0 = stop, 1 = right, 2 = left, 3 = up, 4 = down

func _physics_process(delta):
	
	
	
	if state ==0:
		motion.x = 0
		motion.y = 0
	elif state == 1:
		motion.x = 100
		motion.y = 0
	elif state == 2:
		motion.x = -100
		motion.y = 0
	elif state == 3:
		motion.x = 0
		motion.y = -100
	elif state == 4:
		motion.x = 0
		motion.y = 100
	
	move_and_slide(motion, Vector2(0,-1))


func _on_Timer_timeout():
	state = floor(rand_range(0,5))
	print(state)
	pass # Replace with function body.
