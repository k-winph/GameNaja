extends PathFollow2D

@onready var path_follow_2d: PathFollow2D = $"."
@onready var path_car_crash: Path2D = $".."

var ProgressRatio = 0.0
var speed = 3
var can_move = false

func _ready():
	await get_tree().create_timer(9.5).timeout
	get_node("AnimatedSprite2D").play("car")
	can_move = true

func setProgressRatio():
	while progress_ratio <= 1.0:
		ProgressRatio = progress_ratio
 
func _process(delta):
	if can_move:
		progress_ratio += delta * speed
		if progress_ratio < 1:
			ProgressRatio = progress_ratio
			get_node("AnimatedSprite2D").play("car")
		
