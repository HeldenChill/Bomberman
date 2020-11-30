extends AbstractItem

func _on_Area2D_body_entered(body):
	var player = get_tree().get_root().get_child(0).get_node("Player")
	player.setSpeed(player.getSpeed() + 20)
	queue_free()
	pass # Replace with function body.
