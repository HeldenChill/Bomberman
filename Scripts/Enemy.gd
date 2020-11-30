extends AbstractEnemy


func _init(var _heath = 50,var _speed = 50).(_heath,_speed):
	faceRight = true;
	direction = 1;
	pass

func _physics_process(delta):
	move()
	move_and_slide(velocity)

func move():
	if (is_on_wall()) : #if kinematic body is collide with wall
		direction *= -1
		faceRight = false
		pass	
	if(!faceRight):
		faceRight = true
		$FlipComponents/Sprite.scale.x *= -1
		
	chuyendong.x = speed * direction
	pass
