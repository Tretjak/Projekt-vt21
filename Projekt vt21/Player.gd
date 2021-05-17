extends KinematicBody2D


export (int) var speed = 200
var velocity = Vector2()
var timer = 0
var target
var lukt = 0


# warning-ignore:unused_argument
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
# warning-ignore:return_value_discarded
	move_and_slide(velocity)
	if Input.is_action_just_pressed("ui_accept"):
		shoot() 
	if velocity != Vector2(0,0) and ! $Fotsteg.is_playing():
		$Fotsteg.play()
		get_node("Charachter/AnimationPlayer").play("Ny Anim")
	elif velocity == Vector2(0,0):
		$Fotsteg.stop()
		get_node("Charachter/AnimationPlayer").stop()
	
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
	if Global.ficklampa == "på":
		var lampa = load("res://ljus.tscn").instance()
		add_child(lampa)
		target = get_global_mouse_position()
		lampa.position = $ficklampa.position

func pistolsprite():
	if Global.sprite == "på":
		if !get_node("pew"):
			var pew = load("res://pew.tscn").instance()
			add_child(pew)
			target = get_global_mouse_position()
			pew.position = $pistol.position
			#Global.sprite = ""

func shoot():
	if Global.weapon == "Handgun" and timer == 0:
		var spawn = get_node("pew/Position2D")
		var shot = load("res://HandGun.tscn").instance()
		shot.position = spawn.global_position
		get_parent().get_parent().add_child(shot)
		timer = 1
		$Skott_Timer.start(1)
		get_parent().get_parent().get_node("ljud&musik/Pistolskott").play()
	if Global.weapon == "assult":
		var shot = load("res://Assult.tscn").instance()
		shot.position = get_global_position()
		get_parent().add_child(shot)
		timer = 1
		$Skott_Timer.start(0.1)
	if Global.weapon == "Elektrisk" and timer == 0:
		var shot = load("res://Elektrisk.tscn").instance()
		shot.position = position
		get_parent().add_child(shot)
		timer = 1
		$Skott_Timer.start(1)
#Elektrisk skot med aoe, snabbare powerup


func _ready() -> void:
	position = Global.playerpos
	
	$Timer.start(1)

func _on_LuktTimer_timeout():
	var lukt = load("res://Enemy/Lukt.tscn").instance()
	lukt.position = get_global_position()
	get_parent().get_parent().add_child(lukt)


func _on_Skott_Timer_timeout():
	timer = 0
	pass # Replace with function body.
