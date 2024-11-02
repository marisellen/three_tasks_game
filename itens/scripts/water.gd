extends Area2D
class_name Water

signal item_picked_up

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	add_to_group("collectible")

func _on_body_entered(_body):
		#_body.pick_item("Water")
		#queue_free()
		_body.pick_item("Water")
		GameState.items_collected["Water"] = true
		queue_free()
		emit_signal("item_picked_up")
