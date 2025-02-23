extends Area2D

@export var event_message: String = "Press [E] to interact!"  
var player_in_area = false

func _ready():
	connect("body_entered", _on_body_entered)
	connect("body_exited", _on_body_exited)

func _on_body_entered(body):
	if body.is_in_group("player"):  
		player_in_area = true
		print(event_message)

func _on_body_exited(body):
	if body.is_in_group("player"):  
		player_in_area = false

func _process(delta):
	if player_in_area and Input.is_action_just_pressed("interact"):
		print("Event Triggered!")
		get_tree().change_scene_to_file("res://scene/scene3/stage3.tscn")
