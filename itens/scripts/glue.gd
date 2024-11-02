extends Area2D
class_name Glue

signal item_collected

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	add_to_group("collectible")

func _on_body_entered(body):
	if body.name == "Character":
		emit_signal("item_collected")
		queue_free()
