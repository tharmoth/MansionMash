extends Area2D

signal dead
var targets: Array[Node2D]

const SPEED = 300.0

@export var damage = 10

@onready var health = 100
@onready var health_bar := $HealthBar as ProgressBar
@onready var hit_timer := $HitTimer as Timer
@onready var blood_particles := $BloodParticles2D as GPUParticles2D
@onready var sprite := $AnimatedSprite2D as AnimatedSprite2D

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
		# Blood!
		blood_particles.emitting = true
		# Disable damaging hitbox
		$CollisionShape2D.set_deferred("disabled", true)
		# Loot!

		var tween = get_tree().create_tween()
		tween.tween_property(sprite, "scale", Vector2(1, 0), 2)
		await get_tree().create_timer(2).timeout
		dead.emit()
		queue_free()
