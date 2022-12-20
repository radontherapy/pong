extends KinematicBody2D

var velocity = Vector2();
var move = Vector2();

var game;
var player1;
var player2;
var Ball;
var scoreLeft;
var scoreRight;

var startPosition = Vector2(500, 300);

func _ready():
	move.x = 100;
	move.y = -100;
	
	game = get_node("/root/Game");
	player1 = get_node("/root/Game/Player1")
	player2 = get_node("/root/Game/Player2")
	scoreLeft = get_node("/root/Game/ScoreLeft")
	scoreRight = get_node("/root/Game/ScoreRight")
	
	scoreLeft.text = str(player1.score);
	scoreRight.text = str(player2.score);
	
	position = startPosition;

func _process(delta):
	velocity.x = move.x;
	velocity.y = move.y;
	
	var collision = move_and_collide(velocity * delta);
	
	if collision:
		print("I collided with ", collision.collider.name);
		
		if collision.collider.name == "Player2":
			move.x = -100;
		elif collision.collider.name == "Player1":
			move.x = 100;
		elif collision.collider.name == "UpWall":
			move.y = 100;
		elif collision.collider.name == "DownWall":
			move.y = -100;
		elif collision.collider.name == "LeftWall":
			print("Left wall hitted! Resetting position and increasing score.");
			move.x = 100;
			position = startPosition;
			player2.score += 1;
			print(player1.score, " : ", player2.score);
			scoreLeft.text = str(player1.score);
			scoreRight.text = str(player2.score);
		elif collision.collider.name == "RightWall":
			print("Right wall hitted! Resetting position and increasing score.");
			move.x = -100;
			position = startPosition;
			player1.score += 1;
			print(player1.score, " : ", player2.score);
			scoreLeft.text = str(player1.score);
			scoreRight.text = str(player2.score);
