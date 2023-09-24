extends Area2D

var speed = 750

func _ready():
    await get_tree().create_timer(3.0).timeout
    queue_free()

func _physics_process(delta):
    position += transform.x * speed * delta

func _on_bullet_body_entered(body):
    if body.is_in_group("mobs"):
        body.queue_free()
    queue_free()
