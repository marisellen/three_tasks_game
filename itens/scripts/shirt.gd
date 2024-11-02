extends Area2D
class_name Shirt

signal item_picked_up
var _player_ref: Character = null

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	add_to_group("collectible")

func _on_body_entered(body: Node2D) -> void:
	if GameState.item_collected["Glue"]:
		body.pick_item("shirt")
		queue_free()
	else:
		print("Você precisa coletar o glue primeiro!")
