extends Area2D

@export var DragAndDropCard: PackedScene
var top_of_deck = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if top_of_deck == null:
		top_of_deck = DragAndDropCard.instantiate()
		top_of_deck.position = position
		get_node("/root/DeckBuilder").add_child(top_of_deck)

func _on_body_exited(body):
	if body == top_of_deck:
		top_of_deck = null
