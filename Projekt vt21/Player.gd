extends KinematicBody2D


export (int) var speed = 200
var sprite = ""
var weapon = ""
var ficklampa = ""
var velocity = Vector2()
var timer = 0
var target



func _physics_process(delta):
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1 #and get_node("../ljud&musik/Fotsteg").Play()
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
		
	if !has_node("Ljus"):
		if Input.is_action_just_pressed("ui_f"):
			flashlight()
	elif has_node("Ljus"):
		if Input.is_action_just_pressed("ui_f"):
			$Ljus.queue_free()
	pistolsprite()
	
	var look_vec = get_global_mouse_position() - global_position
	global_rotation = atan2(look_vec.y, look_vec.x)

func flashlight():
	if ficklampa == "på":
		var lampa = load("res://ljus.tscn").instance()
		add_child(lampa)
		target = get_global_mouse_position()
		lampa.position = $ficklampa.position

func pistolsprite():
	if sprite == "på":
		var pew = load("res://pew.tscn").instance()
		add_child(pew)
		target = get_global_mouse_position()
		pew.position = $pistol.position
		sprite = ""

func shoot():
	if weapon == "Handgun" and timer == 0:
		var spawn = get_node("pew/Position2D")
		var shot = load("res://HandGun.tscn").instance()
		shot.position = spawn.global_position
		get_parent().get_parent().add_child(shot)
		timer = 1
		$Skott_Timer.start(1)
	if weapon == "assult":
		var shot = load("res://Assult.tscn").instance()
		shot.position = get_global_position()
		get_parent().add_child(shot)
		timer = 1
		$Skott_Timer.start(0.1)
	if weapon == "Elektrisk" and timer == 0:
		var shot = load("res://Elektrisk.tscn").instance()
		shot.position = position
		get_parent().add_child(shot)
		timer = 1
		$Skott_Timer.start(1)
#Elektrisk skot med aoe, snabbare powerup


func _ready() -> void:
	$Timer.start(3)

func _on_LuktTimer_timeout():
	var lukt = load("res://Enemy/Lukt.tscn").instance()
	lukt.position = get_global_position()
	get_parent().get_parent().add_child(lukt)


func _on_Skott_Timer_timeout():
	timer = 0
	pass # Replace with function body.
