extends TextureButton

func _ready():
	get_node('/root/World/Paddle').set_process_input(false)
	get_node('/root/World/Paddle').hide()
	

func _on_Button_pressed():
	get_parent().hide()
	
	get_node('/root/World/Paddle').set_process_input(true)
	get_node('/root/World/Paddle').show()

	

