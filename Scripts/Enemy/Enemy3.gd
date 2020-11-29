extends AbstractEnemy

var choice
var rayRight : RayCast2D
var rayLeft : RayCast2D
var rayUp : RayCast2D
var rayDown : RayCast2D

func _init(var _heath = 50, var _speed = 80) . (_heath, _speed) :
	faceRight = true
	direction = 1
	pass
	

func _physics_process(delta):
	move_and_slide(move())
	
func random()->int:
	var x : int
	randomize()
	x = randi() %3 + 1
	return x
	pass
	
func move()->Vector2 :
	if(rayRight.get_collider()):
		choice = random()
		if(choice == 1):
			velocity.x = -speed
			velocity.y = 0
		elif(choice == 2):
			velocity.y = -speed
			velocity.x = 0
		elif(choice == 3):
			velocity.y = speed
			velocity.x = 0
			
	if(rayLeft.get_collider()):
		choice = random()
		if(choice == 1):
			velocity.x = speed
			velocity.y = 0
		elif(choice == 2):
			velocity.y = -speed
			velocity.x = 0
		elif(choice == 3):
			velocity.y = speed
			velocity.x = 0
	
	if(rayUp.get_collider()):
		choice = random()
		if(choice == 1):
			velocity.x = -speed
			velocity.y = 0
		elif(choice == 2):
			velocity.y = 0
			velocity.x = speed
		elif(choice == 3):
			velocity.y = speed
			velocity.x = 0
			
	if(rayDown.get_collider()):
		choice = random()
		if(choice == 1):
			velocity.x = -speed
			velocity.y = 0
		elif(choice == 2):
			velocity.y = 0
			velocity.x = speed
		elif(choice == 3):
			velocity.y = -speed
			velocity.x = 0
	return velocity
	pass
