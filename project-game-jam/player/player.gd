extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	#movement
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	#animation
	if velocity.x < 0:
		get_node("AnimatedSprite2D").play("Run")
		get_node("AnimatedSprite2D").set_flip_h(true)
	elif velocity.x > 0:
		get_node("AnimatedSprite2D").play("Run")
		get_node("AnimatedSprite2D").set_flip_h(false)
	else :
		get_node("AnimatedSprite2D").play("Idle")

	move_and_slide()
