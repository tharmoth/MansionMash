extends Area2D

func _on_body_entered(body):
	if body.has_method("in_deck"):
		body.in_deck(true)

func _on_body_exited(body):
	if body.has_method("in_deck"):
		body.in_deck(false)
