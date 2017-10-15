extends StaticBody2D

export var VALUE = 10
export var SOUND = 'normal_brick'
export var LIFES = 3.0
var lifes

func _ready():
	lifes = LIFES
	pass

func ball_contact(ball):
	get_node('/root/World/Sound').play(SOUND, true)
	lifes -= 1.0
	if lifes == 0:
		queue_free()
		get_node('/root/World').score += VALUE
		get_parent().free_brick()
	else:
		get_node('./Sprite').set_opacity(lifes / LIFES)
	