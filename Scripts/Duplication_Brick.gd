extends StaticBody2D

export var VALUE = 5
export var SOUND = 'duplication_brick'

func _ready():
	pass

func ball_contact(ball):
	get_node('/root/World/Sound').play(SOUND, true)
	queue_free()
	get_node('/root/World').score += VALUE
	get_parent().free_brick()
	
	# Spawn a new ball at the position of this brick going into a random direction
	var new_ball = ball.duplicate()
	new_ball.set_pos(	get_global_pos())
	new_ball.set_linear_velocity(Vector2((randf()-0.5)*500, -200))
	get_node('/root/World').add_child(new_ball)