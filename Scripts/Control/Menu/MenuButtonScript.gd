extends Button

export(String) var pathOfScene;
class_name LoadScene

func _ready():
	connect("pressed",self,"_on_Button_Press");
	
func _on_Button_Press():
	get_tree().change_scene(pathOfScene);

