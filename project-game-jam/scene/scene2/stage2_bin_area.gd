extends Area2D

var player_in_area = false
var count = 0
@export var move_1 = false

func _ready():
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("player"):  
		player_in_area = true
		count += 1

func _process(delta):
	if player_in_area and count == 1:
		count += 1
		move_1 = true
		print("Event Triggered!")  
		
