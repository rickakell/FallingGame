extends CharacterBody2D


const SPEED = 1500.0
# Adjust gravity to make the game feel better
const GRAVITY_MODIFIER = 1.3
# Set a terminal velocity that gives you time to dodge
const TERMINAL_VELOCITY = 2000

static var collisions = 0;

var can_collide = true
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and velocity.y <= TERMINAL_VELOCITY:
		velocity += get_gravity() * GRAVITY_MODIFIER * delta;
		print(velocity);

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	if can_collide:
		if get_slide_collision_count():
			can_collide = false;
			get_tree().create_timer(1).timeout.connect(func(): can_collide = true)
			collisions += 1
