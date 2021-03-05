extends KinematicBody2D

const MOVE_SPEED = 15

onready var nav_2d: Navigation2D = get_node("../../Navigation2D")

var goal = Vector2()
var motion = Vector2()
var path = []
var state = 0
var hunt = 0
#0 = stop, 1 = right, 2 = left, 3 = up, 4 = down

func _physics_process(delta):
	if hunt == 1:
		_set_target(goal)
		if Input.is_action_pressed('ui_right'):
			goal = get_node("../../player").global_position
		move_and_slide(goal * MOVE_SPEED * delta)
		
	
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


"""func _on_Timer_timeout():
	state = floor(rand_range(0,5))
	print(state)
	pass # Replace with function body.
	"""
	
	
func _set_target(goal):
	var new_path : = nav_2d.get_simple_path(self.global_position, goal)
	print("what is my path?")
	print(new_path)
	path = new_path


func _on_Area2D_body_entered(body):
	hunt = 1
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	hunt = 0
	pass # Replace with function body.
