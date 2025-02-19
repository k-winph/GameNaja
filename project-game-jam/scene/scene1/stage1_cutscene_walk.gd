extends PathFollow2D

@onready var path_follow_walk: PathFollow2D = $"."
@onready var path_follow_2d: PathFollow2D = $"../../PathPlantFall/PathFollow2D"
@onready var path_2d: Path2D = $".."

var ProgressRatio = 0.0
var speed = 0.3
var can_move = true

func _ready():
	get_node("AnimatedSprite2D").play("Run")

func setProgressRatio():
	while progress_ratio <= 1.0:
		ProgressRatio = progress_ratio
 
func _process(delta):
	if can_move:
		progress_ratio += delta * speed
		if progress_ratio == 1 :
			get_node("AnimatedSprite2D").play("Idle")
			get_node("AnimatedSprite2D").set_flip_h(false)
			await get_tree().create_timer(0.5).timeout
			path_follow_walk.visible = false
		elif progress_ratio > 0.89:
			get_node("AnimatedSprite2D").play("StepBack")
			get_node("AnimatedSprite2D").set_flip_h(true)
		elif progress_ratio < 1:
			ProgressRatio = progress_ratio
			get_node("AnimatedSprite2D").play("Run")
			get_node("AnimatedSprite2D").set_flip_h(false)
		#elif progress_ratio == 1 :
		#	path_2d.visible = false
