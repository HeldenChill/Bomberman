extends "res://Scripts/AbstractClass/GameObject.gd"

var bomb = preload("res://Scenes/Prefabs/Bomb.tscn");
func _ready():
	
	pass # Replace with function body.
	
func flip():
	flipComponent.scale.x *= -1;
	pass

func _input(event):
	if(Input.is_action_just_pressed("A")):
		if(flipComponent.scale.x != -originScale.x):
			flip();
			pass
		pass
	if(Input.is_action_just_pressed("D")):
		if(flipComponent.scale.x != originScale.x):
			flip();
			pass
		pass	
	if(Input.is_action_just_pressed("Space")):
		var bombObj = bomb.instance();
		bombObj._init(1,3);
		bombObj.global_position = global_position;
		get_tree().get_root().add_child(bombObj);
	pass
	
func move()->Vector2:
	var vecMove = Vector2(0,0);
	if(Input.is_action_pressed("A")):
		vecMove = Vector2(-speed,0)
		pass			
	if(Input.is_action_pressed("D")):
		vecMove = Vector2(speed,0)
		pass	
	if(Input.is_action_pressed("W")):
		vecMove = Vector2(0,-speed)
		pass	
	if(Input.is_action_pressed("S")):
		vecMove = Vector2(0,speed)
		pass	
	return vecMove
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(move() != Vector2.ZERO):
		anim.travel("Run");
		body.move_and_slide(move());
	else:
		anim.travel("Idle");	
	pass
