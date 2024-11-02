extends Area2D
class_name Soil

signal item_picked_up

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	add_to_group("collectible")

func _on_body_entered(_body):
	if _body is CharacterBody2D and _body.has_method("pick_item"):
		_body.pick_item("Soil")
		GameState.items2_collected["Soil"] = true
		queue_free()
		emit_signal("item_picked_up")
	else:
		print("Objeto não suportado ou método 'pick_item' não encontrado.")
