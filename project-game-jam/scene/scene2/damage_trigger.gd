extends Area2D

@export var dead: String = "res://scene/scene1/stage1.tscn"
@onready var stage2_bin_area = get_node("/root/stage2/Area2D")
@onready var stage2_bin_area2 = get_node("/root/stage2/Area2D2")
@onready var path_follow_2d: PathFollow2D = $"../.."
@onready var stage2_bin_move = get_node("/root/stage2/Path2DBin/PathFollow2D")

func _ready():
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	if stage2_bin_move.visible == true:
		if body.is_in_group("player") and stage2_bin_area.count > 0:
			get_tree().change_scene_to_file(dead)
