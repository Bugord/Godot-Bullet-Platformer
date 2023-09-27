extends Node2D
class_name HealthComponent

@export var current_health: int
@export var max_health: int

signal health_empty

func init(init_max_health: int) -> void:
	max_health = init_max_health
	current_health = max_health

func take_damage(damage: int) -> void:
	current_health -= damage
	if(current_health <= 0):
		current_health = 0
		health_empty.emit()
