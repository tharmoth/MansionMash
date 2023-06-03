extends CharacterBody2D


const SPEED = 300.0
const FRICTION = 10.0

@onready var health = 100

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else: 
		velocity.x = 0

	move_and_slide()
