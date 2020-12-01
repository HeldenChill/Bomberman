extends Sprite
class_name AbstractExplode

var animPlayer : AnimationPlayer
var anim : AnimationTree
var numberOfOldChild : int;
var timer : Timer;
var allFlame;
var isCollideWall : bool = false;
func _init():
	pass
func _ready():
	numberOfOldChild = get_child_count();
	animPlayer = $AnimationPlayer;
	timer = $Timer;
	pass # Replace with function body.

func _on_DamageArea_body_entered(body):
	if(body.collision_layer == 2):
		body.die();
	if(body.collision_layer == 64):
		body.breaked();
	if(body.collision_layer == 1):
		body.die()
	pass # Replace with function body.

func runAnimExplode():
	animPlayer.play("Explode");	
	pass

func _on_Timer_timeout():
	
	pass # Replace with function body.
