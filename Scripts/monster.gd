extends CharacterBody2D
class_name Monster

const JUMP_VELOCITY = -400.0
const MAX_HEALTH = 20.0

@onready var healthComoponent: HealthComponent = $HealthComponent

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	healthComoponent.init(20)
	healthComoponent.health_empty.connect(on_health_empty)

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()

func take_damage(damage: int):
	healthComoponent.take_damage(damage)
	print(damage)
	print(MAX_HEALTH)
	print(healthComoponent.current_health)

func on_health_empty():
	queue_free()
