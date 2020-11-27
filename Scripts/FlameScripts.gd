extends AbstractExplode

var middleFlame = load("res://Scenes/Prefabs/ExplosionFlame/MiddleFlame.tscn")
var topFlame = load("res://Scenes/Prefabs/ExplosionFlame/TopFlame.tscn")

var degree : int;
var levelDamage : int;

func _ready():
	pass 

func init(var _degree,var _levelDamage,var _allFlame):
	setRotation(_degree)
	levelDamage = _levelDamage
	allFlame = _allFlame
	allFlame.push_back(get_node("."))
	pass
	
func setRotation(var _degree:int):
	degree = _degree;
	$Sprite.rotation_degrees = _degree;
	pass
	
func createFlame(var _position : Vector2)->void:
	if(!$Sprite/CheckWall.get_collider()):
		if(levelDamage > 1):
			if(get_child_count() > numberOfOldChild):
				get_child(numberOfOldChild).createFlame(_position);
				pass
			else:	#create and pass value in middle flame
				var newFlame = middleFlame.instance();
				newFlame.init(degree,levelDamage-1,allFlame);
				newFlame.set_position(_position);
				add_child(newFlame);
				pass
		else:	#create and pass value in top flame
			var newFlame = topFlame.instance();
			newFlame.init(degree,levelDamage-1,allFlame);
			newFlame.set_position(_position);
			add_child(newFlame);
			return 
			pass	
	pass



