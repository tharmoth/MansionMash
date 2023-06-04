extends MarginContainer

@onready var cardDataBase = preload("res://Assets/Cards/Card_Database.gd").new()
var cardName = "topHatOld" :
	set(value): 
		cardName = value
		cardInfo = cardDataBase.DATA[cardName]
		cardImage = str("res://Assets/Cards/",cardInfo[0],"/",cardName,".png")
		rarity = cardInfo[2]
		initalize()
		
var cardInfo
var cardImage
var rarity
# Called when the node enters the scene tree for the first time.

func _ready():
	cardName = "topHatOld"

func initalize():
	var cardSize = Vector2($cardBase.texture.get_width(), $cardBase.texture.get_height())
	if rarity != "starter":
		var boarderImage = str("res://Assets/Cards/rarity/",rarity)
		$cardRarityBoarder.texture = load(boarderImage)
		$cardRarityBoarder.scale *= cardSize/$cardRarityBoarder.texture.get_size()	
	$cardItem.texture = load(cardImage)
	# $cardItem.scale *= cardSize / $cardItem.texture.get_size()
	$cardItem.scale = (cardSize / $cardItem.texture.get_size()) / 3
	$cardItem.offset.x = 70
	$cardItem.offset.y = 50
	$cardBase/Name.text = cardInfo[3]
	$cardBase/Type.text = str("Item: ",cardInfo[0])
	$cardBase/Theme.text = cardInfo[1]
	if cardInfo[4] != "NONE":
		$cardBase/Property1.text = str(cardInfo[4])
		$cardBase/PropertyValue1.text = str(cardInfo[5])
	if cardInfo[0] != "trinket" && cardInfo[6]!="NONE":
		$cardBase/Property2.text = str(cardInfo[6])
		$cardBase/PropertyValue2.text = str(cardInfo[7])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
