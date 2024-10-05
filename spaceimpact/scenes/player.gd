extends CharacterBody2D

const SCREEN_HEIGHT_VIRTUAL_TOP = 65;
const SCREEN_HEIGHT_VIRTUAL_BOTTOM = 713;

const SPEED = 500.0;

func _physics_process(delta: float) -> void:
	# Add the gravity.

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_up", "move_down")
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
	global_position.y = clamp(global_position.y,SCREEN_HEIGHT_VIRTUAL_TOP,SCREEN_HEIGHT_VIRTUAL_BOTTOM) # Limmiting the player movement to stay within the screen
