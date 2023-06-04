extends CharacterBody2D

class_name DragAndDropCard

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var dragging = false
var click_offset : Vector2
var static_card = false

var card_consumers = []

func _ready():
	input_event.connect(_on_input_event)

func _physics_process(delta):
	if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and dragging:
		dragging = false
		CardDatabase.selected_card = null
		z_index = 0
		if card_consumers.size() > 0: 
			card_consumers[0].eat_card(self)
			
			# used for cards parented to the gui
			if static_card:
				if get_parent().get_parent().name == "UseContainer":
					CardDatabase.equipped_cards.remove_at(CardDatabase.equipped_cards.find(cardName))
				elif get_parent().get_parent().name == "LibraryContainer":
					CardDatabase.library_cards.remove_at(CardDatabase.library_cards.find(cardName))
				get_parent().get_parent().remove_child(get_parent())
			else:
				get_parent().remove_child(self)
	
	if dragging:
		position = get_viewport().get_mouse_position() + click_offset

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and CardDatabase.selected_card == null:
		z_index = 1
		dragging = true
		click_offset = position - get_viewport().get_mouse_position()
		CardDatabase.selected_card = self
		
func add_consumer(consumer):
	card_consumers.append(consumer)
	
func remove_consumer(consumer):
	card_consumers.remove_at(card_consumers.find(consumer))

var cardName :
	get:
		return $CardBase.cardName
	set(value):
		$CardBase.cardName = value
