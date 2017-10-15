extends RigidBody2D

export var SPEEDUP = 10
export var MAX_SPEED = 400
export var BALL_LOST_SOUND = 'ball_lost'

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	for body in get_colliding_bodies():
		if body.is_in_group('Brick'):
			body.ball_contact(self)
		
		if body.is_in_group('Paddle'):
			var speed = get_linear_velocity().length()
			var direction = get_pos() - body.get_node('ReflectionPoint').get_global_pos() + body.velocity * 10.0
			#set_linear_velocity(direction.normalized() * min(speed + SPEEDUP, MAX_SPEED))
			set_linear_velocity(direction.normalized() * speed)
		
	if get_pos().y > (get_node('/root/World/Paddle').get_pos().y + 20):
		queue_free()
		get_node('/root/World/Sound').play(BALL_LOST_SOUND, true)	
		get_node('/root/World').score += -20