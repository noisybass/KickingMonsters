extends KinematicBody2D

var input_direction = Vector2()
var last_move_direction = Vector2(1, 0)

export var max_speed = 200
var speed = 0.0
var velocity = Vector2()

func _physics_process(delta):
	if input_direction:
		last_move_direction = input_direction
		speed = max_speed
	else:
		speed = 0.0
		
	velocity = input_direction.normalized() * speed
	move_and_slide(velocity)
	
#	var motion = input_direction.normalized() * speed * delta
#	move_and_collide(motion)
