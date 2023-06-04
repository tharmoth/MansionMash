extends Area2D

var targets: Array[Node2D]

const SPEED = 300.0
const FRICTION = 10.0

@export var damage = 10
@export var health = 100

@onready var hit_timer := $HitTimer as Timer


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var velocity = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		
	position += velocity * delta

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
	get_node("%HealthBar").value = health
	if(health == 0):
		queue_free()
