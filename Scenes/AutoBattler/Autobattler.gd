extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func game_over():
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")

func _on_return_button_pressed():
	game_over()

func _on_player_dead():
	game_over()
