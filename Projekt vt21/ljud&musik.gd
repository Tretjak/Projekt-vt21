extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func Play():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Play()
	if Input.is_action_just_pressed("ui_right"):
		$Fotsteg.play()
	elif Input.is_action_just_released("ui_right"):
		$Fotsteg.stop()
		
	if Input.is_action_just_pressed("ui_left"):
		$Fotsteg.play()
	elif Input.is_action_just_released("ui_left"):
		$Fotsteg.stop()
		
	if Input.is_action_just_pressed("ui_down"):
		$Fotsteg.play()
	elif Input.is_action_just_released("ui_down"):
		$Fotsteg.stop()
		
	if Input.is_action_just_pressed("ui_up"):
		$Fotsteg.play()
	elif Input.is_action_just_released("ui_up"):
		$Fotsteg.stop()
		
	#if Input.is_action_just_pressed("ui_accept"):
	#	$Pistolskott.play()
#	AudioStreamPlayer.set_loop(true)


func _on_AudioStreamPlayer_finished():
	pass
