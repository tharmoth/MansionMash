extends CharacterBody2D

@onready var man := $PotentialMan2ItemSlotHighlight as Sprite2D
@onready var tophat := $JustHat as Sprite2D
@onready var manWithHat := $PotentialMan2TopHat as Sprite2D

# check to see if character's hands are holding anything
var handLFill = false
var handRFill = false
var neckFill = false
var hatFill = false

func _on_hat_dropped():
	if hatFill == true:
		slot_error()
	hatFill = true
	queue_free()
	return -1

func _on_left_dropped():
	if handLFill == true:
		slot_error()
	handLFill = true
	queue_free()
	return -1

func _on_right_dropped():
	if handRFill == true:
		slot_error()
	handRFill = true
	queue_free()
	return -1

func _on_neck_dropped():
	if neckFill == true:
		slot_error()
	neckFill = true
	queue_free()
	return -1

func slot_error():
	print("You may only fill the slot with one item at a time")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
