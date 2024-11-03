extends Area2D
class_name Skin_item

signal item_picked_up
@export var MagicBook: PackedScene

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	add_to_group("collectible")

func _on_body_entered(body: Node2D) -> void:
	if body is Character:
		body.pick_item("Knife")
		GameState.item_collected["Knife"] = true
		queue_free()
		emit_signal("item_picked_up")
	else:
		print("Erro: `body` não é do tipo Character.")
