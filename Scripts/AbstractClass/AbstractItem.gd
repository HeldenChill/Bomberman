extends Node2D
class_name AbstractItem
var player : Player
func _ready():
	player = get_tree().get_root().get_child(0).get_child(2);
func _on_Area2D_body_entered(body):
	queue_free()
	pass # Replace with function body.
