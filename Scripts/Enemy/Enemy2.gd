extends AbstractEnemy

func _init(var _heath = 50,var _speed = 60).(_heath,_speed):
	pass

var control;
var player;
var disMaxWithPath = 20;
var path : PoolVector2Array

func _ready():
	control = get_tree().get_root().get_child(0);
	player = control.get_child(2);
	$Timer.start(2);
	

func followPlayer()->Vector2:
	velocity = Vector2.ZERO
	if(path.size() > 0):
		if(global_position.distance_to(path[0]) > disMaxWithPath): 
			velocity = path[0]-global_position;
		else:
			path.remove(0);
			
	
	velocity = velocity.normalized()*speed;
	return velocity	
	pass
	
func move()->Vector2:
	return followPlayer();
	pass
	
	
	
func _physics_process(delta):
	velocity = move_and_slide(move());	


func _on_Timer_timeout():
	if(player != null && player is Player):
		path = control.getPathBetween(global_position,player.global_position);
	pass # Replace with function body.
	
func _on_Area2D_body_entered(body):
	._on_Area2D_body_entered(body);
	pass 
