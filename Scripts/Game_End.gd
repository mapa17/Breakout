extends TextureButton

func _ready():
	get_node('/root/World/Paddle').set_process_input(false)
	get_node('/root/World/Paddle').hide()
	get_node('/root/World/Sound').play('victory', true)	
	
func _on_Button_pressed():
	get_tree().quit()