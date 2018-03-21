extends Camera2D

onready var player = $'..'
onready var aim = $'../Aim'
	
func _process(delta):
	global_position = (player.global_position + aim.global_position)/2
