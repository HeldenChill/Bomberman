extends AbstractEnemy

#class_name Enemy1
func _init(var _heath = 50,var _speed = 50).(_heath,_speed):
	faceRight = true;
	direction = 1;
	pass

func _physics_process(delta):
	velocity = move_and_slide(move())

func move()->Vector2:
	if (is_on_wall()) : #if kinematic body is collide with wall
		direction *= -1
		pass	
		
	velocity.x = speed * direction
	return velocity;
	pass

