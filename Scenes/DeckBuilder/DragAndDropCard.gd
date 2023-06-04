extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var dragging = false
var click_offset : Vector2
var is_in_deck = false

func _physics_process(delta):
	if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		dragging = false
		z_index = 0
		if is_in_deck: 
			get_parent().remove_child(self)
	
	if dragging:
		position = get_viewport().get_mouse_position() + click_offset


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		z_index = 1
		dragging = true
		click_offset = position - get_viewport().get_mouse_position()
		
func in_deck(in_deck : bool):
	is_in_deck = in_deck
	
