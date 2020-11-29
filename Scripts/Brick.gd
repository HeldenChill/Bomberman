extends StaticBody2D


class_name Brick
var parent;
var anim : AnimationPlayer;

func _init():
	pass
func _ready():
	anim = $AnimationPlayer;
	parent = get_parent();

func die():
	queue_free();
	pass

func breaked():
	die();
	parent.whenBrickBroken(position);
	pass
