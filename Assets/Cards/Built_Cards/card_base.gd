extends MarginContainer


@onready var cardDataBase = preload("res://Assets/Cards/Card_Database.gd").new()
var cardName = "topHatOld"
@onready var cardInfo = cardDataBase.DATA[cardDataBase.get(cardName)]
@onready var cardImage = str("res://Assets/Cards/",cardInfo[0],"/",cardName,".png")
@onready var rarity = cardInfo[2]
# Called when the node enters the scene tree for the first time.
func _ready():
	
	var cardSize = get_rect()
	if rarity != "starter":
		var boarderImage = str("res://Assets/Cards/rarity/",rarity)
		$cardRarityBoarder.scale *= cardSize/$cardRarityBoarder.texture.get_size()
		$cardRarityBoarder.texture = load(boarderImage)
	$CardItem.scale *= cardSize/$CardItem.texture.get_size()
	$CardItem.texture = load(cardImage)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
