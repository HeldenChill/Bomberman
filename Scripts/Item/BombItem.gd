extends AbstractItem


func _on_Area2D_body_entered(body):
	print("BOMB UP!")
	player.numberOfBomb += 1
	queue_free()
	pass # Replace with function body.
func _ready():
	pass # Replace with function body.
