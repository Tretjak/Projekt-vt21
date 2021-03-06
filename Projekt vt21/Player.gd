extends KinematicBody2D

export (int) var speed = 200
var weapon = "Handgun"
var velocity = Vector2()
var timer = 0

func _physics_process(delta):
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	move_and_slide(velocity)
	if Input.is_action_just_pressed("ui_accept"):
		shoot()
			
func shoot():
	if weapon == "Handgun" and timer == 0:
		var shot = load("res://HandGun.tscn").instance()
		shot.position = get_global_position()
		get_parent().get_parent().add_child(shot)
		timer = 1
	
		$Timer.start(1)
	if weapon == "assult":
		var shot = load("res://Assult.tscn").instance()
		shot.position = get_global_position()
		get_parent().get_parent().add_child(shot)
#Elektrisk skot med aoe, snabbare powerup
