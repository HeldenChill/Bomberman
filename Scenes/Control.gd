extends Node2D

class_name ControlScene
func _ready():
	pass 
	
func  _unhandled_input(event: InputEvent) -> void:
	if not (event is InputEventMouseButton):
		return
	if (event.button_index != BUTTON_LEFT or not event.pressed):
		return
	pass
	
	var newPath = getPathBetween($Player.global_position,event.global_position);
	print(newPath,$Player.global_position,event.global_position);
	$Line2D.points = newPath;
	$Player.setPath(newPath);

func getPathBetween(pos1 : Vector2,pos2 : Vector2)->PoolVector2Array:
	return $Navigation2D.get_simple_path(pos1,pos2,false)
	pass
