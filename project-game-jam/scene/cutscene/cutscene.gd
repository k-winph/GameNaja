extends Node2D
	
@onready var text = $text
@onready var text_audio = $text_audio

var full_text = "ระวังตัวด้วยนะหลานเอ้ย"
var current_index = 0
var typing_delay : float = 0.1
var timer : float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	text.text = ""
	text.visible = true
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_start()

func _start():
	var full_text = text.text
	text_audio.play()
	text.text = ""
	text.visible = true
	await show_text(full_text)

# ฟังก์ชันแสดงข้อความ
func show_text(full_text: String) -> void:
	var typing_speed = typing_delay / 10
	for i in range(full_text.length()):
		text.text += full_text[i]
		await get_tree().create_timer(typing_speed).timeout
	text_audio.stop()
