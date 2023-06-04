extends Control

@export var gui_card: PackedScene

func _ready():
	$MarginContainer/ReturnButton.pressed.connect(_on_return_pressed)
	$MarginContainer/HBoxContainer/VBoxContainer/UseContainer/UseLabel/CardConsumer.consumed_card.connect(_use_drop)
	$MarginContainer/HBoxContainer/VBoxContainer/LibraryContainer/LibraryLabel/CardConsumer.consumed_card.connect(_library_drop)

func _on_return_pressed():
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")

func _use_drop(card):
	var new_card = gui_card.instantiate()
	new_card.get_child(0).static_card = true
	print(card.get_node("CardBase").cardName)
	new_card.get_node("DragAndDropCard/CardBase").cardName = card.get_node("CardBase").cardName
	$MarginContainer/HBoxContainer/VBoxContainer/UseContainer.add_child(new_card)
	
func _library_drop(card):
	var new_card = gui_card.instantiate()
	new_card.get_child(0).static_card = true
	print(card.get_node("CardBase").cardName)
	new_card.get_node("DragAndDropCard/CardBase").cardName = card.get_node("CardBase").cardName
	$MarginContainer/HBoxContainer/VBoxContainer/LibraryContainer.add_child(new_card)
