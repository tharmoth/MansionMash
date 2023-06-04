#BookInfo = ["type","theme","rarity","name","passiveType","passiveValue","activeType","activeValue"]
#TrinketInfo = ["type","theme","rarity","name","passiveType","passiveValue"]
#HatInfo = ["type","theme","rarity","name","passiveType","passiveValue","armor","armorValue"]
#WeaponInfo ["type","theme","rarity","name","passiveType","passiveValue","damageType","damageValue"]

#Grit is Sanity armor
enum {topHatOld,cricketBat,rosaryOld,tomeOld,lesserKey,necronomicon}

const DATA = {
	"topHatOld" :
		["hat","general","starter","Old Top Hat","NONE",0,"Armor",1],
	"cricketBat" :
		["weapon","general","starter","Child's Cricket Bat","NONE",0,"general",2],
	"rosaryOld" :
		["trinket","biblical","starter","Broken Rosary","Holy Armor",1],
	"eldSigil" :
		["trinket","eldritch","uncommon","Eldritch Sigil","Elder Armor",1],
	"tomeOld" :
		["book","general","starter","Grandpa's Journal","Grit",2,"NONE",0],
	"cookbookElder" :
		["book","general","common","How to Cook Like Cthulhu","Grit",-1,"Elder Eater",10], #Recover health after killing an eldritch enemy
	"cookbookDemon" :
		["book","general","common","Yummy Demons!","Grit",-1,"Demon Eater",10], #Recover health after killing a demonic enemy
	"lesserKey" :
		["book","biblical","occultic","Lesser Key of Solomon","Grit",-5,"Accuracy", 10], #Accuracy plus 10%
	"necronomicon" :
		["book","eldritch","occultic","The Necronomicon","Grit",-10,"Damage Multiplier",4]
}
