extends Area2D

signal consumed_card

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if body.has_method("add_consumer"):
		body.add_consumer(self)

func _on_body_exited(body):
	if body.has_method("remove_consumer") && body.card_consumers.find(self) != -1:
		body.remove_consumer(self)

func eat_card(card):
	consumed_card.emit(card)
