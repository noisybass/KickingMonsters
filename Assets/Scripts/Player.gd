extends "res://Assets/Scripts/Character.gd"

func _physics_process(delta):
	input_direction = Vector2()
	
	input_direction.x = float(Input.is_action_pressed('move_right')) - float(Input.is_action_pressed('move_left'))
	input_direction.y = float(Input.is_action_pressed('move_down')) - float(Input.is_action_pressed('move_up'))
	
	#print (input_direction)
	#print(Input.get_joy_axis(0, JOY_AXIS_0))
	if $Aim.global_position.x < global_position.x:
		update_pivots(-1)
	else:
		update_pivots(1)
	
func update_pivots(scale):
	$Pivot.scale.x = scale
	$SlingshotPivot.scale.x = scale
	var angle = ($Aim.position - $SlingshotPivot.position).normalized().angle()
	$SlingshotPivot.rotation = angle + min(0, scale)*135