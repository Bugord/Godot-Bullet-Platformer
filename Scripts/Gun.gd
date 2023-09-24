extends Node2D

@onready var sprite2d: Sprite2D = $Sprite2D 

func _ready():
	sprite2d.visible = false

func _physics_process (_delta) -> void: 
	look_at(get_global_mouse_position())

func enable_gun():
	sprite2d.visible = true