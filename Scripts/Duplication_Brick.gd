extends StaticBody2D

export var VALUE = 5
export var SOUND = 'duplication_brick'
export var DAMAGE = 1.0
var current_damage = 0.0

func _ready():
	pass

func _destruction():
	get_node('/root/World/Sound').play(SOUND, true)
	queue_free()
	get_node('/root/World').score += VALUE	
	get_parent().free_brick()

func ball_contact(ball):
	# Spawn a new ball at the position of this brick going into a random direction
	var new_ball = ball.duplicate()
	new_ball.set_pos(get_global_pos())
	var new_velocity = Vector2((randf()-0.5)*500, -200)
	new_ball.set_linear_velocity(new_velocity.normalized() * ball.get_linear_velocity().length())
	get_node('/root/World').add_child(new_ball)

	current_damage += DAMAGE
		
	if current_damage >= 1.0:
		_destruction()
