extends StaticBody2D

export var VALUE = 0
export var SOUND = 'hole_brick'

func _ready():
	pass

func ball_contact(ball):
	get_node('/root/World/Sound').play(SOUND, true)	
	ball.queue_free()
	