extends PathFollow2D

@onready var path_2d: Path2D = $".."
@onready var player: CharacterBody2D = $"../../Player"

var ProgressRatio = 0.0
var speed = 0.7
var can_move = true

func _ready():
	if Global.scene_count == 3:
		Global.scene_count = 4
	Global.increment_scene_count()
	print("Current Scene Count: ", Global.scene_count)
	player.visible = false
	get_node("AnimatedSprite2D").play("Run")
	get_node("AnimatedSprite2D").set_flip_h(false)
	await get_tree().create_timer(1.0).timeout

func setProgressRatio():
	while progress_ratio <= 1.0:
		ProgressRatio = progress_ratio

func _process(delta):
	if can_move:
		progress_ratio += delta * speed
		if progress_ratio < 1:
			ProgressRatio = progress_ratio
			get_node("AnimatedSprite2D").play("Run")
			get_node("AnimatedSprite2D").set_flip_h(false)
		elif progress_ratio == 1 :
			get_node("AnimatedSprite2D").play("Idle")
			await get_tree().create_timer(1).timeout
			player.visible = true
			path_2d.visible = false
			
	else:
		get_node("AnimatedSprite2D").play("Idle")
		
