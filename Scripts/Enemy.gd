extends "res://Scripts/AbstractClass/GameObject.gd"

var chuyendong = Vector2()
var faceRight = true;
var SPEED = 60
var direction = 1

func _physics_process(delta):
	move()
	
	move_and_slide(chuyendong)
	
	if is_on_wall() :
		direction *= -1
		faceRight = false
		pass
		
	if(!faceRight):
		faceRight = true
		$FlipComponents/Sprite.scale.x *= -1
	

func move():
	chuyendong.x = SPEED * direction
	pass
