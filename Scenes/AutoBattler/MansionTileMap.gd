extends TileMap

var enemy = preload("res://Scenes/AutoBattler/enemy.tscn")

func _ready() -> void:
	for i in 1000:
		set_pattern(0, Vector2i(i, 0), tile_set.get_pattern(0))
	
	for n in range(1000,100000,1000):
		var my_enemy = enemy.instantiate()
		add_child(my_enemy)
		my_enemy.position.x = n
		my_enemy.position.y = 370
