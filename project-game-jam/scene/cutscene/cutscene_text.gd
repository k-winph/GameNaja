extends Node2D
@onready var text = $text
@onready var text_audio = $text_audio

var typing_delay : float = 0.4

func _ready():
	await get_tree().create_timer(1.75).timeout
	_start()

func _start():
	text.text = "" 
	await show_text("Walk carefully, don't trip and die on the way, you hear me!!")

func show_text(full_text):
	var typing_speed = typing_delay / 10
	for i in range(full_text.length()):
		text.text += full_text[i]
		await get_tree().create_timer(typing_speed).timeout
