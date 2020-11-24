extends GameObject

class_name AbstractEnemy

var chuyendong : Vector2
var faceRight : bool;
var direction : int

func _init(var _heath:int,var _speed:int).(_heath,_speed):
	pass

func takeDamage(var damage:int)->void:
	heath = heath - damage;
	pass
	


