extends CharacterBody2D

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_looking_right: bool = true; 

func _ready():
	animation_tree.active = true

func is_walking():
	return abs(velocity.length()) > 0.1

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	is_looking_right = get_global_mouse_position().x > position.x
	sprite.set_flip_h(!is_looking_right)

	animation_tree["parameters/player_run/TimeScale/scale"] = 1 if is_looking_right == (direction > 0) else -1
	move_and_slide()
	animation_tree["parameters/player_jump/blend_position"] = velocity.y
