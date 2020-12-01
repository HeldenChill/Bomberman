extends Node2D



class_name ControlScene

var enemyPosition : PoolVector2Array;

var map;
func _ready():
	pass 
	
func random()->int:
	var x : int
	randomize()
	x = randi() % 4
	return x
	pass



func  _unhandled_input(event: InputEvent) -> void:
	if not (event is InputEventMouseButton):
		return
	if (event.button_index != BUTTON_LEFT or not event.pressed):
		return
	pass
	
	var newPath = getPathBetween($Player.global_position,event.global_position);
	$Player.setPath(newPath);

func getPathBetween(pos1 : Vector2,pos2 : Vector2)->PoolVector2Array:
	return $Navigation2D.get_simple_path(pos1,pos2,false)
	pass
	

func putEnemyInPos(enemyType : int,pos : Vector2):
	var enemy;
#	enemy = enemy1.instance();
#	if(enemyType == 0):
#		enemy = enemy1.instance();
#	elif(enemyType == 1):
#		enemy = enemy2.instance();
#	elif(enemyType == 2):
#		enemy = enemy3.instance();
#	elif(enemyType == 3):
#		enemy = enemy4.instance();
#	enemy._init();
#	enemy.global_position = pos;
#	add_child(enemy)
	pass

func _on_Map3_finishCreateMap():
	map = $Navigation2D/Map3;
	enemyPosition = map.enemyPosition;
	print(enemyPosition)
	
	pass # Replace with function body.
