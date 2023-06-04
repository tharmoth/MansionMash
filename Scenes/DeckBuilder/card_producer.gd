extends Area2D

@export var DragAndDropCard: PackedScene
var top_of_deck = null

func _ready():
	body_exited.connect(_on_body_exited)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if top_of_deck == null and CardDatabase.obtained_cards.size() > 0:
		top_of_deck = DragAndDropCard.instantiate()
		var name = CardDatabase.obtained_cards[RandomNumberGenerator.new().randi_range(0, CardDatabase.obtained_cards.size() - 1)]
		top_of_deck.get_node("CardBase").cardName = name
		CardDatabase.obtained_cards.remove_at(CardDatabase.obtained_cards.find(name))
		top_of_deck.position = global_position
		get_node("/root/GUI").add_child(top_of_deck)

func _on_body_exited(body):
	if body == top_of_deck:
		top_of_deck = null
