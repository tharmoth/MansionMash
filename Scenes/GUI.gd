extends Control

var simultaneous_scene = preload("res://Scenes/Autobattler.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/Autobattler.tscn")


func _on_button_3_quit_pressed():
	get_tree().quit()
