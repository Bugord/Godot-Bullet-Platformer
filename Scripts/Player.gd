extends CharacterBody2D

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animation_tree.active = true

func is_walking():
	return abs(velocity.length()) > 0.1

func _physics_process(delta):
	var direction = Input.get_axis("Left", "Right")

	apply_gravity(delta)
	jump()
	move(direction)
	

	animation_tree["parameters/player_run/TimeScale/scale"] = 1 if is_looking_right() == (direction > 0) else -1
	move_and_slide()
	transform.x.x = 1 if is_looking_right() else -1
	animation_tree["parameters/player_jump/blend_position"] = velocity.y

func jump():
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

func apply_gravity(delta: float):
	if not is_on_floor():
		velocity.y += gravity * delta

func move(direction: float):
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

func is_looking_right():
	return get_global_mouse_position().x > position.x
