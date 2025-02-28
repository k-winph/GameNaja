extends PathFollow2D

@onready var path_2d: Path2D = $".."

var ProgressRatio = 0.0
var speed = 5
var can_move = false

func _ready():
	await get_tree().create_timer(5.5).timeout
	get_node("AnimatedSprite2D").play("Plant")
	can_move = true

func setProgressRatio():
	while progress_ratio <= 1.0:
		ProgressRatio = progress_ratio
 
func _process(delta):
	if can_move and Global.scene_count == 1:
		progress_ratio += delta * speed
		if progress_ratio < 1:
			ProgressRatio = progress_ratio
			get_node("AnimatedSprite2D").play("Plant")
	elif Global.scene_count > 1:
		progress_ratio = 1
