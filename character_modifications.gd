extends Node2D

@onready var man := $PotentialMan2ItemSlotHighlight as Sprite2D
@onready var tophat := $JustHat as Sprite2D
@onready var manWithHat := $PotentialMan2TopHat as Sprite2D

@onready var hatSprite = $CompositeSprites/Hat
@onready var neckSprite = $CompositeSprite/Neck
@onready var handLSprite = $CompositeSprites/HandL
@onready var handRSprite = $CompositeSprites/HandR

const composite_sprites = preload("res://CompositeSpritesheets/CompositeSprites.gd")

var curr_hat: int = 0
var curr_neck: int = 0
var curr_left: int = 0
var curr_right: int = 0

#func _ready():

# check to see if character's hands are holding anything
var handLFill = false
var handRFill = false
var neckFill = false
var hatFill = false

func _on_hat_dropped():
	curr_hat = (curr_hat + 1) % composite_sprites.head_spritesheet.size()
	curr_hat.texture = composite_sprites.head_spritesheet[curr_hat]

func _on_left_dropped():
	curr_left = (curr_left + 1) % composite_sprites.left_spritesheet.size()
	curr_left.texture = composite_sprites.left_spritesheet[curr_left]

func _on_right_dropped():
	curr_right = (curr_right + 1) % composite_sprites.right_spritesheet.size()
	curr_right.texture = composite_sprites.right_spritesheet[curr_right]

func _on_neck_dropped():
	curr_neck = (curr_neck + 1) % composite_sprites.neck_spritesheet.size()
	curr_neck.texture = composite_sprites.neck_spritesheet[curr_neck]
