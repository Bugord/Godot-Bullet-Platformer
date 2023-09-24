extends Node2D

@onready var sprite2d: Sprite2D = $Sprite2D 

func _ready():
	sprite2d.visible = false

func _physics_process (_delta) -> void: 
	var mouse_pos = get_global_mouse_position();
	sprite2d.flip_v = mouse_pos.x < get_parent().position.x	 
	look_at(mouse_pos)

func enable_gun():
	sprite2d.visible = true