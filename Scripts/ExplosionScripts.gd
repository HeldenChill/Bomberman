extends Sprite

var middleFlame = preload("res://Scenes/Prefabs/ExplosionFlame/MiddleFlame.tscn")
var topFlame = preload("res://Scenes/Prefabs/ExplosionFlame/TopFlame.tscn")


class_name Explosion

var levelDamage : int setget setLevelDamage,getLevelDamage;
var oldTime : float;
var timeCreateFlame : float;
var isFlameAround = false;

var newFlame1 = null
var newFlame2 = null
var newFlame3 = null
var newFlame4 = null

func _init(var _levelDamage:int = 3):
	levelDamage = _levelDamage;
	pass

func _ready():
	timeCreateFlame = 0.01;
	oldTime = timeCreateFlame * (levelDamage + 1) + 0.5;
	$Timer.start(oldTime);	#set clock
	pass  



func _process(delta):
	var time = $Timer.time_left;
	if(time < oldTime - timeCreateFlame):
		oldTime = oldTime - timeCreateFlame
		createAroundFlame();
	pass
	

func setLevelDamage(var level:int):
	levelDamage = level;
	pass

func getLevelDamage()->int:
	return levelDamage;
	pass

func createFlame(var _degree:int,var _position:Vector2):
	var newFlame = middleFlame.instance()
	newFlame.init(_degree,levelDamage-1);
	newFlame.set_position(_position);
	return newFlame
	pass
	

func createAroundFlame():
	if(!isFlameAround):
		if(!$CheckWall1.get_collider()):
			newFlame1 = createFlame(0,Vector2(16,0));
			add_child(newFlame1);
		if(!$CheckWall2.get_collider()):
			newFlame2 = createFlame(90,Vector2(0,16));
			add_child(newFlame2)
		if(!$CheckWall3.get_collider()):
			newFlame3 = createFlame(180,Vector2(-16,0));
			add_child(newFlame3)
		if(!$CheckWall4.get_collider()):
			newFlame4 = createFlame(270,Vector2(0,-16));
			add_child(newFlame4)
		isFlameAround = true;	
	elif(get_child_count() > 2):
		if(newFlame1 != null):
			newFlame1.createFlame(Vector2(16,0));	
			pass
		if(newFlame2 != null):
			newFlame2.createFlame(Vector2(0,16));
			pass
		if(newFlame3 != null):
			newFlame3.createFlame(Vector2(-16,0));
			pass
		if(newFlame4 != null):
			newFlame4.createFlame(Vector2(0,-16));
			pass
	pass

func _on_Timer_timeout():
	queue_free() 	#destroy
	pass 
