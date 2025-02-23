extends PathFollow2D

@onready var player: CharacterBody2D = $Player
@onready var path_follow_walk: PathFollow2D = $"."
@onready var path_follow_2d: PathFollow2D = $"../../PathPlantFall/PathFollow2D"
@onready var path_2d: Path2D = $".."

var ProgressRatio = 0.0
var speed = 0.2
var can_move = true

func _ready():
	if Global.scene_count == 1:
		Global.scene_count = 2
	#elif Global.scene_count > 2:
	#	player.visible = true
	
	Global.increment_scene_count()
	print("Current Scene Count: ", Global.scene_count)
	if Global.scene_count == 2:
		can_move = true
		get_node("AnimatedSprite2D").play("Run")
		await get_tree().create_timer(2.0).timeout
		can_move = false
		get_node("AnimatedSprite2D").play("Idle")
		await get_tree().create_timer(3).timeout
		can_move = true
		await get_tree().create_timer(1).timeout
		can_move = false
		get_node("AnimatedSprite2D").set_flip_h(false)
		get_node("AnimatedSprite2D").play("Idle")
		await get_tree().create_timer(2).timeout
		can_move = true
		get_node("AnimatedSprite2D").play("Run")
	elif Global.scene_count >= 3:
		can_move = true
		get_node("AnimatedSprite2D").play("Run")
		get_node("AnimatedSprite2D").set_flip_h(false)
		await get_tree().create_timer(1.0).timeout
			

func setProgressRatio():
	while progress_ratio <= 1.0:
		ProgressRatio = progress_ratio
 
func _process(delta):
	if Global.scene_count == 2:
		if can_move:
			progress_ratio += delta * speed
			if progress_ratio == 1 :
				get_node("AnimatedSprite2D").set_flip_h(false)
				get_node("AnimatedSprite2D").play("Idle")
				await get_tree().create_timer(1.5).timeout
				path_follow_walk.visible = false
			elif progress_ratio > 0.54 and progress_ratio < 0.61 or progress_ratio >= 0.9 :
				get_node("AnimatedSprite2D").play("StepBack")
				get_node("AnimatedSprite2D").set_flip_h(true)
			elif progress_ratio < 1:
				ProgressRatio = progress_ratio
				get_node("AnimatedSprite2D").play("Run")
				get_node("AnimatedSprite2D").set_flip_h(false)
	if Global.scene_count >= 3:
		if can_move:
			if progress_ratio < 0.216:
				progress_ratio += delta * speed
			if progress_ratio > 0.215 :
				get_node("AnimatedSprite2D").play("Idle")
				await get_tree().create_timer(2).timeout
				path_follow_walk.visible = false
