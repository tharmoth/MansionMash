#BookInfo = ["type","theme","rarity","name","passiveType","passiveValue","activeType","activeValue"]
#TrinketInfo = ["type","theme","rarity","name","passiveType","passiveValue"]
#HatInfo = ["type","theme","rarity","name","passiveType","passiveValue","armor","armorValue"]
#WeaponInfo ["type","theme","rarity","name","passiveType","passiveValue","damageType","damageValue"]

#Grit is Sanity armor
enum {topHatOld,foxMask,wolfMask,tigerMask,bearMask,demonMask,cricketBat,rosaryOld,eldSigil,tomeOld,cookbookElder,cookbookDemon,cookbookYokai,lesserKey,necronomicon,hyakki}

const DATA = {
	"topHatOld" :
		["hat","general","starter","Old Top Hat","NONE",0,"Armor",1],
	"foxMask" :
		["hat","yokai","common","Mask of the Fox","Evasion",10,"Armor",4],#Evasion +10%
	"wolfMask" :
		["hat","yokai","common","Mask of the Wolf","pDamage",5,"Armor",4],
	"tigerMask" :
		["hat","yokai","uncommon","Mask of the Tiger","pDamage",10,"Armor",6],
	"bearMask" :
		["hat","yokai","uncommon","Mask of the Bear","Evasion",-10,"Armor",20],
	"demonMask" :
		["hat","yokai","rare","Mask of the Demon","pDamage",25,"Armor",0],
	"cricketBat" :
		["weapon","general","starter","Child's Cricket Bat","NONE",0,"pDamage",2], #pDamage = physical Damage
	"rosaryOld" :
		["trinket","biblical","starter","Broken Rosary","Holy Armor",1],
	"eldSigil" :
		["trinket","eldritch","uncommon","Eldritch Sigil","Elder Armor",1],
	"yokaiWatch" :
		["trinket","yokai","rare","Yokai Watch","Accuracy",10],
	"tomeOld" :
		["book","general","starter","Grandpa's Journal","Grit",2,"NONE",0],
	"cookbookElder" :
		["book","eldritch","common","Cook Like Cthulhu!","Grit",-1,"Elder Eater",10], #Recover health after killing an eldritch enemy
	"cookbookDemon" :
		["book","biblical","common","Yummy Demons!","Grit",-1,"Demon Eater",10], #Recover health after killing a demonic enemy
	"cookbookYokai" :
		["book","yokai","common","Sugoi Yokai Tabemono","Grit",-1,"Yokai Eater",10], #Recover health after killing a Yokai enemy
	"lesserKey" :
		["book","biblical","occultic","Lesser Key of Solomon","Grit",-5,"Accuracy", 20], #Accuracy plus 20%
	"necronomicon" :
		["book","eldritch","occultic","The Necronomicon","Grit",-10,"Dmg Mult",4],
	"hyakki" :
		["book","yokai","occultic","Hyakki Yagyo Zu","Grit",10,"Evasion",4]
}
