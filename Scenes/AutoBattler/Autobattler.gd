extends Node2D

func game_over():
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")

func _on_return_button_pressed():
	game_over()

func _on_player_dead():
	game_over()
