extends KinematicBody2D


onready var nav_2d : Navigation2D = $Navigation2D
onready var line_2d : Line2D = $CollisionShape2D
onready var monster = get_node("res://Enemy2")

onready var goal = get_node("KinematicBody2D")
# var b = "text"

