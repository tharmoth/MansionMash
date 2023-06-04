extends Node2D

var grandma = preload("res://Scenes/AutoBattler/grandma.tscn")
var squidward = preload("res://Scenes/AutoBattler/squidward.tscn")

@onready var hand := $CanvasLayer/BattlerGUI/PlayerHand as HBoxContainer

@export var gui_card: PackedScene

func _ready() -> void:
#	for i in 1000:
#		set_pattern(0, Vector2i(i, 0), tile_set.get_pattern(0))
	
	for n in range(1000,100000,1000):
		var my_enemy = grandma.instantiate()
		var my_squidward = squidward.instantiate()
		add_child(my_enemy)
		add_child(my_squidward)
		my_enemy.position.x = n
		my_enemy.position.y = 400
		my_enemy.dead.connect(_on_enemy_dead)
		my_squidward.position.x = n + 500
		my_squidward.position.y = 400
		my_squidward.dead.connect(_on_enemy_dead)
	


func game_over():
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")

func _on_return_button_pressed():
	game_over()

func _on_player_dead():
	game_over()
	
func _on_enemy_dead():
	var new_card = gui_card.instantiate()
	new_card.get_child(0).static_card = true
	hand.add_child(new_card)

func _use_drop(card):
	var new_card = gui_card.instantiate()
	new_card.get_child(0).static_card = true
	print(card.get_node("CardBase").cardName)
	new_card.get_node("DragAndDropCard/CardBase").cardName = card.get_node("CardBase").cardName
	$CanvasLayer/BattlerGUI/PlayerHand.add_child(new_card)

