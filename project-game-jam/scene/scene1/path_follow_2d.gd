extends PathFollow2D

@onready var player: CharacterBody2D = $"../../Player"
@onready var path_2d: Path2D = $".."

var speed = 0.5
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
#	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_ratio += delta * speed
	if progress_ratio < 1:
		get_node("AnimatedSprite2D").play("Run")
		get_node("AnimatedSprite2D").set_flip_h(false)
		player.visible = false
	elif progress_ratio == 1 :
		player.visible = true
		await wait_until_progress_complete()
		path_2d.visible = false
		

func wait_until_progress_complete():
	while progress_ratio < 1.0:  # ตรวจสอบค่า progress_ratio
		await get_tree().process_frame  # รอเฟรมถัดไป (ป้องกันเกมค้าง)
