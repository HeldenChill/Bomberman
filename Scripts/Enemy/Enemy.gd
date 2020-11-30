extends AbstractEnemy

#class_name Enemy1
var rayRight : RayCast2D
func _init(var _heath = 50,var _speed = 60).(_heath,_speed):
	faceRight = true;
	direction = 1;
	pass

func _ready():
	rayRight = $FlipComponents/Right;
	pass

func _physics_process(delta):
	velocity = move_and_slide(move())

func move()->Vector2:
	if (rayRight.get_collider()) : #if kinematic body is collide with wall
		direction *= -1
		pass	
		
	velocity.x = speed * direction
	return velocity;
	pass

