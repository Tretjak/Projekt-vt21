extends CanvasLayer

signal start_game
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func show_message(text):
	$message.text = text
	$message.show()
	$messagetimer.start()

func show_game_over():
	show_message("game over")
	
	yield($messagetimer, "timeout")
	
	$message.text = "dodge the\ncreeps!"
	$message.show()
	
	yield(get_tree().create_timer(1), "timeout")
	$startbutton.show()

func update_score(score):
	$scorelabel.text = str(score)
# Called when the node enters the scene tree for the first time.




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_messagetimer_timeout():
	$message.hide()


func _on_startbutton_pressed():
	$startbutton.hide()
	emit_signal("start_game")
	
