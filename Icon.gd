extends Sprite2D

func process(_delta) -> void: 
	look_at(get_global_mouse_position())
