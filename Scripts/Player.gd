extends GameObject


class_name Player

var path:PoolVector2Array setget setPath;
var bomb = preload("res://Scenes/Prefabs/Bomb.tscn");

func _init(var _heath = 50,var _speed = 50).(_heath,_speed):
	pass
	
func _ready():
	pass # Replace with function body.

func flip():
	flipComponent.scale.x *= -1;
	pass

func _input(event):
	if(Input.is_action_just_pressed("A")):
		if(flipComponent.scale.x != -originScale.x):
			flip();
			pass
		pass
	if(Input.is_action_just_pressed("D")):
		if(flipComponent.scale.x != originScale.x):
			flip();
			pass
		pass	
	if(Input.is_action_just_pressed("Space")):
		var bombObj = bomb.instance();
		bombObj._init(1,3);
		var posOfBomb : Vector2;
		posOfBomb.x = int(global_position.x/32)*32+16;
		posOfBomb.y = int(global_position.y/32)*32+16;
		bombObj.global_position = posOfBomb;
		get_tree().get_root().add_child(bombObj);
	pass
	
func move()->Vector2:
	var vecMove = Vector2(0,0);
	if(Input.is_action_pressed("A")):
		vecMove = Vector2(-speed,0)
		pass			
	if(Input.is_action_pressed("D")):
		vecMove = Vector2(speed,0)
		pass	
	if(Input.is_action_pressed("W")):
		vecMove = Vector2(0,-speed)
		pass	
	if(Input.is_action_pressed("S")):
		vecMove = Vector2(0,speed)
		pass	
	
	#move for navigation
	#if(path.size() > 0):
		
	#	if((path[0]-global_position).length() > 5):
	#		vecMove = path[0]-global_position;
	#	else:
	#		path.remove(0);
	vecMove = vecMove.normalized()*speed;
	return vecMove
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(move() != Vector2.ZERO):
		anim.travel("Run");
		body.move_and_slide(move());
	else:
		anim.travel("Idle");		
		
	pass

func setPath(value : PoolVector2Array):
	path = value;
	if(path.size() == 0):
		return	
	for i in range(path.size()):
		path[i].x = int(path[i].x/32)*32+16;
		path[i].y = int(path[i].y/32)*32+16;
	pass
