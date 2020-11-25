extends AbstractEnemy

func _init(var _heath = 50,var _speed = 60).(_heath,_speed):
	pass

var control;
var player;
var disMaxWithPath = 20;
var path : PoolVector2Array

func _ready():
	control = get_parent();
	player = get_parent().get_child(2);
	followPlayer();

func followPlayer()->void:
	path = control.getPathBetween(global_position,player.global_position);
	pass
	
func move():
	var vecMove : Vector2
	if(path.size() > 0):
		if(global_position.distance_to(path[0]) > disMaxWithPath): 
			vecMove = path[0]-global_position;
		else:
			path.remove(0);
			
	
	vecMove = vecMove.normalized()*speed;
	return vecMove	
	
func _physics_process(delta):
	move_and_slide(move());	
