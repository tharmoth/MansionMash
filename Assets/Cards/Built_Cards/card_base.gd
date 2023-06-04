extends MarginContainer

var cardDataBase = CardDatabase
var cardName = cardDataBase.equpped_cards[RandomNumberGenerator.new().randi_range(0, cardDataBase.equpped_cards.size() - 1)] :
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
	cardName = cardName

func initalize():
	var cardSize = Vector2($cardBase.texture.get_width(), $cardBase.texture.get_height())
	if rarity != "starter":
		var boarderImage = str("res://Assets/Cards/rarity/",rarity,".png")
		$cardRarityBoarder.texture = load(boarderImage)
		$cardRarityBoarder.scale *= cardSize/$cardRarityBoarder.texture.get_size()	
	$cardItem.texture = load(cardImage)
	# $cardItem.scale *= cardSize / $cardItem.texture.get_size()
	$cardItem.scale = (cardSize / $cardItem.texture.get_size()) / 3
	$cardItem.offset.x = $cardItem.texture.get_size().x * 1.1
	$cardItem.offset.y = $cardItem.texture.get_size().y * .9
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
