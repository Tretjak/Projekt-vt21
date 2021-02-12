extends Area2D

const speed = 5
var target
var screensize

var velocity =Vector2()

func _ready():
	target = get_global_mouse_position()
	velocity = -(position - target).normalized()
	pass
	
func _process(delta):
	position += velocity * speed
	
	"""
	$AnimatedSprite.frame = 0
	$Tween.interpolate_property(AnimatedSprite, 'scale', $AnimatedSpries.scale,
		$AnimatedSprite.scale * 3, 00.3, Tween.TRANS_QUAD,
		Tween.EASE_IN_OUT)
	$Tween.interpolate_property($AnimatedSprite, 'modulate', Color(1, 1, 1,1),
		Color(1, 1, 1, 0), 0.3, Tween.TRANS_QUAD,
		Tween.EASE_IN_OUT)
		

func pickup():
	monitoring = false
	$Tween.start()
	
func _onTween_tween_completed(object, key):
	queue_free()
	
func _on_Powerup_area_entered(area):
	if area.is_in_group("obstacles"):
		position = Vector2(rand_range(0, screensize.x), rand_range(0, screensize.y))
	
func _on_Lifetime_timeout():
	queue_free()
"""
