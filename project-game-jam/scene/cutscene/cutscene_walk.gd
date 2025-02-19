extends PathFollow2D

@onready var path_2d: Path2D = $".."

var ProgressRatio = 0.0
var speed = 0.3
var can_move = false

func _ready():
	get_node("AnimatedSprite2D").play("Idle")
	get_node("AnimatedSprite2D").set_flip_h(true)
	await get_tree().create_timer(1.0).timeout
	can_move = true
	await get_tree().create_timer(1.0).timeout
	can_move = false
	await get_tree().create_timer(2.75).timeout
	can_move = true

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
			path_2d.visible = false
	else:
		get_node("AnimatedSprite2D").play("Idle")
		
