extends CharacterBody2D

@onready var man := $PotentialMan2ItemSlotHighlight as Sprite2D
@onready var tophat := $JustHat as Sprite2D

# check to see if character's hands are holding anything
var handLFill = false
var handRFill = false
var neckFill = false
var hatFill = false

func _on_hat_dropped():
	hat = true
	
func _on_left_dropped():
	handLFill = true
	
func _on_right_dropped():
	handRFill = true
	
func _on_neck_dropped():
	neckFill = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
