extends PathFollow2D

@onready var path_2d: Path2D = $".."

var ProgressRatio = 0.0
var speed = 0.4
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
#	pass # Replace with function body.
func setProgressRatio():
	while progress_ratio <= 1.0:
		ProgressRatio = progress_ratio
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Timer
	progress_ratio += delta * speed
	if progress_ratio < 1:
		ProgressRatio = progress_ratio
		get_node("AnimatedSprite2D").play("Run")
		get_node("AnimatedSprite2D").set_flip_h(false)
	elif progress_ratio == 1 :
		path_2d.visible = false
		
