extends Area2D

var targets: Array[Node2D]

const SPEED = 300.0

@export var damage = 10

@onready var health = 100
@onready var health_bar := $HealthBar as ProgressBar
@onready var hit_timer := $HitTimer as Timer

func _on_area_entered(area):
	if not area in targets:
		targets.append(area)
		if(hit_timer.is_stopped()):
			hit_timer.start()

func _on_area_exited(area):
	if area in targets:
		targets.erase(area)

func _on_hit_timer_timeout():
	for area in targets:
		if area.has_method("subtract_health"):
			area.subtract_health(damage)

func subtract_health(value: int) -> void:
	health = max(0, health - value)
	health_bar.value = health
	if(health == 0):
		queue_free()
