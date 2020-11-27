extends KinematicBody2D


class_name GameObject
var heath : int setget setHealth,getHealth;
var speed : int setget setSpeed,getSpeed;
var body : PhysicsBody2D;
var anim : AnimationNodeStateMachinePlayback;
var flipComponent : Node2D;
var originScale : Vector2

func _init(var _heath:int,var _speed:int):
	heath = _heath;
	speed = _speed;
	pass

func _ready():
	body = get_node(".");
	flipComponent = $FlipComponents
	anim = $FlipComponents/AnimationTree.get("parameters/playback")
	speed = 100;
	originScale = flipComponent.scale;
	pass

func getHealth()-> int:
	return heath;
	pass

func setHealth(var health : int)->void:
	get_node(".").health = health;
	pass

func getSpeed()-> int:
	return speed;
	pass	
	
func setSpeed(var speed : int)->void:
	get_node(".").speed = speed;
	pass

func move()->Vector2:
	return Vector2.ZERO;
	pass	

func die()->void:
	queue_free();
	pass
