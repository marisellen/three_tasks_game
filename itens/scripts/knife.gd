extends Area2D
class_name Knife

signal item_picked_up

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	add_to_group("collectible")

func _on_body_entered(_body):
		_body.pick_item("Knife")
		GameState.items_collected["Knife"] = true
		queue_free()
		emit_signal("item_picked_up")
