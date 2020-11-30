extends Node2D

var explodeObject = preload("res://Scenes/Prefabs/Explosion.tscn");

class_name Bomb
var allFlame = []
var levelDamage : int setget setLevelDamage,getLevelDamage
var timeToExplode : int
var oldTime : int
func _init(var _timeToExplode = 4,var _levelDamage = 2):
	timeToExplode = _timeToExplode;
	levelDamage = _levelDamage;
	pass
	
func _ready():
	$Timer.start(timeToExplode);
	pass
	
func _process(delta):
	oldTime = $Timer.time_left+1;
	$Label.text = String(oldTime);
	pass

func setLevelDamage(var level:int):
	levelDamage = level;
	pass

func getLevelDamage()->int:
	return levelDamage;
	pass
	
func _on_Timer_timeout():
	var explode = explodeObject.instance()
	explode._init(levelDamage,allFlame)
	explode.global_position = global_position;
	get_tree().get_root().add_child(explode);
	queue_free()	#destroy object
	pass 
