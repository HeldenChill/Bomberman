extends AbstractEnemy
var choice
var player = null
var chasingSpeed
func _init(var _heath = 50, var _speed = 20) . (_heath, _speed) :
	faceRight = true
	direction = 1
	pass
	
func _ready():
	chasingSpeed = 1
	$Timer.start(1);
	velocity = Vector2.ZERO
	pass
	
func _physics_process(delta):
	if(player!=null) :
		velocity = position.direction_to(player.position) * chasingSpeed
		move_and_collide(velocity)
	else:
		velocity = Vector2.ZERO
		move_and_slide(velocity)
		move_and_collide(move())
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
	return velocity * speed
	pass

	
func _on_ChasingArea_body_entered(body):
	if(body != self):
		player = body
		print("ok")
	pass # Replace with function body.

func _on_ChasingArea_body_exited(body):
	player = null
	pass # Replace with function body.

func random()->int:
	var x : int
	randomize()
	x = randi() % 4
	return x
	pass

func chooseDirect()->Vector2:
	
	if(choice == 0):
		velocity = Vector2(1,0)
	elif(choice == 1):
		velocity = Vector2(-1,0)
	elif(choice == 2):
		velocity = Vector2(0,1)
	else:
		velocity = Vector2(0, -1)
	return velocity
	pass
	

func _on_Timer_timeout():
	choice = random()
	chooseDirect()
	pass # Replace with function body.
