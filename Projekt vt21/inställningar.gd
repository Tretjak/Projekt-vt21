extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var button = Button.new()
	button.text = "inställningar"
	button.connect("pressed", self, "_button_pressed")
	add_child(button)

func _button_pressed():
	print("Kommer snart till en dator långt borta från dig")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
