extends StaticBody2D


class_name Brick
var parent;
var choice;
var itemObj;
var itemPos;
var anim : AnimationPlayer;
var speedUp = preload("res://Scenes/Prefabs/Items/SpeedItem.tscn")
var bombUp = preload("res://Scenes/Prefabs/Items/BombItem.tscn")
var flameUp = preload("res://Scenes/Prefabs/Items/FlameItem.tscn")

func _init():
	pass
func _ready():
	anim = $AnimationPlayer;
	parent = get_parent();

func die():
	queue_free();
	pass

func breaked():
	randomize()
	choice = randi() % 3
	if(choice == 0):
		itemObj = speedUp.instance()
		pass
	elif(choice == 1):
		itemObj = bombUp.instance()
		pass
	else :
		itemObj = flameUp.instance()
		pass
	itemObj.scale.x = 2
	itemObj.scale.y = 2
	itemObj.global_position = global_position
	get_tree().get_root().add_child(itemObj)
	die();
	parent.whenBrickBroken(position);
	pass
