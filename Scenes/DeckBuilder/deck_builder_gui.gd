extends Control

@export var gui_card: PackedScene

func _ready():
	$MarginContainer/ReturnButton.pressed.connect(_on_return_pressed)
	$MarginContainer/HBoxContainer/VBoxContainer/HeadContainer/HeadLabel/CardConsumer.consumed_card.connect(_head_drop)

func _on_return_pressed():
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")

func _head_drop():
	var new_card = gui_card.instantiate()
	new_card.get_child(0).static_card = true
	$MarginContainer/HBoxContainer/VBoxContainer/HeadContainer.add_child(new_card)
