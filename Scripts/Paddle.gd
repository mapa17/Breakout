extends KinematicBody2D

const ball_scene = preload('res://Scenes/Ball.tscn.xscn')

var new_ball_speed = 200 setget set_new_ball_speed
var prev_pos = get_pos()
var velocity = Vector2()

func _ready():
	#print('Viewport rect %s' % (get_node('/root').get_rect()))
	#get_node('/root').set_rect(Rect2(0, 0, 640, 360))
	set_fixed_process(true)
	set_process_input(true)
	
func _fixed_process(delta):
	var mouse_x = get_viewport().get_mouse_pos().x
	set_pos(Vector2(mouse_x, get_pos().y))
	velocity = get_pos() - prev_pos
	prev_pos = get_pos()


func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON && event.is_pressed():
		var new_ball = ball_scene.instance()
		new_ball.set_pos(get_pos() - Vector2(0, 16))
		new_ball.set_linear_velocity(Vector2((randf()-0.5)*500, -new_ball_speed))
		get_node('/root/World').add_child(new_ball)
		print('Created new ball!')
		
func set_new_ball_speed(value):
	new_ball_speed = value
	print('Setting ball speed to %3.3f' % new_ball_speed)
