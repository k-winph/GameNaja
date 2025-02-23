extends PathFollow2D

@onready var path_follow_2d: PathFollow2D = $"."
@onready var path_car_crash: Path2D = $".."
@onready var stage2_bin_area = get_node("/root/stage2/Area2D")
@onready var stage2_bin_area2 = get_node("/root/stage2/Area2D2")
@onready var area_2d: Area2D = $Bin/Area2D

var ProgressRatio = 0.0
var speed = 0.3
@export var round = 0

func _ready():
	await get_tree().create_timer(0.5).timeout
	path_follow_2d.visible = true
	if stage2_bin_area == null:
		print("Error: stage2_bin_area is NULL!")  
	else:
		print(stage2_bin_area.move_1)

func _process(delta):
	if stage2_bin_area != null and stage2_bin_area2 != null:
		if progress_ratio == 1:
			await get_tree().create_timer(0.5).timeout
			path_follow_2d.visible = false
			area_2d.visible = false
		elif stage2_bin_area.move_1 and progress_ratio < 0.64:
			progress_ratio += delta * speed
			round = 1
			print(round)
		elif stage2_bin_area2.move_2:
			speed = 0.5
			progress_ratio += delta * speed
			round = 2
			print(round)
