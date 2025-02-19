extends PathFollow2D

@onready var path_2d: Path2D = $".."

var ProgressRatio = 0.0
var speed = 0.4

func setProgressRatio():
	while progress_ratio <= 1.0:
		ProgressRatio = progress_ratio
 
func _process(delta):
	Timer
	progress_ratio += delta * speed
	if progress_ratio < 1:
		ProgressRatio = progress_ratio
		get_node("AnimatedSprite2D").play("Run")
		get_node("AnimatedSprite2D").set_flip_h(false)
	elif progress_ratio == 1 :
		path_2d.visible = false
		
