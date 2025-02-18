extends CharacterBody2D

@onready var player: CharacterBody2D = $"."
@onready var path_follow_2d: PathFollow2D = $"../Path2D/PathFollow2D"

var CanMove = false
var ProgressRatio:float = 0.0
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _process(delta):
	if path_follow_2d != null:
		ProgressRatio = path_follow_2d.ProgressRatio 
		
	wait_until_cutscene_complete()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	#movement
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	var direction := Input.get_axis("move_left", "move_right")
	if CanMove == true:
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
	
func wait_until_cutscene_complete():
	if ProgressRatio >0.99:
		CanMove = true
		player.visible = true
	else:
		CanMove = false
		player.visible = false
	

func wait_until_progress_complete():
	while ProgressRatio <= 1.0:
		await get_tree().process_frame
