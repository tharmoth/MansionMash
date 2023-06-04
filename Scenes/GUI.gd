extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_play_pressed():
	$Buttonsfx.play()
	get_tree().change_scene_to_file("res://Scenes/AutoBattler/Autobattler.tscn")
	

func _on_button_3_quit_pressed():
	get_tree().quit()
