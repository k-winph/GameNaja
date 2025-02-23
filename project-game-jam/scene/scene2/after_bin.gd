extends Sprite2D

@onready var bin: Sprite2D = $"."
@onready var path_follow_2d: PathFollow2D = $"../Path2DBin/PathFollow2D"
@onready var stage2_bin_move = get_node("/root/stage2/Path2DBin/PathFollow2D")

func _ready():
	if bin != null:
		bin.visible = false
	else:
		print("Error: Bin node not found!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if stage2_bin_move.round == 2:
		await get_tree().create_timer(1).timeout
		if bin != null:
			bin.visible = true
