extends AnimatedSprite2D

@onready var granny: AnimatedSprite2D = $"."

func _ready():
	await get_tree().create_timer(1).timeout
	granny.play("Bye")
