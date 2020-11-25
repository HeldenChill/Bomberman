extends Node2D


func _ready():
	pass 
	
func  _unhandled_input(event: InputEvent) -> void:
	if not (event is InputEventMouseButton):
		return
	if (event.button_index != BUTTON_LEFT or not event.pressed):
		return
	pass
	
	var newPath = $Navigation2D.get_simple_path($Player.global_position,event.global_position,false)
	print(newPath,$Player.global_position,event.global_position);
	$Line2D.points = newPath;
	$Player.setPath(newPath);


