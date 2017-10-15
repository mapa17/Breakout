extends StaticBody2D

export var VALUE = 5
export var SOUND = 'normal_brick'

func _ready():
	pass

func ball_contact(ball):
	get_node('/root/World/Sound').play(SOUND, true)
	queue_free()
	get_node('/root/World').score += VALUE
	get_parent().free_brick()

	