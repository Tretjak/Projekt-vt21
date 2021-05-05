extends KinematicBody2D

const MOVE_SPEED = 100

onready var nav_2d: Navigation2D = get_node("../../Navigation2D")

export (int) var speed = 50
var goal = Vector2()
var motion = Vector2()
var path = []
var state = 0
var hunt = 0
var velocity = Vector2()
#0 = stop, 1 = right, 2 = left, 3 = up, 4 = down

func _physics_process(delta):
	if hunt == 1:
		#_set_target(goal)
		goal = get_node("../../Player/KinematicBody2D").global_position - global_position
		move_and_slide(goal * MOVE_SPEED * delta)
	elif hunt == 2:
		goal = get_node("../../StaticBody2D").global_position - global_position
		move_and_slide(goal * MOVE_SPEED * delta)
	elif hunt == 0:
		if state == 0:
			velocity.x = 0
			velocity.y = 0
		if state == 1:
			velocity.x += 1
		if state == 2:
			velocity.x -= 1
		if state == 3:
			velocity.y += 1
		if state == 4:
			velocity.y -= 1
		velocity = velocity.normalized() * speed
		move_and_slide(velocity)

func _on_Timer_timeout():
	if hunt == 0:
		state = floor(rand_range(0,5))
		print(state)
		pass # Replace with function body.

func _set_target(goal):
	var new_path : = nav_2d.get_simple_path(self.global_position, goal)
	print("what is my path?")
	print(new_path)
	path = new_path

func _on_Area2D_body_entered(body):
	if body.name == "KinematicBody2D" and body != self:
		print("Entered:")
		print(body)
		hunt = 1
	elif body.name == "StaticBody2D" and body != self:
		hunt = 2
	pass # Replace with function body.

func _on_Area2D_body_exited(body):
	if body.name == "KinematicBody2D" and body != self:
		print("Exit:")
		print(body)
		hunt = 0
	elif body.name == "StaticBody2D" and body != self:
		hunt = 0
	pass # Replace with function body.

func attack():
	get_node("../Node/AnimationPlayer").play()

func idle():
	get_node("../Node/AnimationPlayer").stop()
