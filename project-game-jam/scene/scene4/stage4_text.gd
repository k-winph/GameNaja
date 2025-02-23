extends Node2D

@onready var text: Label = $text

var typing_delay : float = 0.3

func _ready():
	await get_tree().create_timer(2.2).timeout
	_start()

func _start():
	text.text = "" 
	text.position = Vector2(16, 217)
	await show_text("What the hell is going on?!")
	await get_tree().create_timer(1).timeout
	text.text = ""

func show_text(full_text):
	var typing_speed = typing_delay / 10
	for i in range(full_text.length()):
		text.text += full_text[i]
		await get_tree().create_timer(typing_speed).timeout
