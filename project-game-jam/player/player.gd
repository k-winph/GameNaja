extends CharacterBody2D

@onready var player: CharacterBody2D = $"."
@onready var path_follow_walk1: PathFollow2D = $"../PathWalk/PathFollowWalk1"

var CanMove = false
var ProgressRatio:float = 0.0
const SPEED = 150.0
var JUMP_VELOCITY = -250.0

func _ready():
	player.visible = false
	await get_tree().create_timer(0.25).timeout
	if Global.scene_count == 1:
		CanMove = false
	elif Global.scene_count >= 2:
		player.position = Vector2(21, 176)
		await get_tree().create_timer(2).timeout
		player.visible = true
		await get_tree().create_timer(1).timeout
		CanMove = true
		

func _process(delta):
	if Global.scene_count <= 1:
		if path_follow_walk1 != null:
			ProgressRatio = path_follow_walk1.ProgressRatio 
			
		wait_until_cutscene_complete()

func wait_until_cutscene_complete():
	if Global.scene_count <= 1:
		if ProgressRatio > 0.88:
			await get_tree().create_timer(2.0).timeout
			player.visible = true
			await get_tree().create_timer(0.5).timeout
			CanMove = true
		else:
			CanMove = false
			player.visible = false
	

func wait_until_progress_complete():
	while ProgressRatio <= 1.0:
		await get_tree().process_frame

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	#movement
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		if Global.scene_count == 2:
			velocity.y = -300
		else:
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
	
