extends Node2D

@onready var text: Label = $text
@onready var text_audio: AudioStreamPlayer2D = $text_audio

var typing_delay : float = 0.3

func _ready():
	await get_tree().create_timer(2.2).timeout
	_start()

func _start():
	text.text = "" 
	text.position = Vector2(43, 217)
	await show_text("What’s the big deal, Granny? It’s just walking to school!")
	await get_tree().create_timer(0.5).timeout
	text.text = ""
	await get_tree().create_timer(1).timeout
	text.position = Vector2(77, 217)
	await show_text("!!!")
	await get_tree().create_timer(0.5).timeout
	text.text = ""
	await show_text("Whoa!!")
	await get_tree().create_timer(0.5).timeout
	text.text = ""

func show_text(full_text):
	var typing_speed = typing_delay / 10
	for i in range(full_text.length()):
		text.text += full_text[i]
		await get_tree().create_timer(typing_speed).timeout
