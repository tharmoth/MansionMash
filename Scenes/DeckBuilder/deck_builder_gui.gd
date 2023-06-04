extends Control

func _ready():
	$MarginContainer/ReturnButton.pressed.connect(_on_return_pressed)
	
func _on_return_pressed():
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")
