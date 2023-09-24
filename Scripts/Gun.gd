extends Node2D
class_name Gun

@onready var sprite2d: Sprite2D = $Gun
@onready var animation_player: AnimationPlayer = $AnimationPlayer 

func _ready():
	sprite2d.visible = false
	animation_player.play("gun_idle")

func _process(_delta):
	fire()

func _physics_process (_delta) -> void: 
	look_at(get_global_mouse_position())

func enable_gun():
	sprite2d.visible = true

func fire():
	if Input.is_action_just_pressed("Fire"):
		animation_player.stop()
		animation_player.play("gun_fire");

