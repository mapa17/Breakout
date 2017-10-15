extends Node2D


func _ready():
	get_node('/root/World/Paddle').hide()
	get_node('/root/World/Paddle').set_process_input(false)
	get_node('./welcome_message/Tutorial').connect("pressed",self,"start_tutorial")
	get_node('./welcome_message/Game').connect("pressed",self,"start_game")

func start_tutorial():
	get_node('/root/World/Paddle').show()
	get_node('/root/World/Paddle').set_process_input(true)
	get_node('/root/World').start_tutorial(self)
	#get_node('/root/World/Paddle').show()
	
func start_game():
	get_node('/root/World/Paddle').show()
	get_node('/root/World/Paddle').set_process_input(true)
	get_node('/root/World').start_game(self)
	#get_node('/root/World/Paddle').show()