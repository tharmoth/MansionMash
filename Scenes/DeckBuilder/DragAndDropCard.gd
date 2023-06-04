extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var dragging = false
var click_offset : Vector2
var card_consumer = null
var static_card = false

func _ready():
	input_event.connect(_on_input_event)
	if RandomNumberGenerator.new().randi_range(0, 1) == 0:
		$CardBase.cardName = "rosaryOld"

func _physics_process(delta):
	if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and dragging:
		dragging = false
		z_index = 0
		if card_consumer != null: 
			card_consumer.eat_card()
			
			# used for cards parented to the gui
			if static_card:
				get_parent().get_parent().remove_child(get_parent())
			else:
				get_parent().remove_child(self)
	
	if dragging:
		position = get_viewport().get_mouse_position() + click_offset


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		z_index = 1
		dragging = true
		click_offset = position - get_viewport().get_mouse_position()
		
func in_deck(consumer):
	card_consumer = consumer
	
