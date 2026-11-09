extends CharacterBody2D


var speed = 0
var jump_velocity = 0
const WALK_SPEED = 300.0

const DASH_SPEED = 700.0

const ACCEL = 100.0
const DECEL = 150.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		# Handles speed of Player
		speed = WALK_SPEED
		#Applies speed onto Player
		velocity.x = move_toward(velocity.x, direction * speed, ACCEL)
	else:
		velocity.x = move_toward(velocity.x, 0, DECEL)

	move_and_slide()
