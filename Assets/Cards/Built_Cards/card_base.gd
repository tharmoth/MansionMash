extends MarginContainer

@onready var cardDataBase = preload("res://Assets/Cards/Card_Database.gd").new()
var cardName = "topHatOld"
@onready var cardInfo = cardDataBase.DATA[cardDataBase.get(cardName)]
@onready var cardImage = str("res://Assets/Cards/",cardInfo[3],"/",cardName)
# Called when the node enters the scene tree for the first time.
func _ready():
	print(cardImage)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
