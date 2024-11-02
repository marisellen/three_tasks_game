extends Area2D
class_name Glue

signal item_picked_up

@export var shirt: PackedScene

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	add_to_group("collectible")

func _on_body_entered(body: Node2D):
		body.pick_item("glue")
		GameState.item_collected["Glue"] = true
		queue_free()
		emit_signal("item_picked_up")
