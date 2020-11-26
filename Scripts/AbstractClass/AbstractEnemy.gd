extends GameObject

class_name AbstractEnemy

var velocity : Vector2;
var faceRight : bool;
var direction : int;
var valueToRun : float;

func _init(var _heath:int,var _speed:int).(_heath,_speed):
	faceRight = true;
	valueToRun  = 1/3 * speed;
	pass

func takeDamage(var damage:int)->void:
	heath = heath - damage;
	pass

func anim():
	if(velocity.length() > valueToRun):
		anim.travel("Run")
		if(faceRight && velocity.x < valueToRun):
			$FlipComponents.scale.x *= -1;
			faceRight = false;
			pass
		elif(!faceRight && velocity.x > valueToRun):
			$FlipComponents.scale.x *= -1;
			faceRight = true;
			pass
	pass

func _process(delta):
	anim();
	pass	
