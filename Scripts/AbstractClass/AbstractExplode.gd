extends Sprite
class_name AbstractExplode

var animPlayer : AnimationPlayer
var numberOfOldChild : int;
var timer : Timer;
var allFlame;
func _init():
	pass
func _ready():
	numberOfOldChild = get_child_count();
	animPlayer = $AnimationPlayer;
	timer = $Timer;
	pass # Replace with function body.

func _on_DamageArea_body_entered(body):
	if(body is AbstractEnemy):
		body.die();
	pass # Replace with function body.

func runAnimExplode():
	animPlayer.play("Explode")
	pass

func _on_Timer_timeout():
	
	pass # Replace with function body.
