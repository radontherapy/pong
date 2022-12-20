extends KinematicBody2D

var movement = Vector2();
export(int) var score = 0;

func _process(_delta):
	if Input.is_action_pressed("player2_up"):
		movement.y = -100;
	elif Input.is_action_pressed("player2_down"):
		movement.y = 100;
	else:
		movement.y = 0;
		
	move_and_slide(movement);
