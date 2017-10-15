extends Node2D

func _ready():
	get_node('/root/World/Paddle').set_process_input(false)
	get_node('/root/World/Paddle').hide()
	get_node('/root/World/Paddle').new_ball_speed = 200;

func freed_all_bricks():
	print('Level solved!')
	get_parent().level_solved(self)