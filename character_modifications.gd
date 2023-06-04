extends Node2D

@onready var headSprite = $CompositeSprites/Head
@onready var neckSprite = $CompositeSprite/Neck
@onready var handLSprite = $CompositeSprites/HandL
@onready var handRSprite = $CompositeSprites/HandR

var composite_sprites = preload("res://Assets/character/CompositeSprites.gd")

var curr_head: int = 0
var curr_neck: int = 0
var curr_left: int = 0
var curr_right: int = 0

func _ready():
	headSprite.texture = composite_sprites.head_spritesheet[0]
	neckSprite.texture = composite_sprites.neck_spritesheet[0]
	handLSprite.texture = composite_sprites.left_spritesheet[0]
	handRSprite.texture = composite_sprites.right_spritesheet[0]
	

func _on_hat_dropped():
	curr_head = (curr_head + 1) % composite_sprites.head_spritesheet.size()
	curr_head.Texture = composite_sprites.head_spritesheet[curr_head]

func _on_left_dropped():
	curr_left = (curr_left + 1) % composite_sprites.left_spritesheet.size()
	curr_left.texture = composite_sprites.left_spritesheet[curr_left]

func _on_right_dropped():
	curr_right = (curr_right + 1) % composite_sprites.right_spritesheet.size()
	curr_right.texture = composite_sprites.right_spritesheet[curr_right]

func _on_neck_dropped():
	curr_neck = (curr_neck + 1) % composite_sprites.neck_spritesheet.size()
	curr_neck.texture = composite_sprites.neck_spritesheet[curr_neck]
