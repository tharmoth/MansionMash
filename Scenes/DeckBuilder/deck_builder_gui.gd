extends Control

@export var gui_card: PackedScene

func _ready():
	$MarginContainer/ReturnButton.pressed.connect(_on_return_pressed)
	$MarginContainer/HBoxContainer/VBoxContainer/UseContainer/UseLabel/CardConsumer.consumed_card.connect(_use_drop)
	$MarginContainer/HBoxContainer/VBoxContainer/LibraryContainer/LibraryLabel/CardConsumer.consumed_card.connect(_library_drop)

	for card in CardDatabase.equipped_cards:
		var new_card = gui_card.instantiate()
		new_card.get_child(0).static_card = true
		new_card.get_node("DragAndDropCard/CardBase").cardName = card
		$MarginContainer/HBoxContainer/VBoxContainer/UseContainer.add_child(new_card)

	for card in CardDatabase.library_cards:
		var new_card = gui_card.instantiate()
		new_card.get_child(0).static_card = true
		new_card.get_node("DragAndDropCard/CardBase").cardName = card
		$MarginContainer/HBoxContainer/VBoxContainer/LibraryContainer.add_child(new_card)

func _on_return_pressed():
	for child in get_node("/root/GUI").get_children():
		if child is DragAndDropCard:
			CardDatabase.obtained_cards.append(child.cardName)
			print("yeet")
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")

func _use_drop(card):
	var new_card = gui_card.instantiate()
	new_card.get_child(0).static_card = true
	new_card.get_node("DragAndDropCard/CardBase").cardName = card.get_node("CardBase").cardName
	$MarginContainer/HBoxContainer/VBoxContainer/UseContainer.add_child(new_card)
	CardDatabase.equipped_cards.append(card.get_node("CardBase").cardName)
	
func _library_drop(card):
	var new_card = gui_card.instantiate()
	new_card.get_child(0).static_card = true
	new_card.get_node("DragAndDropCard/CardBase").cardName = card.get_node("CardBase").cardName
	$MarginContainer/HBoxContainer/VBoxContainer/LibraryContainer.add_child(new_card)
	CardDatabase.library_cards.append(card.get_node("CardBase").cardName)
