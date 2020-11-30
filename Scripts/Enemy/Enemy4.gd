extends RandomMoveEnemy


var player = null
var chasingSpeed
func _init(var _heath = 50, var _speed = 80) . (_heath, _speed) :
	faceRight = true
	direction = 1
	pass
	
func _ready():
	chasingSpeed = 100
	$Timer.start(1);
	velocity = Vector2.ZERO
	pass
	
func _physics_process(delta):
	move_and_slide(move())
	pass
	
func move()->Vector2:
	if(is_on_wall()):
		var oldChoice = choice
		while(oldChoice == choice):
			choice = random()
		chooseDirect()
	if((int(global_position.x) - 16) % 32 == 0):
		if((int(global_position.y) - 16) % 32 == 0):
			choice = random()
			chooseDirect()
	if(player != null) :
		velocity = (player.global_position - global_position).normalized()
		return velocity * chasingSpeed
	return velocity.normalized() * speed
	pass

	
func _on_ChasingArea_body_entered(body):
	if(body != self):
		player = body
	pass # Replace with function body.

func _on_ChasingArea_body_exited(body):
	player = null
	pass # Replace with function body.


func _on_Timer_timeout():
	choice = random()
	chooseDirect()
	pass # Replace with function body.
