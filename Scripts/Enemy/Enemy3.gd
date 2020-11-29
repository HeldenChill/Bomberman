extends AbstractEnemy

var choice
var rayRight : RayCast2D
var rayLeft : RayCast2D
var rayUp : RayCast2D
var rayDown : RayCast2D

func _init(var _heath = 50, var _speed = 20) . (_heath, _speed) :
	faceRight = true
	direction = 1
	pass
	

func _ready():
	rayRight = $RayRight;
	rayLeft = $RayLeft;
	rayDown = $RayDown;
	rayUp = $RayUp;
	$Timer.start(1);
	velocity = Vector2.ZERO
	pass
	
func _physics_process(delta):
	move_and_slide(move())
	
	
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
	
func move()->Vector2 :
	if(is_on_wall()):
		var oldChoice = choice
		while(oldChoice == choice):
			choice = random()
		chooseDirect()
	if((int(global_position.x) - 16) % 32 == 0):
		if((int(global_position.y) - 16) % 32 == 0):
			choice = random()
			chooseDirect()
			print("ok")
	return velocity * speed
	pass


func _on_Timer_timeout():
	choice = random()
	chooseDirect()
	pass # Replace with function body.
