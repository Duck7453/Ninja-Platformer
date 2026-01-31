extends CharacterBody2D
class_name PlayerScript

@export var speed = 5.0
@export var jump = 10.0
var speed_m = 20.0
var jump_m = -20.0
var direction = 0
 


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump * jump_m

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed * speed_m
	else:
		velocity.x = move_toward(velocity.x, 0, speed * speed_m)

	move_and_slide()
