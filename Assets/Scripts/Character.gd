extends KinematicBody2D

var input_direction = Vector2()
var last_move_direction = Vector2(1, 0)

export var max_speed = 200
var speed = 0.0
var velocity = Vector2()

enum CharacterState { IDLE, MOVE }
var state = null

func _ready():
	_change_state(CharacterState.IDLE)

func _change_state(new_state):
	
	match new_state:
		IDLE:
			$AnimationPlayer.play('idle')
		MOVE:
			$AnimationPlayer.play('run')
			
	state = new_state

func _physics_process(delta):
	update_direction()
	
	if state == IDLE and input_direction:
		_change_state(MOVE)
	elif state == MOVE:
		if not input_direction:
			_change_state(IDLE)
		move()



func update_direction():
	if input_direction:
		last_move_direction = input_direction
	
	
func move():
	if input_direction:
		last_move_direction = input_direction
		speed = max_speed
	else:
		speed = 0.0
		
	velocity = input_direction.normalized() * speed
	move_and_slide(velocity)
	
#	var motion = input_direction.normalized() * speed * delta
#	move_and_collide(motion)
