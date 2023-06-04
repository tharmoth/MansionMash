extends Area2D

signal consumed_card

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if body.has_method("in_deck"):
		body.in_deck(self)

func _on_body_exited(body):
	if body.has_method("in_deck"):
		body.in_deck(self)

func eat_card():
	consumed_card.emit()
