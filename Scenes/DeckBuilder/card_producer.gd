extends Area2D

@export var DragAndDropCard: PackedScene
var top_of_deck = null

func _ready():
	body_exited.connect(_on_body_exited)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if top_of_deck == null:
		top_of_deck = DragAndDropCard.instantiate()
		top_of_deck.position = global_position
		get_node("/root/GUI").add_child(top_of_deck)

func _on_body_exited(body):
	if body == top_of_deck:
		top_of_deck = null
