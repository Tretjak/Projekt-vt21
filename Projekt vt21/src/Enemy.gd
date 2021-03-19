extends KinematicBody2D


onready var nav_2d: Navigation2D = get_node("../../Navigation2D")

var goal = Vector2()
var motion = Vector2()
var path = []
var state = 0
#0 = stop, 1 = right, 2 = left, 3 = up, 4 = down

func _physics_process(delta):
	_set_target(goal)
	if Input.is_action_pressed('ui_right'):
		goal = get_node("../../player").global_position
	move_and_slide(goal)
	
	
	"""if state ==0:
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
		"""
	
	


func _on_Timer_timeout():
	state = floor(rand_range(0,5))
	print(state)
	pass # Replace with function body.
	
	
func _set_target(goal):
	var new_path : = nav_2d.get_simple_path(self.golab_position, goal)
	print("what is my path?")
	print(new_path)
	path = new_path
