extends Area2D

var targets: Array[Node2D]

signal dead

const SPEED = 300.0
const FRICTION = 10.0

enum States {IDLE, MOVING, COMBAT}

@export var damage = 20
@export var health = 100
@export var state : int = States.IDLE

@onready var hit_timer := $HitTimer as Timer
@onready var continue_button := get_node("%ContinueButton") as Button
@onready var return_button := get_node("%ReturnButton") as Button

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var velocity = Vector2()
	
	if state == States.IDLE:
		continue_button.disabled = false
		return_button.disabled = false

	if state == States.MOVING:
		continue_button.disabled = true
		return_button.disabled = false
		velocity.x += 1

	if state == States.COMBAT:
		if targets.is_empty():
			state = States.IDLE
		else:
			continue_button.disabled = true
			return_button.disabled = true

	else:
		get_node("%ContinueButton").disabled = false
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		
	position += velocity * delta

func _on_area_entered(area):
	if not area in targets:
		targets.append(area)
		if(hit_timer.is_stopped()):
			hit_timer.start()
		state = States.COMBAT

func _on_area_exited(area):
	if area in targets:
		targets.erase(area)
		get_node("%ContinueButton").disabled = false

func _on_hit_timer_timeout():
	for area in targets:
		if area.has_method("subtract_health"):
			area.subtract_health(damage)

func subtract_health(value: int) -> void:
	health = max(0, health - value)
	get_node("%HealthBar").value = health
	if(health == 0):
		emit_signal("dead")
		queue_free()


func _on_continue_button_pressed():
	if state == States.IDLE:
		continue_button.disabled = true
		state = States.MOVING
