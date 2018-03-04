extends "res://Assets/Scripts/Character.gd"

func _physics_process(delta):
	input_direction = Vector2()
	
	input_direction.x = float(Input.is_action_pressed('move_right')) - float(Input.is_action_pressed('move_left'))
	input_direction.y = float(Input.is_action_pressed('move_down')) - float(Input.is_action_pressed('move_up'))
	
	print (input_direction)
	#print(Input.get_joy_axis(0, JOY_AXIS_0))